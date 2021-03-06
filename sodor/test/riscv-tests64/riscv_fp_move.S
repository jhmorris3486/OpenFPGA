#*****************************************************************************
# riscv_fp_move.S
#-----------------------------------------------------------------------------
#
# This test verifies that mxtf.[s,d], mftx.[s,d], mtfsr, mffsr,
# and fsgnj[x|n].[s|d] work properly.
#

#include "test_macros.h"

TEST_RISCV
TEST_CODEBEGIN

li t0, 1
mtfsr t0

TEST_CASE(2, t1, 1, li t0, 0x1234; mtfsr t1, t0)
TEST_CASE(3, t0, 0x34, mffsr t0)
TEST_CASE(4, t0, 0x34, mffsr t0)

TEST_CASE(5, a0, 0xFFFFFFFFBF812345, li a1, 0xFFFFFFFFBF812345; mxtf.s f0, a1; mftx.s a0, f0)
TEST_CASE(6, a0, 0x3FF02468A0000000, li a1, 0x3FF02468A0000000; mxtf.d f1, a1; mftx.d a0, f1)

TEST_CASE(7, a0, 0xFFFFFFFFBF812345, li a1, 0xFFFFFFFFBF812345; mxtf.s f0, a1; fsgnj.s f1, f0, f0; mftx.s a0, f1)
TEST_CASE(8, a0, 0x000000004BA98765, li a1, 0xFFFFFFFFCBA98765; mxtf.s f0, a1; fsgnjx.s f1, f0, f0; mftx.s a0, f1)
TEST_CASE(9, a0, 0x000000005EADBEEF, li a1, 0xFFFFFFFFDEADBEEF; mxtf.s f0, a1; fsgnjn.s f1, f0, f0; mftx.s a0, f1)
TEST_CASE(10, a0, 0xBFF02468A0001000, li a1, 0x3FF02468A0001000; li a2, -1; mxtf.d f1, a1; mxtf.d f2, a2; fsgnj.d f0, f1, f2; mftx.d a0, f0)

TEST_PASSFAIL
TEST_CODEEND

        TEST_DATABEGIN
        TEST_DATAEND
