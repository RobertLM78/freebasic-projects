# freebasic-projects
Various projects in FreeBASIC
http://freebasic.net/


More about FreeBASIC (from the website)
Compatibility

FreeBASIC is not a "new" BASIC language. You don't need to learn much new if you are familiar with any Microsoft-BASIC variant. You can use either "-lang qb" for compatibility, or (default) "-lang fb" for some of the new features, but it also brings some restrictions and some similarity with the "C" programming language. FreeBASIC is case-insensitive; explicit "main" procedure is not required; most of the graphic and console statements and procedures found in Microsoft QuickBASIC are implemented, et cetera. Only with "-lang qb": scalar variables don't need to be dimensioned and suffixes can be used; line numbers are supported; On Error and Gosub supported.
Clean syntax

Only a small number of keywords have been added. All procedures are implemented as libraries, so for the most part, there are no new intrinsic routines, and therefore there is a low chance of having name duplication with old code.
Thin bindings (header files) to existing C libraries and APIs

No wrappers or helpers are necessary, just a ported header file, making usage of external C libraries very easy. The official distribution comes with several bindings to existing C libraries already, see External Libraries for a complete up-to-date list.
Multi-platform

FreeBASIC currently runs on 64/32-bit Windows, Linux, and DOS (a 16-bit DOS is good enough, although FreeBASIC itself and compiler output are 32-bit) and also creates applications for the Xbox console. More platforms to come. The runtime library was written with portability in mind. All third-party tools used exist on most operating systems already as they are from the GNU binutils. The compiler is written in 100% FreeBASIC code (that is, FreeBASIC compiles itself.), which makes it simple to be bootstrapped as it doesn't depend on non-portable tools.
Unicode support

Besides ASCII files with Unicode escape sequences (\u), FreeBASIC can parse UTF-8, UTF-16LE, UTF-16BE, UTF-32LE and UTF-32BE source (.bas) or header (.bi) files, they can be freely mixed with other sources/headers in the same project (also with other ASCII files). Literal strings can be typed in the original non-Latin alphabet, just use a text-editor that supports some of the Unicode formats listed above. The Wstring type holds wide-characters, all string procedures (like Left, Trim, etc) will work with wide-strings too. Open was extended to support UTF-8, UTF-16LE and UTF-32LE files with the Encoding specifier. Input # and Line Input #, as well as Print # and Write # can be used normally, and any conversion between Unicode to ASCII is done automatically if necessary. Print also supports Unicode output (see Requirements).
A large number of built-in data types

    Integer: Byte, Ubyte, Short, Ushort, Integer, UInteger, Long, ULong, Longint, Ulongint
    Floating-point: Single (32-bit), Double (64-bit)
    String: fixed, variable-length or null-terminated (Zstring), up to 2GB long Unicode strings (Wstring), like Zstring, but with support for wide characters. Use the Windows Unicode API procedures directly, etc.

User-defined types (UDTs)

Unlimited nesting. BASIC's Type statement is supported, along with the new Union statement (including anonymous nested unions). Array fields utilizing up to eight dimensions can be used. Procedure pointer fields. Bit fields. Enumerations (enums) Easily declare a list of constants with sequential values with Enum. Arrays Fixed- and variable- length arrays are supported, up to 2 GB in size. Up to eight dimensions, including arrays with unknown dimensions. Any lower and upper boundaries. Element data can be preserved during a re-size of variable-length arrays with Redim using the new Preserve specifier. Pointers to any of the data types listed above, including string characters, array elements and UDT's. Uses the same syntax as C. Unlimited indirection levels (e.g., pointer to pointer to ...). Procedure pointers. Indexing []'s (including string indexing). Type casting. Variable, object and array initialization For static, module-level or local variables, arrays and UDT's.
Default procedure parameter values

For numeric, string and UDT parameter types. Procedure overloading Including procedures with default parameter values.
In-line assembly Intel syntax

Reference variables directly by name; no "trick code" needed.
Traditional preprocessor support

Same syntax as in C. Single-line macros supported with the #Define command, including parameters. Multi-line macros supported with the #Macro command. Type aliases Supporting forward referencing as in C, including UDT and procedure pointer types. C-like escape sequences for string literals Same as in C (except numbers are interpreted as decimal, not octal).
Debugging support

Full debugging support with GDB (the GNU debugger) or Insight (a GDB GUI frontend). Array bounds checking (only enabled by the -exx command-line option). Null pointer checking (same as above).
Create OBJ's, LIB's, DLL's, and console or GUI EXE's

You are in no way locked to an IDE or editor of any kind. You can create static and dynamic/shared libraries adding just one command-line option (-lib or -dylib/-dll). As a 32-bit application FreeBASIC can compile source code files up to 2 GB in size. The number of symbols (variables, constants, et cetera) is only limited by the total memory available during compile time. (You can, for example, include OpenGL, GTK/SDL, BASS, simultaneously in your source code.)
Optimized code generation

While FreeBASIC is not an optimizing compiler, it does many kinds of general optimizations to generate the fastest possible code on x86 CPU's, not losing to other BASIC alternatives, including the commercial ones. Completely free All third-party tools are also free. No piece of abandoned or copyrighted software is used (except GoRC on Win32). The assembler, linker, archiver, and other command-line applications come from the GNU binutils programming tools. 
