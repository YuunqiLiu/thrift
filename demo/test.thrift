struct Address {
  1: string street;
  2: string city;
  3: string country;
}

struct Person {
  1: string name;
  2: string age;
  3: Address address;  // 嵌套 Address 结构
}


struct All {
  1: bool             field1;
  2: i8               field2;
  3: i16              field3;
  4: i32              field4;
  5: i64              field5;
  6: double           field6;
  //7: float            field7;
  8: string           field8;
  9: binary           field9;
  //10: list<i32>       field10;
  //11: set<i32>        field11;
  //12: map<i32, i32>   field12;
}