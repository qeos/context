@rem compile version undet windows console
context.exe ctx4win.223 /c
fasm ctx4win.asm ctx4win.223.exe

@rem now compile Kolibri
ctx4win.223.exe ctx4kbr.223 /k

@rem make sample source
ctx4win.223.exe example.ctx /k
@rem fasm example.asm
