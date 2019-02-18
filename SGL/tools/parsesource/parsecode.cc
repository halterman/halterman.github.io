//  File parsecode.cpp

#include <fstream>
#include <iostream>
#include <sstream>
#include <string>

using namespace std;

const string NOFILENAME = "NOFILENAME";

bool contains(string s, string piece)
{
    return s.find(piece) != string::npos;
}

//  Extracts a C++ file name of the form "xxxxx.cpp"
string getfilename(string s)
{
    string result = NOFILENAME;

    unsigned start = s.find("prog:");
    if ( start != string::npos )
    {
        start += 5;  //  exclude "prog:";
        unsigned end = s.find(".cpp");
        if ( end != string::npos )
        {
            end += 4; //   include ".cpp"
            result = s.substr(start, end - start);
        }
        else
        {
            unsigned end = s.find(".h");
            if ( end != string::npos )
            {
                end += 2; //   include ".h"
                result = s.substr(start, end - start);
            }
        }
    }
    return result;
}

int main(int argc, char **argv)
{
    if ( argc < 2 )
    {
        cout << "Usage:" << endl;
        cout << "    parsecode <docbook file>" << endl;
    }
    else
    {
        int chapter_counter = 0;
        string line, program_name = NOFILENAME;
        ifstream in(argv[1]);
        ofstream out;
        stringstream ss;
        while ( !in.eof() )
        {
            getline(in, line);
            if ( contains(line, "<chapter id") )
                chapter_counter++;
            if ( contains(line, "<example id") ) 
            {
                program_name = ".\\Chap";
                ss.str("");  //  Reset stringstream
                ss << chapter_counter;
                program_name = program_name.append(ss.str());
                program_name = program_name.append("\\");
                program_name = program_name.append(getfilename(line));
                cout << program_name << endl;
            }
            if ( contains(line, "<programlisting") 
                    && program_name != NOFILENAME )
            {
                getline(in, line);  //  skip first line
                out.open(program_name.c_str());
                //cout << "Writing Chap" << chapter_counter << "/ " << endl;
                while ( !contains(line, "</programlisting") )
                {
                    out << line << endl;
                    //cout << line << endl;
                    getline(in, line);
                }
                out.close();
                program_name = NOFILENAME;
            }
        }
        in.close();
    }
}
