{类型不匹配的赋值}
Program prog;

var
x, y : integer;
a : record
  title: array [1..50] of char;
  author: array [1..50] of char;
  subject: array [1..100] of char;
  bookid: integer;
end;
begin
  x := a;
end.
