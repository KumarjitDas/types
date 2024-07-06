# Changelog

## [Unreleased](https://github.com/KumarjitDas/types/compare/v1.1.0...HEAD) - 2024-07-06

- Resolved [Issue #8](https://github.com/KumarjitDas/types/issues/8)&nbsp; (Remove architecture specific macros)
    - Removed _TYPES_'s own architecture specific macros and used _KDAPI_'s.

- Resolved [Issue #10](https://github.com/KumarjitDas/types/issues/10)&nbsp; (Boolean type error for C++)
    - Fixed the error by wrapping the library around C++ checking macros.

- Added API version in examples.
- Fixed 64-bit prints for any types in example2

- Resolved [Issue #9](https://github.com/KumarjitDas/types/issues/9)&nbsp; (Use **kdapi** _v1.2.0_)
    - Using **kdapi** _v1.2.0_ for architecture specific macro definitions.

- Changed project version to _1.1.1_

- Resolved [Issue #12](https://github.com/KumarjitDas/types/issues/12)&nbsp; (CMake files do not contain license statement)
    - Added license statement to all CMake files.

- Resolved [Issue #14](https://github.com/KumarjitDas/types/issues/14)&nbsp; (Wrap the library around C++ check)
    - Added C++ check wrapping around the library.

- Resolved [Issue #15](https://github.com/KumarjitDas/types/issues/15)&nbsp; (Remove 'Is defined component' macros)
    - Removed 'Is defined component' macros.

- Added 'Dependency' section in readme file.
- Removed 'Acknowledgment' section from readme file.
- Did some minor documentation changes.

## [v1.1.0](https://github.com/KumarjitDas/types/compare/v1.0.0...v1.1.0) - 2024-07-03

### Added

- [Issue #6](https://github.com/KumarjitDas/types/issues/7)&nbsp; Add exit status macros
    - `EXIT_SUCCESS` and `EXIT_FAILURE` macros
- [Issue #4](https://github.com/KumarjitDas/types/issues/4)&nbsp; An example without OS/CPU/compiler checks
    - Example without OS/CPU architecture/compiler checks with `ifdef`: [_examples/example2.c_](examples/example2.c)
- [Issue #3](https://github.com/KumarjitDas/types/issues/3)&nbsp; Add printable type cast macros
    - `FSBTC_<TYPE_NAME>` type cast macros for values for using in the standard format string functions to suppress warnings for different types
- [Issue #2](https://github.com/KumarjitDas/types/issues/2)&nbsp; Add C-style format specifiers
    - `FMTSP_<TYPE_NAME>` macros for C-style format specifiers for all types to be used in the standard format string functions
- Value assignment macro `ASSIGN_ANY` for `any` type

### Changed

- [Issue #5](https://github.com/KumarjitDas/types/issues/5)&nbsp; Use the newer version of KDAPI
    - Using the newer version of **KDAPI** _(v1.1.0)_.
- Main example source file name(_examples/example.c_) to [_examples/example1.c_](examples/example1.c)

### Removed

- [Issue #7](https://github.com/KumarjitDas/types/issues/7)&nbsp; Remove the /MD option for MSVC compiler
    - The `/MD` option for MSVC compiler

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
