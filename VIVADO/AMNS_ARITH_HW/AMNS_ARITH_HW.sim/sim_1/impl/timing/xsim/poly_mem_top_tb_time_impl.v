// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Sun Mar 21 22:36:08 2021
// Host        : LAPTOP-6Q7QM5AJ running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               C:/Users/louis/Desktop/AMNS_IMPLEMENTATION/VIVADO/AMNS_ARITH_HW/AMNS_ARITH_HW.sim/sim_1/impl/timing/xsim/poly_mem_top_tb_time_impl.v
// Design      : poly_mem_top
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module poly_mem
   (data_o_OBUF,
    clock_i_IBUF_BUFG,
    sel_i_IBUF,
    reset_i_IBUF,
    start_i_IBUF);
  output [0:0]data_o_OBUF;
  input clock_i_IBUF_BUFG;
  input [0:0]sel_i_IBUF;
  input reset_i_IBUF;
  input start_i_IBUF;

  wire clock_i_IBUF_BUFG;
  wire [7:7]\data_1_o[3] ;
  wire [0:0]data_o_OBUF;
  wire \mem_array_s[5][3][7]_i_1_n_0 ;
  wire reset_i_IBUF;
  wire [0:0]sel_i_IBUF;
  wire start_i_IBUF;

  (* \PinAttr:I0:HOLD_DETOUR  = "181" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \data_o_OBUF[7]_inst_i_1 
       (.I0(\data_1_o[3] ),
        .I1(sel_i_IBUF),
        .O(data_o_OBUF));
  (* \PinAttr:I1:HOLD_DETOUR  = "181" *) 
  LUT3 #(
    .INIT(8'hA8)) 
    \mem_array_s[5][3][7]_i_1 
       (.I0(reset_i_IBUF),
        .I1(\data_1_o[3] ),
        .I2(start_i_IBUF),
        .O(\mem_array_s[5][3][7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \mem_array_s_reg[5][3][7] 
       (.C(clock_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\mem_array_s[5][3][7]_i_1_n_0 ),
        .Q(\data_1_o[3] ),
        .R(1'b0));
endmodule

(* ECO_CHECKSUM = "9f86e8c" *) 
(* NotValidForBitStream *)
module poly_mem_top
   (clock_i,
    reset_i,
    start_i,
    sel_i,
    data_o);
  input clock_i;
  input reset_i;
  input start_i;
  input [7:0]sel_i;
  output [7:0]data_o;

  wire clock_i;
  wire clock_i_IBUF;
  wire clock_i_IBUF_BUFG;
  wire [7:0]data_o;
  wire [0:0]data_o_OBUF;
  wire reset_i;
  wire reset_i_IBUF;
  wire [7:0]sel_i;
  wire [3:3]sel_i_IBUF;
  wire start_i;
  wire start_i_IBUF;

initial begin
 $sdf_annotate("poly_mem_top_tb_time_impl.sdf",,,,"tool_control");
end
  poly_mem POLY_MEM_INST
       (.clock_i_IBUF_BUFG(clock_i_IBUF_BUFG),
        .data_o_OBUF(data_o_OBUF),
        .reset_i_IBUF(reset_i_IBUF),
        .sel_i_IBUF(sel_i_IBUF),
        .start_i_IBUF(start_i_IBUF));
  BUFG clock_i_IBUF_BUFG_inst
       (.I(clock_i_IBUF),
        .O(clock_i_IBUF_BUFG));
  IBUF clock_i_IBUF_inst
       (.I(clock_i),
        .O(clock_i_IBUF));
  OBUF \data_o_OBUF[0]_inst 
       (.I(data_o_OBUF),
        .O(data_o[0]));
  OBUF \data_o_OBUF[1]_inst 
       (.I(data_o_OBUF),
        .O(data_o[1]));
  OBUF \data_o_OBUF[2]_inst 
       (.I(data_o_OBUF),
        .O(data_o[2]));
  OBUF \data_o_OBUF[3]_inst 
       (.I(data_o_OBUF),
        .O(data_o[3]));
  OBUF \data_o_OBUF[4]_inst 
       (.I(data_o_OBUF),
        .O(data_o[4]));
  OBUF \data_o_OBUF[5]_inst 
       (.I(data_o_OBUF),
        .O(data_o[5]));
  OBUF \data_o_OBUF[6]_inst 
       (.I(data_o_OBUF),
        .O(data_o[6]));
  OBUF \data_o_OBUF[7]_inst 
       (.I(data_o_OBUF),
        .O(data_o[7]));
  IBUF reset_i_IBUF_inst
       (.I(reset_i),
        .O(reset_i_IBUF));
  IBUF \sel_i_IBUF[3]_inst 
       (.I(sel_i[3]),
        .O(sel_i_IBUF));
  IBUF start_i_IBUF_inst
       (.I(start_i),
        .O(start_i_IBUF));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
