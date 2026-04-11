with Ada.Text_IO;

procedure Classify_Number (X : Integer) is
begin
   if X > 0 then
      Ada.Text_IO.Put_Line ("Positive!");
   elsif X < 0 then
      Ada.Text_IO.Put_Line ("Negative!");
   else
      Ada.Text_IO.Put_Line ("Zero!");
   end if;
end Classify_Number;