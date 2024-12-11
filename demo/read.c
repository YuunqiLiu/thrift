#include <stdio.h>
#include <stdlib.h>
#include "gen-cpp/test_types.h"
//#include "gen-cpp/example_types.tcc"
#include <thrift/protocol/TBinaryProtocol.h>
#include <thrift/protocol/TJSONProtocol.h>
#include <thrift/transport/TBufferTransports.h>
#include "/home/liuyunqi/software/vcs_2016/include/svdpi.h"

using namespace apache::thrift;
using namespace apache::thrift::protocol;
using namespace apache::thrift::transport;

typedef struct {
    svOpenArrayHandle a;
    int a_size;
} a_vec;

extern "C" {

void read_thrift_file(const char *filename, a_vec* a_inst) {
    FILE *file = fopen(filename, "rb");
    if (!file) {
        perror("无法打开 Thrift 文件");
        return;
    }
    printf("aaaaaaaa %d\n", a_inst->a_size);
    printf("aaaa %d\n", svDimensions(a_inst->a));

    // 获取文件大小
    fseek(file, 0, SEEK_END);
    long length = ftell(file);
    fseek(file, 0, SEEK_SET);

    // 读取文件内容
    //uint8_t *data = malloc(length);
    uint8_t *data = (uint8_t *)malloc(length);

    fread(data, 1, length, file);
    fclose(file);

    // 创建 Thrift 反序列化对象
    //auto transport = std::make_shared<apache::thrift::transport::TMemoryBuffer>(data, length);
    //apache::thrift::protocol::TBinaryProtocolT<apache::thrift::transport::TMemoryBuffer> protocol(transport);
    std::shared_ptr<TMemoryBuffer> transport = std::make_shared<TMemoryBuffer>((uint8_t *)data, length);
    TJSONProtocol protocol(transport);


    // 解码 Thrift 对象
    Person person;
    person.read(&protocol);

    // 显示数据
    printf("Name: %s\n", person.name.c_str());
    printf("Age: %d\n", person.age);
    //printf("Email: %s\n", person.address.c_str());

    free(data);
}

// int main() {
//     read_thrift_file("person.thrift");
//     return 0;
// }


}