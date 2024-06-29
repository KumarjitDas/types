
# TYPES

TYPES is a simple, header-only C library designed to provide compile-time system information. This project targets both Windows and GNU/Linux (32-bit and 64-bit) platforms. The library aims to help developers easily retrieve details about the compiler, target operating system, target CPU, and endianness at compile-time.

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Requirements](#requirements)
- [Usage](#usage)
- [Roadmap](#roadmap)
- [Contributing](#contributing)
- [Naming Convention](#naming-convention)
- [License](#license)
- [Project Status](#project-status)
- [Acknowledgment](#acknowledgment)
- [Contact](#contact)
- [Versioning](#versioning)
- [Changelog](#changelog)

## Features

- Detects compiler type and version.
- Identifies the target operating system.
- Determines the target CPU architecture.
- Checks system endianness.
- Provides macros for import-export signatures, calling conventions, and extern indicators.
- CMake target for ease of use with other CMake projects.

## Installation

To get started with this project, download and install the following.

- Download and install **git**
  - If you use *Windows*, then go to this [link](https://git-scm.com/downloads) and download and install the suitable version.
  - If you use any stable version of *Debian/Ubuntu* then run this command in your terminal

    ```sh
    sudo apt-get install git
    ```

  - If you use *macOS* then install [homebrew](https://brew.sh/) if you don't already have it, then run this command in your terminal

    ```sh
    brew install git
    ```

- Run the command to clone this repository

  ```sh
  git clone https://github.com/KumarjitDas/types.git
  ```

- Download and install a **C** compiler
  - If you use *Windows 8/10/11* then download **Visual Studio 2017/2019/2022** from this [link](https://visualstudio.microsoft.com/downloads/) download and install a suitable version of **clang** from this [link](https://releases.llvm.org/download.html). For **gcc**, use the suitable *MinGW* version from this [link](http://mingw-w64.org/doku.php/download).
  - If you use any stable version of *Debian/Ubuntu* then run these commands in your terminal to download and install **clang** and **gcc** compilers

    ```sh
    sudo apt install clang
    ```

    ```sh
    sudo apt install gcc
    ```

  - In *macOS*, **clang** is the default **C** compiler. To download and install gcc, run this command in your terminal

    ```sh
    brew install gcc
    ```

## Requirements

- For building on Linux 32-bit targets on a 64-bit platform, `gcc-multilib` must be installed:

  ```bash
  sudo apt install gcc-multilib
  ```

## Usage

Include the `kdapi.h` header file in your C project to use TYPES.

```c
#include "kdapi.h"
```

### Example

An example usage of TYPES can be found in the `test.c` file.

```c
#include <stdio.h>
#include "kdapi.h"

int main() {
    printf("TYPES Version: %s\n", KD_VERSION_STR);
    
    printf("Current OS: %s\n",
    #ifdef KD_OS_LINUX
           "Linux"
    #elif KD_OS_WINDOWS
           "Windows"
    #else
           "Unknown"
    #endif
    );
    
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

- Fork this project \[[kdapi](https://github.com/KumarjitDas/types)\]
- Create your *Feature Branch*

  ```sh
  git checkout -b feature/AmazingFeature
  ```

- Commit your *Changes*

  ```sh
  git commit -m 'Added some AmazingFeature'
  ```

- Push to the Branch

  ```sh
  git push origin feature/AmazingFeature
  ```

- Create a [pull request](https://github.com/KumarjitDas/types/pulls)

## Naming Convention

The TYPES project follows a consistent naming convention to ensure readability and maintainability. Here are the key aspects of the naming convention used:

- **Macro Names**: Macro names are written in uppercase letters with underscores separating words. They typically start with the prefix `KD_`.
  - Examples: `KD_COMPILER_GCC`, `KD_OS_LINUX`, `KD_CPU_X86_64`, `KD_VERSION_MAJOR`

- **Function-Like Macros**: Function-like macros also follow the uppercase with underscores convention and use parentheses to indicate parameters.
  - Examples: `KD_EXTERN_BEGIN`, `KD_EXTERN_END`

- **Constants**: Constants are defined using uppercase letters with underscores and often include a descriptive name or version number.
  - Examples: `KD_VERSION_STR`, `KD_VERSION_MAJOR`

- **File Names**: File names are in lowercase and use underscores to separate words.
  - Examples: `kdapi.h`, `test.c`, `setup_env.sh`

## License

This project is distributed under the **BSD 2-Clause License**. See [LICENSE](LICENSE.txt) for more information.

## Project Status

List of functionalities/features implemented so far:

- **Compiler Detection**: Macros for various compilers (Intel, GCC, LLVM, etc.).
- **OS Identification**: Macros for target operating systems (Linux, Windows, etc.).
- **CPU Architecture Detection**: Macros for target CPU architectures (x86, x64, ARM, etc.).
- **Endianness Determination**: Macros for little-endian and big-endian.
- **DLL Handling**: Import-export macros for DLLs.
- **Calling Conventions**: Macros for cdecl, stdcall, fastcall.
- **Build Configuration**: CMake configuration files for shared and static builds.
- **Example Program**: [Example](examples/example.c) demonstrating library usage.


## Acknowledgment

I appreciate these websites which helped me to make such good **README** file, and helped me to learn about project versioning and keeping **CHANGELOG**.

- [Make a README](https://www.makeareadme.com/)
- [Semantic Versioning](https://semver.org/spec/v2.0.0.html)
- [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)

## Contact

Twitter: [@kumarjitdas1999](https://twitter.com/kumarjitdas1999)

LinkedIn: [Kumarjit Das](https://www.linkedin.com/in/kumarjit-das)

E-mail: [kumarjitdas1999@gmail.com](mailto:kumarjitdas1999+github@gmail.com)

Project link: [TYPES](https://github.com/KumarjitDas/types)

## Versioning

This project uses **MAJOR**, **MINOR**, and **PATCH** version numbers for
versioning (v*MAJOR.MINOR.PATCH*).

- **MAJOR** version number indicates *new changes which may be incompatible with older versions*.
- **MINOR** version number indicates *addition of backwards-compatible features*.
- **PATCH** version number indicates *backwards-compatible bug fixes*, or minor mistake fixes like *spelling*,
  *character cases*, *punctuations*, and *indentation*.

## Changelog

The [Changelog](CHANGELOG.md) file contains all the information about the changes made to this project till now.
