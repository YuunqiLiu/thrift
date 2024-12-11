import sys
from gen_py.test.ttypes import Person,Address,All
from thrift.protocol import TBinaryProtocol, TJSONProtocol


from thrift.transport import TTransport

# 创建 Person 对象
person = Person(name="Alice", age="30", address=Address(street="street1",city="city2",country="country3"))
all = All(
    field1=1,
    field2=2,
    field3=3,
    field4=4,
    field5=5,
    field6=6.1,
    field8="str8",
    field9="str9".encode()
)

# 序列化到二进制数据
transport = TTransport.TMemoryBuffer()
protocol = TBinaryProtocol.TBinaryProtocol(transport)
protocol = TJSONProtocol.TJSONProtocol(transport)
person.write(protocol)

# 保存到文件
with open("test.json", "wb") as f:
    f.write(transport.getvalue())

# 序列化到二进制数据
transport = TTransport.TMemoryBuffer()
protocol = TBinaryProtocol.TBinaryProtocol(transport)
protocol = TJSONProtocol.TJSONProtocol(transport)
all.write(protocol)

# 保存到文件
with open("test2.json", "wb") as f:
    f.write(transport.getvalue())



print("Thrift 序列化文件已生成: test.json")
