#include <GL/sgl.h>

using namespace sgl;

class ColorBox: public Window
{
protected:
    bool is_red;
public:
    ColorBox(): Window("Click Me", 100, 100, 400, 300, 
                          0.0, 100.0, 0.0, 100.0), is_red(true)
    {}

    void paint()
    {
        if ( is_red )       
            set_color(RED);
        else
            set_color(BLUE);
        fill_rectangle(30.0, 30.0, 40.0, 40.0);
    }

    void mouse_pressed(double, double, MouseButton)
    {
        is_red = !is_red;  //  Toggle the color
        repaint();         //  Request a repaint
    }
};

int main()
{
    (new ColorBox())->run();  //  Create the window and execute it
}
