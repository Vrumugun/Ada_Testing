with Ada.Text_IO;
with Ada.Command_Line;

procedure Main is
   procedure Greet (Name : String) is
   begin
      Ada.Text_IO.Put_Line("Hello " & Name & "!");
   end Greet;
begin
   if Ada.Command_Line.Argument_Count < 1 then
      Ada.Text_IO.Put_Line ("Invalid number of arguments!");
      return;
   elsif Ada.Command_Line.Argument_Count > 1 then
      Ada.Text_IO.Put_Line ("Ignoring additional arguments...");
   end if;
   Greet (Ada.Command_Line.Argument (1));
end Main;
