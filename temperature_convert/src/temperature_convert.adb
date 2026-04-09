with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.IO_Exceptions;

procedure Temperature_Convert is
   type Temperature_C is delta 0.01 range -273.15 .. 1000.0;
   type Temperature_F is delta 0.01 range -1000.00 .. 1000.0;
   type Mode_Type is (Mode_None, Mode_C_to_F, Mode_F_to_C, Mode_Exit);

   package Temp_C_IO is new Ada.Text_IO.Fixed_IO (Temperature_C);
   package Temp_F_IO is new Ada.Text_IO.Fixed_IO (Temperature_F);

   input_temperature_C : Temperature_C;
   input_temperature_F : Temperature_F;
   mode_input : Integer;
   mode_select : Mode_Type := Mode_None;

   function Celsius_To_Fahrenheit (C : Temperature_C) return Temperature_F is
   begin
      return Temperature_F ((Float (C) * 9.0 / 5.0) + 32.0);
   end Celsius_To_Fahrenheit;

   function Fahrenheit_To_Celsius (F : Temperature_F) return Temperature_C is
   begin
      return Temperature_C ((Float (F) - 32.0) * 5.0 / 9.0);
   end Fahrenheit_To_Celsius;
begin
   while mode_select /= Mode_Exit loop
      Ada.Text_IO.Put ("Select: (1) - Convert from celsius to fahrenheit, " &
         "(2) - Convert from fahrenheit to celsius. " &
         "(3) - Exit. Enter selection: ");
      begin
         Ada.Integer_Text_IO.Get (mode_input);

         case mode_input is
            when 1 =>
               mode_select := Mode_C_to_F;
            when 2 =>
               mode_select := Mode_F_to_C;
            when 3 =>
               mode_select := Mode_Exit;
            when others =>
               Ada.Text_IO.Put_Line ("Invalid input, not a valid mode value.");
               mode_select := Mode_None;
         end case;
      exception
         when Ada.IO_Exceptions.Data_Error =>
            Ada.Text_IO.Put_Line ("Invalid input, not a valid mode value.");
            Ada.Text_IO.Skip_Line;
            mode_select := Mode_None;
      end;

      if mode_select = Mode_C_to_F then
         Ada.Text_IO.Put ("Enter temperature in Celsius: ");
         begin
            Temp_C_IO.Get (input_temperature_C);
            Ada.Text_IO.Put ("Temperature in Fahrenheit: " &
               Temperature_F'Image (
                  Celsius_To_Fahrenheit (input_temperature_C)) &
               " F");
            Ada.Text_IO.New_Line;
         exception
            when Constraint_Error =>
               Ada.Text_IO.Put_Line ("Invalid input, " &
                  "temperature out of range!");
               Ada.Text_IO.Skip_Line;
            when Ada.IO_Exceptions.Data_Error =>
               Ada.Text_IO.Put_Line ("Invalid input, not a valid mode value.");
               Ada.Text_IO.Skip_Line;
               mode_select := Mode_None;
         end;
      elsif mode_select = Mode_F_to_C then
         Ada.Text_IO.Put ("Enter temperature in Fahrenheit: ");
         begin
            Temp_F_IO.Get (input_temperature_F);
            Ada.Text_IO.Put ("Temperature in Celsius: " &
               Temperature_C'Image (
                  Fahrenheit_To_Celsius (input_temperature_F)) &
               " C");
            Ada.Text_IO.New_Line;
         exception
            when Constraint_Error =>
               Ada.Text_IO.Put_Line ("Invalid input, " &
                  "temperature out of range!");
               Ada.Text_IO.Skip_Line;
         end;
      end if;
   end loop;
end Temperature_Convert;
