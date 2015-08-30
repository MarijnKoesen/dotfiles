set iskeyword=@,48-57,_,-,192-255

syntax keyword Type int list str term
syntax match   Type "[a-z-0-9-]*"

syntax match Identifier "[A-Z][a-z0-9-]*"
syntax match Identifier "?"

syntax keyword Statement process is
syntax keyword Statement tau delta
syntax keyword Statement let in endlet
syntax keyword Statement tool command
syntax keyword Statement first next

syntax keyword Conditional if then else fi
syntax keyword Conditional not not-equal equal and or

syntax keyword Special process-id
syntax match   Special 'execute('he=e-1
syntax match   Special 'create('he=e-1
syntax match   Special 'shutdown('he=e-1

syntax match Error     'snd-.*('he=e-1
syntax match Error     'rec-.*('he=e-1

syntax match Statement 'snd-do('he=e-1
syntax match   Special 'snd-terminate('he=e-1

syntax match Statement 'rec-connect('he=e-1
syntax match Statement 'rec-disconnect('he=e-1

syntax match Statement 'subscribe('he=e-1
syntax match Statement 'unsubscribe('he=e-1

syntax match Statement 'snd-msg('he=e-1
syntax match Statement 'rec-msg('he=e-1

syntax match Statement 'rec-event('he=e-1
syntax match Statement 'snd-ack-event('he=e-1

syntax match Statement 'snd-eval('he=e-1
syntax match Statement 'rec-value('he=e-1

syntax match Statement 'snd-note('he=e-1
syntax match Statement 'rec-note('he=e-1

syntax match Operator "+"
syntax match Operator "*"
syntax match Operator "\."

syntax region Comment start="/\*" end="\*/"

syntax region String  start=+L\="+ skip=+\\\\\|\\"+ end=+"+
