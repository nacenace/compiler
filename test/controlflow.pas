{集中测试:控制流if-else，case-of，while-do，repeat-until，for}
program prog;
const
  ZERO = 0;
  ONE = 1;
  TWO = 2;
type
  int = integer;
var
  x, y, i: int;

begin
  writeln('Please input two integers x and y');
  readln(x, y);

  { if statement }
  writeln('if test');
  if x < y then writeln('x < y')
  else if x > y then writeln('x > y')
  else writeln('x = y');

  { case statement }
  writeln('case test');
  case x mod 3 of
    0: x := ZERO;
    1: x := ONE;
    2: x := TWO;
  end;
  writeln('x mod 3 = ', x);

  { repeat statement }
  writeln('repeat test');
  i := 0;
  repeat
    write(i);
    write(' ');
    i := i + 1;
  until i = 10;
  writeln();

  { while statement }
  writeln('while test');
  while i > 0 do begin
    i := i - 1;
    write(i);
    write(' ');
  end;
  writeln();

  {for statement}
  writeln('for test');
  for i := 1 to 10 do
    write(i);
    
  writeln();
end.
