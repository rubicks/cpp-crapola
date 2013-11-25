/* bt/backtrace.cpp */


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


typedef struct rlimit rlimit_type ;


struct _error : virtual std::exception, virtual boost::exception{} ;


rlimit_type
_getrlimit( int resource )
{
    rlimit_type ret ;
    if( 0 != getrlimit( resource, boost::addressof( ret ) ) )
        BOOST_THROW_EXCEPTION
            ( _error()
              << boost::errinfo_api_function( "getrlimit" )
              << boost::errinfo_errno( errno ) );
    return ret ;
}


rlim_t _cur( const rlimit_type&o ){ return o.rlim_cur ; }
rlim_t _max( const rlimit_type&o ){ return o.rlim_max ; }


std::ostream&
operator<<( std::ostream&os,
            const rlimit_type o )
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
    std::vector< void* >ret;
    ret.resize( _cur( _getrlimit( RLIMIT_STACK ) ) );
    ret.resize( backtrace( boost::addressof( ret.at( 0 ) ), ret.size() ) );
    return ret ;
}


std::vector< std::string >
_stacktrace( std::vector< void* >const&bt )
{
    std::vector< std::string >ret;
    char**a =
        backtrace_symbols
        ( boost::addressof( bt.at( 0 ) ), bt.size() );
    if( a ){
        std::copy( a, a + bt.size(), std::back_inserter( ret ) );
        free( a );
    }
    return ret ;
}
std::vector< std::string >
_stacktrace( void )
{
    return _stacktrace( _backtrace() );
}


int main( int, char** )
{
#if defined( __clang__ )
    std::cout << "__clang__" << BOOST_PP_STRINGIZE( __clang__ ) << std::endl ;
#elif defined( __GNUC__ )
    std::cout << "__GNUC__" << BOOST_PP_STRINGIZE( __GNUC__ ) << std::endl ;
#else
#  error "unsupported compiler"
#endif

    std::cout
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

    std::copy
        ( bt.begin(), bt.end(),
          std::ostream_iterator< void* >( std::cout << std::hex, "\n" ) );


    {
        std::vector< std::string >const st( _stacktrace() );
        std::copy
            ( st.begin(), st.end(),
              std::ostream_iterator< std::string >
              ( std::cout << std::hex, "\n" ) );
    }

    return EXIT_SUCCESS ;
}
