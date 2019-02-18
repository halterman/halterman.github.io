#include <GL/sgl.h>

using namespace sgl;

class HelloWindow: public Window
{
public:
    HelloWindow(): Window("Simple Window",  //  Window's title
                          100, 50,          //  Left-top corner
                          400, 300,         //  Width and height
                          -10.0, 90.0,      //  Minimum and maximum x
                          -5.0, 95.0)       //  Minimum and maximum y
    {}

    virtual void paint()
    {
        set_color(BLUE);
        draw_text("Hello, world!", 30, 40, 18);
    }
};

int main()
{
    HelloWindow *win = new HelloWindow();
    win->run();
}
