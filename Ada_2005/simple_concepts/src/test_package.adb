with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

package body Test_package is

   procedure Print_Root is
      X : Float;
   begin
      Put ("Enter a number: ");
      Get (X);
      if X < 0.0 then
         Put_Line ("Cannot compute square root of a negative number.");
      elsif X > 0.0 then
         Put_Line ("The square root of " & Float'Image (X) & " is "
            & Float'Image (Sqrt (X)));
      else -- X = 0.0
         Put_Line ("The square root of 0 is 0.");
      end if;
      New_Line;
      Put_Line ("Goodbye!");
   end Print_Root;

end Test_package;
