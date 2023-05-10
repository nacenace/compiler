{集中测试:子程序(函数和过程)定义和调用,包括一些系统函数}
program prog;
var
  a, b: integer;
  c, d: real;
  ch: char;
  e: boolen;

function Sum(a, b: integer): integer;
begin
  Sum := a + b;
end;

begin
  { Integer operations }
  writeln('Please input two integers x and y');
  readln(a, b);
  writeln('-a = ', -a, ', -b = ', -b);
  writeln('a  +  b = ', a + b);
  writeln('a  -  b = ', a - b);
  writeln('a  *  b = ', a * b);
  writeln('a  /  b = ', a / b);
  writeln('a div b = ', a div b);
  writeln('a mod b = ', a mod b);
  writeln('a xor b = ',a xor b); 
  writeln('sqrt(abs(a)) = ', sqrt(abs(a)));
  { Floating-point operations }
  writeln('Please input two floats c and d');
  readln(c, d);
  writeln('c + d = ', c + d);
  writeln('c - d = ', c - d);
  writeln('c * d = ', c * d);
  writeln('c / d = ', c / d);
  writeln('sqrt(abs(c)) = ', sqrt(abs(c)));
  { Implicit conversion }
  writeln('a + c = ', a + c);
  writeln('b * d = ', b * d);
  {and or not xor >}
  e := true and false;
  writeln('true and false: ',e); 
  e := true or false;
  writeln('true or false: ',e);
  e := not true;
  writeln('not true: ',e);
  e := a > b;
  writeln('a > b: ',e);
  { Char functions }
  writeln('Please input one character ch');
  read(ch);
  writeln('chr(ord(ch))  = ', chr(ord(ch)));
  writeln('pred(ch) = ', pred(ch));
  writeln('succ(ch) = ', succ(ch));
end.
