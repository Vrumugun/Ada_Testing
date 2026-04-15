with Led_Timer;
with A0B.ARMv7M.Instructions;

procedure Led_Timer_Main is
begin
   Led_Timer.Initialize;
   A0B.ARMv7M.Instructions.Enable_Interrupts;
   loop
      --  Switch CPU into lower power mode.
      A0B.ARMv7M.Instructions.Wait_For_Interrupt;
   end loop;
end Led_Timer_Main;
