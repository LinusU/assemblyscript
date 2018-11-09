import { HEADER_SIZE } from "./internal/arraybuffer";

@inline
function get<T>(buffer: ArrayBuffer, byteOffset: i32, littleEndian: boolean): T {
  var result: T = load<T>(changetype<usize>(buffer) + byteOffset, HEADER_SIZE);
  return littleEndian ? result : bswap<T>(result);
}

@inline
function set<T>(buffer: ArrayBuffer, byteOffset: i32, value: T, littleEndian: boolean): void {
  var input = littleEndian ? value : bswap<T>(value);
  store<T>(changetype<usize>(buffer) + byteOffset, input, HEADER_SIZE);
}

export class DataView {
  constructor(
    readonly buffer: ArrayBuffer,
    readonly byteOffset: i32 = 0,
    readonly byteLength: i32 = i32.MIN_VALUE,
  ) {
    if (byteLength === i32.MIN_VALUE) byteLength = buffer.byteLength - byteOffset;

    if (byteOffset < 0) throw new RangeError("byteOffset cannot be negative");
    if (byteLength < 0) throw new RangeError("byteLength cannot be negative");
    if (byteOffset + byteLength > buffer.byteLength) throw new RangeError("Length out of range of buffer");
  }

  @inline
  getFloat32(byteOffset: i32, littleEndian: boolean = false): f32 {
    var result: u32 = load<u32>(changetype<usize>(this.buffer) + this.byteOffset + byteOffset, HEADER_SIZE);
    return reinterpret<f32>(littleEndian ? result : bswap<u32>(result));
  }

  @inline
  getFloat64(byteOffset: i32, littleEndian: boolean = false): f64 {
    var result: u64 = load<u64>(changetype<usize>(this.buffer) + this.byteOffset + byteOffset, HEADER_SIZE);
    return reinterpret<f64>(littleEndian ? result : bswap<u64>(result));
  }

  @inline
  getInt8(byteOffset: i32): i8 {
    return get<i8>(this.buffer, this.byteOffset + byteOffset, true);
  }

  @inline
  getInt16(byteOffset: i32, littleEndian: boolean = false): i16 {
    return get<i16>(this.buffer, this.byteOffset + byteOffset, littleEndian);
  }

  @inline
  getInt32(byteOffset: i32, littleEndian: boolean = false): i32 {
    return get<i32>(this.buffer, this.byteOffset + byteOffset, littleEndian);
  }

  @inline
  getUint8(byteOffset: i32): u8 {
    return get<u8>(this.buffer, this.byteOffset + byteOffset, true);
  }

  @inline
  getUint16(byteOffset: i32, littleEndian: boolean = false): u16 {
    return get<u16>(this.buffer, this.byteOffset + byteOffset, littleEndian);
  }

  @inline
  getUint32(byteOffset: i32, littleEndian: boolean = false): u32 {
    return get<u32>(this.buffer, this.byteOffset + byteOffset, littleEndian);
  }

  @inline
  setFloat32(byteOffset: i32, value: f32, littleEndian: boolean = false): void {
    var input: f32 = littleEndian ? value : reinterpret<f32>(bswap<u32>(reinterpret<u32>(value)));
    store<f32>(changetype<usize>(this.buffer) + this.byteOffset + byteOffset, input, HEADER_SIZE);
  }

  @inline
  setFloat64(byteOffset: i32, value: f64, littleEndian: boolean = false): void {
    var input: f64 = littleEndian ? value : reinterpret<f64>(bswap<u64>(reinterpret<u64>(value)));
    store<f64>(changetype<usize>(this.buffer) + this.byteOffset + byteOffset, input, HEADER_SIZE);
  }

  @inline
  setInt8(byteOffset: i32, value: i8): void {
    set<i8>(this.buffer, this.byteOffset + byteOffset, value, true);
  }

  @inline
  setInt16(byteOffset: i32, value: i16, littleEndian: boolean = false): void {
    set<i16>(this.buffer, this.byteOffset + byteOffset, value, littleEndian);
  }

  @inline
  setInt32(byteOffset: i32, value: i32, littleEndian: boolean = false): void {
    set<i32>(this.buffer, this.byteOffset + byteOffset, value, littleEndian);
  }

  @inline
  setUint8(byteOffset: i32, value: u8): void {
    set<u8>(this.buffer, this.byteOffset + byteOffset, value, true);
  }

  @inline
  setUint16(byteOffset: i32, value: u16, littleEndian: boolean = false): void {
    set<u16>(this.buffer, this.byteOffset + byteOffset, value, littleEndian);
  }

  @inline
  setUint32(byteOffset: i32, value: u32, littleEndian: boolean = false): void {
    set<u32>(this.buffer, this.byteOffset + byteOffset, value, littleEndian);
  }

  /**
   * Non-standard additions that makes sense in WebAssembly, but won't work in JS
   */

  @inline
  getInt64(byteOffset: i32, littleEndian: boolean = false): i64 {
    return get<i64>(this.buffer, this.byteOffset + byteOffset, littleEndian);
  }

  @inline
  getUint64(byteOffset: i32, littleEndian: boolean = false): u64 {
    return get<u64>(this.buffer, this.byteOffset + byteOffset, littleEndian);
  }

  @inline
  setInt64(byteOffset: i32, value: i64, littleEndian: boolean = false): void {
    set<i64>(this.buffer, this.byteOffset + byteOffset, value, littleEndian);
  }

  @inline
  setUint64(byteOffset: i32, value: u64, littleEndian: boolean = false): void {
    set<u64>(this.buffer, this.byteOffset + byteOffset, value, littleEndian);
  }
}
