#include <GL/sgl.h>

using namespace sgl;

class ClockWindow: public Window
{
public:
    ClockWindow(): Window("3:00", 100, 100, 200, 200, 
                          -100.0, 100.0, -100.0, 100.0)
    {}

    void paint()
    {
        set_color(BLUE);
        //  Draw outline of clock
        draw_circle(0.0, 0.0, 45.0);    //  Center at (0,0), radius of 45
        //  Draw hour hand
        set_line_width(4);          //  Thicker line
        draw_line(0.0, 0.0, 25.0, 0.0); //  Shorter line
        //  Draw minute hand
        set_line_width(2);          //  Thinner line
        draw_line(0.0, 0.0, 0.0, 40.0); //  Longer line
    }
};

int main()
{
    (new ClockWindow())->run();  //  Create the window and execute it
}
