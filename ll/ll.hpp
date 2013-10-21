/* ll/ll.hpp */


#include<boost/type_traits.hpp>


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
