--
--  Copyright (C) 2024, Vadim Godunko <vgodunko@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

pragma Ada_2022;

with System;
with A0B.Callbacks;
with A0B.ATSAM3X8E.SVD.SYSC;

package A0B.ATSAM3X8E.WDT
  with Preelaborate
is
   type WDT_Controller_Base
     (Peripheral : not null access A0B.ATSAM3X8E.SVD.SYSC.WDT_Peripheral)
     is tagged limited
   record
      Busy              : Boolean := False with Volatile;
      --  XXX State of the controller must be protected from interrupt
      --  preemption and task switch.
      Transmit_Buffer   : System.Address;
      Receive_Buffer    : System.Address;
      Finished_Callback : A0B.Callbacks.Callback;
--        Selected_Device : access SPI_Slave_Device'Class;
      Reverse_Bits      : Boolean := False;
   end record;

   procedure Disable (Self : in out WDT_Controller_Base'Class);

   subtype WDT_Controller is
     WDT_Controller_Base
     (Peripheral   => A0B.ATSAM3X8E.SVD.SYSC.WDT_Periph'Access);

   WDT : aliased WDT_Controller;

end A0B.ATSAM3X8E.WDT;