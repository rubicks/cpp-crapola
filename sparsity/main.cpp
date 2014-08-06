/* cpp-crapola/sparsity/main.cpp */


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
#include<boost/numeric/ublas/io.hpp>
#include<boost/numeric/ublas/vector_sparse.hpp>
#include<boost/preprocessor/stringize.hpp>
#include<boost/utility.hpp>


int
main( int, char** )
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

    namespace ublas = boost::numeric::ublas ;

    ublas::mapped_vector< double >v( 8 );

    std::cout
        << std::endl
        << "v == " << v
        << std::endl
        ;

    for( unsigned i = 0 ; i < v.size() ; ++i ){
        v[i] = i ;
    }

    std::cout
        << std::endl
        << "v == " << v
        << std::endl
        ;

    return EXIT_SUCCESS ;
}
