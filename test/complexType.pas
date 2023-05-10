{集中测试:一维数组,结构体类型}
program prog;
type
a = record
    x: integer;
    y: integer;
end;
var
  arr: array[0..4] of integer;
  p: a;
begin
  arr[1]:= 1;
  arr[2]:= 2;
  arr[3]:= 3;
  arr[4]:= 4;
  arr[5]:= 5;
  p.x := 10;
  p.y := 20;
  write('数组第二个的值:');
  writeln(arr[2]);
  write('结构体的值:');
  writeln(p.x, ', ', p.y);
end.
