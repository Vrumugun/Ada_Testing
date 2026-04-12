with Ada.Text_IO;
with Ada.Command_Line;
with Display_Numbers;

procedure Display_Numbers_Main is
   A, B : Integer;
begin
   if Ada.Command_Line.Argument_Count < 2 then
      Ada.Text_IO.Put_Line ("Invalid number of arguments!");
      return;
   elsif Ada.Command_Line.Argument_Count > 2 then
      Ada.Text_IO.Put_Line ("Ignoring additional arguments!");
   end if;

   A := Integer'Value (Ada.Command_Line.Argument (1));
   B := Integer'Value (Ada.Command_Line.Argument (2));

   Display_Numbers (A, B);
end Display_Numbers_Main;
