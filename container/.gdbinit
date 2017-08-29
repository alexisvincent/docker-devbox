# set Intel instruction format, otherwise we get AT&T
set disassembly-flavor intel

# have registers and assembly visible
layout asm
layout regs
focus cmd

# resize asm/regs tab heights; adjust to taste
wh asm +8
wh regs -5

# fix stepping
define si
    stepi
    refresh
end

define ni
    nexti
    refresh
end

define s
    step
    refresh
end

define n
    next
    refresh
end

# context of variables pushed on top of the stack before a function call
define showbase
    x/x $ebp
    x/x $ebp+4
    x/x $ebp+8
    x/x $ebp+16
    x/x $ebp+20
    x/x $ebp+24
    x/x $ebp+28
    x/x $ebp+32
end

# top of the stack
define showstack
    x/x $esp
    x/x $esp+4
    x/x $esp+8
    x/x $esp+16
    x/x $esp+20
    x/x $esp+24
    x/x $esp+28
    x/x $esp+32
end

# example break point settings
# b *0x8048eee
# b *0x8048e94
# b *0x80494fc
