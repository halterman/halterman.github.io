#include "sgl.h"

using namespace sgl;

//  Derive a custom popup menu from sgl::PopupMenu
class ColorChangerMenu: public PopupMenu
{

};

//  Define a window with a box that can change colors
class ChameleonBox: public Window
{

};

int main()
{
    new Window("Simple Application", 100, 100, 600, 600)->show();
}
