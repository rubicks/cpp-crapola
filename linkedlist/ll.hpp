/* cpp-crapola/linkedlist/ll.hpp */


#ifndef CPP_CRAPOLA___LINKEDLIST___LL_HPP
#define CPP_CRAPOLA___LINKEDLIST___LL_HPP


namespace ll
{
    template< typename T >
    struct node
    {
        typedef node< T >this_type ;
        T value_;
        this_type*next_;
    };
}


#endif//ndef CPP_CRAPOLA___LINKEDLIST___LL_HPP
