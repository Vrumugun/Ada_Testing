package Test_package is

   procedure Print_Root;

   type buffer
      is record
         data : String (1 .. 100);
         length : Natural := 0;
      end record;

end Test_package;
