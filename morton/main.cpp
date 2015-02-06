/* cpp-crapola/morton/main.cpp */


#if defined( HAVE_CONFIG_H )
#  include "config.h"
#else
#  error "config.h"
#endif

#include<cassert>
#include<cerrno>
#include<cinttypes>
#include<cstring>
#include<iostream>
#include<vector>

#include<boost/exception/all.hpp>
#include<boost/preprocessor/stringize.hpp>
#include<boost/utility.hpp>


namespace
{
  uint32_t
  _part1by2( uint8_t n )
  {
    uint32_t ret = n ;
    ret = ( ret ^ ( ret << 16 ) ) & 0x0000ff ;
    ret = ( ret ^ ( ret <<  8 ) ) & 0x00f00f ;
    ret = ( ret ^ ( ret <<  4 ) ) & 0x0c30c3 ;
    ret = ( ret ^ ( ret <<  2 ) ) & 0x249249 ;
  }

  uint32_t
  _morton( uint8_t const /* r */,
           uint8_t const /* g */,
           uint8_t const /* b */ )
  {
    return _morton( uint8_t( 0x42 ) );
  }

  uint32_t
  _morton( uint32_t const n )
  {
    uint32_t ret = n ;
    ret &= 0x00ffffff ;
    ret = ()
    return
      _morton
      ( ( ( n >>  0 ) & 0xff ),
        ( ( n >>  8 ) & 0xff ),
        ( ( n >> 16 ) & 0xff ) )
      ;
  }
  
}

int
main( int, char** )
{
  std::cout
    << __PRETTY_FUNCTION__
    << " at "
    << __FILE__
    << ":"
    << std::dec
    << __LINE__
    << std::endl
    ;
  std::cout
    << "_morton( 42 ) == "
    << std::dec
    << _morton( 42 )
    << std::endl
    ;
  return EXIT_SUCCESS ;
}
