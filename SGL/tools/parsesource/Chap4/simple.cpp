#include "sgl.h"

using sgl::Window;

int main()
{
    (new Window("Simple Application", 100, 100, 600, 600))->run();
}
