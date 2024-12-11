import sys
from gen_py.test.ttypes import Person, Address
from thrift.protocol import TBinaryProtocol, TJSONProtocol


from thrift.transport import TTransport

# 创建 Person 对象
person = Person(name="Alice", age="30", address=Address(street="street1",city="city2",country="country3"))

# 序列化到二进制数据
transport = TTransport.TMemoryBuffer()
protocol = TBinaryProtocol.TBinaryProtocol(transport)
protocol = TJSONProtocol.TJSONProtocol(transport)
person.write(protocol)

# 保存到文件
with open("person.thrift", "wb") as f:
    f.write(transport.getvalue())



print("Thrift 序列化文件已生成：person.thrift")
