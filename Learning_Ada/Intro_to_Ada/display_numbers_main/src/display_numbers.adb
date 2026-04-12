with Ada.Text_IO;

procedure Display_Numbers (A, B : Integer) is
   First, Last : Integer;
begin
   if A < B then
      First := A;
      Last := B;
   else
      First := B;
      Last := A;
   end if;

   for I in First .. Last loop
      Ada.Text_IO.Put (Integer'Image (I) & ", ");
   end loop;
end Display_Numbers;