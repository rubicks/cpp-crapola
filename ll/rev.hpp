/* ll/rev.hpp */


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
