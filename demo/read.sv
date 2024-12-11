typedef struct {
    int a[];
    int a_size;
} a_vec;
import "DPI-C" context function void read_thrift_file(input string str, a_vec a_inst);
// SystemVerilog 代码
class MyMathClass;

    int a;
    int b;
    int c;
    a_vec aaaa;

    // 声明 C++ 函数接口
    //import "DPI-C" context function int add(input int a, input int b);

    // 类的成员方法
    function int compute_addition();
        aaaa.a = new[10];
        foreach(aaaa.a[i])
            aaaa.a[i] = i;
        aaaa.a_size = aaaa.a.size();
        read_thrift_file("person.thrift", aaaa);
        //return add(a, b);  // 调用 C++ 函数
    endfunction

endclass

module top;
    MyMathClass my_obj;
    int result;

    initial begin
        // 创建类对象
        my_obj = new();

        // 调用类中的方法，间接调用 C++ 函数
        result = my_obj.compute_addition();
        
        // 打印结果
        $display("The result of compute_addition(15, 25) is: %0d", result);
    end
endmodule
