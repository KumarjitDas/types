/**
 * @file example.c
 * @author Kumarjit Das
 * @date 2024-07-01
 * @brief TYPES library main example source file.
 */
/**
 * LICENSE:
 * 
 * Copyright (c) 2024, Kumarjit Das
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 * 
 * - Redistributions of source code must retain the above copyright notice, this
 *   list of conditions and the following disclaimer.
 * 
 * - Redistributions in binary form must reproduce the above copyright notice,
 *   this list of conditions and the following disclaimer in the documentation
 *   and/or other materials provided with the distribution.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */


#include <stdio.h>
#include <stdint.h>
#include "types.h"


int main(int argc, char **argv)
{
  bool val_bool;
  i8 val_i8;
  i16 val_i16;
  i32 val_i32;
  imin val_imin;
  imax val_imax;
  u8 val_u8;
  u16 val_u16;
  u32 val_u32;
  umin val_umin;
  umax val_umax;

  #if defined TYPES_64BIT_INTEGER
  i64 val_i64;
  u64 val_u64;
  #endif  /* TYPES_64BIT_INTEGER */

  usize val_usize;
  byte val_byte;
  charcode val_charcode;
  f32 val_f32;
  f64 val_f64;
  fmin val_fmin;
  fmax val_fmax;
  any val_any;
  void *val_ptr;

  (void) argc;
  (void) argv;

  (void) printf("TYPES example :: begin\n");

  (void) printf("\nSizes of types:\n\n");

  (void) printf("SZ_BOOL = %d,\n", SZ_BOOL);
  (void) printf("SZ_I8 = %d,\n", SZ_I8);
  (void) printf("SZ_I16 = %d,\n", SZ_I16);
  (void) printf("SZ_I32 = %d,\n", SZ_I32);
  (void) printf("SZ_IMIN = %d,\n", SZ_IMIN);
  (void) printf("SZ_IMAX = %d,\n", SZ_IMAX);
  (void) printf("SZ_U8 = %d,\n", SZ_U8);
  (void) printf("SZ_U16 = %d,\n", SZ_U16);
  (void) printf("SZ_U32 = %d,\n", SZ_U32);
  (void) printf("SZ_UMIN = %d,\n", SZ_UMIN);
  (void) printf("SZ_UMAX = %d,\n", SZ_UMAX);

  #if defined TYPES_64BIT_INTEGER
  (void) printf("SZ_I64 = %d,\n", SZ_I64);
  (void) printf("SZ_U64 = %d,\n", SZ_U64);
  #endif  /* TYPES_64BIT_INTEGER */

  (void) printf("SZ_USIZE = %d,\n", SZ_USIZE);
  (void) printf("SZ_BYTE = %d,\n", SZ_BYTE);
  (void) printf("SZ_CHARCODE = %d,\n", SZ_CHARCODE);
  (void) printf("SZ_F32 = %d,\n", SZ_F32);
  (void) printf("SZ_F64 = %d,\n", SZ_F64);
  (void) printf("SZ_FMIN = %d,\n", SZ_FMIN);
  (void) printf("SZ_FMAX = %d,\n", SZ_FMAX);
  (void) printf("SZ_ANY = %d,\n", SZ_ANY);
  (void) printf("SZ_PTR = %d,\n", SZ_PTR);

  (void) printf("\nValues of types:\n\n");

  val_bool = true;
  val_i8 = MAX_I8;
  val_i16 = MAX_I16;
  val_i32 = MAX_I32;
  val_imin = MAX_IMIN;
  val_imax = MAX_IMAX;
  val_u8 = MAX_U8;
  val_u16 = MAX_U16;
  val_u32 = MAX_U32;
  val_umin = MAX_UMIN;
  val_umax = MAX_UMAX;

  #if defined TYPES_64BIT_INTEGER
  val_i64 = MAX_I64;
  val_u64 = MAX_U64;
  #endif  /* TYPES_64BIT_INTEGER */

  val_usize = MAX_USIZE;
  val_byte = MAX_BYTE;
  val_charcode = MAX_CHARCODE;
  val_f32 = MAX_F32;
  val_f64 = MAX_F64;
  val_fmin = MAX_FMIN;
  val_fmax = MAX_FMAX;
  val_any.val_umax = MAX_ANY;
  val_ptr = MAX_PTR;

  (void) printf("val_bool = %s,\n", val_bool ? "TRUE" : "FALSE");
  (void) printf("val_i8 = %d,\n", (i32) val_i8);
  (void) printf("val_i16 = %hd,\n", val_i16);
  (void) printf("val_i32 = %d,\n", val_i32);
  (void) printf("val_imin = %d,\n", (i32) val_imin);

  (void) printf(
    "val_imax = "
    #ifdef TYPES_64BIT_INTEGER
    "%ld"
    #else
    "%d"
    #endif  /* TYPES_64BIT_INTEGER */
    ",\n", val_imax);

  (void) printf("val_u8 = %u,\n", (u32) val_u8);
  (void) printf("val_u16 = %hu,\n", val_u16);
  (void) printf("val_u32 = %u,\n", val_u32);

  #if defined TYPES_64BIT_INTEGER
  (void) printf("val_i64 = %ld,\n", val_i64);
  (void) printf("val_u64 = %lu,\n", val_u64);
  #endif  /* TYPES_64BIT_INTEGER */

  (void) printf("val_umin = %u,\n", (u32) val_umin);

  (void) printf(
    "val_umax = "
    #ifdef TYPES_64BIT_INTEGER
    "%lu"
    #else
    "%u"
    #endif  /* TYPES_64BIT_INTEGER */
    ",\n", val_umax);

  (void) printf(
    "val_usize = "
    #ifdef TYPES_64BIT_INTEGER
    "%lu"
    #else
    "%u"
    #endif  /* TYPES_64BIT_INTEGER */
    ",\n", val_usize);

  (void) printf("val_byte = %u,\n", (u32) val_byte);
  (void) printf("val_charcode = %u,\n", val_charcode);
  (void) printf("val_f32 = %f,\n", (double) val_f32);
  (void) printf("val_f64 = %f,\n", val_f64);
  (void) printf("val_fmin = %f,\n", (double) val_fmin);
  (void) printf("val_fmax = %f,\n", val_fmax);

  (void) printf("val_any: {\n");
  (void) printf(
    "\tval = "
    #ifdef TYPES_64BIT_INTEGER
    "%ld"
    #else
    "%d"
    #endif  /* TYPES_64BIT_INTEGER */
    ",\n", val_any.val);
  (void) printf("\tptr = %p\n", val_any.ptr);

  (void) printf(
    "\tslice = [%d, %d, %d, %d"
    #if defined TYPES_64BIT_INTEGER
    ", %d, %d, %d, %d"
    #endif  /* TYPES_64BIT_INTEGER */
    "]\n",
    val_any.slice[0], val_any.slice[1], val_any.slice[2], val_any.slice[3]
    #if defined TYPES_64BIT_INTEGER
    , val_any.slice[4], val_any.slice[5], val_any.slice[6], val_any.slice[7]
    #endif  /* TYPES_64BIT_INTEGER */
  );

  (void) printf("\tval_bool = %s\n", val_any.val_bool ? "TRUE" : "FALSE");
  (void) printf("\tval_i8 = %d\n", (i32) val_any.val_i8);
  (void) printf("\tval_i16 = %hd\n", val_any.val_i16);
  (void) printf("\tval_i32 = %d\n", val_any.val_i32);
  (void) printf("\tval_imin = %d\n", (i32) val_any.val_imin);

  (void) printf(
    "\tval_imax = "
    #ifdef TYPES_64BIT_INTEGER
    "%ld"
    #else
    "%d"
    #endif  /* TYPES_64BIT_INTEGER */
    ",\n", val_any.val_imax);

  (void) printf("\tval_u8 = %u\n", (u32) val_any.val_u8);
  (void) printf("\tval_u16 = %hu\n", val_any.val_u16);
  (void) printf("\tval_u32 = %u\n", val_any.val_u32);
  (void) printf("\tval_umin = %u\n", (u32) val_any.val_umin);

  (void) printf(
    "\tval_umax = "
    #ifdef TYPES_64BIT_INTEGER
    "%lu"
    #else
    "%u"
    #endif  /* TYPES_64BIT_INTEGER */
    ",\n", val_any.val_umax);

  (void) printf("\tval_byte = %u\n", (u32) val_any.val_byte);
  (void) printf("\tval_charcode = %u\n", val_any.val_charcode);
  (void) printf("\tval_f32 = %f\n", (double) val_any.val_f32);
  (void) printf("\tval_f64 = %f\n", val_any.val_f64);
  (void) printf("\tval_fmin = %f\n", (double) val_any.val_fmin);
  (void) printf("\tval_fmax = %f\n", val_any.val_fmax);
  (void) printf("\tptr_bool = %p\n", (void *) val_any.ptr_bool);
  (void) printf("\tptr_i8 = %p\n", (void *) val_any.ptr_i8);
  (void) printf("\tptr_i16 = %p\n", (void *) val_any.ptr_i16);
  (void) printf("\tptr_i32 = %p\n", (void *) val_any.ptr_i32);
  (void) printf("\tptr_imin = %p\n", (void *) val_any.ptr_imin);
  (void) printf("\tptr_imax = %p\n", (void *) val_any.ptr_imax);
  (void) printf("\tptr_u8 = %p\n", (void *) val_any.ptr_u8);
  (void) printf("\tptr_u16 = %p\n", (void *) val_any.ptr_u16);
  (void) printf("\tptr_u32 = %p\n", (void *) val_any.ptr_u32);
  (void) printf("\tptr_umin = %p\n", (void *) val_any.ptr_umin);
  (void) printf("\tptr_umax = %p\n", (void *) val_any.ptr_umax);
  (void) printf("\tptr_byte = %p\n", (void *) val_any.ptr_byte);
  (void) printf("\tptr_charcode = %p\n", (void *) val_any.ptr_charcode);
  (void) printf("\tptr_f32 = %p\n", (void *) val_any.ptr_f32);
  (void) printf("\tptr_f64 = %p\n", (void *) val_any.ptr_f64);
  (void) printf("\tptr_fmin = %p\n", (void *) val_any.ptr_fmin);
  (void) printf("\tptr_fmax = %p\n", (void *) val_any.ptr_fmax);

  #ifdef TYPES_64BIT_INTEGER
  (void) printf("\tval_i64 = %ld\n", val_any.val_i64);
  (void) printf("\tval_u64 = %lu\n", val_any.val_u64);
  (void) printf("\tptr_i64 = %p\n", (void *) val_any.ptr_i64);
  (void) printf("\tptr_u64 = %p\n", (void *) val_any.ptr_u64);
  #endif  /* TYPES_64BIT_INTEGER */

  (void) printf("}\n");

  (void) printf("val_ptr = %p,\n", val_ptr);

  (void) printf("\nTYPES example :: end\n");

  return 0;
}
