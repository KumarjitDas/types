# Release Notes

## [v1.0.0](https://github.com/KumarjitDas/types/releases/tag/v1.0.0)
2nd July 2024

### Features

1. **Type Definitions**
   - Added comprehensive type definitions:
     - Boolean: `bool`
     - Signed integers: `i8`, `i16`, `i32`, `i64`, `imin`, `imax`
     - Unsigned integers: `u8`, `u16`, `u32`, `u64`, `umin`, `umax`, `usize`
     - Other types: `byte`, `charcode`
     - Floating points: `f32`, `f64`, `fmin`, `fmax`
     - General purpose: `any`

2. **Type Pretend Macros**
   - `TYPES_PRETEND_64BIT_INTEGER`: Makes 64-bit types act as 32-bit types for compatibility purposes.

3. **Type Definition Checks**
   - `TYPES_DEFINED_TYPE_<TYPE_NAME>`: Checks if a type is defined in the current environment.
   - `TYPES_DEFINED_TYPEVAL_<VALUE_NAME>`: Checks if a constant value of a type is defined.

4. **Integer and Pointer Size Checks**
   - `TYPES_64BIT_INTEGER`: Checks if the compiler, OS, and CPU support 64-bit integers.
   - `TYPES_32BIT_INTEGER`: Checks if the compiler, OS, and CPU support 32-bit integers.
   - `TYPES_64BIT_POINTER`: Checks if the compiler, OS, and CPU support 64-bit pointers.
   - `TYPES_32BIT_POINTER`: Checks if the compiler, OS, and CPU support 32-bit pointers.

5. **Type Boundaries and Sizes**
   - `MIN_<TYPE_NAME>`: Macro to get the minimum value of a type.
   - `MAX_<TYPE_NAME>`: Macro to get the maximum value of a type.
   - `SZ_<TYPE_NAME>`: Macro to get the size of a type.

For more details, see the full [Changelog](CHANGELOG.md).

## Version Details

- **First Release**: 1.0.0
- **Release Date**: 2024-07-02
