
# convert elf to binary

alr exec -- arm-eabi-objcopy -O binary .\bin\hello_arduino .\bin\hello_arduino.bin

or

& "C:\Users\simon\AppData\Local\alire\cache\toolchains\gnat_arm_elf_15.2.1_a927173b\bin\arm-eabi-objcopy.exe"  -O binary .\bin\hello_arduino .\bin\hello_arduino.bin

# bossac

Press "Erase" and "Reset" next on the board.

bossac -p COM3 -U false -e -w -v -b hello_arduino -R

# 1) Build
$env:Path += ";C:\Program Files\Alire\bin"
cd C:\GitHub\Ada_Testing\Arduino_Due\hello_arduino
alr build --development

# 2) Convert ELF -> BIN (absolute path to objcopy)
& "C:\Users\simon\AppData\Local\alire\cache\toolchains\gnat_arm_elf_15.2.1_a927173b\bin\arm-eabi-objcopy.exe" `
  -O binary .\bin\hello_arduino .\bin\hello_arduino.bin

# 3) Put board into bootloader (1200 baud touch on Programming port)
$p = New-Object System.IO.Ports.SerialPort COM3,1200,None,8,one
$p.Open(); $p.Close()

# 4) Flash immediately
cd C:\GitHub\Ada_Testing\Arduino_Due\bossac\1.6.1-arduino
.\bossac -p COM3 -U false -e -w -v -b "C:\GitHub\Ada_Testing\Arduino_Due\hello_arduino\bin\hello_arduino.bin" -R
