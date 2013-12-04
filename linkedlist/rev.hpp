/* cpp-crapola/linkedlist/rev.hpp */


#ifndef CPP_CRAPOLA___LINKEDLIST___REV_HPP
#define CPP_CRAPOLA___LINKEDLIST___REV_HPP


#include"ll.hpp"


namespace ll
{
    namespace rev
    {
        template< typename T >
        node< T >*
        in_place( node< T >*f )
        {
            node< T >*r = NULL ;
            while( NULL != f ){
                std::swap( r, f->next_ );
                std::swap( r, f );
            }
            return r ;
        }
    }
}


#endif//ndef CPP_CRAPOLA___LINKEDLIST___REV_HPP
