import { HEADER_SIZE } from "./internal/arraybuffer";

@inline
function get<T>(buffer: ArrayBuffer, byteOffset: i32, littleEndian: boolean): T {
  const result = load<T>(changetype<usize>(buffer) + byteOffset, HEADER_SIZE);
  return littleEndian ? result : bswap<T>(result);
}

@inline
function set<T>(buffer: ArrayBuffer, byteOffset: i32, value: T, littleEndian: boolean): void {
  const input = littleEndian ? value : bswap<T>(value);
  store<T>(changetype<usize>(buffer) + byteOffset, input, HEADER_SIZE);
}

export class DataView {
  constructor(
    readonly buffer: ArrayBuffer,
    readonly byteOffset: i32 = 0,
    readonly byteLength: i32 = i32.MAX_VALUE,
  ) {
    this.byteLength = min(buffer.byteLength, byteLength);
  }

  @inline
  getFloat32(byteOffset: i32, littleEndian: boolean): f32 {
    return get<f32>(this.buffer, byteOffset, littleEndian);
  }

  @inline
  getFloat64(byteOffset: i32, littleEndian: boolean): f64 {
    return get<f64>(this.buffer, byteOffset, littleEndian);
  }

  @inline
  getInt8(byteOffset: i32, littleEndian: boolean): i8 {
    return get<i8>(this.buffer, byteOffset, littleEndian);
  }

  @inline
  getInt16(byteOffset: i32, littleEndian: boolean): i16 {
    return get<i16>(this.buffer, byteOffset, littleEndian);
  }

  @inline
  getInt32(byteOffset: i32, littleEndian: boolean): i32 {
    return get<i32>(this.buffer, byteOffset, littleEndian);
  }

  @inline
  getUint8(byteOffset: i32, littleEndian: boolean): u8 {
    return get<u8>(this.buffer, byteOffset, littleEndian);
  }

  @inline
  getUint16(byteOffset: i32, littleEndian: boolean): u16 {
    return get<u16>(this.buffer, byteOffset, littleEndian);
  }

  @inline
  getUint32(byteOffset: i32, littleEndian: boolean): u32 {
    return get<u32>(this.buffer, byteOffset, littleEndian);
  }

  @inline
  setFloat32(byteOffset: i32, value: f32, littleEndian: boolean): void {
    set<f32>(this.buffer, byteOffset, value, littleEndian);
  }

  @inline
  setFloat64(byteOffset: i32, value: f64, littleEndian: boolean): void {
    set<f64>(this.buffer, byteOffset, value, littleEndian);
  }

  @inline
  setInt8(byteOffset: i32, value: i8, littleEndian: boolean): void {
    set<i8>(this.buffer, byteOffset, value, littleEndian);
  }

  @inline
  setInt16(byteOffset: i32, value: i16, littleEndian: boolean): void {
    set<i16>(this.buffer, byteOffset, value, littleEndian);
  }

  @inline
  setInt32(byteOffset: i32, value: i32, littleEndian: boolean): void {
    set<i32>(this.buffer, byteOffset, value, littleEndian);
  }

  @inline
  setUint8(byteOffset: i32, value: u8, littleEndian: boolean): void {
    set<u8>(this.buffer, byteOffset, value, littleEndian);
  }

  @inline
  setUint16(byteOffset: i32, value: u16, littleEndian: boolean): void {
    set<u16>(this.buffer, byteOffset, value, littleEndian);
  }

  @inline
  setUint32(byteOffset: i32, value: u32, littleEndian: boolean): void {
    set<u32>(this.buffer, byteOffset, value, littleEndian);
  }
}
