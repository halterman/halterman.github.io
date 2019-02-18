#include "sgl.h"

using namespace sgl;

//  Define a window with a box that can change colors
class BouncingBall: public Window
{

};

int main()
{
    new BouncingBall("Bouncing Ball", 100, 100, 600, 600)->show();
}
