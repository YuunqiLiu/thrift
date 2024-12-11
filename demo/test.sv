
`include "gen_sv/test_types.svh"

module top;
    Person my_obj;
    All obj_all;
    //int result;

    initial begin
        // 创建类对象
        my_obj = new();

        // 调用类中的方法，间接调用 C++ 函数
        //result = my_obj.compute_addition();
        
        my_obj.deserialize_from_file("test.json");
        my_obj.display();
        my_obj.display_by_dpic();

        obj_all = new();
        obj_all.deserialize_from_file("test2.json");
        obj_all.display();
        obj_all.display_by_dpic();

        $display("sv finish.");
        // 打印结果
        //$display("The result of compute_addition(15, 25) is: %0d", result);
    end
endmodule
