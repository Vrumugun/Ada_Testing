with Ada.Text_IO;
with Ada.Float_Text_IO;
with Ada.Integer_Text_IO;
with Ada.IO_Exceptions;

procedure Temperature_Convert is
   type Temperature_C is delta 0.01 range -273.15 .. 1000.0;
   type Temperature_F is delta 0.01 range -1000.00 .. 1000.0;

   input_temperature_C : Temperature_C;
   input_temperature_F : Temperature_F;
   input_value : Float;
   mode_select : Integer := 0;

   function Celsius_To_Fahrenheit (C : Temperature_C) return Temperature_F is
   begin
      return Temperature_F ((Float (C) * 9.0 / 5.0) + 32.0);
   end Celsius_To_Fahrenheit;

   function Fahrenheit_To_Celsius (F : Temperature_F) return Temperature_C is
   begin
      return Temperature_C ((Float (F) - 32.0) * 5.0 / 9.0);
   end Fahrenheit_To_Celsius;
begin
   while mode_select /= 3 loop
      Ada.Text_IO.Put ("Select: (1) - Convert from celsius to fahrenheit, " &
         "(2) - Convert from fahrenheit to celsius. " &
         "(3) - Exit. Enter selection: ");
      begin
         Ada.Integer_Text_IO.Get (mode_select);
      exception
         when E : Ada.IO_Exceptions.Data_Error =>
            Ada.Text_IO.Put_Line ("Invalid input, not a valid mode values.");
            Ada.Text_IO.Skip_Line;
            mode_select := 0;
      end;

      if mode_select = 1 then
         Ada.Text_IO.Put ("Enter temperature in Celsius: ");
         begin
            Ada.Float_Text_IO.Get (input_value);
            input_temperature_C := Temperature_C (input_value);
            Ada.Text_IO.Put ("Temperature in Fahrenheit: " &
               Temperature_F'Image (
                  Celsius_To_Fahrenheit (input_temperature_C)) &
               " F");
            Ada.Text_IO.New_Line;
         exception
            when E : Constraint_Error =>
               Ada.Text_IO.Put_Line ("Invalid input, " &
                  "temperature out of range!");
         end;
      elsif mode_select = 2 then
         Ada.Text_IO.Put ("Enter temperature in Fahrenheit: ");
         begin
            Ada.Float_Text_IO.Get (input_value);
            input_temperature_F := Temperature_F (input_value);
            Ada.Text_IO.Put ("Temperature in Celsius: " &
               Temperature_C'Image (
                  Fahrenheit_To_Celsius (input_temperature_F)) &
               " C");
            Ada.Text_IO.New_Line;
         exception
            when E : Constraint_Error =>
               Ada.Text_IO.Put_Line ("Invalid input, " &
                  "temperature out of range!");
         end;
      end if;
   end loop;
end Temperature_Convert;
