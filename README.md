# TYPES

TYPES is a simple, header-only C library designed to provide types with sizes. This project targets both Windows and GNU/Linux (32-bit and 64-bit) platforms. The library aims to help developers easily specify the size of a type instead of relying on the compiler/OS/CPU architecture and macros.

## Table of Contents

- [Features](#features)
- [Requirements](#requirements)
- [Usage](#usage)
- [Dependency](#dependency)
- [Roadmap](#roadmap)
- [Contributing](#contributing)
- [Naming Convention](#naming-convention)
- [License](#license)
- [Project Status](#project-status)
- [Contact](#contact)
- [Versioning](#versioning)
- [Changelog](#changelog)

## Features

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

3. **Integer and Pointer Size Checks**
   - `TYPES_64BIT_INTEGER`: Checks if the compiler, OS, and CPU support 64-bit integers.
   - `TYPES_32BIT_INTEGER`: Checks if the compiler, OS, and CPU support 32-bit integers.
   - `TYPES_64BIT_POINTER`: Checks if the compiler, OS, and CPU support 64-bit pointers.
   - `TYPES_32BIT_POINTER`: Checks if the compiler, OS, and CPU support 32-bit pointers.

4. **Type Boundaries and Sizes**
   - `MIN_<TYPE_NAME>`: Macro to get the minimum value of a type.
   - `MAX_<TYPE_NAME>`: Macro to get the maximum value of a type.
   - `SZ_<TYPE_NAME>`: Macro to get the size of a type.

5. **Format Specifiers and Type Casts**
   - `FMTSP_<TYPE_NAME>`: Macro to get standard C format specifiers.
   - `FSBTC_<TYPE_NAME>`: Function-like macro to type cast the library types.

## Requirements

To get started with this project, download and install the following.

- Download and install **git**
    - If you use *Windows*, then go to this [link](https://git-scm.com/downloads) and download and install the suitable version.
    - If you use any stable version of *Debian/Ubuntu* then run this command in your terminal

        ```shell
        sudo apt-get install git
        ```

    - If you use *macOS* then install [homebrew](https://brew.sh/) if you don't already have it, then run this command in your terminal

        ```shell
        brew install git
        ```

- Run the command to clone this repository
    
    ```shell
    git clone https://github.com/KumarjitDas/types.git
    ```

- Download and install a **C** compiler
    - If you use *Windows 8/10/11* then download **Visual Studio 2017/2019/2022** from this [link](https://visualstudio.microsoft.com/downloads/) or download and install a suitable version of **clang** from this [link](https://releases.llvm.org/download.html). For **gcc**, use the suitable *MinGW* version from this [link](http://mingw-w64.org/doku.php/download).

    - If you use any stable version of *Debian/Ubuntu* then run these commands in your terminal to download and install **clang** and **gcc** compilers

        ```shell
        sudo apt install clang
        ```

        ```shell
        sudo apt install gcc
        ```

    - In *macOS*, **clang** is the default **C** compiler. To download and install gcc, run this command in your terminal

        ```shell
        brew install gcc
        ```

- For building on Linux 32-bit targets on a 64-bit platform, `gcc-multilib` must be installed:

    ```bash
    sudo apt install gcc-multilib
    ```

- Download and install **CMake**
    - For *Windows 8/10/11* download from [kitware](https://cmake.org/files/v3.19/) or [GitHub](https://github.com/Kitware/CMake/releases/tag/v3.19.6)

    - If you use any stable version of *Debian/Ubuntu* then run these commands in your terminal to download and install **cmake**

        ```shell
        sudo apt install cmake
        ```

    - To download and install **cmake** on *macOS*, run this command in your terminal

        ```shell
        brew install cmake
        ```

### Dependency

The **types** library depends on the **kdapi** library. Ensure that you have the **kdapi** library available in your project. If you do not provide the location of the **kdapi** CMake targets, the **types** library will attempt to download the **kdapi** library and place it in the _external_ directory inside the build tree.

#### Including _kdapi_

- Download the `kdapi` library from the official [repository](https://github.com/KumarjitDas/kdapi/releases/latest) or [source](https://github.com/KumarjitDas/kdapi/archive/refs/tags/v1.2.0.zip).
- Provide the cmake-targets path in either inside root cmake file or in the command line
    - In CMake file

        ```cmake
        # ...
        list(APPEND CMAKE_PREFIX_PATH path/to/kdapi/lib/cmake)
        # ...
        ```

    - In command line as an argument

        ```shell
        cmake ... -DCMAKE_PREFIX_PATH=path/to/kdapi/lib/cmake ...
        ```

## Usage

- Download the [latest release](https://github.com/KumarjitDas/types/releases/latest) of the project according to your system specification.

- For CMake projects add the _types_ library _cmake_ directory path to the `CMAKE_PREFIX_PATH` variable.
    - In CMake file

        ```cmake
        # ...
        list(APPEND CMAKE_PREFIX_PATH path/to/types/lib/cmake)
        # ...
        ```

    - In command line as an argument

        ```shell
        cmake ... -DCMAKE_PREFIX_PATH=path/to/types/lib/cmake ...
        ```

- Include the _types.h_ header file in your C project to use KDAPI.

    ```c
    #include "types.h"
    ```

- To build the project from source using CMake you have to provide target platform information (`KDAPI_TARGET_OS` and `KDAPI_TARGET_ARCH`. For example:

    ```shell
    cmake -DKDAPI_TARGET_OS=windows -DKDAPI_TARGET_ARCH=x64 -G Ninja -S path/to/types -B path/to/build
    ```

### Example

You can find all the examples [here](examples). Here's a demo:

```c
#include <stdio.h>
#include "types.h"

int main() {
    printf("TYPES Version: %s\n", TYPES_VERSION_STR);
    
    i8 val8i = 128;
    u32 val32u = 654321;
    
    printf("val8i: " FMTSP_I8 ",  val32u = " FMTSP_U32 "\n", FSBTC_I8(val8i), FSBTC_U32(val32u));
    
    return 0;
}
```

## Roadmap

See the [open issues](https://github.com/KumarjitDas/types/issues) for a list of proposed
features/functionalities (and known issues).

The list of features and functions implemented till now is given in [Project Status](#project-status).

## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any
contributions you make are greatly appreciated.

- Fork this project \[[types](https://github.com/KumarjitDas/types)\]
- Create your *Feature Branch*

    ```shell
    git checkout -b feature/AmazingFeature
    ```

- Commit your *Changes*

    ```shell
    git commit -m 'Added some AmazingFeature'
    ```

- Push to the Branch

    ```shell
    git push origin feature/AmazingFeature
    ```

- Create a [pull request](https://github.com/KumarjitDas/types/pulls)

## Naming Convention

The TYPES project follows a consistent naming convention to ensure readability and maintainability. Here are the key aspects of the naming convention used:

- **Macro Names**: Macro names are written in uppercase letters with underscores separating words. They typically start with the prefix `KD_`.
- Examples: `KD_COMPILER_GCC`, `KD_OS_LINUX`, `KD_CPU_X86_64`, `KD_VERSION_MAJOR`

- **Macro Definitions:**
    - Macro names are written in uppercase letters. They typically start with the prefix `TYPES_`.
    - Words are separated by underscores (`_`).
    - Example: `TYPES_VERSION_MAJOR`, `TYPES_DEFINED_TYPE_BOOL`.

- **Type Definitions:**
    - Type names are in lowercase.
    - Use of prefixes for type groups, such as `kd_types__type_` for internal types.
    - Example: `kd_types__type_i64_`, `bool`, `i8`.

- **Enums:**
    - Enum names follow a similar lowercase pattern, with names indicating boolean values.
    - Example: `kd_types__type_bool_` with values `false` and `true`.

- **Function-like Macros:**
    - Macros that behave like functions are in uppercase with parameters in parentheses.
    - Example: `TYPES_I64(x)`, `TYPES_U32(x)`, `FSBTC_U32(x)`.

- **Constant Values:**
    - Constants follow the uppercase convention and often include type indications.
    - Example: `MIN_I8`, `MAX_I32`, `SZ_BOOL`, `FMTSP_I8`.

## License

This project is distributed under the **BSD 2-Clause License**. See [LICENSE](LICENSE.txt) for more information.

## Project Status

List of functionalities/features implemented so far:

- **Type definitions**: `bool`, `i8`, `i16`, `i32`, `i64`, `imin`, `imax`, `u8`, `u16`, `u32`, `u64`, `umin`, `umax`, `usize`, `byte`, `charcode`, `f32`, `f64`, `fmin`, `fmax`, and `any`.
- **Macro `TYPES_PRETEND_64BIT_INTEGER`**: Makes 64-bit types act as 32-bit types.
- **Macro `TYPES_DEFINED_TYPE_<TYPE_NAME>`**: Checks if a type is defined.
- **Macro `TYPES_DEFINED_TYPEVAL_<VALUE_NAME>`**: Checks if a constant value of a type is defined.
- **Macro `TYPES_64BIT_INTEGER`**: Checks if the compiler, OS, and CPU support 64-bit integers.
- **Macro `TYPES_32BIT_INTEGER`**: Checks if the compiler, OS, and CPU support 32-bit integers.
- **Macro `TYPES_64BIT_POINTER`**: Checks if the compiler, OS, and CPU support 64-bit pointers.
- **Macro `TYPES_32BIT_POINTER`**: Checks if the compiler, OS, and CPU support 32-bit pointers.
- **Macro `MIN_<TYPE_NAME>`**: Gets the minimum value of a type.
- **Macro `MAX_<TYPE_NAME>`**: Gets the maximum value of a type.
- **Macro `SZ_<TYPE_NAME>`**: Gets the size of a type.
- **Macro `FMTSP_<TYPE_NAME>`**: Gets compatible standard C format specifier of a type.
- **Macro `FMTSP_<TYPE_NAME>(x)`**: Gets suitable type cast of a type.
- **Build Configuration**: CMake configuration files for shared and static builds.
- **Example Programs**: [Examples](examples) demonstrating library usage.

## Contact

Twitter: [@kumarjitdas1999](https://twitter.com/kumarjitdas1999)

LinkedIn: [Kumarjit Das](https://www.linkedin.com/in/kumarjit-das)

E-mail: [kumarjitdas1999@gmail.com](mailto:kumarjitdas1999+github@gmail.com)

Project link: [TYPES](https://github.com/KumarjitDas/types)

## Versioning

This project uses **MAJOR**, **MINOR**, and **PATCH** version numbers for versioning (v*MAJOR.MINOR.PATCH*).

- **MAJOR** version number indicates *new changes which may be incompatible with older versions*.
- **MINOR** version number indicates *addition of backwards-compatible features*.
- **PATCH** version number indicates *backwards-compatible bug fixes*, or minor mistake fixes like *spelling*, *character cases*, *punctuations*, and *indentation*.

## Changelog

The [Changelog](CHANGELOG.md) file contains all the information about the changes made to this project till now.

You can also view the [raw](https://raw.githubusercontent.com/KumarjitDas/types/main/CHANGELOG.md) version.
