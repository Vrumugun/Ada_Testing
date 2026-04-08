with Test_package;
with Ada.Text_IO;

procedure Simple_Concepts is
   The_Array : constant array (1 .. 10) of Integer :=
      (1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
   Next : array (1 .. 10) of Integer;
   My_Buffer : Test_package.buffer;
begin
   --  Test record type
   My_Buffer.data (1 .. 11) := "Hello World";
   My_Buffer.length := 11;
   Ada.Text_IO.Put_Line ("First 5 letters of Buffer: " & My_Buffer.data (1 .. 5));

   --  Test array type
   for I in The_Array'Range loop
      Next (I) := The_Array (I) + 1;
   end loop;

   --  Print the next array
   Ada.Text_IO.Put_Line ("Next array:");
   for I in Next'Range loop
      Ada.Text_IO.Put (Integer'Image (Next (I)) & " ");
   end loop;
   Ada.Text_IO.New_Line;

   Test_package.Print_Root;
end Simple_Concepts;
