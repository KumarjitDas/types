# Changelog

## [v1.0.0](https://github.com/KumarjitDas/types/releases/tag/v1.0.0) - 2024-07-02

### Added

- Type definitions: `bool`, `i8`, `i16`, `i32`, `i64`, `imin`, `imax`, `u8`, `u16`, `u32`, `u64`, `umin`, `umax`, `usize`, `byte`, `charcode`, `f32`, `f64`, `fmin`, `fmax`, and `any`
- `TYPES_PRETEND_64BIT_INTEGER` to make 64-bit types act as 32-bit types.
- `TYPES_DEFINED_TYPE_<TYPE_NAME>` for checking if a type is defined.
- `TYPES_DEFINED_TYPEVAL_<VALUE_NAME>` for checking if a constant value of a type is defined.
- `TYPES_64BIT_INTEGER` for checking if the compiler, OS, and CPU support 64-bit integers.
- `TYPES_32BIT_INTEGER` for checking if the compiler, OS, and CPU support 32-bit integers.
- `TYPES_64BIT_POINTER` for checking if the compiler, OS, and CPU support 64-bit pointers.
- `TYPES_32BIT_POINTER` for checking if the compiler, OS, and CPU support 32-bit pointers.
- `MIN_<TYPE_NAME>` to get the minimum value of a type.
- `MAX_<TYPE_NAME>` to get the maximum value of a type.
- `SZ_<TYPE_NAME>` to get the size of a type.
