
parsecode.exe: parsecode.cc
	cl /W4 /WX /EHsc /Za parsecode.cc

clean:
	del parsecode.exe
	del parsecode.obj
	for /r %a in (*.cpp *.obj *.h *.exe) do del %a

run: parsecode.exe
	.\parsecode.exe ..\..\sgl.xml 

check: parsecode.exe
	for /r %a in (*.cpp) do cl /c /nologo /W4 /EHsc /Za %a
