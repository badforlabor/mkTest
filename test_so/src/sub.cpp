#include "add.h"
#include "other/sub.h"

int sub(int a, int b)
{
    return add(a, -b);
}