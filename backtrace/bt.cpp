/* cpp-crapola/backtrace/bt.cpp */


#if defined( HAVE_CONFIG_H )
#  include "config.h"
#else
#  error "config.h"
#endif

#include<cerrno>
#include<cstring>
#include<iostream>
#include<vector>

#include<boost/exception/all.hpp>
#include<boost/preprocessor/stringize.hpp>
#include<boost/utility.hpp>

#include<execinfo.h>
#include<stdlib.h>

#include<sys/resource.h>
#include<sys/time.h>

#include"bt.hpp"


namespace
{
    struct _error : virtual std::exception, virtual boost::exception{} ;


    rlimit
    _getrlimit( int resource )
    {
        rlimit ret ;
        if( 0 != getrlimit( resource, boost::addressof( ret ) ) )
            BOOST_THROW_EXCEPTION
                ( _error()
                  << boost::errinfo_api_function( "getrlimit" )
                  << boost::errinfo_errno( errno ) );
        return ret ;
    }


    rlim_t _cur( const rlimit&o ){ return o.rlim_cur ; }
    rlim_t _max( const rlimit&o ){ return o.rlim_max ; }


    std::ostream&
    operator<<( std::ostream&os, rlimit const&o )
    {
        return os
            << "{ rlim_cur: " << std::dec << _cur( o )
            << ", rlim_max: " << std::dec << _max( o )
            << " }"
            ;
    }


    std::vector< void* >
    _backtrace( void )
    {
        std::vector< void* >ret ;
        {
            rlim_t n = _cur( _getrlimit( RLIMIT_STACK ) );
            ret.resize( n );
        }
        {
            void**buffer = boost::addressof( ret.at( 0 ) );
            int size = ret.size();
            rlim_t n = backtrace( buffer, size );
            ret.resize( n );
            ret.erase( ret.begin() );
        }
        return ret ;
    }


    std::vector< std::string >
    _stacktrace( std::vector< void* >const&bt )
    {
        std::vector< std::string >ret ;
        {
            char**a =
                backtrace_symbols
                ( boost::addressof( bt.at( 0 ) ), bt.size() );
            if( a ){
                std::copy( a, a + bt.size(), std::back_inserter( ret ) );
                free( a );
            }
        }
        return ret ;
    }
    std::vector< std::string >
    _stacktrace( void )
    {
        return _stacktrace( _backtrace() );
    }


    template< typename C >
    std::ostream&
    _spit_container( std::ostream&os, C const&c )
    {
        typedef typename C::value_type value_type ;
        std::copy
            ( c.begin(), c.end(),
              std::ostream_iterator< value_type >
              ( os << std::endl << std::hex, "\n" ) );
        return os ;
    }

}//end anonymous namespace



void qux( void ){
    std::vector< void* >bt;
    {
        rlim_t n = _cur( _getrlimit( RLIMIT_STACK ) );
        bt.resize( n );
    }
    {
        void**buffer = boost::addressof( bt.at( 0 ) );
        int size = bt.size();
        rlim_t n = backtrace( buffer, size );
        bt.resize( n );
    }

    _spit_container( std::cout, bt );

    std::vector< std::string >st;
    {
        char**a =
            backtrace_symbols
            ( boost::addressof( bt.at( 0 ) ), bt.size() );
        if( a ){
            std::copy( a, a + bt.size(), std::back_inserter( st ) );
            free( a );
        }
    }

    _spit_container( std::cout, st );
}

void bar( void ){
    qux();
}

void foo( void ){
    bar();
}


int bt::main( int, char** )
{
#if defined( __clang__ )
    std::cout
        << std::endl
        << "__clang__ == "
        << BOOST_PP_STRINGIZE( __clang__ )
        << std::endl
        ;
#elif defined( __GNUC__ )
    std::cout
        << std::endl
        << "__GNUC__ == "
        << BOOST_PP_STRINGIZE( __GNUC__ )
        << std::endl
        ;
#else
#  error "unsupported compiler"
#endif

    std::cout
        << std::endl
        << "_getrlimit( RLIMIT_STACK ) == "
        << _getrlimit( RLIMIT_STACK )
        << std::endl
        << "_cur( _getrlimit( RLIMIT_STACK ) ) == "
        << _cur( _getrlimit( RLIMIT_STACK ) )
        << std::endl
        << "_max( _getrlimit( RLIMIT_STACK ) ) == "
        << _max( _getrlimit( RLIMIT_STACK ) )
        << std::endl
        ;

    std::vector< void* >const bt( _backtrace() );
    _spit_container( std::cout, bt );

    std::vector< std::string >const st( _stacktrace() );
    _spit_container( std::cout, st );

    foo();

    return EXIT_SUCCESS ;
}
