/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2020 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
 #define IKI_DLLESPEC __declspec(dllimport)
#else
 #define IKI_DLLESPEC
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2020 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
 #define IKI_DLLESPEC __declspec(dllimport)
#else
 #define IKI_DLLESPEC
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
IKI_DLLESPEC extern void execute_2(char*, char *);
IKI_DLLESPEC extern void execute_3(char*, char *);
IKI_DLLESPEC extern void execute_4(char*, char *);
IKI_DLLESPEC extern void execute_5(char*, char *);
IKI_DLLESPEC extern void execute_6(char*, char *);
IKI_DLLESPEC extern void execute_7(char*, char *);
IKI_DLLESPEC extern void execute_8(char*, char *);
IKI_DLLESPEC extern void execute_9(char*, char *);
IKI_DLLESPEC extern void execute_10(char*, char *);
IKI_DLLESPEC extern void execute_11(char*, char *);
IKI_DLLESPEC extern void execute_58(char*, char *);
IKI_DLLESPEC extern void execute_59(char*, char *);
IKI_DLLESPEC extern void execute_20(char*, char *);
IKI_DLLESPEC extern void execute_158(char*, char *);
IKI_DLLESPEC extern void execute_159(char*, char *);
IKI_DLLESPEC extern void execute_160(char*, char *);
IKI_DLLESPEC extern void execute_161(char*, char *);
IKI_DLLESPEC extern void execute_162(char*, char *);
IKI_DLLESPEC extern void execute_163(char*, char *);
IKI_DLLESPEC extern void execute_164(char*, char *);
IKI_DLLESPEC extern void execute_165(char*, char *);
IKI_DLLESPEC extern void execute_166(char*, char *);
IKI_DLLESPEC extern void vlog_const_rhs_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
IKI_DLLESPEC extern void execute_120(char*, char *);
IKI_DLLESPEC extern void execute_121(char*, char *);
IKI_DLLESPEC extern void execute_122(char*, char *);
IKI_DLLESPEC extern void execute_123(char*, char *);
IKI_DLLESPEC extern void execute_124(char*, char *);
IKI_DLLESPEC extern void execute_125(char*, char *);
IKI_DLLESPEC extern void execute_126(char*, char *);
IKI_DLLESPEC extern void execute_24(char*, char *);
IKI_DLLESPEC extern void execute_63(char*, char *);
IKI_DLLESPEC extern void execute_64(char*, char *);
IKI_DLLESPEC extern void execute_65(char*, char *);
IKI_DLLESPEC extern void execute_66(char*, char *);
IKI_DLLESPEC extern void execute_62(char*, char *);
IKI_DLLESPEC extern void execute_27(char*, char *);
IKI_DLLESPEC extern void execute_68(char*, char *);
IKI_DLLESPEC extern void execute_69(char*, char *);
IKI_DLLESPEC extern void execute_70(char*, char *);
IKI_DLLESPEC extern void execute_71(char*, char *);
IKI_DLLESPEC extern void execute_72(char*, char *);
IKI_DLLESPEC extern void execute_73(char*, char *);
IKI_DLLESPEC extern void execute_74(char*, char *);
IKI_DLLESPEC extern void execute_75(char*, char *);
IKI_DLLESPEC extern void execute_67(char*, char *);
IKI_DLLESPEC extern void execute_29(char*, char *);
IKI_DLLESPEC extern void execute_30(char*, char *);
IKI_DLLESPEC extern void execute_31(char*, char *);
IKI_DLLESPEC extern void execute_32(char*, char *);
IKI_DLLESPEC extern void execute_76(char*, char *);
IKI_DLLESPEC extern void execute_77(char*, char *);
IKI_DLLESPEC extern void execute_78(char*, char *);
IKI_DLLESPEC extern void execute_79(char*, char *);
IKI_DLLESPEC extern void execute_80(char*, char *);
IKI_DLLESPEC extern void execute_81(char*, char *);
IKI_DLLESPEC extern void execute_82(char*, char *);
IKI_DLLESPEC extern void execute_83(char*, char *);
IKI_DLLESPEC extern void vlog_simple_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
IKI_DLLESPEC extern void execute_85(char*, char *);
IKI_DLLESPEC extern void execute_86(char*, char *);
IKI_DLLESPEC extern void execute_87(char*, char *);
IKI_DLLESPEC extern void execute_88(char*, char *);
IKI_DLLESPEC extern void execute_89(char*, char *);
IKI_DLLESPEC extern void execute_90(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_1(char*, char *);
IKI_DLLESPEC extern void vlog_timingcheck_execute_0(char*, char*, char*);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_2(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_3(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_4(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_5(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_6(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_7(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_8(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_9(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_10(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_11(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_12(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_13(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_14(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_15(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_16(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_17(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_18(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_19(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_20(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_21(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_22(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_23(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_24(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_25(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_26(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_27(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_28(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_29(char*, char *);
IKI_DLLESPEC extern void timing_checker_condition_m_a96e1bf7_67151b0a_30(char*, char *);
IKI_DLLESPEC extern void execute_109(char*, char *);
IKI_DLLESPEC extern void execute_114(char*, char *);
IKI_DLLESPEC extern void execute_115(char*, char *);
IKI_DLLESPEC extern void execute_116(char*, char *);
IKI_DLLESPEC extern void execute_117(char*, char *);
IKI_DLLESPEC extern void execute_127(char*, char *);
IKI_DLLESPEC extern void execute_35(char*, char *);
IKI_DLLESPEC extern void execute_130(char*, char *);
IKI_DLLESPEC extern void execute_37(char*, char *);
IKI_DLLESPEC extern void execute_131(char*, char *);
IKI_DLLESPEC extern void execute_132(char*, char *);
IKI_DLLESPEC extern void execute_133(char*, char *);
IKI_DLLESPEC extern void vlog_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
IKI_DLLESPEC extern void transaction_34(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_35(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_36(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_37(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_38(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_39(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_40(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_41(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_42(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_43(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_44(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_45(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_46(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_47(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_48(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_49(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_50(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_51(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_52(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_53(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_54(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_55(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_56(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_57(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_58(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_59(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_60(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_61(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_62(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_63(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_64(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_65(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_66(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_67(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_94(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[144] = {(funcp)execute_2, (funcp)execute_3, (funcp)execute_4, (funcp)execute_5, (funcp)execute_6, (funcp)execute_7, (funcp)execute_8, (funcp)execute_9, (funcp)execute_10, (funcp)execute_11, (funcp)execute_58, (funcp)execute_59, (funcp)execute_20, (funcp)execute_158, (funcp)execute_159, (funcp)execute_160, (funcp)execute_161, (funcp)execute_162, (funcp)execute_163, (funcp)execute_164, (funcp)execute_165, (funcp)execute_166, (funcp)vlog_const_rhs_process_execute_0_fast_no_reg_no_agg, (funcp)execute_120, (funcp)execute_121, (funcp)execute_122, (funcp)execute_123, (funcp)execute_124, (funcp)execute_125, (funcp)execute_126, (funcp)execute_24, (funcp)execute_63, (funcp)execute_64, (funcp)execute_65, (funcp)execute_66, (funcp)execute_62, (funcp)execute_27, (funcp)execute_68, (funcp)execute_69, (funcp)execute_70, (funcp)execute_71, (funcp)execute_72, (funcp)execute_73, (funcp)execute_74, (funcp)execute_75, (funcp)execute_67, (funcp)execute_29, (funcp)execute_30, (funcp)execute_31, (funcp)execute_32, (funcp)execute_76, (funcp)execute_77, (funcp)execute_78, (funcp)execute_79, (funcp)execute_80, (funcp)execute_81, (funcp)execute_82, (funcp)execute_83, (funcp)vlog_simple_process_execute_0_fast_no_reg_no_agg, (funcp)execute_85, (funcp)execute_86, (funcp)execute_87, (funcp)execute_88, (funcp)execute_89, (funcp)execute_90, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_1, (funcp)vlog_timingcheck_execute_0, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_2, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_3, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_4, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_5, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_6, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_7, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_8, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_9, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_10, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_11, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_12, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_13, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_14, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_15, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_16, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_17, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_18, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_19, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_20, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_21, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_22, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_23, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_24, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_25, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_26, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_27, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_28, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_29, (funcp)timing_checker_condition_m_a96e1bf7_67151b0a_30, (funcp)execute_109, (funcp)execute_114, (funcp)execute_115, (funcp)execute_116, (funcp)execute_117, (funcp)execute_127, (funcp)execute_35, (funcp)execute_130, (funcp)execute_37, (funcp)execute_131, (funcp)execute_132, (funcp)execute_133, (funcp)vlog_transfunc_eventcallback, (funcp)transaction_34, (funcp)transaction_35, (funcp)transaction_36, (funcp)transaction_37, (funcp)transaction_38, (funcp)transaction_39, (funcp)transaction_40, (funcp)transaction_41, (funcp)transaction_42, (funcp)transaction_43, (funcp)transaction_44, (funcp)transaction_45, (funcp)transaction_46, (funcp)transaction_47, (funcp)transaction_48, (funcp)transaction_49, (funcp)transaction_50, (funcp)transaction_51, (funcp)transaction_52, (funcp)transaction_53, (funcp)transaction_54, (funcp)transaction_55, (funcp)transaction_56, (funcp)transaction_57, (funcp)transaction_58, (funcp)transaction_59, (funcp)transaction_60, (funcp)transaction_61, (funcp)transaction_62, (funcp)transaction_63, (funcp)transaction_64, (funcp)transaction_65, (funcp)transaction_66, (funcp)transaction_67, (funcp)transaction_94};
const int NumRelocateId= 144;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/poly_mem_top_tb_time_synth/xsim.reloc",  (void **)funcTab, 144);
	iki_vhdl_file_variable_register(dp + 32944);
	iki_vhdl_file_variable_register(dp + 33000);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/poly_mem_top_tb_time_synth/xsim.reloc");
}

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/poly_mem_top_tb_time_synth/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 38816, dp + 39472, 0, 0, 0, 0, 1, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 38872, dp + 39752, 0, 0, 0, 0, 1, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 38928, dp + 39976, 0, 0, 0, 0, 1, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 38984, dp + 39864, 0, 7, 0, 7, 8, 1);
	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/poly_mem_top_tb_time_synth/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/poly_mem_top_tb_time_synth/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/poly_mem_top_tb_time_synth/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, (void*)0, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
