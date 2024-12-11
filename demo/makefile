

cpp:
	../compiler/cpp/thrift --gen cpp test.thrift 

sv:
	mkdir -p gen_sv
	../compiler/cpp/thrift --gen sv -out gen_sv test.thrift

dpic:
	mkdir -p gen_dpic
	../compiler/cpp/thrift --gen dpic -out gen_dpic test.thrift

py:
	mkdir -p gen_py
	../compiler/cpp/thrift --gen py -out gen_py test.thrift

comp_cpp:
	g++ -o read.so read.c gen-cpp/test_types.cpp -lthrift -fPIC -shared
	# g++ -o read read.c gen-cpp/test_types.cpp -lthrift

comp_dpic:
	g++ -o test.so gen_dpic/test_types.cpp -lthrift -fPIC -shared

help:
	../compiler/cpp/thrift --help


comp_dp:
	vcs -debug_all -full64 -sverilog datatype.sv -LDFLAGS -Wl,--no-as-needed -kdb -lca -cc gcc-4.8 -cpp g++-4.8

test: py dpic sv comp_dpic
	@echo "Start Test."
	python test.py
	vcs -debug_all -full64 -sverilog test.sv test.so -LDFLAGS -Wl,--no-as-needed -kdb -lca -cc gcc-4.8 -cpp g++-4.8


test2: py dpic sv
	@echo "Start Test."
	python test.py
	vcs -debug_all -full64 -sverilog test.sv gen_dpic/test_types.cpp -LDFLAGS -Wl,--no-as-needed -kdb -lca -cc gcc-4.8 -cpp g++-4.8
