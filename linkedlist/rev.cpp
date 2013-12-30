/* ll/rev.cpp */


#include<iostream>

#include<boost/utility.hpp>

#include"rev.hpp"


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

    std::ostream&operator<<( std::ostream&os, node_type const&o )
    {
        node_type const*p = boost::addressof( o );
        while( p ){
            os
                << "node @ "
                << std::hex << std::showbase << p
                << " ; value_ == " << std::dec << p->value_
                << " ; next_ == "
                << std::hex << std::showbase << p->next_
                << std::endl
                ;
            p = p->next_ ;
        }
        return os ;
    }
}


int
main( int, char** )
{
    node_type*p = _new( 0 );

    {
        node_type*tmp = p;
        for( int i = 1; i < 8; ++i ){
            tmp->next_ = _new( i );
            tmp = tmp->next_ ;
            //std::cout << *tmp << std::endl ;
        }
    }

    std::cout << *p << std::endl ;

    p = ll::rev::in_place( p );

    std::cout << *p << std::endl ;

    _delete( p );

    return EXIT_SUCCESS ;
}
