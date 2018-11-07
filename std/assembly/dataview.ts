import {
  loadUnsafeWithOffset,
} from "./internal/arraybuffer";

export class DataView {
  readonly buffer: ArrayBuffer;
  readonly byteOffset: i32;
  readonly byteLength: i32;

  constructor (buffer: ArrayBuffer, byteOffset: i32, byteLength: i32) {
    this.buffer = buffer
    this.byteOffset = byteOffset
    this.byteLength = byteLength
  }

  @inline
  getUint32 (byteOffset: u32, littleEndian: boolean): u32 {
    if (littleEndian) {
      return (
        (loadUnsafeWithOffset<u8, u8>(this.buffer, byteOffset + 0, this.byteOffset) << 24) &
        (loadUnsafeWithOffset<u8, u8>(this.buffer, byteOffset + 1, this.byteOffset) << 16) &
        (loadUnsafeWithOffset<u8, u8>(this.buffer, byteOffset + 2, this.byteOffset) << 8) &
        (loadUnsafeWithOffset<u8, u8>(this.buffer, byteOffset + 3, this.byteOffset) << 0)
      );
    } else {
      return (
        (loadUnsafeWithOffset<u8, u8>(this.buffer, byteOffset + 0, this.byteOffset) << 0) &
        (loadUnsafeWithOffset<u8, u8>(this.buffer, byteOffset + 1, this.byteOffset) << 8) &
        (loadUnsafeWithOffset<u8, u8>(this.buffer, byteOffset + 2, this.byteOffset) << 16) &
        (loadUnsafeWithOffset<u8, u8>(this.buffer, byteOffset + 3, this.byteOffset) << 24)
      );
    }
  }

  @inline
  getUint16 (byteOffset: u32, littleEndian: boolean): u16 {
    if (littleEndian) {
      return (
        (loadUnsafeWithOffset<u8, u8>(this.buffer, byteOffset + 0, this.byteOffset) << 8) &
        (loadUnsafeWithOffset<u8, u8>(this.buffer, byteOffset + 1, this.byteOffset) << 0)
      );
    } else {
      return (
        (loadUnsafeWithOffset<u8, u8>(this.buffer, byteOffset + 0, this.byteOffset) << 0) &
        (loadUnsafeWithOffset<u8, u8>(this.buffer, byteOffset + 1, this.byteOffset) << 8)
      );
    }
  }
}
