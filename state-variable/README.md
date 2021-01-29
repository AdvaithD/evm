## State variable

```
mstore(0x40, 0x80)
callvalue
dup1
iszero
tag_1
jumpi
0x00
dup1
revert
tag_1:
 pop
 0x01
 0x00
 dup2
 swap1
 sstore
 pop
 dataSize(sub_0)
 dup1
 dataOffset(sub_0)
 0x00
 codecopy
 0x00
 return
stop
```

#### Bytecode

```
6080604052348015600f57600080fd5b5060016000819055506085806100266000396000f3fe6080604052348015600f57600080fd
5b506004361060285760003560e01c80630dbe671f14602d575b600080fd5b60336049565b60405180828152602001915050604051
80910390f35b6000548156fea264697066735822122080c75569e2d78735d5756b5cb9adc62ac340594b65f890183145d14a1260fd
a564736f6c63430006070033
```

`6001600081905550` - variable assignment

60 01
60 00
81
90
55
50

EVM executes each instruction top down.

```
tag2:
 // 60 01
 0x1
 // 60 00
 0x0
 // 81
 dup2
 // 90
 swap1
 // 55
 sstore
 // 50
 pop
```
0x1 is shorthand for `push(0x1)` - push the number 1 onto the stack.

EVM - stack machine. Instructions may use values on the stack as arguments, and push results 
onto the stack.
stack - [1 2]
after add: stack - [3 2 1]

Store:
store before: {}
store after: { 0x0 => 0x1} (after pushing 0x1 in 0x0, a simple mapping)

Simulating bytecode - 6001600081905550

60 01: push 1 onto stack
0x1
  stack - [0x1]
60 00: push 0 onto stack
0x0
  stack - [0x0 0x1]
81 - duplicate second item
dup2
  stack - [0x1 0x0 0x1]
90 - swap top two elements
swap1
  stack - [0x0 0x1 0x1]
55 - store 0x1 at pos 0x1, uses top two items
sstore
  stack - [0x1]
  store: { 0x0 => 0x1 }
50: pop stack
  stack: []
  store { 0x0 => 0x1 }

Resulting state: empty stackm, one item pushed to storage
