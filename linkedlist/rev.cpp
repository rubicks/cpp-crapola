/* ll/rev.cpp */


#include"rev.hpp"

#include<boost/utility.hpp>

#include<iostream>


namespace
{
    typedef ll::node< int >node_type ;


    void _delete( node_type*p )
    {
        node_type*n = NULL ;
        while( NULL != p ){
            n = p->next_ ;
            delete p ;
            p = n ;
        }
    }


    node_type*_new( const int _value )
    {
        node_type*ret = new node_type ;
        ret->next_ = NULL ;
        ret->value_ = _value ;
        return ret ;
    }


    std::ostream&operator<<( std::ostream&os, node_type const&p )
    {
        return os
            << "node @ " << std::hex << std::showbase << boost::addressof( p )
            << " ; value_ == " << std::dec << p.value_
            ;
    }
}


int
main( int, char** )
{
    node_type*p = _new( 0 );

    std::cout << "*p == { " << *p << " }" << std::endl ;

    {
        node_type*tmp = p;
        for( int i = 1; i < 8; ++i ){
            tmp->next_ = _new( i );
            tmp = tmp->next_ ;
            std::cout << *tmp << std::endl ;
        }
    }

    std::cout << "*p == { " << *p << " }" << std::endl ;

    {
        node_type*tmp = p ;
        while( NULL != tmp ){
            std::cout << *tmp << std::endl ;
            tmp = tmp->next_ ;
        }
    }

    _delete( p );
    return EXIT_SUCCESS ;
}
