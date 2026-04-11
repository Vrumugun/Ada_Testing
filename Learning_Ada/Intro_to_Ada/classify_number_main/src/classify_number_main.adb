with Ada.Text_IO;
with Ada.Command_Line;
with Classify_Number;

procedure Classify_Number_Main is
   A : Integer;
begin
   if Ada.Command_Line.Argument_Count < 1 then
      Ada.Text_IO.Put_Line ("Invalid number of arguments!");
      return;
   end if;

   A := Integer'Value (Ada.Command_Line.Argument (1));

   Classify_Number (A);
end Classify_Number_Main;
