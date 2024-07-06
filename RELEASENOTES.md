# Release Notes

## [v1.2.0](https://github.com/KumarjitDas/types/releases/tag/v1.2.0) - 2024-07-06
6th July 2024

### Resolved Issues

- [Issue #10](https://github.com/KumarjitDas/types/issues/10): Fixed boolean type error for C++.
- [Issue #12](https://github.com/KumarjitDas/types/issues/12): Added license statement to all CMake files.
- [Issue #14](https://github.com/KumarjitDas/types/issues/14): Added C++ check wrapping around the library.
- [Issue #1](https://github.com/KumarjitDas/types/issues/11): Updated the dependency section in README.
- [Issue #9](https://github.com/KumarjitDas/types/issues/9): Using **kdapi** _v1.2.0_ for architecture specific macro definitions.
- [Issue #15](https://github.com/KumarjitDas/types/issues/15): Removed 'Is defined component' macros.
- [Issue #8](https://github.com/KumarjitDas/types/issues/8): Removed _TYPES_'s own architecture specific macros and used _KDAPI_'s.

### Fixed

- 64-bit prints for any types in example2.

### Added

- API version in examples.

### Changed

- Did some minor documentation changes.
- Updated version to _1.2.0_.
- Updated readme.
- Updated release notes.

### Removed

- 'Acknowledgment' section from readme file.

## [v1.1.0](https://github.com/KumarjitDas/types/releases/tag/v1.1.0)
3rd July 2024

### Resolved Issues

- [Issue #6](https://github.com/KumarjitDas/types/issues/7): Added exit status `EXIT_SUCCESS` and `EXIT_FAILURE` macros.
- [Issue #4](https://github.com/KumarjitDas/types/issues/4): Added an example without OS/CPU architecture/compiler checks with `ifdef`: [_examples/example2.c_](examples/example2.c).
- [Issue #3](https://github.com/KumarjitDas/types/issues/3): Added `FSBTC_<TYPE_NAME>` type cast macros for values for using in the standard format string functions to suppress warnings for different types.
- [Issue #2](https://github.com/KumarjitDas/types/issues/2): Added `FMTSP_<TYPE_NAME>` macros for C-style format specifiers for all types to be used in the standard format string functions.
- [Issue #5](https://github.com/KumarjitDas/types/issues/5): Using the newer version of **KDAPI** _(v1.1.0)_.
- [Issue #7](https://github.com/KumarjitDas/types/issues/7): Remove the `/MD` option for MSVC compiler.

### Added

- Value assignment macro `ASSIGN_ANY` for `any` type.

### Changed

- Main example source file name(_examples/example.c_) to [_examples/example1.c_](examples/example1.c).

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

- **Current Version**: 1.2.0
- **Release Date**: 6th July 2024
- **Previous Version**: 1.1.0
