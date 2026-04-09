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
   mode_select : Mode_Type := Mode_None;

   function Celsius_To_Fahrenheit (C : Temperature_C) return Temperature_F is
   begin
      return Temperature_F ((C * 9) / 5 + Temperature_C'(32.0));
   end Celsius_To_Fahrenheit;

   function Fahrenheit_To_Celsius (F : Temperature_F) return Temperature_C is
   begin
      return Temperature_C ((F - Temperature_F'(32.0)) * 5 / 9);
   end Fahrenheit_To_Celsius;

   function Read_Mode return Mode_Type is
      input_mode : Mode_Type;
      input_value : Integer;
   begin
      loop
         Ada.Text_IO.Put ("Select: " &
            "(1) - Convert from celsius to fahrenheit, " &
            "(2) - Convert from fahrenheit to celsius. " &
            "(3) - Exit. Enter selection: ");
         begin
            Ada.Integer_Text_IO.Get (input_value);
            case input_value is
               when 1 =>
                  input_mode := Mode_C_to_F;
               when 2 =>
                  input_mode := Mode_F_to_C;
               when 3 =>
                  input_mode := Mode_Exit;
               when others =>
                  Ada.Text_IO.Put_Line ("Invalid input, not a valid mode.");
                  input_mode := Mode_None;
            end case;
            return input_mode;
         exception
            when Ada.IO_Exceptions.Data_Error =>
               Ada.Text_IO.Put_Line ("Invalid input, not a valid mode value.");
               Ada.Text_IO.Skip_Line;
         end;
      end loop;
   end Read_Mode;

   function Get_Temperature_C return Temperature_C is
      Value : Temperature_C;
   begin
      loop
         begin
            Ada.Text_IO.Put ("Enter temperature in Celsius: ");
            Temp_C_IO.Get (Value);
            return Value;
         exception
            when Constraint_Error | Ada.IO_Exceptions.Data_Error =>
               Ada.Text_IO.Put_Line ("Invalid temperature.");
               Ada.Text_IO.Skip_Line;
         end;
      end loop;
   end Get_Temperature_C;

   function Get_Temperature_F return Temperature_F is
      Value : Temperature_F;
   begin
      loop
         begin
            Ada.Text_IO.Put ("Enter temperature in Fahrenheit: ");
            Temp_F_IO.Get (Value);
            return Value;
         exception
            when Constraint_Error | Ada.IO_Exceptions.Data_Error =>
               Ada.Text_IO.Put_Line ("Invalid temperature.");
               Ada.Text_IO.Skip_Line;
         end;
      end loop;
   end Get_Temperature_F;

begin
   while mode_select /= Mode_Exit loop
      mode_select := Read_Mode;

      if mode_select = Mode_C_to_F then
         input_temperature_C := Get_Temperature_C;
         Ada.Text_IO.Put ("Temperature in Fahrenheit: " &
            Temperature_F'Image (
               Celsius_To_Fahrenheit (input_temperature_C)) &
            " F");
         Ada.Text_IO.New_Line;
      elsif mode_select = Mode_F_to_C then
         input_temperature_F := Get_Temperature_F;
         Ada.Text_IO.Put ("Temperature in Celsius: " &
            Temperature_C'Image (
               Fahrenheit_To_Celsius (input_temperature_F)) &
            " C");
         Ada.Text_IO.New_Line;
      end if;
   end loop;
end Temperature_Convert;
