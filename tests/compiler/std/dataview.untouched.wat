(module
 (type $iii (func (param i32 i32) (result i32)))
 (type $iiiiv (func (param i32 i32 i32 i32)))
 (type $ii (func (param i32) (result i32)))
 (type $iiiv (func (param i32 i32 i32)))
 (type $iiiii (func (param i32 i32 i32 i32) (result i32)))
 (type $II (func (param i64) (result i64)))
 (type $v (func))
 (memory $0 1)
 (data (i32.const 8) "\1b\00\00\00~\00l\00i\00b\00/\00i\00n\00t\00e\00r\00n\00a\00l\00/\00t\00y\00p\00e\00d\00a\00r\00r\00a\00y\00.\00t\00s\00")
 (data (i32.const 72) "\1c\00\00\00~\00l\00i\00b\00/\00i\00n\00t\00e\00r\00n\00a\00l\00/\00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00.\00t\00s\00")
 (data (i32.const 136) "\10\00\00\00~\00l\00i\00b\00/\00d\00a\00t\00a\00v\00i\00e\00w\00.\00t\00s\00")
 (data (i32.const 176) "\11\00\00\00~\00l\00i\00b\00/\00p\00o\00l\00y\00f\00i\00l\00l\00s\00.\00t\00s\00")
 (data (i32.const 216) "\0f\00\00\00s\00t\00d\00/\00d\00a\00t\00a\00v\00i\00e\00w\00.\00t\00s\00")
 (table 1 anyfunc)
 (elem (i32.const 0) $null)
 (import "env" "abort" (func $~lib/env/abort (param i32 i32 i32 i32)))
 (global $~lib/internal/allocator/AL_BITS i32 (i32.const 3))
 (global $~lib/internal/allocator/AL_SIZE i32 (i32.const 8))
 (global $~lib/internal/allocator/AL_MASK i32 (i32.const 7))
 (global $~lib/internal/allocator/MAX_SIZE_32 i32 (i32.const 1073741824))
 (global $~lib/allocator/arena/startOffset (mut i32) (i32.const 0))
 (global $~lib/allocator/arena/offset (mut i32) (i32.const 0))
 (global $~lib/internal/arraybuffer/HEADER_SIZE i32 (i32.const 8))
 (global $~lib/internal/arraybuffer/MAX_BLENGTH i32 (i32.const 1073741816))
 (global $std/dataview/array (mut i32) (i32.const 0))
 (global $~lib/builtins/i32.MIN_VALUE i32 (i32.const -2147483648))
 (global $std/dataview/view (mut i32) (i32.const 0))
 (global $HEAP_BASE i32 (i32.const 252))
 (export "memory" (memory $0))
 (export "table" (table $0))
 (start $start)
 (func $~lib/internal/arraybuffer/computeSize (; 1 ;) (type $ii) (param $0 i32) (result i32)
  (i32.shl
   (i32.const 1)
   (i32.sub
    (i32.const 32)
    (i32.clz
     (i32.sub
      (i32.add
       (get_local $0)
       (get_global $~lib/internal/arraybuffer/HEADER_SIZE)
      )
      (i32.const 1)
     )
    )
   )
  )
 )
 (func $~lib/allocator/arena/__memory_allocate (; 2 ;) (type $ii) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (if
   (i32.gt_u
    (get_local $0)
    (get_global $~lib/internal/allocator/MAX_SIZE_32)
   )
   (unreachable)
  )
  (set_local $1
   (get_global $~lib/allocator/arena/offset)
  )
  (set_local $4
   (i32.and
    (i32.add
     (i32.add
      (get_local $1)
      (select
       (tee_local $2
        (get_local $0)
       )
       (tee_local $3
        (i32.const 1)
       )
       (i32.gt_u
        (get_local $2)
        (get_local $3)
       )
      )
     )
     (get_global $~lib/internal/allocator/AL_MASK)
    )
    (i32.xor
     (get_global $~lib/internal/allocator/AL_MASK)
     (i32.const -1)
    )
   )
  )
  (set_local $5
   (current_memory)
  )
  (if
   (i32.gt_u
    (get_local $4)
    (i32.shl
     (get_local $5)
     (i32.const 16)
    )
   )
   (block
    (set_local $2
     (i32.shr_u
      (i32.and
       (i32.add
        (i32.sub
         (get_local $4)
         (get_local $1)
        )
        (i32.const 65535)
       )
       (i32.xor
        (i32.const 65535)
        (i32.const -1)
       )
      )
      (i32.const 16)
     )
    )
    (set_local $3
     (select
      (tee_local $3
       (get_local $5)
      )
      (tee_local $6
       (get_local $2)
      )
      (i32.gt_s
       (get_local $3)
       (get_local $6)
      )
     )
    )
    (if
     (i32.lt_s
      (grow_memory
       (get_local $3)
      )
      (i32.const 0)
     )
     (if
      (i32.lt_s
       (grow_memory
        (get_local $2)
       )
       (i32.const 0)
      )
      (unreachable)
     )
    )
   )
  )
  (set_global $~lib/allocator/arena/offset
   (get_local $4)
  )
  (get_local $1)
 )
 (func $~lib/internal/arraybuffer/allocateUnsafe (; 3 ;) (type $ii) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (if
   (i32.eqz
    (i32.le_u
     (get_local $0)
     (get_global $~lib/internal/arraybuffer/MAX_BLENGTH)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 72)
     (i32.const 23)
     (i32.const 2)
    )
    (unreachable)
   )
  )
  (set_local $1
   (block $~lib/memory/memory.allocate|inlined.0 (result i32)
    (set_local $2
     (call $~lib/internal/arraybuffer/computeSize
      (get_local $0)
     )
    )
    (br $~lib/memory/memory.allocate|inlined.0
     (call $~lib/allocator/arena/__memory_allocate
      (get_local $2)
     )
    )
   )
  )
  (i32.store
   (get_local $1)
   (get_local $0)
  )
  (get_local $1)
 )
 (func $~lib/internal/memory/memset (; 4 ;) (type $iiiv) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i64)
  (if
   (i32.eqz
    (get_local $2)
   )
   (return)
  )
  (i32.store8
   (get_local $0)
   (get_local $1)
  )
  (i32.store8
   (i32.sub
    (i32.add
     (get_local $0)
     (get_local $2)
    )
    (i32.const 1)
   )
   (get_local $1)
  )
  (if
   (i32.le_u
    (get_local $2)
    (i32.const 2)
   )
   (return)
  )
  (i32.store8
   (i32.add
    (get_local $0)
    (i32.const 1)
   )
   (get_local $1)
  )
  (i32.store8
   (i32.add
    (get_local $0)
    (i32.const 2)
   )
   (get_local $1)
  )
  (i32.store8
   (i32.sub
    (i32.add
     (get_local $0)
     (get_local $2)
    )
    (i32.const 2)
   )
   (get_local $1)
  )
  (i32.store8
   (i32.sub
    (i32.add
     (get_local $0)
     (get_local $2)
    )
    (i32.const 3)
   )
   (get_local $1)
  )
  (if
   (i32.le_u
    (get_local $2)
    (i32.const 6)
   )
   (return)
  )
  (i32.store8
   (i32.add
    (get_local $0)
    (i32.const 3)
   )
   (get_local $1)
  )
  (i32.store8
   (i32.sub
    (i32.add
     (get_local $0)
     (get_local $2)
    )
    (i32.const 4)
   )
   (get_local $1)
  )
  (if
   (i32.le_u
    (get_local $2)
    (i32.const 8)
   )
   (return)
  )
  (set_local $3
   (i32.and
    (i32.sub
     (i32.const 0)
     (get_local $0)
    )
    (i32.const 3)
   )
  )
  (set_local $0
   (i32.add
    (get_local $0)
    (get_local $3)
   )
  )
  (set_local $2
   (i32.sub
    (get_local $2)
    (get_local $3)
   )
  )
  (set_local $2
   (i32.and
    (get_local $2)
    (i32.const -4)
   )
  )
  (set_local $4
   (i32.mul
    (i32.div_u
     (i32.const -1)
     (i32.const 255)
    )
    (i32.and
     (get_local $1)
     (i32.const 255)
    )
   )
  )
  (i32.store
   (get_local $0)
   (get_local $4)
  )
  (i32.store
   (i32.sub
    (i32.add
     (get_local $0)
     (get_local $2)
    )
    (i32.const 4)
   )
   (get_local $4)
  )
  (if
   (i32.le_u
    (get_local $2)
    (i32.const 8)
   )
   (return)
  )
  (i32.store
   (i32.add
    (get_local $0)
    (i32.const 4)
   )
   (get_local $4)
  )
  (i32.store
   (i32.add
    (get_local $0)
    (i32.const 8)
   )
   (get_local $4)
  )
  (i32.store
   (i32.sub
    (i32.add
     (get_local $0)
     (get_local $2)
    )
    (i32.const 12)
   )
   (get_local $4)
  )
  (i32.store
   (i32.sub
    (i32.add
     (get_local $0)
     (get_local $2)
    )
    (i32.const 8)
   )
   (get_local $4)
  )
  (if
   (i32.le_u
    (get_local $2)
    (i32.const 24)
   )
   (return)
  )
  (i32.store
   (i32.add
    (get_local $0)
    (i32.const 12)
   )
   (get_local $4)
  )
  (i32.store
   (i32.add
    (get_local $0)
    (i32.const 16)
   )
   (get_local $4)
  )
  (i32.store
   (i32.add
    (get_local $0)
    (i32.const 20)
   )
   (get_local $4)
  )
  (i32.store
   (i32.add
    (get_local $0)
    (i32.const 24)
   )
   (get_local $4)
  )
  (i32.store
   (i32.sub
    (i32.add
     (get_local $0)
     (get_local $2)
    )
    (i32.const 28)
   )
   (get_local $4)
  )
  (i32.store
   (i32.sub
    (i32.add
     (get_local $0)
     (get_local $2)
    )
    (i32.const 24)
   )
   (get_local $4)
  )
  (i32.store
   (i32.sub
    (i32.add
     (get_local $0)
     (get_local $2)
    )
    (i32.const 20)
   )
   (get_local $4)
  )
  (i32.store
   (i32.sub
    (i32.add
     (get_local $0)
     (get_local $2)
    )
    (i32.const 16)
   )
   (get_local $4)
  )
  (set_local $3
   (i32.add
    (i32.const 24)
    (i32.and
     (get_local $0)
     (i32.const 4)
    )
   )
  )
  (set_local $0
   (i32.add
    (get_local $0)
    (get_local $3)
   )
  )
  (set_local $2
   (i32.sub
    (get_local $2)
    (get_local $3)
   )
  )
  (set_local $5
   (i64.or
    (i64.extend_u/i32
     (get_local $4)
    )
    (i64.shl
     (i64.extend_u/i32
      (get_local $4)
     )
     (i64.const 32)
    )
   )
  )
  (block $break|0
   (loop $continue|0
    (if
     (i32.ge_u
      (get_local $2)
      (i32.const 32)
     )
     (block
      (block
       (i64.store
        (get_local $0)
        (get_local $5)
       )
       (i64.store
        (i32.add
         (get_local $0)
         (i32.const 8)
        )
        (get_local $5)
       )
       (i64.store
        (i32.add
         (get_local $0)
         (i32.const 16)
        )
        (get_local $5)
       )
       (i64.store
        (i32.add
         (get_local $0)
         (i32.const 24)
        )
        (get_local $5)
       )
       (set_local $2
        (i32.sub
         (get_local $2)
         (i32.const 32)
        )
       )
       (set_local $0
        (i32.add
         (get_local $0)
         (i32.const 32)
        )
       )
      )
      (br $continue|0)
     )
    )
   )
  )
 )
 (func $~lib/memory/memory.allocate (; 5 ;) (type $ii) (param $0 i32) (result i32)
  (return
   (call $~lib/allocator/arena/__memory_allocate
    (get_local $0)
   )
  )
 )
 (func $~lib/internal/typedarray/TypedArray<u8,u32>#constructor (; 6 ;) (type $iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (if
   (i32.gt_u
    (get_local $1)
    (i32.const 1073741816)
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 8)
     (i32.const 24)
     (i32.const 34)
    )
    (unreachable)
   )
  )
  (set_local $2
   (i32.shl
    (get_local $1)
    (i32.const 0)
   )
  )
  (set_local $3
   (call $~lib/internal/arraybuffer/allocateUnsafe
    (get_local $2)
   )
  )
  (block $~lib/memory/memory.fill|inlined.0
   (set_local $4
    (i32.add
     (get_local $3)
     (get_global $~lib/internal/arraybuffer/HEADER_SIZE)
    )
   )
   (set_local $5
    (i32.const 0)
   )
   (call $~lib/internal/memory/memset
    (get_local $4)
    (get_local $5)
    (get_local $2)
   )
  )
  (i32.store
   (tee_local $0
    (if (result i32)
     (get_local $0)
     (get_local $0)
     (tee_local $0
      (block (result i32)
       (set_local $5
        (call $~lib/memory/memory.allocate
         (i32.const 12)
        )
       )
       (i32.store
        (get_local $5)
        (i32.const 0)
       )
       (i32.store offset=4
        (get_local $5)
        (i32.const 0)
       )
       (i32.store offset=8
        (get_local $5)
        (i32.const 0)
       )
       (get_local $5)
      )
     )
    )
   )
   (get_local $3)
  )
  (i32.store offset=4
   (get_local $0)
   (i32.const 0)
  )
  (i32.store offset=8
   (get_local $0)
   (get_local $2)
  )
  (get_local $0)
 )
 (func $~lib/internal/typedarray/TypedArray<u8,u32>#__set (; 7 ;) (type $iiiv) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (set_local $3
   (i32.load offset=4
    (get_local $0)
   )
  )
  (set_local $4
   (i32.shr_u
    (i32.sub
     (i32.load offset=8
      (get_local $0)
     )
     (get_local $3)
    )
    (i32.const 0)
   )
  )
  (if
   (i32.ge_u
    (get_local $1)
    (get_local $4)
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 8)
     (i32.const 55)
     (i32.const 42)
    )
    (unreachable)
   )
  )
  (block $~lib/internal/arraybuffer/storeUnsafeWithOffset<u8,u32>|inlined.0
   (set_local $5
    (i32.load
     (get_local $0)
    )
   )
   (i32.store8 offset=8
    (i32.add
     (i32.add
      (get_local $5)
      (get_local $3)
     )
     (i32.shl
      (get_local $1)
      (i32.const 0)
     )
    )
    (get_local $2)
   )
  )
 )
 (func $~lib/dataview/DataView#constructor (; 8 ;) (type $iiiii) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (result i32)
  (local $4 i32)
  (if
   (i32.eq
    (get_local $3)
    (get_global $~lib/builtins/i32.MIN_VALUE)
   )
   (set_local $3
    (i32.sub
     (i32.load
      (get_local $1)
     )
     (get_local $2)
    )
   )
  )
  (if
   (i32.lt_s
    (get_local $2)
    (i32.const 0)
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 136)
     (i32.const 23)
     (i32.const 24)
    )
    (unreachable)
   )
  )
  (if
   (i32.lt_s
    (get_local $3)
    (i32.const 0)
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 136)
     (i32.const 24)
     (i32.const 24)
    )
    (unreachable)
   )
  )
  (if
   (i32.gt_s
    (i32.add
     (get_local $2)
     (get_local $3)
    )
    (i32.load
     (get_local $1)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 136)
     (i32.const 25)
     (i32.const 53)
    )
    (unreachable)
   )
  )
  (tee_local $0
   (if (result i32)
    (get_local $0)
    (get_local $0)
    (tee_local $0
     (block (result i32)
      (set_local $4
       (call $~lib/memory/memory.allocate
        (i32.const 12)
       )
      )
      (i32.store
       (get_local $4)
       (get_local $1)
      )
      (i32.store offset=4
       (get_local $4)
       (get_local $2)
      )
      (i32.store offset=8
       (get_local $4)
       (get_local $3)
      )
      (get_local $4)
     )
    )
   )
  )
 )
 (func $~lib/polyfills/bswap<u32> (; 9 ;) (type $ii) (param $0 i32) (result i32)
  (local $1 i32)
  (if
   (i32.eqz
    (if (result i32)
     (tee_local $1
      (if (result i32)
       (tee_local $1
        (if (result i32)
         (tee_local $1
          (i32.eq
           (i32.const 4)
           (i32.const 1)
          )
         )
         (get_local $1)
         (i32.eq
          (i32.const 4)
          (i32.const 2)
         )
        )
       )
       (get_local $1)
       (i32.eq
        (i32.const 4)
        (i32.const 4)
       )
      )
     )
     (get_local $1)
     (i32.eq
      (i32.const 4)
      (i32.const 8)
     )
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 176)
     (i32.const 2)
     (i32.const 2)
    )
    (unreachable)
   )
  )
  (return
   (i32.or
    (i32.rotl
     (i32.and
      (get_local $0)
      (i32.const -16711936)
     )
     (i32.const 8)
    )
    (i32.rotr
     (i32.and
      (get_local $0)
      (i32.const 16711935)
     )
     (i32.const 8)
    )
   )
  )
 )
 (func $~lib/polyfills/bswap<u64> (; 10 ;) (type $II) (param $0 i64) (result i64)
  (local $1 i32)
  (local $2 i64)
  (local $3 i64)
  (local $4 i64)
  (if
   (i32.eqz
    (if (result i32)
     (tee_local $1
      (if (result i32)
       (tee_local $1
        (if (result i32)
         (tee_local $1
          (i32.eq
           (i32.const 8)
           (i32.const 1)
          )
         )
         (get_local $1)
         (i32.eq
          (i32.const 8)
          (i32.const 2)
         )
        )
       )
       (get_local $1)
       (i32.eq
        (i32.const 8)
        (i32.const 4)
       )
      )
     )
     (get_local $1)
     (i32.eq
      (i32.const 8)
      (i32.const 8)
     )
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 176)
     (i32.const 2)
     (i32.const 2)
    )
    (unreachable)
   )
  )
  (set_local $2
   (i64.and
    (i64.shr_u
     (get_local $0)
     (i64.const 8)
    )
    (i64.const 71777214294589695)
   )
  )
  (set_local $3
   (i64.shl
    (i64.and
     (get_local $0)
     (i64.const 71777214294589695)
    )
    (i64.const 8)
   )
  )
  (set_local $4
   (i64.or
    (get_local $2)
    (get_local $3)
   )
  )
  (set_local $2
   (i64.and
    (i64.shr_u
     (get_local $4)
     (i64.const 16)
    )
    (i64.const 281470681808895)
   )
  )
  (set_local $3
   (i64.shl
    (i64.and
     (get_local $4)
     (i64.const 281470681808895)
    )
    (i64.const 16)
   )
  )
  (return
   (i64.rotr
    (i64.or
     (get_local $2)
     (get_local $3)
    )
    (i64.const 32)
   )
  )
 )
 (func $~lib/polyfills/bswap<i8> (; 11 ;) (type $ii) (param $0 i32) (result i32)
  (local $1 i32)
  (if
   (i32.eqz
    (if (result i32)
     (tee_local $1
      (if (result i32)
       (tee_local $1
        (if (result i32)
         (tee_local $1
          (i32.eq
           (i32.const 1)
           (i32.const 1)
          )
         )
         (get_local $1)
         (i32.eq
          (i32.const 1)
          (i32.const 2)
         )
        )
       )
       (get_local $1)
       (i32.eq
        (i32.const 1)
        (i32.const 4)
       )
      )
     )
     (get_local $1)
     (i32.eq
      (i32.const 1)
      (i32.const 8)
     )
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 176)
     (i32.const 2)
     (i32.const 2)
    )
    (unreachable)
   )
  )
  (get_local $0)
 )
 (func $~lib/polyfills/bswap16<i16> (; 12 ;) (type $ii) (param $0 i32) (result i32)
  (local $1 i32)
  (if
   (i32.eqz
    (if (result i32)
     (tee_local $1
      (if (result i32)
       (tee_local $1
        (i32.eq
         (i32.const 2)
         (i32.const 1)
        )
       )
       (get_local $1)
       (i32.eq
        (i32.const 2)
        (i32.const 2)
       )
      )
     )
     (get_local $1)
     (i32.eq
      (i32.const 2)
      (i32.const 4)
     )
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 176)
     (i32.const 27)
     (i32.const 2)
    )
    (unreachable)
   )
  )
  (if
   (if (result i32)
    (tee_local $1
     (i32.eq
      (i32.const 2)
      (i32.const 2)
     )
    )
    (get_local $1)
    (i32.eq
     (i32.const 2)
     (i32.const 4)
    )
   )
   (return
    (i32.or
     (i32.or
      (i32.and
       (i32.shl
        (get_local $0)
        (i32.const 8)
       )
       (i32.const 65280)
      )
      (i32.and
       (i32.shr_s
        (i32.shr_s
         (i32.shl
          (get_local $0)
          (i32.const 16)
         )
         (i32.const 16)
        )
        (i32.const 8)
       )
       (i32.const 255)
      )
     )
     (i32.and
      (get_local $0)
      (i32.const -65536)
     )
    )
   )
  )
  (get_local $0)
 )
 (func $~lib/polyfills/bswap<i16> (; 13 ;) (type $ii) (param $0 i32) (result i32)
  (local $1 i32)
  (if
   (i32.eqz
    (if (result i32)
     (tee_local $1
      (if (result i32)
       (tee_local $1
        (if (result i32)
         (tee_local $1
          (i32.eq
           (i32.const 2)
           (i32.const 1)
          )
         )
         (get_local $1)
         (i32.eq
          (i32.const 2)
          (i32.const 2)
         )
        )
       )
       (get_local $1)
       (i32.eq
        (i32.const 2)
        (i32.const 4)
       )
      )
     )
     (get_local $1)
     (i32.eq
      (i32.const 2)
      (i32.const 8)
     )
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 176)
     (i32.const 2)
     (i32.const 2)
    )
    (unreachable)
   )
  )
  (return
   (call $~lib/polyfills/bswap16<i16>
    (get_local $0)
   )
  )
 )
 (func $~lib/polyfills/bswap<i32> (; 14 ;) (type $ii) (param $0 i32) (result i32)
  (local $1 i32)
  (if
   (i32.eqz
    (if (result i32)
     (tee_local $1
      (if (result i32)
       (tee_local $1
        (if (result i32)
         (tee_local $1
          (i32.eq
           (i32.const 4)
           (i32.const 1)
          )
         )
         (get_local $1)
         (i32.eq
          (i32.const 4)
          (i32.const 2)
         )
        )
       )
       (get_local $1)
       (i32.eq
        (i32.const 4)
        (i32.const 4)
       )
      )
     )
     (get_local $1)
     (i32.eq
      (i32.const 4)
      (i32.const 8)
     )
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 176)
     (i32.const 2)
     (i32.const 2)
    )
    (unreachable)
   )
  )
  (return
   (i32.or
    (i32.rotl
     (i32.and
      (get_local $0)
      (i32.const -16711936)
     )
     (i32.const 8)
    )
    (i32.rotr
     (i32.and
      (get_local $0)
      (i32.const 16711935)
     )
     (i32.const 8)
    )
   )
  )
 )
 (func $~lib/polyfills/bswap<u8> (; 15 ;) (type $ii) (param $0 i32) (result i32)
  (local $1 i32)
  (if
   (i32.eqz
    (if (result i32)
     (tee_local $1
      (if (result i32)
       (tee_local $1
        (if (result i32)
         (tee_local $1
          (i32.eq
           (i32.const 1)
           (i32.const 1)
          )
         )
         (get_local $1)
         (i32.eq
          (i32.const 1)
          (i32.const 2)
         )
        )
       )
       (get_local $1)
       (i32.eq
        (i32.const 1)
        (i32.const 4)
       )
      )
     )
     (get_local $1)
     (i32.eq
      (i32.const 1)
      (i32.const 8)
     )
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 176)
     (i32.const 2)
     (i32.const 2)
    )
    (unreachable)
   )
  )
  (get_local $0)
 )
 (func $~lib/polyfills/bswap16<u16> (; 16 ;) (type $ii) (param $0 i32) (result i32)
  (local $1 i32)
  (if
   (i32.eqz
    (if (result i32)
     (tee_local $1
      (if (result i32)
       (tee_local $1
        (i32.eq
         (i32.const 2)
         (i32.const 1)
        )
       )
       (get_local $1)
       (i32.eq
        (i32.const 2)
        (i32.const 2)
       )
      )
     )
     (get_local $1)
     (i32.eq
      (i32.const 2)
      (i32.const 4)
     )
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 176)
     (i32.const 27)
     (i32.const 2)
    )
    (unreachable)
   )
  )
  (if
   (if (result i32)
    (tee_local $1
     (i32.eq
      (i32.const 2)
      (i32.const 2)
     )
    )
    (get_local $1)
    (i32.eq
     (i32.const 2)
     (i32.const 4)
    )
   )
   (return
    (i32.or
     (i32.or
      (i32.and
       (i32.shl
        (get_local $0)
        (i32.const 8)
       )
       (i32.const 65280)
      )
      (i32.and
       (i32.shr_u
        (i32.and
         (get_local $0)
         (i32.const 65535)
        )
        (i32.const 8)
       )
       (i32.const 255)
      )
     )
     (i32.and
      (get_local $0)
      (i32.const -65536)
     )
    )
   )
  )
  (get_local $0)
 )
 (func $~lib/polyfills/bswap<u16> (; 17 ;) (type $ii) (param $0 i32) (result i32)
  (local $1 i32)
  (if
   (i32.eqz
    (if (result i32)
     (tee_local $1
      (if (result i32)
       (tee_local $1
        (if (result i32)
         (tee_local $1
          (i32.eq
           (i32.const 2)
           (i32.const 1)
          )
         )
         (get_local $1)
         (i32.eq
          (i32.const 2)
          (i32.const 2)
         )
        )
       )
       (get_local $1)
       (i32.eq
        (i32.const 2)
        (i32.const 4)
       )
      )
     )
     (get_local $1)
     (i32.eq
      (i32.const 2)
      (i32.const 8)
     )
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 176)
     (i32.const 2)
     (i32.const 2)
    )
    (unreachable)
   )
  )
  (return
   (call $~lib/polyfills/bswap16<u16>
    (get_local $0)
   )
  )
 )
 (func $start (; 18 ;) (type $v)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i64)
  (local $5 i32)
  (local $6 i32)
  (set_global $~lib/allocator/arena/startOffset
   (i32.and
    (i32.add
     (get_global $HEAP_BASE)
     (get_global $~lib/internal/allocator/AL_MASK)
    )
    (i32.xor
     (get_global $~lib/internal/allocator/AL_MASK)
     (i32.const -1)
    )
   )
  )
  (set_global $~lib/allocator/arena/offset
   (get_global $~lib/allocator/arena/startOffset)
  )
  (set_global $std/dataview/array
   (call $~lib/internal/typedarray/TypedArray<u8,u32>#constructor
    (i32.const 0)
    (i32.const 8)
   )
  )
  (call $~lib/internal/typedarray/TypedArray<u8,u32>#__set
   (get_global $std/dataview/array)
   (i32.const 0)
   (i32.const 246)
  )
  (call $~lib/internal/typedarray/TypedArray<u8,u32>#__set
   (get_global $std/dataview/array)
   (i32.const 1)
   (i32.const 224)
  )
  (call $~lib/internal/typedarray/TypedArray<u8,u32>#__set
   (get_global $std/dataview/array)
   (i32.const 2)
   (i32.const 88)
  )
  (call $~lib/internal/typedarray/TypedArray<u8,u32>#__set
   (get_global $std/dataview/array)
   (i32.const 3)
   (i32.const 159)
  )
  (call $~lib/internal/typedarray/TypedArray<u8,u32>#__set
   (get_global $std/dataview/array)
   (i32.const 4)
   (i32.const 130)
  )
  (call $~lib/internal/typedarray/TypedArray<u8,u32>#__set
   (get_global $std/dataview/array)
   (i32.const 5)
   (i32.const 101)
  )
  (call $~lib/internal/typedarray/TypedArray<u8,u32>#__set
   (get_global $std/dataview/array)
   (i32.const 6)
   (i32.const 67)
  )
  (call $~lib/internal/typedarray/TypedArray<u8,u32>#__set
   (get_global $std/dataview/array)
   (i32.const 7)
   (i32.const 95)
  )
  (set_global $std/dataview/view
   (call $~lib/dataview/DataView#constructor
    (i32.const 0)
    (i32.load
     (get_global $std/dataview/array)
    )
    (i32.load offset=4
     (get_global $std/dataview/array)
    )
    (i32.load offset=8
     (get_global $std/dataview/array)
    )
   )
  )
  (if
   (i32.eqz
    (f32.eq
     (block $~lib/dataview/DataView#getFloat32|inlined.0 (result f32)
      (set_local $0
       (get_global $std/dataview/view)
      )
      (set_local $1
       (i32.const 0)
      )
      (set_local $2
       (i32.const 1)
      )
      (set_local $3
       (i32.load offset=8
        (i32.add
         (i32.add
          (i32.load
           (get_local $0)
          )
          (i32.load offset=4
           (get_local $0)
          )
         )
         (get_local $1)
        )
       )
      )
      (f32.reinterpret/i32
       (if (result i32)
        (get_local $2)
        (get_local $3)
        (call $~lib/polyfills/bswap<u32>
         (get_local $3)
        )
       )
      )
     )
     (f32.const -4.592586247781397e-20)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 16)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (f32.eq
     (block $~lib/dataview/DataView#getFloat32|inlined.1 (result f32)
      (set_local $3
       (get_global $std/dataview/view)
      )
      (set_local $2
       (i32.const 1)
      )
      (set_local $1
       (i32.const 1)
      )
      (set_local $0
       (i32.load offset=8
        (i32.add
         (i32.add
          (i32.load
           (get_local $3)
          )
          (i32.load offset=4
           (get_local $3)
          )
         )
         (get_local $2)
        )
       )
      )
      (f32.reinterpret/i32
       (if (result i32)
        (get_local $1)
        (get_local $0)
        (call $~lib/polyfills/bswap<u32>
         (get_local $0)
        )
       )
      )
     )
     (f32.const -2.3413961970849473e-37)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 17)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (f32.eq
     (block $~lib/dataview/DataView#getFloat32|inlined.2 (result f32)
      (set_local $0
       (get_global $std/dataview/view)
      )
      (set_local $1
       (i32.const 2)
      )
      (set_local $2
       (i32.const 1)
      )
      (set_local $3
       (i32.load offset=8
        (i32.add
         (i32.add
          (i32.load
           (get_local $0)
          )
          (i32.load offset=4
           (get_local $0)
          )
         )
         (get_local $1)
        )
       )
      )
      (f32.reinterpret/i32
       (if (result i32)
        (get_local $2)
        (get_local $3)
        (call $~lib/polyfills/bswap<u32>
         (get_local $3)
        )
       )
      )
     )
     (f32.const 77105877018631129268224)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 18)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (f32.eq
     (block $~lib/dataview/DataView#getFloat32|inlined.3 (result f32)
      (set_local $3
       (get_global $std/dataview/view)
      )
      (set_local $2
       (i32.const 3)
      )
      (set_local $1
       (i32.const 1)
      )
      (set_local $0
       (i32.load offset=8
        (i32.add
         (i32.add
          (i32.load
           (get_local $3)
          )
          (i32.load offset=4
           (get_local $3)
          )
         )
         (get_local $2)
        )
       )
      )
      (f32.reinterpret/i32
       (if (result i32)
        (get_local $1)
        (get_local $0)
        (call $~lib/polyfills/bswap<u32>
         (get_local $0)
        )
       )
      )
     )
     (f32.const 229.51023864746094)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 19)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (f32.eq
     (block $~lib/dataview/DataView#getFloat32|inlined.4 (result f32)
      (set_local $0
       (get_global $std/dataview/view)
      )
      (set_local $1
       (i32.const 4)
      )
      (set_local $2
       (i32.const 1)
      )
      (set_local $3
       (i32.load offset=8
        (i32.add
         (i32.add
          (i32.load
           (get_local $0)
          )
          (i32.load offset=4
           (get_local $0)
          )
         )
         (get_local $1)
        )
       )
      )
      (f32.reinterpret/i32
       (if (result i32)
        (get_local $2)
        (get_local $3)
        (call $~lib/polyfills/bswap<u32>
         (get_local $3)
        )
       )
      )
     )
     (f32.const 14079802746555334656)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 20)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (f32.eq
     (block $~lib/dataview/DataView#getFloat32|inlined.5 (result f32)
      (set_local $3
       (get_global $std/dataview/view)
      )
      (set_local $2
       (i32.const 0)
      )
      (set_local $1
       (i32.const 0)
      )
      (set_local $0
       (i32.load offset=8
        (i32.add
         (i32.add
          (i32.load
           (get_local $3)
          )
          (i32.load offset=4
           (get_local $3)
          )
         )
         (get_local $2)
        )
       )
      )
      (f32.reinterpret/i32
       (if (result i32)
        (get_local $1)
        (get_local $0)
        (call $~lib/polyfills/bswap<u32>
         (get_local $0)
        )
       )
      )
     )
     (f32.const -2275140518817895515269171e9)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 22)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (f32.eq
     (block $~lib/dataview/DataView#getFloat32|inlined.6 (result f32)
      (set_local $0
       (get_global $std/dataview/view)
      )
      (set_local $1
       (i32.const 1)
      )
      (set_local $2
       (i32.const 0)
      )
      (set_local $3
       (i32.load offset=8
        (i32.add
         (i32.add
          (i32.load
           (get_local $0)
          )
          (i32.load offset=4
           (get_local $0)
          )
         )
         (get_local $1)
        )
       )
      )
      (f32.reinterpret/i32
       (if (result i32)
        (get_local $2)
        (get_local $3)
        (call $~lib/polyfills/bswap<u32>
         (get_local $3)
        )
       )
      )
     )
     (f32.const -62437351080004157440)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 23)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (f32.eq
     (block $~lib/dataview/DataView#getFloat32|inlined.7 (result f32)
      (set_local $3
       (get_global $std/dataview/view)
      )
      (set_local $2
       (i32.const 2)
      )
      (set_local $1
       (i32.const 0)
      )
      (set_local $0
       (i32.load offset=8
        (i32.add
         (i32.add
          (i32.load
           (get_local $3)
          )
          (i32.load offset=4
           (get_local $3)
          )
         )
         (get_local $2)
        )
       )
      )
      (f32.reinterpret/i32
       (if (result i32)
        (get_local $1)
        (get_local $0)
        (call $~lib/polyfills/bswap<u32>
         (get_local $0)
        )
       )
      )
     )
     (f32.const 1403059112509440)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 24)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (f32.eq
     (block $~lib/dataview/DataView#getFloat32|inlined.8 (result f32)
      (set_local $0
       (get_global $std/dataview/view)
      )
      (set_local $1
       (i32.const 3)
      )
      (set_local $2
       (i32.const 0)
      )
      (set_local $3
       (i32.load offset=8
        (i32.add
         (i32.add
          (i32.load
           (get_local $0)
          )
          (i32.load offset=4
           (get_local $0)
          )
         )
         (get_local $1)
        )
       )
      )
      (f32.reinterpret/i32
       (if (result i32)
        (get_local $2)
        (get_local $3)
        (call $~lib/polyfills/bswap<u32>
         (get_local $3)
        )
       )
      )
     )
     (f32.const -5.522466503261712e-20)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 25)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (f32.eq
     (block $~lib/dataview/DataView#getFloat32|inlined.9 (result f32)
      (set_local $3
       (get_global $std/dataview/view)
      )
      (set_local $2
       (i32.const 4)
      )
      (set_local $1
       (i32.const 0)
      )
      (set_local $0
       (i32.load offset=8
        (i32.add
         (i32.add
          (i32.load
           (get_local $3)
          )
          (i32.load offset=4
           (get_local $3)
          )
         )
         (get_local $2)
        )
       )
      )
      (f32.reinterpret/i32
       (if (result i32)
        (get_local $1)
        (get_local $0)
        (call $~lib/polyfills/bswap<u32>
         (get_local $0)
        )
       )
      )
     )
     (f32.const -1.6843597451835358e-37)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 26)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (f64.eq
     (block $~lib/dataview/DataView#getFloat64|inlined.0 (result f64)
      (set_local $0
       (get_global $std/dataview/view)
      )
      (set_local $1
       (i32.const 0)
      )
      (set_local $2
       (i32.const 1)
      )
      (set_local $4
       (i64.load offset=8
        (i32.add
         (i32.add
          (i32.load
           (get_local $0)
          )
          (i32.load offset=4
           (get_local $0)
          )
         )
         (get_local $1)
        )
       )
      )
      (f64.reinterpret/i64
       (if (result i64)
        (get_local $2)
        (get_local $4)
        (call $~lib/polyfills/bswap<u64>
         (get_local $4)
        )
       )
      )
     )
     (f64.const 7936550095674706383278551e126)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 28)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (f64.eq
     (block $~lib/dataview/DataView#getFloat64|inlined.1 (result f64)
      (set_local $2
       (get_global $std/dataview/view)
      )
      (set_local $1
       (i32.const 0)
      )
      (set_local $0
       (i32.const 0)
      )
      (set_local $4
       (i64.load offset=8
        (i32.add
         (i32.add
          (i32.load
           (get_local $2)
          )
          (i32.load offset=4
           (get_local $2)
          )
         )
         (get_local $1)
        )
       )
      )
      (f64.reinterpret/i64
       (if (result i64)
        (get_local $0)
        (get_local $4)
        (call $~lib/polyfills/bswap<u64>
         (get_local $4)
        )
       )
      )
     )
     (f64.const -411777475818852546741639e241)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 29)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (i32.shr_s
      (i32.shl
       (block $~lib/dataview/DataView#getInt8|inlined.0 (result i32)
        (set_local $0
         (get_global $std/dataview/view)
        )
        (set_local $1
         (i32.const 0)
        )
        (block $~lib/dataview/get<i8>|inlined.0 (result i32)
         (set_local $2
          (i32.load
           (get_local $0)
          )
         )
         (set_local $3
          (i32.add
           (i32.load offset=4
            (get_local $0)
           )
           (get_local $1)
          )
         )
         (set_local $5
          (i32.const 1)
         )
         (set_local $6
          (i32.load8_s offset=8
           (i32.add
            (get_local $2)
            (get_local $3)
           )
          )
         )
         (if (result i32)
          (get_local $5)
          (get_local $6)
          (call $~lib/polyfills/bswap<i8>
           (get_local $6)
          )
         )
        )
       )
       (i32.const 24)
      )
      (i32.const 24)
     )
     (i32.const -10)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 31)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (i32.shr_s
      (i32.shl
       (block $~lib/dataview/DataView#getInt8|inlined.1 (result i32)
        (set_local $1
         (get_global $std/dataview/view)
        )
        (set_local $0
         (i32.const 1)
        )
        (block $~lib/dataview/get<i8>|inlined.1 (result i32)
         (set_local $6
          (i32.load
           (get_local $1)
          )
         )
         (set_local $5
          (i32.add
           (i32.load offset=4
            (get_local $1)
           )
           (get_local $0)
          )
         )
         (set_local $3
          (i32.const 1)
         )
         (set_local $2
          (i32.load8_s offset=8
           (i32.add
            (get_local $6)
            (get_local $5)
           )
          )
         )
         (if (result i32)
          (get_local $3)
          (get_local $2)
          (call $~lib/polyfills/bswap<i8>
           (get_local $2)
          )
         )
        )
       )
       (i32.const 24)
      )
      (i32.const 24)
     )
     (i32.const -32)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 32)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (i32.shr_s
      (i32.shl
       (block $~lib/dataview/DataView#getInt8|inlined.2 (result i32)
        (set_local $0
         (get_global $std/dataview/view)
        )
        (set_local $1
         (i32.const 2)
        )
        (block $~lib/dataview/get<i8>|inlined.2 (result i32)
         (set_local $2
          (i32.load
           (get_local $0)
          )
         )
         (set_local $3
          (i32.add
           (i32.load offset=4
            (get_local $0)
           )
           (get_local $1)
          )
         )
         (set_local $5
          (i32.const 1)
         )
         (set_local $6
          (i32.load8_s offset=8
           (i32.add
            (get_local $2)
            (get_local $3)
           )
          )
         )
         (if (result i32)
          (get_local $5)
          (get_local $6)
          (call $~lib/polyfills/bswap<i8>
           (get_local $6)
          )
         )
        )
       )
       (i32.const 24)
      )
      (i32.const 24)
     )
     (i32.const 88)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 33)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (i32.shr_s
      (i32.shl
       (block $~lib/dataview/DataView#getInt8|inlined.3 (result i32)
        (set_local $1
         (get_global $std/dataview/view)
        )
        (set_local $0
         (i32.const 3)
        )
        (block $~lib/dataview/get<i8>|inlined.3 (result i32)
         (set_local $6
          (i32.load
           (get_local $1)
          )
         )
         (set_local $5
          (i32.add
           (i32.load offset=4
            (get_local $1)
           )
           (get_local $0)
          )
         )
         (set_local $3
          (i32.const 1)
         )
         (set_local $2
          (i32.load8_s offset=8
           (i32.add
            (get_local $6)
            (get_local $5)
           )
          )
         )
         (if (result i32)
          (get_local $3)
          (get_local $2)
          (call $~lib/polyfills/bswap<i8>
           (get_local $2)
          )
         )
        )
       )
       (i32.const 24)
      )
      (i32.const 24)
     )
     (i32.const -97)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 34)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (i32.shr_s
      (i32.shl
       (block $~lib/dataview/DataView#getInt8|inlined.4 (result i32)
        (set_local $0
         (get_global $std/dataview/view)
        )
        (set_local $1
         (i32.const 4)
        )
        (block $~lib/dataview/get<i8>|inlined.4 (result i32)
         (set_local $2
          (i32.load
           (get_local $0)
          )
         )
         (set_local $3
          (i32.add
           (i32.load offset=4
            (get_local $0)
           )
           (get_local $1)
          )
         )
         (set_local $5
          (i32.const 1)
         )
         (set_local $6
          (i32.load8_s offset=8
           (i32.add
            (get_local $2)
            (get_local $3)
           )
          )
         )
         (if (result i32)
          (get_local $5)
          (get_local $6)
          (call $~lib/polyfills/bswap<i8>
           (get_local $6)
          )
         )
        )
       )
       (i32.const 24)
      )
      (i32.const 24)
     )
     (i32.const -126)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 35)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (i32.shr_s
      (i32.shl
       (block $~lib/dataview/DataView#getInt8|inlined.5 (result i32)
        (set_local $1
         (get_global $std/dataview/view)
        )
        (set_local $0
         (i32.const 5)
        )
        (block $~lib/dataview/get<i8>|inlined.5 (result i32)
         (set_local $6
          (i32.load
           (get_local $1)
          )
         )
         (set_local $5
          (i32.add
           (i32.load offset=4
            (get_local $1)
           )
           (get_local $0)
          )
         )
         (set_local $3
          (i32.const 1)
         )
         (set_local $2
          (i32.load8_s offset=8
           (i32.add
            (get_local $6)
            (get_local $5)
           )
          )
         )
         (if (result i32)
          (get_local $3)
          (get_local $2)
          (call $~lib/polyfills/bswap<i8>
           (get_local $2)
          )
         )
        )
       )
       (i32.const 24)
      )
      (i32.const 24)
     )
     (i32.const 101)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 36)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (i32.shr_s
      (i32.shl
       (block $~lib/dataview/DataView#getInt8|inlined.6 (result i32)
        (set_local $0
         (get_global $std/dataview/view)
        )
        (set_local $1
         (i32.const 6)
        )
        (block $~lib/dataview/get<i8>|inlined.6 (result i32)
         (set_local $2
          (i32.load
           (get_local $0)
          )
         )
         (set_local $3
          (i32.add
           (i32.load offset=4
            (get_local $0)
           )
           (get_local $1)
          )
         )
         (set_local $5
          (i32.const 1)
         )
         (set_local $6
          (i32.load8_s offset=8
           (i32.add
            (get_local $2)
            (get_local $3)
           )
          )
         )
         (if (result i32)
          (get_local $5)
          (get_local $6)
          (call $~lib/polyfills/bswap<i8>
           (get_local $6)
          )
         )
        )
       )
       (i32.const 24)
      )
      (i32.const 24)
     )
     (i32.const 67)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 37)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (i32.shr_s
      (i32.shl
       (block $~lib/dataview/DataView#getInt8|inlined.7 (result i32)
        (set_local $1
         (get_global $std/dataview/view)
        )
        (set_local $0
         (i32.const 7)
        )
        (block $~lib/dataview/get<i8>|inlined.7 (result i32)
         (set_local $6
          (i32.load
           (get_local $1)
          )
         )
         (set_local $5
          (i32.add
           (i32.load offset=4
            (get_local $1)
           )
           (get_local $0)
          )
         )
         (set_local $3
          (i32.const 1)
         )
         (set_local $2
          (i32.load8_s offset=8
           (i32.add
            (get_local $6)
            (get_local $5)
           )
          )
         )
         (if (result i32)
          (get_local $3)
          (get_local $2)
          (call $~lib/polyfills/bswap<i8>
           (get_local $2)
          )
         )
        )
       )
       (i32.const 24)
      )
      (i32.const 24)
     )
     (i32.const 95)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 38)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (i32.shr_s
      (i32.shl
       (block $~lib/dataview/DataView#getInt16|inlined.0 (result i32)
        (set_local $0
         (get_global $std/dataview/view)
        )
        (set_local $1
         (i32.const 0)
        )
        (set_local $2
         (i32.const 1)
        )
        (block $~lib/dataview/get<i16>|inlined.0 (result i32)
         (set_local $3
          (i32.load
           (get_local $0)
          )
         )
         (set_local $5
          (i32.add
           (i32.load offset=4
            (get_local $0)
           )
           (get_local $1)
          )
         )
         (set_local $6
          (i32.load16_s offset=8
           (i32.add
            (get_local $3)
            (get_local $5)
           )
          )
         )
         (if (result i32)
          (i32.and
           (get_local $2)
           (i32.const 1)
          )
          (get_local $6)
          (call $~lib/polyfills/bswap<i16>
           (get_local $6)
          )
         )
        )
       )
       (i32.const 16)
      )
      (i32.const 16)
     )
     (i32.const -7946)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 40)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (i32.shr_s
      (i32.shl
       (block $~lib/dataview/DataView#getInt16|inlined.1 (result i32)
        (set_local $2
         (get_global $std/dataview/view)
        )
        (set_local $1
         (i32.const 1)
        )
        (set_local $0
         (i32.const 1)
        )
        (block $~lib/dataview/get<i16>|inlined.1 (result i32)
         (set_local $6
          (i32.load
           (get_local $2)
          )
         )
         (set_local $5
          (i32.add
           (i32.load offset=4
            (get_local $2)
           )
           (get_local $1)
          )
         )
         (set_local $3
          (i32.load16_s offset=8
           (i32.add
            (get_local $6)
            (get_local $5)
           )
          )
         )
         (if (result i32)
          (i32.and
           (get_local $0)
           (i32.const 1)
          )
          (get_local $3)
          (call $~lib/polyfills/bswap<i16>
           (get_local $3)
          )
         )
        )
       )
       (i32.const 16)
      )
      (i32.const 16)
     )
     (i32.const 22752)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 41)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (i32.shr_s
      (i32.shl
       (block $~lib/dataview/DataView#getInt16|inlined.2 (result i32)
        (set_local $0
         (get_global $std/dataview/view)
        )
        (set_local $1
         (i32.const 2)
        )
        (set_local $2
         (i32.const 1)
        )
        (block $~lib/dataview/get<i16>|inlined.2 (result i32)
         (set_local $3
          (i32.load
           (get_local $0)
          )
         )
         (set_local $5
          (i32.add
           (i32.load offset=4
            (get_local $0)
           )
           (get_local $1)
          )
         )
         (set_local $6
          (i32.load16_s offset=8
           (i32.add
            (get_local $3)
            (get_local $5)
           )
          )
         )
         (if (result i32)
          (i32.and
           (get_local $2)
           (i32.const 1)
          )
          (get_local $6)
          (call $~lib/polyfills/bswap<i16>
           (get_local $6)
          )
         )
        )
       )
       (i32.const 16)
      )
      (i32.const 16)
     )
     (i32.const -24744)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 42)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (i32.shr_s
      (i32.shl
       (block $~lib/dataview/DataView#getInt16|inlined.3 (result i32)
        (set_local $2
         (get_global $std/dataview/view)
        )
        (set_local $1
         (i32.const 3)
        )
        (set_local $0
         (i32.const 1)
        )
        (block $~lib/dataview/get<i16>|inlined.3 (result i32)
         (set_local $6
          (i32.load
           (get_local $2)
          )
         )
         (set_local $5
          (i32.add
           (i32.load offset=4
            (get_local $2)
           )
           (get_local $1)
          )
         )
         (set_local $3
          (i32.load16_s offset=8
           (i32.add
            (get_local $6)
            (get_local $5)
           )
          )
         )
         (if (result i32)
          (i32.and
           (get_local $0)
           (i32.const 1)
          )
          (get_local $3)
          (call $~lib/polyfills/bswap<i16>
           (get_local $3)
          )
         )
        )
       )
       (i32.const 16)
      )
      (i32.const 16)
     )
     (i32.const -32097)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 43)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (i32.shr_s
      (i32.shl
       (block $~lib/dataview/DataView#getInt16|inlined.4 (result i32)
        (set_local $0
         (get_global $std/dataview/view)
        )
        (set_local $1
         (i32.const 4)
        )
        (set_local $2
         (i32.const 1)
        )
        (block $~lib/dataview/get<i16>|inlined.4 (result i32)
         (set_local $3
          (i32.load
           (get_local $0)
          )
         )
         (set_local $5
          (i32.add
           (i32.load offset=4
            (get_local $0)
           )
           (get_local $1)
          )
         )
         (set_local $6
          (i32.load16_s offset=8
           (i32.add
            (get_local $3)
            (get_local $5)
           )
          )
         )
         (if (result i32)
          (i32.and
           (get_local $2)
           (i32.const 1)
          )
          (get_local $6)
          (call $~lib/polyfills/bswap<i16>
           (get_local $6)
          )
         )
        )
       )
       (i32.const 16)
      )
      (i32.const 16)
     )
     (i32.const 25986)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 44)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (i32.shr_s
      (i32.shl
       (block $~lib/dataview/DataView#getInt16|inlined.5 (result i32)
        (set_local $2
         (get_global $std/dataview/view)
        )
        (set_local $1
         (i32.const 5)
        )
        (set_local $0
         (i32.const 1)
        )
        (block $~lib/dataview/get<i16>|inlined.5 (result i32)
         (set_local $6
          (i32.load
           (get_local $2)
          )
         )
         (set_local $5
          (i32.add
           (i32.load offset=4
            (get_local $2)
           )
           (get_local $1)
          )
         )
         (set_local $3
          (i32.load16_s offset=8
           (i32.add
            (get_local $6)
            (get_local $5)
           )
          )
         )
         (if (result i32)
          (i32.and
           (get_local $0)
           (i32.const 1)
          )
          (get_local $3)
          (call $~lib/polyfills/bswap<i16>
           (get_local $3)
          )
         )
        )
       )
       (i32.const 16)
      )
      (i32.const 16)
     )
     (i32.const 17253)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 45)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (i32.shr_s
      (i32.shl
       (block $~lib/dataview/DataView#getInt16|inlined.6 (result i32)
        (set_local $0
         (get_global $std/dataview/view)
        )
        (set_local $1
         (i32.const 6)
        )
        (set_local $2
         (i32.const 1)
        )
        (block $~lib/dataview/get<i16>|inlined.6 (result i32)
         (set_local $3
          (i32.load
           (get_local $0)
          )
         )
         (set_local $5
          (i32.add
           (i32.load offset=4
            (get_local $0)
           )
           (get_local $1)
          )
         )
         (set_local $6
          (i32.load16_s offset=8
           (i32.add
            (get_local $3)
            (get_local $5)
           )
          )
         )
         (if (result i32)
          (i32.and
           (get_local $2)
           (i32.const 1)
          )
          (get_local $6)
          (call $~lib/polyfills/bswap<i16>
           (get_local $6)
          )
         )
        )
       )
       (i32.const 16)
      )
      (i32.const 16)
     )
     (i32.const 24387)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 46)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (i32.shr_s
      (i32.shl
       (block $~lib/dataview/DataView#getInt16|inlined.7 (result i32)
        (set_local $2
         (get_global $std/dataview/view)
        )
        (set_local $1
         (i32.const 0)
        )
        (set_local $0
         (i32.const 0)
        )
        (block $~lib/dataview/get<i16>|inlined.7 (result i32)
         (set_local $6
          (i32.load
           (get_local $2)
          )
         )
         (set_local $5
          (i32.add
           (i32.load offset=4
            (get_local $2)
           )
           (get_local $1)
          )
         )
         (set_local $3
          (i32.load16_s offset=8
           (i32.add
            (get_local $6)
            (get_local $5)
           )
          )
         )
         (if (result i32)
          (i32.and
           (get_local $0)
           (i32.const 1)
          )
          (get_local $3)
          (call $~lib/polyfills/bswap<i16>
           (get_local $3)
          )
         )
        )
       )
       (i32.const 16)
      )
      (i32.const 16)
     )
     (i32.const -2336)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 48)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (i32.shr_s
      (i32.shl
       (block $~lib/dataview/DataView#getInt16|inlined.8 (result i32)
        (set_local $0
         (get_global $std/dataview/view)
        )
        (set_local $1
         (i32.const 1)
        )
        (set_local $2
         (i32.const 0)
        )
        (block $~lib/dataview/get<i16>|inlined.8 (result i32)
         (set_local $3
          (i32.load
           (get_local $0)
          )
         )
         (set_local $5
          (i32.add
           (i32.load offset=4
            (get_local $0)
           )
           (get_local $1)
          )
         )
         (set_local $6
          (i32.load16_s offset=8
           (i32.add
            (get_local $3)
            (get_local $5)
           )
          )
         )
         (if (result i32)
          (i32.and
           (get_local $2)
           (i32.const 1)
          )
          (get_local $6)
          (call $~lib/polyfills/bswap<i16>
           (get_local $6)
          )
         )
        )
       )
       (i32.const 16)
      )
      (i32.const 16)
     )
     (i32.const -8104)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 49)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (i32.shr_s
      (i32.shl
       (block $~lib/dataview/DataView#getInt16|inlined.9 (result i32)
        (set_local $2
         (get_global $std/dataview/view)
        )
        (set_local $1
         (i32.const 2)
        )
        (set_local $0
         (i32.const 0)
        )
        (block $~lib/dataview/get<i16>|inlined.9 (result i32)
         (set_local $6
          (i32.load
           (get_local $2)
          )
         )
         (set_local $5
          (i32.add
           (i32.load offset=4
            (get_local $2)
           )
           (get_local $1)
          )
         )
         (set_local $3
          (i32.load16_s offset=8
           (i32.add
            (get_local $6)
            (get_local $5)
           )
          )
         )
         (if (result i32)
          (i32.and
           (get_local $0)
           (i32.const 1)
          )
          (get_local $3)
          (call $~lib/polyfills/bswap<i16>
           (get_local $3)
          )
         )
        )
       )
       (i32.const 16)
      )
      (i32.const 16)
     )
     (i32.const 22687)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 50)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (i32.shr_s
      (i32.shl
       (block $~lib/dataview/DataView#getInt16|inlined.10 (result i32)
        (set_local $0
         (get_global $std/dataview/view)
        )
        (set_local $1
         (i32.const 3)
        )
        (set_local $2
         (i32.const 0)
        )
        (block $~lib/dataview/get<i16>|inlined.10 (result i32)
         (set_local $3
          (i32.load
           (get_local $0)
          )
         )
         (set_local $5
          (i32.add
           (i32.load offset=4
            (get_local $0)
           )
           (get_local $1)
          )
         )
         (set_local $6
          (i32.load16_s offset=8
           (i32.add
            (get_local $3)
            (get_local $5)
           )
          )
         )
         (if (result i32)
          (i32.and
           (get_local $2)
           (i32.const 1)
          )
          (get_local $6)
          (call $~lib/polyfills/bswap<i16>
           (get_local $6)
          )
         )
        )
       )
       (i32.const 16)
      )
      (i32.const 16)
     )
     (i32.const -24702)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 51)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (i32.shr_s
      (i32.shl
       (block $~lib/dataview/DataView#getInt16|inlined.11 (result i32)
        (set_local $2
         (get_global $std/dataview/view)
        )
        (set_local $1
         (i32.const 4)
        )
        (set_local $0
         (i32.const 0)
        )
        (block $~lib/dataview/get<i16>|inlined.11 (result i32)
         (set_local $6
          (i32.load
           (get_local $2)
          )
         )
         (set_local $5
          (i32.add
           (i32.load offset=4
            (get_local $2)
           )
           (get_local $1)
          )
         )
         (set_local $3
          (i32.load16_s offset=8
           (i32.add
            (get_local $6)
            (get_local $5)
           )
          )
         )
         (if (result i32)
          (i32.and
           (get_local $0)
           (i32.const 1)
          )
          (get_local $3)
          (call $~lib/polyfills/bswap<i16>
           (get_local $3)
          )
         )
        )
       )
       (i32.const 16)
      )
      (i32.const 16)
     )
     (i32.const -32155)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 52)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (i32.shr_s
      (i32.shl
       (block $~lib/dataview/DataView#getInt16|inlined.12 (result i32)
        (set_local $0
         (get_global $std/dataview/view)
        )
        (set_local $1
         (i32.const 5)
        )
        (set_local $2
         (i32.const 0)
        )
        (block $~lib/dataview/get<i16>|inlined.12 (result i32)
         (set_local $3
          (i32.load
           (get_local $0)
          )
         )
         (set_local $5
          (i32.add
           (i32.load offset=4
            (get_local $0)
           )
           (get_local $1)
          )
         )
         (set_local $6
          (i32.load16_s offset=8
           (i32.add
            (get_local $3)
            (get_local $5)
           )
          )
         )
         (if (result i32)
          (i32.and
           (get_local $2)
           (i32.const 1)
          )
          (get_local $6)
          (call $~lib/polyfills/bswap<i16>
           (get_local $6)
          )
         )
        )
       )
       (i32.const 16)
      )
      (i32.const 16)
     )
     (i32.const 25923)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 53)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (i32.shr_s
      (i32.shl
       (block $~lib/dataview/DataView#getInt16|inlined.13 (result i32)
        (set_local $2
         (get_global $std/dataview/view)
        )
        (set_local $1
         (i32.const 6)
        )
        (set_local $0
         (i32.const 0)
        )
        (block $~lib/dataview/get<i16>|inlined.13 (result i32)
         (set_local $6
          (i32.load
           (get_local $2)
          )
         )
         (set_local $5
          (i32.add
           (i32.load offset=4
            (get_local $2)
           )
           (get_local $1)
          )
         )
         (set_local $3
          (i32.load16_s offset=8
           (i32.add
            (get_local $6)
            (get_local $5)
           )
          )
         )
         (if (result i32)
          (i32.and
           (get_local $0)
           (i32.const 1)
          )
          (get_local $3)
          (call $~lib/polyfills/bswap<i16>
           (get_local $3)
          )
         )
        )
       )
       (i32.const 16)
      )
      (i32.const 16)
     )
     (i32.const 17247)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 54)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (block $~lib/dataview/DataView#getInt32|inlined.0 (result i32)
      (set_local $0
       (get_global $std/dataview/view)
      )
      (set_local $1
       (i32.const 0)
      )
      (set_local $2
       (i32.const 1)
      )
      (block $~lib/dataview/get<i32>|inlined.0 (result i32)
       (set_local $3
        (i32.load
         (get_local $0)
        )
       )
       (set_local $5
        (i32.add
         (i32.load offset=4
          (get_local $0)
         )
         (get_local $1)
        )
       )
       (set_local $6
        (i32.load offset=8
         (i32.add
          (get_local $3)
          (get_local $5)
         )
        )
       )
       (if (result i32)
        (i32.and
         (get_local $2)
         (i32.const 1)
        )
        (get_local $6)
        (call $~lib/polyfills/bswap<i32>
         (get_local $6)
        )
       )
      )
     )
     (i32.const -1621565194)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 56)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (block $~lib/dataview/DataView#getInt32|inlined.1 (result i32)
      (set_local $2
       (get_global $std/dataview/view)
      )
      (set_local $1
       (i32.const 1)
      )
      (set_local $0
       (i32.const 1)
      )
      (block $~lib/dataview/get<i32>|inlined.1 (result i32)
       (set_local $6
        (i32.load
         (get_local $2)
        )
       )
       (set_local $5
        (i32.add
         (i32.load offset=4
          (get_local $2)
         )
         (get_local $1)
        )
       )
       (set_local $3
        (i32.load offset=8
         (i32.add
          (get_local $6)
          (get_local $5)
         )
        )
       )
       (if (result i32)
        (i32.and
         (get_local $0)
         (i32.const 1)
        )
        (get_local $3)
        (call $~lib/polyfills/bswap<i32>
         (get_local $3)
        )
       )
      )
     )
     (i32.const -2103486240)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 57)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (block $~lib/dataview/DataView#getInt32|inlined.2 (result i32)
      (set_local $0
       (get_global $std/dataview/view)
      )
      (set_local $1
       (i32.const 2)
      )
      (set_local $2
       (i32.const 1)
      )
      (block $~lib/dataview/get<i32>|inlined.2 (result i32)
       (set_local $3
        (i32.load
         (get_local $0)
        )
       )
       (set_local $5
        (i32.add
         (i32.load offset=4
          (get_local $0)
         )
         (get_local $1)
        )
       )
       (set_local $6
        (i32.load offset=8
         (i32.add
          (get_local $3)
          (get_local $5)
         )
        )
       )
       (if (result i32)
        (i32.and
         (get_local $2)
         (i32.const 1)
        )
        (get_local $6)
        (call $~lib/polyfills/bswap<i32>
         (get_local $6)
        )
       )
      )
     )
     (i32.const 1703059288)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 58)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (block $~lib/dataview/DataView#getInt32|inlined.3 (result i32)
      (set_local $2
       (get_global $std/dataview/view)
      )
      (set_local $1
       (i32.const 3)
      )
      (set_local $0
       (i32.const 1)
      )
      (block $~lib/dataview/get<i32>|inlined.3 (result i32)
       (set_local $6
        (i32.load
         (get_local $2)
        )
       )
       (set_local $5
        (i32.add
         (i32.load offset=4
          (get_local $2)
         )
         (get_local $1)
        )
       )
       (set_local $3
        (i32.load offset=8
         (i32.add
          (get_local $6)
          (get_local $5)
         )
        )
       )
       (if (result i32)
        (i32.and
         (get_local $0)
         (i32.const 1)
        )
        (get_local $3)
        (call $~lib/polyfills/bswap<i32>
         (get_local $3)
        )
       )
      )
     )
     (i32.const 1130726047)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 59)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (block $~lib/dataview/DataView#getInt32|inlined.4 (result i32)
      (set_local $0
       (get_global $std/dataview/view)
      )
      (set_local $1
       (i32.const 4)
      )
      (set_local $2
       (i32.const 1)
      )
      (block $~lib/dataview/get<i32>|inlined.4 (result i32)
       (set_local $3
        (i32.load
         (get_local $0)
        )
       )
       (set_local $5
        (i32.add
         (i32.load offset=4
          (get_local $0)
         )
         (get_local $1)
        )
       )
       (set_local $6
        (i32.load offset=8
         (i32.add
          (get_local $3)
          (get_local $5)
         )
        )
       )
       (if (result i32)
        (i32.and
         (get_local $2)
         (i32.const 1)
        )
        (get_local $6)
        (call $~lib/polyfills/bswap<i32>
         (get_local $6)
        )
       )
      )
     )
     (i32.const 1598252418)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 60)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (block $~lib/dataview/DataView#getInt32|inlined.5 (result i32)
      (set_local $2
       (get_global $std/dataview/view)
      )
      (set_local $1
       (i32.const 0)
      )
      (set_local $0
       (i32.const 0)
      )
      (block $~lib/dataview/get<i32>|inlined.5 (result i32)
       (set_local $6
        (i32.load
         (get_local $2)
        )
       )
       (set_local $5
        (i32.add
         (i32.load offset=4
          (get_local $2)
         )
         (get_local $1)
        )
       )
       (set_local $3
        (i32.load offset=8
         (i32.add
          (get_local $6)
          (get_local $5)
         )
        )
       )
       (if (result i32)
        (i32.and
         (get_local $0)
         (i32.const 1)
        )
        (get_local $3)
        (call $~lib/polyfills/bswap<i32>
         (get_local $3)
        )
       )
      )
     )
     (i32.const -153069409)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 62)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (block $~lib/dataview/DataView#getInt32|inlined.6 (result i32)
      (set_local $0
       (get_global $std/dataview/view)
      )
      (set_local $1
       (i32.const 1)
      )
      (set_local $2
       (i32.const 0)
      )
      (block $~lib/dataview/get<i32>|inlined.6 (result i32)
       (set_local $3
        (i32.load
         (get_local $0)
        )
       )
       (set_local $5
        (i32.add
         (i32.load offset=4
          (get_local $0)
         )
         (get_local $1)
        )
       )
       (set_local $6
        (i32.load offset=8
         (i32.add
          (get_local $3)
          (get_local $5)
         )
        )
       )
       (if (result i32)
        (i32.and
         (get_local $2)
         (i32.const 1)
        )
        (get_local $6)
        (call $~lib/polyfills/bswap<i32>
         (get_local $6)
        )
       )
      )
     )
     (i32.const -531062910)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 63)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (block $~lib/dataview/DataView#getInt32|inlined.7 (result i32)
      (set_local $2
       (get_global $std/dataview/view)
      )
      (set_local $1
       (i32.const 2)
      )
      (set_local $0
       (i32.const 0)
      )
      (block $~lib/dataview/get<i32>|inlined.7 (result i32)
       (set_local $6
        (i32.load
         (get_local $2)
        )
       )
       (set_local $5
        (i32.add
         (i32.load offset=4
          (get_local $2)
         )
         (get_local $1)
        )
       )
       (set_local $3
        (i32.load offset=8
         (i32.add
          (get_local $6)
          (get_local $5)
         )
        )
       )
       (if (result i32)
        (i32.and
         (get_local $0)
         (i32.const 1)
        )
        (get_local $3)
        (call $~lib/polyfills/bswap<i32>
         (get_local $3)
        )
       )
      )
     )
     (i32.const 1486848613)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 64)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (block $~lib/dataview/DataView#getInt32|inlined.8 (result i32)
      (set_local $0
       (get_global $std/dataview/view)
      )
      (set_local $1
       (i32.const 3)
      )
      (set_local $2
       (i32.const 0)
      )
      (block $~lib/dataview/get<i32>|inlined.8 (result i32)
       (set_local $3
        (i32.load
         (get_local $0)
        )
       )
       (set_local $5
        (i32.add
         (i32.load offset=4
          (get_local $0)
         )
         (get_local $1)
        )
       )
       (set_local $6
        (i32.load offset=8
         (i32.add
          (get_local $3)
          (get_local $5)
         )
        )
       )
       (if (result i32)
        (i32.and
         (get_local $2)
         (i32.const 1)
        )
        (get_local $6)
        (call $~lib/polyfills/bswap<i32>
         (get_local $6)
        )
       )
      )
     )
     (i32.const -1618844349)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 65)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (block $~lib/dataview/DataView#getInt32|inlined.9 (result i32)
      (set_local $2
       (get_global $std/dataview/view)
      )
      (set_local $1
       (i32.const 4)
      )
      (set_local $0
       (i32.const 0)
      )
      (block $~lib/dataview/get<i32>|inlined.9 (result i32)
       (set_local $6
        (i32.load
         (get_local $2)
        )
       )
       (set_local $5
        (i32.add
         (i32.load offset=4
          (get_local $2)
         )
         (get_local $1)
        )
       )
       (set_local $3
        (i32.load offset=8
         (i32.add
          (get_local $6)
          (get_local $5)
         )
        )
       )
       (if (result i32)
        (i32.and
         (get_local $0)
         (i32.const 1)
        )
        (get_local $3)
        (call $~lib/polyfills/bswap<i32>
         (get_local $3)
        )
       )
      )
     )
     (i32.const -2107292833)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 66)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (i32.and
      (block $~lib/dataview/DataView#getUint8|inlined.0 (result i32)
       (set_local $0
        (get_global $std/dataview/view)
       )
       (set_local $1
        (i32.const 0)
       )
       (block $~lib/dataview/get<u8>|inlined.0 (result i32)
        (set_local $2
         (i32.load
          (get_local $0)
         )
        )
        (set_local $3
         (i32.add
          (i32.load offset=4
           (get_local $0)
          )
          (get_local $1)
         )
        )
        (set_local $5
         (i32.const 1)
        )
        (set_local $6
         (i32.load8_u offset=8
          (i32.add
           (get_local $2)
           (get_local $3)
          )
         )
        )
        (if (result i32)
         (get_local $5)
         (get_local $6)
         (call $~lib/polyfills/bswap<u8>
          (get_local $6)
         )
        )
       )
      )
      (i32.const 255)
     )
     (i32.const 246)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 68)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (i32.and
      (block $~lib/dataview/DataView#getUint8|inlined.1 (result i32)
       (set_local $1
        (get_global $std/dataview/view)
       )
       (set_local $0
        (i32.const 1)
       )
       (block $~lib/dataview/get<u8>|inlined.1 (result i32)
        (set_local $6
         (i32.load
          (get_local $1)
         )
        )
        (set_local $5
         (i32.add
          (i32.load offset=4
           (get_local $1)
          )
          (get_local $0)
         )
        )
        (set_local $3
         (i32.const 1)
        )
        (set_local $2
         (i32.load8_u offset=8
          (i32.add
           (get_local $6)
           (get_local $5)
          )
         )
        )
        (if (result i32)
         (get_local $3)
         (get_local $2)
         (call $~lib/polyfills/bswap<u8>
          (get_local $2)
         )
        )
       )
      )
      (i32.const 255)
     )
     (i32.const 224)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 69)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (i32.and
      (block $~lib/dataview/DataView#getUint8|inlined.2 (result i32)
       (set_local $0
        (get_global $std/dataview/view)
       )
       (set_local $1
        (i32.const 2)
       )
       (block $~lib/dataview/get<u8>|inlined.2 (result i32)
        (set_local $2
         (i32.load
          (get_local $0)
         )
        )
        (set_local $3
         (i32.add
          (i32.load offset=4
           (get_local $0)
          )
          (get_local $1)
         )
        )
        (set_local $5
         (i32.const 1)
        )
        (set_local $6
         (i32.load8_u offset=8
          (i32.add
           (get_local $2)
           (get_local $3)
          )
         )
        )
        (if (result i32)
         (get_local $5)
         (get_local $6)
         (call $~lib/polyfills/bswap<u8>
          (get_local $6)
         )
        )
       )
      )
      (i32.const 255)
     )
     (i32.const 88)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 70)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (i32.and
      (block $~lib/dataview/DataView#getUint8|inlined.3 (result i32)
       (set_local $1
        (get_global $std/dataview/view)
       )
       (set_local $0
        (i32.const 3)
       )
       (block $~lib/dataview/get<u8>|inlined.3 (result i32)
        (set_local $6
         (i32.load
          (get_local $1)
         )
        )
        (set_local $5
         (i32.add
          (i32.load offset=4
           (get_local $1)
          )
          (get_local $0)
         )
        )
        (set_local $3
         (i32.const 1)
        )
        (set_local $2
         (i32.load8_u offset=8
          (i32.add
           (get_local $6)
           (get_local $5)
          )
         )
        )
        (if (result i32)
         (get_local $3)
         (get_local $2)
         (call $~lib/polyfills/bswap<u8>
          (get_local $2)
         )
        )
       )
      )
      (i32.const 255)
     )
     (i32.const 159)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 71)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (i32.and
      (block $~lib/dataview/DataView#getUint8|inlined.4 (result i32)
       (set_local $0
        (get_global $std/dataview/view)
       )
       (set_local $1
        (i32.const 4)
       )
       (block $~lib/dataview/get<u8>|inlined.4 (result i32)
        (set_local $2
         (i32.load
          (get_local $0)
         )
        )
        (set_local $3
         (i32.add
          (i32.load offset=4
           (get_local $0)
          )
          (get_local $1)
         )
        )
        (set_local $5
         (i32.const 1)
        )
        (set_local $6
         (i32.load8_u offset=8
          (i32.add
           (get_local $2)
           (get_local $3)
          )
         )
        )
        (if (result i32)
         (get_local $5)
         (get_local $6)
         (call $~lib/polyfills/bswap<u8>
          (get_local $6)
         )
        )
       )
      )
      (i32.const 255)
     )
     (i32.const 130)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 72)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (i32.and
      (block $~lib/dataview/DataView#getUint8|inlined.5 (result i32)
       (set_local $1
        (get_global $std/dataview/view)
       )
       (set_local $0
        (i32.const 5)
       )
       (block $~lib/dataview/get<u8>|inlined.5 (result i32)
        (set_local $6
         (i32.load
          (get_local $1)
         )
        )
        (set_local $5
         (i32.add
          (i32.load offset=4
           (get_local $1)
          )
          (get_local $0)
         )
        )
        (set_local $3
         (i32.const 1)
        )
        (set_local $2
         (i32.load8_u offset=8
          (i32.add
           (get_local $6)
           (get_local $5)
          )
         )
        )
        (if (result i32)
         (get_local $3)
         (get_local $2)
         (call $~lib/polyfills/bswap<u8>
          (get_local $2)
         )
        )
       )
      )
      (i32.const 255)
     )
     (i32.const 101)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 73)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (i32.and
      (block $~lib/dataview/DataView#getUint8|inlined.6 (result i32)
       (set_local $0
        (get_global $std/dataview/view)
       )
       (set_local $1
        (i32.const 6)
       )
       (block $~lib/dataview/get<u8>|inlined.6 (result i32)
        (set_local $2
         (i32.load
          (get_local $0)
         )
        )
        (set_local $3
         (i32.add
          (i32.load offset=4
           (get_local $0)
          )
          (get_local $1)
         )
        )
        (set_local $5
         (i32.const 1)
        )
        (set_local $6
         (i32.load8_u offset=8
          (i32.add
           (get_local $2)
           (get_local $3)
          )
         )
        )
        (if (result i32)
         (get_local $5)
         (get_local $6)
         (call $~lib/polyfills/bswap<u8>
          (get_local $6)
         )
        )
       )
      )
      (i32.const 255)
     )
     (i32.const 67)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 74)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (i32.and
      (block $~lib/dataview/DataView#getUint8|inlined.7 (result i32)
       (set_local $1
        (get_global $std/dataview/view)
       )
       (set_local $0
        (i32.const 7)
       )
       (block $~lib/dataview/get<u8>|inlined.7 (result i32)
        (set_local $6
         (i32.load
          (get_local $1)
         )
        )
        (set_local $5
         (i32.add
          (i32.load offset=4
           (get_local $1)
          )
          (get_local $0)
         )
        )
        (set_local $3
         (i32.const 1)
        )
        (set_local $2
         (i32.load8_u offset=8
          (i32.add
           (get_local $6)
           (get_local $5)
          )
         )
        )
        (if (result i32)
         (get_local $3)
         (get_local $2)
         (call $~lib/polyfills/bswap<u8>
          (get_local $2)
         )
        )
       )
      )
      (i32.const 255)
     )
     (i32.const 95)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 75)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (i32.and
      (block $~lib/dataview/DataView#getUint16|inlined.0 (result i32)
       (set_local $0
        (get_global $std/dataview/view)
       )
       (set_local $1
        (i32.const 0)
       )
       (set_local $2
        (i32.const 1)
       )
       (block $~lib/dataview/get<u16>|inlined.0 (result i32)
        (set_local $3
         (i32.load
          (get_local $0)
         )
        )
        (set_local $5
         (i32.add
          (i32.load offset=4
           (get_local $0)
          )
          (get_local $1)
         )
        )
        (set_local $6
         (i32.load16_u offset=8
          (i32.add
           (get_local $3)
           (get_local $5)
          )
         )
        )
        (if (result i32)
         (i32.and
          (get_local $2)
          (i32.const 1)
         )
         (get_local $6)
         (call $~lib/polyfills/bswap<u16>
          (get_local $6)
         )
        )
       )
      )
      (i32.const 65535)
     )
     (i32.const 57590)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 77)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (i32.and
      (block $~lib/dataview/DataView#getUint16|inlined.1 (result i32)
       (set_local $2
        (get_global $std/dataview/view)
       )
       (set_local $1
        (i32.const 1)
       )
       (set_local $0
        (i32.const 1)
       )
       (block $~lib/dataview/get<u16>|inlined.1 (result i32)
        (set_local $6
         (i32.load
          (get_local $2)
         )
        )
        (set_local $5
         (i32.add
          (i32.load offset=4
           (get_local $2)
          )
          (get_local $1)
         )
        )
        (set_local $3
         (i32.load16_u offset=8
          (i32.add
           (get_local $6)
           (get_local $5)
          )
         )
        )
        (if (result i32)
         (i32.and
          (get_local $0)
          (i32.const 1)
         )
         (get_local $3)
         (call $~lib/polyfills/bswap<u16>
          (get_local $3)
         )
        )
       )
      )
      (i32.const 65535)
     )
     (i32.const 22752)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 78)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (i32.and
      (block $~lib/dataview/DataView#getUint16|inlined.2 (result i32)
       (set_local $0
        (get_global $std/dataview/view)
       )
       (set_local $1
        (i32.const 2)
       )
       (set_local $2
        (i32.const 1)
       )
       (block $~lib/dataview/get<u16>|inlined.2 (result i32)
        (set_local $3
         (i32.load
          (get_local $0)
         )
        )
        (set_local $5
         (i32.add
          (i32.load offset=4
           (get_local $0)
          )
          (get_local $1)
         )
        )
        (set_local $6
         (i32.load16_u offset=8
          (i32.add
           (get_local $3)
           (get_local $5)
          )
         )
        )
        (if (result i32)
         (i32.and
          (get_local $2)
          (i32.const 1)
         )
         (get_local $6)
         (call $~lib/polyfills/bswap<u16>
          (get_local $6)
         )
        )
       )
      )
      (i32.const 65535)
     )
     (i32.const 40792)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 79)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (i32.and
      (block $~lib/dataview/DataView#getUint16|inlined.3 (result i32)
       (set_local $2
        (get_global $std/dataview/view)
       )
       (set_local $1
        (i32.const 3)
       )
       (set_local $0
        (i32.const 1)
       )
       (block $~lib/dataview/get<u16>|inlined.3 (result i32)
        (set_local $6
         (i32.load
          (get_local $2)
         )
        )
        (set_local $5
         (i32.add
          (i32.load offset=4
           (get_local $2)
          )
          (get_local $1)
         )
        )
        (set_local $3
         (i32.load16_u offset=8
          (i32.add
           (get_local $6)
           (get_local $5)
          )
         )
        )
        (if (result i32)
         (i32.and
          (get_local $0)
          (i32.const 1)
         )
         (get_local $3)
         (call $~lib/polyfills/bswap<u16>
          (get_local $3)
         )
        )
       )
      )
      (i32.const 65535)
     )
     (i32.const 33439)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 80)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (i32.and
      (block $~lib/dataview/DataView#getUint16|inlined.4 (result i32)
       (set_local $0
        (get_global $std/dataview/view)
       )
       (set_local $1
        (i32.const 4)
       )
       (set_local $2
        (i32.const 1)
       )
       (block $~lib/dataview/get<u16>|inlined.4 (result i32)
        (set_local $3
         (i32.load
          (get_local $0)
         )
        )
        (set_local $5
         (i32.add
          (i32.load offset=4
           (get_local $0)
          )
          (get_local $1)
         )
        )
        (set_local $6
         (i32.load16_u offset=8
          (i32.add
           (get_local $3)
           (get_local $5)
          )
         )
        )
        (if (result i32)
         (i32.and
          (get_local $2)
          (i32.const 1)
         )
         (get_local $6)
         (call $~lib/polyfills/bswap<u16>
          (get_local $6)
         )
        )
       )
      )
      (i32.const 65535)
     )
     (i32.const 25986)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 81)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (i32.and
      (block $~lib/dataview/DataView#getUint16|inlined.5 (result i32)
       (set_local $2
        (get_global $std/dataview/view)
       )
       (set_local $1
        (i32.const 5)
       )
       (set_local $0
        (i32.const 1)
       )
       (block $~lib/dataview/get<u16>|inlined.5 (result i32)
        (set_local $6
         (i32.load
          (get_local $2)
         )
        )
        (set_local $5
         (i32.add
          (i32.load offset=4
           (get_local $2)
          )
          (get_local $1)
         )
        )
        (set_local $3
         (i32.load16_u offset=8
          (i32.add
           (get_local $6)
           (get_local $5)
          )
         )
        )
        (if (result i32)
         (i32.and
          (get_local $0)
          (i32.const 1)
         )
         (get_local $3)
         (call $~lib/polyfills/bswap<u16>
          (get_local $3)
         )
        )
       )
      )
      (i32.const 65535)
     )
     (i32.const 17253)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 82)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (i32.and
      (block $~lib/dataview/DataView#getUint16|inlined.6 (result i32)
       (set_local $0
        (get_global $std/dataview/view)
       )
       (set_local $1
        (i32.const 6)
       )
       (set_local $2
        (i32.const 1)
       )
       (block $~lib/dataview/get<u16>|inlined.6 (result i32)
        (set_local $3
         (i32.load
          (get_local $0)
         )
        )
        (set_local $5
         (i32.add
          (i32.load offset=4
           (get_local $0)
          )
          (get_local $1)
         )
        )
        (set_local $6
         (i32.load16_u offset=8
          (i32.add
           (get_local $3)
           (get_local $5)
          )
         )
        )
        (if (result i32)
         (i32.and
          (get_local $2)
          (i32.const 1)
         )
         (get_local $6)
         (call $~lib/polyfills/bswap<u16>
          (get_local $6)
         )
        )
       )
      )
      (i32.const 65535)
     )
     (i32.const 24387)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 83)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (i32.and
      (block $~lib/dataview/DataView#getUint16|inlined.7 (result i32)
       (set_local $2
        (get_global $std/dataview/view)
       )
       (set_local $1
        (i32.const 0)
       )
       (set_local $0
        (i32.const 0)
       )
       (block $~lib/dataview/get<u16>|inlined.7 (result i32)
        (set_local $6
         (i32.load
          (get_local $2)
         )
        )
        (set_local $5
         (i32.add
          (i32.load offset=4
           (get_local $2)
          )
          (get_local $1)
         )
        )
        (set_local $3
         (i32.load16_u offset=8
          (i32.add
           (get_local $6)
           (get_local $5)
          )
         )
        )
        (if (result i32)
         (i32.and
          (get_local $0)
          (i32.const 1)
         )
         (get_local $3)
         (call $~lib/polyfills/bswap<u16>
          (get_local $3)
         )
        )
       )
      )
      (i32.const 65535)
     )
     (i32.const 63200)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 85)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (i32.and
      (block $~lib/dataview/DataView#getUint16|inlined.8 (result i32)
       (set_local $0
        (get_global $std/dataview/view)
       )
       (set_local $1
        (i32.const 1)
       )
       (set_local $2
        (i32.const 0)
       )
       (block $~lib/dataview/get<u16>|inlined.8 (result i32)
        (set_local $3
         (i32.load
          (get_local $0)
         )
        )
        (set_local $5
         (i32.add
          (i32.load offset=4
           (get_local $0)
          )
          (get_local $1)
         )
        )
        (set_local $6
         (i32.load16_u offset=8
          (i32.add
           (get_local $3)
           (get_local $5)
          )
         )
        )
        (if (result i32)
         (i32.and
          (get_local $2)
          (i32.const 1)
         )
         (get_local $6)
         (call $~lib/polyfills/bswap<u16>
          (get_local $6)
         )
        )
       )
      )
      (i32.const 65535)
     )
     (i32.const 57432)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 86)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (i32.and
      (block $~lib/dataview/DataView#getUint16|inlined.9 (result i32)
       (set_local $2
        (get_global $std/dataview/view)
       )
       (set_local $1
        (i32.const 2)
       )
       (set_local $0
        (i32.const 0)
       )
       (block $~lib/dataview/get<u16>|inlined.9 (result i32)
        (set_local $6
         (i32.load
          (get_local $2)
         )
        )
        (set_local $5
         (i32.add
          (i32.load offset=4
           (get_local $2)
          )
          (get_local $1)
         )
        )
        (set_local $3
         (i32.load16_u offset=8
          (i32.add
           (get_local $6)
           (get_local $5)
          )
         )
        )
        (if (result i32)
         (i32.and
          (get_local $0)
          (i32.const 1)
         )
         (get_local $3)
         (call $~lib/polyfills/bswap<u16>
          (get_local $3)
         )
        )
       )
      )
      (i32.const 65535)
     )
     (i32.const 22687)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 87)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (i32.and
      (block $~lib/dataview/DataView#getUint16|inlined.10 (result i32)
       (set_local $0
        (get_global $std/dataview/view)
       )
       (set_local $1
        (i32.const 3)
       )
       (set_local $2
        (i32.const 0)
       )
       (block $~lib/dataview/get<u16>|inlined.10 (result i32)
        (set_local $3
         (i32.load
          (get_local $0)
         )
        )
        (set_local $5
         (i32.add
          (i32.load offset=4
           (get_local $0)
          )
          (get_local $1)
         )
        )
        (set_local $6
         (i32.load16_u offset=8
          (i32.add
           (get_local $3)
           (get_local $5)
          )
         )
        )
        (if (result i32)
         (i32.and
          (get_local $2)
          (i32.const 1)
         )
         (get_local $6)
         (call $~lib/polyfills/bswap<u16>
          (get_local $6)
         )
        )
       )
      )
      (i32.const 65535)
     )
     (i32.const 40834)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 88)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (i32.and
      (block $~lib/dataview/DataView#getUint16|inlined.11 (result i32)
       (set_local $2
        (get_global $std/dataview/view)
       )
       (set_local $1
        (i32.const 4)
       )
       (set_local $0
        (i32.const 0)
       )
       (block $~lib/dataview/get<u16>|inlined.11 (result i32)
        (set_local $6
         (i32.load
          (get_local $2)
         )
        )
        (set_local $5
         (i32.add
          (i32.load offset=4
           (get_local $2)
          )
          (get_local $1)
         )
        )
        (set_local $3
         (i32.load16_u offset=8
          (i32.add
           (get_local $6)
           (get_local $5)
          )
         )
        )
        (if (result i32)
         (i32.and
          (get_local $0)
          (i32.const 1)
         )
         (get_local $3)
         (call $~lib/polyfills/bswap<u16>
          (get_local $3)
         )
        )
       )
      )
      (i32.const 65535)
     )
     (i32.const 33381)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 89)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (i32.and
      (block $~lib/dataview/DataView#getUint16|inlined.12 (result i32)
       (set_local $0
        (get_global $std/dataview/view)
       )
       (set_local $1
        (i32.const 5)
       )
       (set_local $2
        (i32.const 0)
       )
       (block $~lib/dataview/get<u16>|inlined.12 (result i32)
        (set_local $3
         (i32.load
          (get_local $0)
         )
        )
        (set_local $5
         (i32.add
          (i32.load offset=4
           (get_local $0)
          )
          (get_local $1)
         )
        )
        (set_local $6
         (i32.load16_u offset=8
          (i32.add
           (get_local $3)
           (get_local $5)
          )
         )
        )
        (if (result i32)
         (i32.and
          (get_local $2)
          (i32.const 1)
         )
         (get_local $6)
         (call $~lib/polyfills/bswap<u16>
          (get_local $6)
         )
        )
       )
      )
      (i32.const 65535)
     )
     (i32.const 25923)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 90)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (i32.and
      (block $~lib/dataview/DataView#getUint16|inlined.13 (result i32)
       (set_local $2
        (get_global $std/dataview/view)
       )
       (set_local $1
        (i32.const 6)
       )
       (set_local $0
        (i32.const 0)
       )
       (block $~lib/dataview/get<u16>|inlined.13 (result i32)
        (set_local $6
         (i32.load
          (get_local $2)
         )
        )
        (set_local $5
         (i32.add
          (i32.load offset=4
           (get_local $2)
          )
          (get_local $1)
         )
        )
        (set_local $3
         (i32.load16_u offset=8
          (i32.add
           (get_local $6)
           (get_local $5)
          )
         )
        )
        (if (result i32)
         (i32.and
          (get_local $0)
          (i32.const 1)
         )
         (get_local $3)
         (call $~lib/polyfills/bswap<u16>
          (get_local $3)
         )
        )
       )
      )
      (i32.const 65535)
     )
     (i32.const 17247)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 91)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (block $~lib/dataview/DataView#getUint32|inlined.0 (result i32)
      (set_local $0
       (get_global $std/dataview/view)
      )
      (set_local $1
       (i32.const 0)
      )
      (set_local $2
       (i32.const 1)
      )
      (block $~lib/dataview/get<u32>|inlined.0 (result i32)
       (set_local $3
        (i32.load
         (get_local $0)
        )
       )
       (set_local $5
        (i32.add
         (i32.load offset=4
          (get_local $0)
         )
         (get_local $1)
        )
       )
       (set_local $6
        (i32.load offset=8
         (i32.add
          (get_local $3)
          (get_local $5)
         )
        )
       )
       (if (result i32)
        (i32.and
         (get_local $2)
         (i32.const 1)
        )
        (get_local $6)
        (call $~lib/polyfills/bswap<u32>
         (get_local $6)
        )
       )
      )
     )
     (i32.const -1621565194)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 93)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (block $~lib/dataview/DataView#getUint32|inlined.1 (result i32)
      (set_local $2
       (get_global $std/dataview/view)
      )
      (set_local $1
       (i32.const 1)
      )
      (set_local $0
       (i32.const 1)
      )
      (block $~lib/dataview/get<u32>|inlined.1 (result i32)
       (set_local $6
        (i32.load
         (get_local $2)
        )
       )
       (set_local $5
        (i32.add
         (i32.load offset=4
          (get_local $2)
         )
         (get_local $1)
        )
       )
       (set_local $3
        (i32.load offset=8
         (i32.add
          (get_local $6)
          (get_local $5)
         )
        )
       )
       (if (result i32)
        (i32.and
         (get_local $0)
         (i32.const 1)
        )
        (get_local $3)
        (call $~lib/polyfills/bswap<u32>
         (get_local $3)
        )
       )
      )
     )
     (i32.const -2103486240)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 94)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (block $~lib/dataview/DataView#getUint32|inlined.2 (result i32)
      (set_local $0
       (get_global $std/dataview/view)
      )
      (set_local $1
       (i32.const 2)
      )
      (set_local $2
       (i32.const 1)
      )
      (block $~lib/dataview/get<u32>|inlined.2 (result i32)
       (set_local $3
        (i32.load
         (get_local $0)
        )
       )
       (set_local $5
        (i32.add
         (i32.load offset=4
          (get_local $0)
         )
         (get_local $1)
        )
       )
       (set_local $6
        (i32.load offset=8
         (i32.add
          (get_local $3)
          (get_local $5)
         )
        )
       )
       (if (result i32)
        (i32.and
         (get_local $2)
         (i32.const 1)
        )
        (get_local $6)
        (call $~lib/polyfills/bswap<u32>
         (get_local $6)
        )
       )
      )
     )
     (i32.const 1703059288)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 95)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (block $~lib/dataview/DataView#getUint32|inlined.3 (result i32)
      (set_local $2
       (get_global $std/dataview/view)
      )
      (set_local $1
       (i32.const 3)
      )
      (set_local $0
       (i32.const 1)
      )
      (block $~lib/dataview/get<u32>|inlined.3 (result i32)
       (set_local $6
        (i32.load
         (get_local $2)
        )
       )
       (set_local $5
        (i32.add
         (i32.load offset=4
          (get_local $2)
         )
         (get_local $1)
        )
       )
       (set_local $3
        (i32.load offset=8
         (i32.add
          (get_local $6)
          (get_local $5)
         )
        )
       )
       (if (result i32)
        (i32.and
         (get_local $0)
         (i32.const 1)
        )
        (get_local $3)
        (call $~lib/polyfills/bswap<u32>
         (get_local $3)
        )
       )
      )
     )
     (i32.const 1130726047)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 96)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (block $~lib/dataview/DataView#getUint32|inlined.4 (result i32)
      (set_local $0
       (get_global $std/dataview/view)
      )
      (set_local $1
       (i32.const 4)
      )
      (set_local $2
       (i32.const 1)
      )
      (block $~lib/dataview/get<u32>|inlined.4 (result i32)
       (set_local $3
        (i32.load
         (get_local $0)
        )
       )
       (set_local $5
        (i32.add
         (i32.load offset=4
          (get_local $0)
         )
         (get_local $1)
        )
       )
       (set_local $6
        (i32.load offset=8
         (i32.add
          (get_local $3)
          (get_local $5)
         )
        )
       )
       (if (result i32)
        (i32.and
         (get_local $2)
         (i32.const 1)
        )
        (get_local $6)
        (call $~lib/polyfills/bswap<u32>
         (get_local $6)
        )
       )
      )
     )
     (i32.const 1598252418)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 97)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (block $~lib/dataview/DataView#getUint32|inlined.5 (result i32)
      (set_local $2
       (get_global $std/dataview/view)
      )
      (set_local $1
       (i32.const 0)
      )
      (set_local $0
       (i32.const 0)
      )
      (block $~lib/dataview/get<u32>|inlined.5 (result i32)
       (set_local $6
        (i32.load
         (get_local $2)
        )
       )
       (set_local $5
        (i32.add
         (i32.load offset=4
          (get_local $2)
         )
         (get_local $1)
        )
       )
       (set_local $3
        (i32.load offset=8
         (i32.add
          (get_local $6)
          (get_local $5)
         )
        )
       )
       (if (result i32)
        (i32.and
         (get_local $0)
         (i32.const 1)
        )
        (get_local $3)
        (call $~lib/polyfills/bswap<u32>
         (get_local $3)
        )
       )
      )
     )
     (i32.const -153069409)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 99)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (block $~lib/dataview/DataView#getUint32|inlined.6 (result i32)
      (set_local $0
       (get_global $std/dataview/view)
      )
      (set_local $1
       (i32.const 1)
      )
      (set_local $2
       (i32.const 0)
      )
      (block $~lib/dataview/get<u32>|inlined.6 (result i32)
       (set_local $3
        (i32.load
         (get_local $0)
        )
       )
       (set_local $5
        (i32.add
         (i32.load offset=4
          (get_local $0)
         )
         (get_local $1)
        )
       )
       (set_local $6
        (i32.load offset=8
         (i32.add
          (get_local $3)
          (get_local $5)
         )
        )
       )
       (if (result i32)
        (i32.and
         (get_local $2)
         (i32.const 1)
        )
        (get_local $6)
        (call $~lib/polyfills/bswap<u32>
         (get_local $6)
        )
       )
      )
     )
     (i32.const -531062910)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 100)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (block $~lib/dataview/DataView#getUint32|inlined.7 (result i32)
      (set_local $2
       (get_global $std/dataview/view)
      )
      (set_local $1
       (i32.const 2)
      )
      (set_local $0
       (i32.const 0)
      )
      (block $~lib/dataview/get<u32>|inlined.7 (result i32)
       (set_local $6
        (i32.load
         (get_local $2)
        )
       )
       (set_local $5
        (i32.add
         (i32.load offset=4
          (get_local $2)
         )
         (get_local $1)
        )
       )
       (set_local $3
        (i32.load offset=8
         (i32.add
          (get_local $6)
          (get_local $5)
         )
        )
       )
       (if (result i32)
        (i32.and
         (get_local $0)
         (i32.const 1)
        )
        (get_local $3)
        (call $~lib/polyfills/bswap<u32>
         (get_local $3)
        )
       )
      )
     )
     (i32.const 1486848613)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 101)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (block $~lib/dataview/DataView#getUint32|inlined.8 (result i32)
      (set_local $0
       (get_global $std/dataview/view)
      )
      (set_local $1
       (i32.const 3)
      )
      (set_local $2
       (i32.const 0)
      )
      (block $~lib/dataview/get<u32>|inlined.8 (result i32)
       (set_local $3
        (i32.load
         (get_local $0)
        )
       )
       (set_local $5
        (i32.add
         (i32.load offset=4
          (get_local $0)
         )
         (get_local $1)
        )
       )
       (set_local $6
        (i32.load offset=8
         (i32.add
          (get_local $3)
          (get_local $5)
         )
        )
       )
       (if (result i32)
        (i32.and
         (get_local $2)
         (i32.const 1)
        )
        (get_local $6)
        (call $~lib/polyfills/bswap<u32>
         (get_local $6)
        )
       )
      )
     )
     (i32.const -1618844349)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 102)
     (i32.const 0)
    )
    (unreachable)
   )
  )
  (if
   (i32.eqz
    (i32.eq
     (block $~lib/dataview/DataView#getUint32|inlined.9 (result i32)
      (set_local $2
       (get_global $std/dataview/view)
      )
      (set_local $1
       (i32.const 4)
      )
      (set_local $0
       (i32.const 0)
      )
      (block $~lib/dataview/get<u32>|inlined.9 (result i32)
       (set_local $6
        (i32.load
         (get_local $2)
        )
       )
       (set_local $5
        (i32.add
         (i32.load offset=4
          (get_local $2)
         )
         (get_local $1)
        )
       )
       (set_local $3
        (i32.load offset=8
         (i32.add
          (get_local $6)
          (get_local $5)
         )
        )
       )
       (if (result i32)
        (i32.and
         (get_local $0)
         (i32.const 1)
        )
        (get_local $3)
        (call $~lib/polyfills/bswap<u32>
         (get_local $3)
        )
       )
      )
     )
     (i32.const -2107292833)
    )
   )
   (block
    (call $~lib/env/abort
     (i32.const 0)
     (i32.const 216)
     (i32.const 103)
     (i32.const 0)
    )
    (unreachable)
   )
  )
 )
 (func $null (; 19 ;) (type $v)
 )
)
