{单元测试:结构体}
program exRecords;
type
Books = record
   title: Char;
   price: integer;
end;
var
   Book1, Book2: Books; (* Declare Book1 and Book2 of type Books *)
begin
   Book1.title  := 'a';
   WriteLn('Book1.title的值: ',Book1.title);
   Book2.price:= 100;
   WriteLn('Book2.price的值: ',Book2.price);
end.