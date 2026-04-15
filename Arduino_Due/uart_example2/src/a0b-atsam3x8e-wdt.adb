--
--  Copyright (C) 2026, Simon Kraemer <simon.kraemer@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

package body A0B.ATSAM3X8E.WDT is

   procedure Disable (Self : in out WDT_Controller_Base'Class) is
   begin
      Self.Peripheral.MR := (WDDIS => True, others => <>);
   end Disable;

end A0B.ATSAM3X8E.WDT;