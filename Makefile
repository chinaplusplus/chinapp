all: amalgamate

amalgamate:
	rm -rf china++.h
	find china++ -name "*.h" -o -name "*.hpp" | xargs -I{} echo '#include "{}"' > china++_gen.h
	amalgamate -w '*.cpp;*.c;*.h;*.mm;*.m;*.hpp' -i china++ china++_gen.h china++.h
	rm -rf china++_gen.h

demo:
	g++ main.cpp -o main.app