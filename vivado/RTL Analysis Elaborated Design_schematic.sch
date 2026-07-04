# File saved with Nlview 7.8.0 2024-04-26 e1825d835c VDI=44 GEI=38 GUI=JA:21.0 threadsafe
# 
# non-default properties - (restore without -noprops)
property -colorscheme classic
property attrcolor #000000
property attrfontsize 8
property autobundle 1
property backgroundcolor #ffffff
property boxcolor0 #000000
property boxcolor1 #000000
property boxcolor2 #000000
property boxinstcolor #000000
property boxpincolor #000000
property buscolor #008000
property closeenough 5
property createnetattrdsp 2048
property decorate 1
property elidetext 40
property fillcolor1 #ffffcc
property fillcolor2 #dfebf8
property fillcolor3 #f0f0f0
property gatecellname 2
property instattrmax 30
property instdrag 15
property instorder 1
property marksize 12
property maxfontsize 15
property maxzoom 6.25
property netcolor #19b400
property objecthighlight0 #ff00ff
property objecthighlight1 #ffff00
property objecthighlight2 #00ff00
property objecthighlight3 #0095ff
property objecthighlight4 #8000ff
property objecthighlight5 #ffc800
property objecthighlight7 #00ffff
property objecthighlight8 #ff00ff
property objecthighlight9 #ccccff
property objecthighlight10 #0ead00
property objecthighlight11 #cefc00
property objecthighlight12 #9e2dbe
property objecthighlight13 #ba6a29
property objecthighlight14 #fc0188
property objecthighlight15 #02f990
property objecthighlight16 #f1b0fb
property objecthighlight17 #fec004
property objecthighlight18 #149bff
property objecthighlight19 #0000ff
property overlaycolor #19b400
property pbuscolor #000000
property pbusnamecolor #000000
property pinattrmax 20
property pinorder 2
property pinpermute 0
property portcolor #000000
property portnamecolor #000000
property ripindexfontsize 4
property rippercolor #000000
property rubberbandcolor #000000
property rubberbandfontsize 15
property selectattr 0
property selectionappearance 2
property selectioncolor #0000ff
property sheetheight 44
property sheetwidth 68
property showmarks 1
property shownetname 0
property showpagenumbers 1
property showripindex 1
property timelimit 1
#
module new rv32i_core work:rv32i_core:NOFILE -nosplit
load symbol alu work:alu:NOFILE HIERBOX pinBus opcode input.left [3:0] pinBus operand1 input.left [31:0] pinBus operand2 input.left [31:0] pinBus result output.right [31:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol alu_control_unit work:alu_control_unit:NOFILE HIERBOX pin bit30 input.left pinBus alu_control output.right [3:0] pinBus alu_op input.left [2:0] pinBus func3 input.left [2:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol control_unit work:control_unit:NOFILE HIERBOX pin AluSrc1 output.right pin AluSrc2 output.right pin Branch output.right pin Jump output.right pin MemRead output.right pin MemToReg output.right pin MemWrite output.right pin PcSrc output.right pin RegWrite output.right pin lui output.right pinBus AluOp output.right [2:0] pinBus opcode input.left [6:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol data_memory work:data_memory:NOFILE HIERBOX pin clk input.left pin mem_read input.left pin mem_write input.left pinBus address input.left [31:0] pinBus read_data output.right [31:0] pinBus write_data input.left [31:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol immediate_generator work:immediate_generator:NOFILE HIERBOX pinBus immediate output.right [31:0] pinBus instruction input.left [31:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol instruction_memory work BOX pinBus instruction output.right [31:0] pinBus read_address input.left [31:0] fillcolor 1
load symbol program_counter work:program_counter:NOFILE HIERBOX pin clk input.left pin reset input.left pinBus next_pc input.left [31:0] pinBus pc output.right [31:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol RTL_AND work AND pin I0 input pin I1 input pin O output fillcolor 1
load symbol RTL_MUX work MUX pin S input.bot pinBus I0 input.left [31:0] pinBus I1 input.left [31:0] pinBus O output.right [31:0] fillcolor 1
load symbol RTL_OR0 work OR pin I0 input pin I1 input pin O output fillcolor 1
load symbol register_file work:register_file:NOFILE HIERBOX pin clk input.left pin reg_write input.left pinBus read_data1 output.right [31:0] pinBus read_data2 output.right [31:0] pinBus read_reg1 input.left [4:0] pinBus read_reg2 input.left [4:0] pinBus write_data input.left [31:0] pinBus write_reg_addr input.left [4:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol RTL_ADD work RTL(+) pinBus I0 input.left [31:0] pinBus I1 input.left [31:0] pinBus O output.right [31:0] fillcolor 1
load port clk input -pg 1 -lvl 0 -x 0 -y 430
load port reset input -pg 1 -lvl 0 -x 0 -y 650
load inst ALU alu work:alu:NOFILE -autohide -attr @cell(#000000) alu -pinBusAttr opcode @name opcode[3:0] -pinBusAttr operand1 @name operand1[31:0] -pinBusAttr operand2 @name operand2[31:0] -pinBusAttr result @name result[31:0] -pg 1 -lvl 12 -x 3840 -y 160
load inst ALU_CU alu_control_unit work:alu_control_unit:NOFILE -autohide -attr @cell(#000000) alu_control_unit -pinBusAttr alu_control @name alu_control[3:0] -pinBusAttr alu_op @name alu_op[2:0] -pinBusAttr func3 @name func3[2:0] -pg 1 -lvl 11 -x 3540 -y 50
load inst CU control_unit work:control_unit:NOFILE -autohide -attr @cell(#000000) control_unit -pinBusAttr AluOp @name AluOp[2:0] -pinBusAttr opcode @name opcode[6:0] -pg 1 -lvl 1 -x 120 -y 140
load inst DataMem data_memory work:data_memory:NOFILE -autohide -attr @cell(#000000) data_memory -pinBusAttr address @name address[31:0] -pinBusAttr read_data @name read_data[31:0] -pinBusAttr write_data @name write_data[31:0] -pg 1 -lvl 2 -x 560 -y 400
load inst ImmGen immediate_generator work:immediate_generator:NOFILE -autohide -attr @cell(#000000) immediate_generator -pinBusAttr immediate @name immediate[31:0] -pinBusAttr instruction @name instruction[31:0] -pg 1 -lvl 3 -x 950 -y 440
load inst InstructionMem instruction_memory work -attr @cell(#000000) instruction_memory -pinBusAttr instruction @name instruction[31:0] -pinBusAttr read_address @name read_address[31:0] -pg 1 -lvl 10 -x 3090 -y 470
load inst PC program_counter work:program_counter:NOFILE -autohide -attr @cell(#000000) program_counter -pinBusAttr next_pc @name next_pc[31:0] -pinBusAttr pc @name pc[31:0] -pg 1 -lvl 9 -x 2920 -y 500
load inst RTL_AND RTL_AND work -attr @cell(#000000) RTL_AND -pg 1 -lvl 5 -x 1640 -y 580
load inst RTL_MUX RTL_MUX work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[31:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[31:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[31:0] -pg 1 -lvl 4 -x 1350 -y 270
load inst RTL_OR RTL_OR0 work -attr @cell(#000000) RTL_OR -pg 1 -lvl 6 -x 1980 -y 580
load inst RegFile register_file work:register_file:NOFILE -autohide -attr @cell(#000000) register_file -pinBusAttr read_data1 @name read_data1[31:0] -pinBusAttr read_data2 @name read_data2[31:0] -pinBusAttr read_reg1 @name read_reg1[4:0] -pinBusAttr read_reg2 @name read_reg2[4:0] -pinBusAttr write_data @name write_data[31:0] -pinBusAttr write_reg_addr @name write_reg_addr[4:0] -pg 1 -lvl 6 -x 1980 -y 240
load inst mem_reg_mux_i RTL_MUX work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[31:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[31:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[31:0] -pg 1 -lvl 3 -x 950 -y 270
load inst mux1_i RTL_MUX work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[31:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[31:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[31:0] -pg 1 -lvl 7 -x 2490 -y 300
load inst mux2_i RTL_MUX work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[31:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[31:0] -pinBusAttr I1 @attr V=X\"00000004\",\ S=default -pinBusAttr O @name O[31:0] -pg 1 -lvl 7 -x 2490 -y 560
load inst next_pc_i RTL_ADD work -attr @cell(#000000) RTL_ADD -pinBusAttr I0 @name I0[31:0] -pinBusAttr I1 @name I1[31:0] -pinBusAttr O @name O[31:0] -pg 1 -lvl 8 -x 2690 -y 530
load inst operand1_i RTL_MUX work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[31:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[31:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[31:0] -pg 1 -lvl 11 -x 3540 -y 190
load inst operand2_i RTL_MUX work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[31:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[31:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[31:0] -pg 1 -lvl 11 -x 3540 -y 430
load inst pc_plus_4_i RTL_ADD work -attr @cell(#000000) RTL_ADD -pinBusAttr I0 @name I0[31:0] -pinBusAttr I1 @name I1[31:0] -pinBusAttr I1 @attr V=X\"00000004\" -pinBusAttr O @name O[31:0] -pg 1 -lvl 4 -x 1350 -y 420
load inst write_data_i RTL_MUX work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[31:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[31:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[31:0] -pg 1 -lvl 5 -x 1640 -y 410
load net <const0> -ground -pin mux2_i I1[31] -pin mux2_i I1[30] -pin mux2_i I1[29] -pin mux2_i I1[28] -pin mux2_i I1[27] -pin mux2_i I1[26] -pin mux2_i I1[25] -pin mux2_i I1[24] -pin mux2_i I1[23] -pin mux2_i I1[22] -pin mux2_i I1[21] -pin mux2_i I1[20] -pin mux2_i I1[19] -pin mux2_i I1[18] -pin mux2_i I1[17] -pin mux2_i I1[16] -pin mux2_i I1[15] -pin mux2_i I1[14] -pin mux2_i I1[13] -pin mux2_i I1[12] -pin mux2_i I1[11] -pin mux2_i I1[10] -pin mux2_i I1[9] -pin mux2_i I1[8] -pin mux2_i I1[7] -pin mux2_i I1[6] -pin mux2_i I1[5] -pin mux2_i I1[4] -pin mux2_i I1[3] -pin mux2_i I1[1] -pin mux2_i I1[0] -pin pc_plus_4_i I1[31] -pin pc_plus_4_i I1[30] -pin pc_plus_4_i I1[29] -pin pc_plus_4_i I1[28] -pin pc_plus_4_i I1[27] -pin pc_plus_4_i I1[26] -pin pc_plus_4_i I1[25] -pin pc_plus_4_i I1[24] -pin pc_plus_4_i I1[23] -pin pc_plus_4_i I1[22] -pin pc_plus_4_i I1[21] -pin pc_plus_4_i I1[20] -pin pc_plus_4_i I1[19] -pin pc_plus_4_i I1[18] -pin pc_plus_4_i I1[17] -pin pc_plus_4_i I1[16] -pin pc_plus_4_i I1[15] -pin pc_plus_4_i I1[14] -pin pc_plus_4_i I1[13] -pin pc_plus_4_i I1[12] -pin pc_plus_4_i I1[11] -pin pc_plus_4_i I1[10] -pin pc_plus_4_i I1[9] -pin pc_plus_4_i I1[8] -pin pc_plus_4_i I1[7] -pin pc_plus_4_i I1[6] -pin pc_plus_4_i I1[5] -pin pc_plus_4_i I1[4] -pin pc_plus_4_i I1[3] -pin pc_plus_4_i I1[1] -pin pc_plus_4_i I1[0]
load net <const1> -power -attr @rip 2 -pin mux2_i I1[2] -pin pc_plus_4_i I1[2]
load net RTL_AND_n_0 -pin RTL_AND O -pin RTL_OR I1
netloc RTL_AND_n_0 1 5 1 1760 580n
load net RTL_MUX_n_0 -attr @rip O[31] -pin RTL_MUX O[31] -pin write_data_i I1[31]
load net RTL_MUX_n_1 -attr @rip O[30] -pin RTL_MUX O[30] -pin write_data_i I1[30]
load net RTL_MUX_n_10 -attr @rip O[21] -pin RTL_MUX O[21] -pin write_data_i I1[21]
load net RTL_MUX_n_11 -attr @rip O[20] -pin RTL_MUX O[20] -pin write_data_i I1[20]
load net RTL_MUX_n_12 -attr @rip O[19] -pin RTL_MUX O[19] -pin write_data_i I1[19]
load net RTL_MUX_n_13 -attr @rip O[18] -pin RTL_MUX O[18] -pin write_data_i I1[18]
load net RTL_MUX_n_14 -attr @rip O[17] -pin RTL_MUX O[17] -pin write_data_i I1[17]
load net RTL_MUX_n_15 -attr @rip O[16] -pin RTL_MUX O[16] -pin write_data_i I1[16]
load net RTL_MUX_n_16 -attr @rip O[15] -pin RTL_MUX O[15] -pin write_data_i I1[15]
load net RTL_MUX_n_17 -attr @rip O[14] -pin RTL_MUX O[14] -pin write_data_i I1[14]
load net RTL_MUX_n_18 -attr @rip O[13] -pin RTL_MUX O[13] -pin write_data_i I1[13]
load net RTL_MUX_n_19 -attr @rip O[12] -pin RTL_MUX O[12] -pin write_data_i I1[12]
load net RTL_MUX_n_2 -attr @rip O[29] -pin RTL_MUX O[29] -pin write_data_i I1[29]
load net RTL_MUX_n_20 -attr @rip O[11] -pin RTL_MUX O[11] -pin write_data_i I1[11]
load net RTL_MUX_n_21 -attr @rip O[10] -pin RTL_MUX O[10] -pin write_data_i I1[10]
load net RTL_MUX_n_22 -attr @rip O[9] -pin RTL_MUX O[9] -pin write_data_i I1[9]
load net RTL_MUX_n_23 -attr @rip O[8] -pin RTL_MUX O[8] -pin write_data_i I1[8]
load net RTL_MUX_n_24 -attr @rip O[7] -pin RTL_MUX O[7] -pin write_data_i I1[7]
load net RTL_MUX_n_25 -attr @rip O[6] -pin RTL_MUX O[6] -pin write_data_i I1[6]
load net RTL_MUX_n_26 -attr @rip O[5] -pin RTL_MUX O[5] -pin write_data_i I1[5]
load net RTL_MUX_n_27 -attr @rip O[4] -pin RTL_MUX O[4] -pin write_data_i I1[4]
load net RTL_MUX_n_28 -attr @rip O[3] -pin RTL_MUX O[3] -pin write_data_i I1[3]
load net RTL_MUX_n_29 -attr @rip O[2] -pin RTL_MUX O[2] -pin write_data_i I1[2]
load net RTL_MUX_n_3 -attr @rip O[28] -pin RTL_MUX O[28] -pin write_data_i I1[28]
load net RTL_MUX_n_30 -attr @rip O[1] -pin RTL_MUX O[1] -pin write_data_i I1[1]
load net RTL_MUX_n_31 -attr @rip O[0] -pin RTL_MUX O[0] -pin write_data_i I1[0]
load net RTL_MUX_n_4 -attr @rip O[27] -pin RTL_MUX O[27] -pin write_data_i I1[27]
load net RTL_MUX_n_5 -attr @rip O[26] -pin RTL_MUX O[26] -pin write_data_i I1[26]
load net RTL_MUX_n_6 -attr @rip O[25] -pin RTL_MUX O[25] -pin write_data_i I1[25]
load net RTL_MUX_n_7 -attr @rip O[24] -pin RTL_MUX O[24] -pin write_data_i I1[24]
load net RTL_MUX_n_8 -attr @rip O[23] -pin RTL_MUX O[23] -pin write_data_i I1[23]
load net RTL_MUX_n_9 -attr @rip O[22] -pin RTL_MUX O[22] -pin write_data_i I1[22]
load net alu_control[0] -attr @rip alu_control[0] -pin ALU opcode[0] -pin ALU_CU alu_control[0]
load net alu_control[1] -attr @rip alu_control[1] -pin ALU opcode[1] -pin ALU_CU alu_control[1]
load net alu_control[2] -attr @rip alu_control[2] -pin ALU opcode[2] -pin ALU_CU alu_control[2]
load net alu_control[3] -attr @rip alu_control[3] -pin ALU opcode[3] -pin ALU_CU alu_control[3]
load net alu_op[0] -attr @rip AluOp[0] -pin ALU_CU alu_op[0] -pin CU AluOp[0]
load net alu_op[1] -attr @rip AluOp[1] -pin ALU_CU alu_op[1] -pin CU AluOp[1]
load net alu_op[2] -attr @rip AluOp[2] -pin ALU_CU alu_op[2] -pin CU AluOp[2]
load net alu_result[0] -attr @rip result[0] -pin ALU result[0] -pin DataMem address[0] -pin RTL_AND I1 -pin mem_reg_mux_i I1[0]
load net alu_result[10] -attr @rip result[10] -pin ALU result[10] -pin DataMem address[10] -pin mem_reg_mux_i I1[10]
load net alu_result[11] -attr @rip result[11] -pin ALU result[11] -pin DataMem address[11] -pin mem_reg_mux_i I1[11]
load net alu_result[12] -attr @rip result[12] -pin ALU result[12] -pin DataMem address[12] -pin mem_reg_mux_i I1[12]
load net alu_result[13] -attr @rip result[13] -pin ALU result[13] -pin DataMem address[13] -pin mem_reg_mux_i I1[13]
load net alu_result[14] -attr @rip result[14] -pin ALU result[14] -pin DataMem address[14] -pin mem_reg_mux_i I1[14]
load net alu_result[15] -attr @rip result[15] -pin ALU result[15] -pin DataMem address[15] -pin mem_reg_mux_i I1[15]
load net alu_result[16] -attr @rip result[16] -pin ALU result[16] -pin DataMem address[16] -pin mem_reg_mux_i I1[16]
load net alu_result[17] -attr @rip result[17] -pin ALU result[17] -pin DataMem address[17] -pin mem_reg_mux_i I1[17]
load net alu_result[18] -attr @rip result[18] -pin ALU result[18] -pin DataMem address[18] -pin mem_reg_mux_i I1[18]
load net alu_result[19] -attr @rip result[19] -pin ALU result[19] -pin DataMem address[19] -pin mem_reg_mux_i I1[19]
load net alu_result[1] -attr @rip result[1] -pin ALU result[1] -pin DataMem address[1] -pin mem_reg_mux_i I1[1]
load net alu_result[20] -attr @rip result[20] -pin ALU result[20] -pin DataMem address[20] -pin mem_reg_mux_i I1[20]
load net alu_result[21] -attr @rip result[21] -pin ALU result[21] -pin DataMem address[21] -pin mem_reg_mux_i I1[21]
load net alu_result[22] -attr @rip result[22] -pin ALU result[22] -pin DataMem address[22] -pin mem_reg_mux_i I1[22]
load net alu_result[23] -attr @rip result[23] -pin ALU result[23] -pin DataMem address[23] -pin mem_reg_mux_i I1[23]
load net alu_result[24] -attr @rip result[24] -pin ALU result[24] -pin DataMem address[24] -pin mem_reg_mux_i I1[24]
load net alu_result[25] -attr @rip result[25] -pin ALU result[25] -pin DataMem address[25] -pin mem_reg_mux_i I1[25]
load net alu_result[26] -attr @rip result[26] -pin ALU result[26] -pin DataMem address[26] -pin mem_reg_mux_i I1[26]
load net alu_result[27] -attr @rip result[27] -pin ALU result[27] -pin DataMem address[27] -pin mem_reg_mux_i I1[27]
load net alu_result[28] -attr @rip result[28] -pin ALU result[28] -pin DataMem address[28] -pin mem_reg_mux_i I1[28]
load net alu_result[29] -attr @rip result[29] -pin ALU result[29] -pin DataMem address[29] -pin mem_reg_mux_i I1[29]
load net alu_result[2] -attr @rip result[2] -pin ALU result[2] -pin DataMem address[2] -pin mem_reg_mux_i I1[2]
load net alu_result[30] -attr @rip result[30] -pin ALU result[30] -pin DataMem address[30] -pin mem_reg_mux_i I1[30]
load net alu_result[31] -attr @rip result[31] -pin ALU result[31] -pin DataMem address[31] -pin mem_reg_mux_i I1[31]
load net alu_result[3] -attr @rip result[3] -pin ALU result[3] -pin DataMem address[3] -pin mem_reg_mux_i I1[3]
load net alu_result[4] -attr @rip result[4] -pin ALU result[4] -pin DataMem address[4] -pin mem_reg_mux_i I1[4]
load net alu_result[5] -attr @rip result[5] -pin ALU result[5] -pin DataMem address[5] -pin mem_reg_mux_i I1[5]
load net alu_result[6] -attr @rip result[6] -pin ALU result[6] -pin DataMem address[6] -pin mem_reg_mux_i I1[6]
load net alu_result[7] -attr @rip result[7] -pin ALU result[7] -pin DataMem address[7] -pin mem_reg_mux_i I1[7]
load net alu_result[8] -attr @rip result[8] -pin ALU result[8] -pin DataMem address[8] -pin mem_reg_mux_i I1[8]
load net alu_result[9] -attr @rip result[9] -pin ALU result[9] -pin DataMem address[9] -pin mem_reg_mux_i I1[9]
load net alu_src1 -pin CU AluSrc1 -pin operand1_i S
netloc alu_src1 1 1 10 300 150 NJ 150 NJ 150 NJ 150 NJ 150 2230J 220 NJ 220 NJ 220 NJ 220 3410J
load net alu_src2 -pin CU AluSrc2 -pin operand2_i S
netloc alu_src2 1 1 10 N 190 NJ 190 NJ 190 NJ 190 NJ 190 2170J 240 NJ 240 NJ 240 NJ 240 3390J
load net branch -pin CU Branch -pin RTL_AND I0
netloc branch 1 1 4 320 570 NJ 570 NJ 570 NJ
load net clk -pin DataMem clk -pin PC clk -pin RegFile clk -port clk
netloc clk 1 0 9 NJ 430 380 630 NJ 630 NJ 630 NJ 630 1820 480 NJ 480 NJ 480 2810J
load net data1[0] -attr @rip read_data1[0] -pin RegFile read_data1[0] -pin mux1_i I0[0] -pin operand1_i I1[0]
load net data1[10] -attr @rip read_data1[10] -pin RegFile read_data1[10] -pin mux1_i I0[10] -pin operand1_i I1[10]
load net data1[11] -attr @rip read_data1[11] -pin RegFile read_data1[11] -pin mux1_i I0[11] -pin operand1_i I1[11]
load net data1[12] -attr @rip read_data1[12] -pin RegFile read_data1[12] -pin mux1_i I0[12] -pin operand1_i I1[12]
load net data1[13] -attr @rip read_data1[13] -pin RegFile read_data1[13] -pin mux1_i I0[13] -pin operand1_i I1[13]
load net data1[14] -attr @rip read_data1[14] -pin RegFile read_data1[14] -pin mux1_i I0[14] -pin operand1_i I1[14]
load net data1[15] -attr @rip read_data1[15] -pin RegFile read_data1[15] -pin mux1_i I0[15] -pin operand1_i I1[15]
load net data1[16] -attr @rip read_data1[16] -pin RegFile read_data1[16] -pin mux1_i I0[16] -pin operand1_i I1[16]
load net data1[17] -attr @rip read_data1[17] -pin RegFile read_data1[17] -pin mux1_i I0[17] -pin operand1_i I1[17]
load net data1[18] -attr @rip read_data1[18] -pin RegFile read_data1[18] -pin mux1_i I0[18] -pin operand1_i I1[18]
load net data1[19] -attr @rip read_data1[19] -pin RegFile read_data1[19] -pin mux1_i I0[19] -pin operand1_i I1[19]
load net data1[1] -attr @rip read_data1[1] -pin RegFile read_data1[1] -pin mux1_i I0[1] -pin operand1_i I1[1]
load net data1[20] -attr @rip read_data1[20] -pin RegFile read_data1[20] -pin mux1_i I0[20] -pin operand1_i I1[20]
load net data1[21] -attr @rip read_data1[21] -pin RegFile read_data1[21] -pin mux1_i I0[21] -pin operand1_i I1[21]
load net data1[22] -attr @rip read_data1[22] -pin RegFile read_data1[22] -pin mux1_i I0[22] -pin operand1_i I1[22]
load net data1[23] -attr @rip read_data1[23] -pin RegFile read_data1[23] -pin mux1_i I0[23] -pin operand1_i I1[23]
load net data1[24] -attr @rip read_data1[24] -pin RegFile read_data1[24] -pin mux1_i I0[24] -pin operand1_i I1[24]
load net data1[25] -attr @rip read_data1[25] -pin RegFile read_data1[25] -pin mux1_i I0[25] -pin operand1_i I1[25]
load net data1[26] -attr @rip read_data1[26] -pin RegFile read_data1[26] -pin mux1_i I0[26] -pin operand1_i I1[26]
load net data1[27] -attr @rip read_data1[27] -pin RegFile read_data1[27] -pin mux1_i I0[27] -pin operand1_i I1[27]
load net data1[28] -attr @rip read_data1[28] -pin RegFile read_data1[28] -pin mux1_i I0[28] -pin operand1_i I1[28]
load net data1[29] -attr @rip read_data1[29] -pin RegFile read_data1[29] -pin mux1_i I0[29] -pin operand1_i I1[29]
load net data1[2] -attr @rip read_data1[2] -pin RegFile read_data1[2] -pin mux1_i I0[2] -pin operand1_i I1[2]
load net data1[30] -attr @rip read_data1[30] -pin RegFile read_data1[30] -pin mux1_i I0[30] -pin operand1_i I1[30]
load net data1[31] -attr @rip read_data1[31] -pin RegFile read_data1[31] -pin mux1_i I0[31] -pin operand1_i I1[31]
load net data1[3] -attr @rip read_data1[3] -pin RegFile read_data1[3] -pin mux1_i I0[3] -pin operand1_i I1[3]
load net data1[4] -attr @rip read_data1[4] -pin RegFile read_data1[4] -pin mux1_i I0[4] -pin operand1_i I1[4]
load net data1[5] -attr @rip read_data1[5] -pin RegFile read_data1[5] -pin mux1_i I0[5] -pin operand1_i I1[5]
load net data1[6] -attr @rip read_data1[6] -pin RegFile read_data1[6] -pin mux1_i I0[6] -pin operand1_i I1[6]
load net data1[7] -attr @rip read_data1[7] -pin RegFile read_data1[7] -pin mux1_i I0[7] -pin operand1_i I1[7]
load net data1[8] -attr @rip read_data1[8] -pin RegFile read_data1[8] -pin mux1_i I0[8] -pin operand1_i I1[8]
load net data1[9] -attr @rip read_data1[9] -pin RegFile read_data1[9] -pin mux1_i I0[9] -pin operand1_i I1[9]
load net data2[0] -attr @rip read_data2[0] -pin DataMem write_data[0] -pin RegFile read_data2[0] -pin operand2_i I1[0]
load net data2[10] -attr @rip read_data2[10] -pin DataMem write_data[10] -pin RegFile read_data2[10] -pin operand2_i I1[10]
load net data2[11] -attr @rip read_data2[11] -pin DataMem write_data[11] -pin RegFile read_data2[11] -pin operand2_i I1[11]
load net data2[12] -attr @rip read_data2[12] -pin DataMem write_data[12] -pin RegFile read_data2[12] -pin operand2_i I1[12]
load net data2[13] -attr @rip read_data2[13] -pin DataMem write_data[13] -pin RegFile read_data2[13] -pin operand2_i I1[13]
load net data2[14] -attr @rip read_data2[14] -pin DataMem write_data[14] -pin RegFile read_data2[14] -pin operand2_i I1[14]
load net data2[15] -attr @rip read_data2[15] -pin DataMem write_data[15] -pin RegFile read_data2[15] -pin operand2_i I1[15]
load net data2[16] -attr @rip read_data2[16] -pin DataMem write_data[16] -pin RegFile read_data2[16] -pin operand2_i I1[16]
load net data2[17] -attr @rip read_data2[17] -pin DataMem write_data[17] -pin RegFile read_data2[17] -pin operand2_i I1[17]
load net data2[18] -attr @rip read_data2[18] -pin DataMem write_data[18] -pin RegFile read_data2[18] -pin operand2_i I1[18]
load net data2[19] -attr @rip read_data2[19] -pin DataMem write_data[19] -pin RegFile read_data2[19] -pin operand2_i I1[19]
load net data2[1] -attr @rip read_data2[1] -pin DataMem write_data[1] -pin RegFile read_data2[1] -pin operand2_i I1[1]
load net data2[20] -attr @rip read_data2[20] -pin DataMem write_data[20] -pin RegFile read_data2[20] -pin operand2_i I1[20]
load net data2[21] -attr @rip read_data2[21] -pin DataMem write_data[21] -pin RegFile read_data2[21] -pin operand2_i I1[21]
load net data2[22] -attr @rip read_data2[22] -pin DataMem write_data[22] -pin RegFile read_data2[22] -pin operand2_i I1[22]
load net data2[23] -attr @rip read_data2[23] -pin DataMem write_data[23] -pin RegFile read_data2[23] -pin operand2_i I1[23]
load net data2[24] -attr @rip read_data2[24] -pin DataMem write_data[24] -pin RegFile read_data2[24] -pin operand2_i I1[24]
load net data2[25] -attr @rip read_data2[25] -pin DataMem write_data[25] -pin RegFile read_data2[25] -pin operand2_i I1[25]
load net data2[26] -attr @rip read_data2[26] -pin DataMem write_data[26] -pin RegFile read_data2[26] -pin operand2_i I1[26]
load net data2[27] -attr @rip read_data2[27] -pin DataMem write_data[27] -pin RegFile read_data2[27] -pin operand2_i I1[27]
load net data2[28] -attr @rip read_data2[28] -pin DataMem write_data[28] -pin RegFile read_data2[28] -pin operand2_i I1[28]
load net data2[29] -attr @rip read_data2[29] -pin DataMem write_data[29] -pin RegFile read_data2[29] -pin operand2_i I1[29]
load net data2[2] -attr @rip read_data2[2] -pin DataMem write_data[2] -pin RegFile read_data2[2] -pin operand2_i I1[2]
load net data2[30] -attr @rip read_data2[30] -pin DataMem write_data[30] -pin RegFile read_data2[30] -pin operand2_i I1[30]
load net data2[31] -attr @rip read_data2[31] -pin DataMem write_data[31] -pin RegFile read_data2[31] -pin operand2_i I1[31]
load net data2[3] -attr @rip read_data2[3] -pin DataMem write_data[3] -pin RegFile read_data2[3] -pin operand2_i I1[3]
load net data2[4] -attr @rip read_data2[4] -pin DataMem write_data[4] -pin RegFile read_data2[4] -pin operand2_i I1[4]
load net data2[5] -attr @rip read_data2[5] -pin DataMem write_data[5] -pin RegFile read_data2[5] -pin operand2_i I1[5]
load net data2[6] -attr @rip read_data2[6] -pin DataMem write_data[6] -pin RegFile read_data2[6] -pin operand2_i I1[6]
load net data2[7] -attr @rip read_data2[7] -pin DataMem write_data[7] -pin RegFile read_data2[7] -pin operand2_i I1[7]
load net data2[8] -attr @rip read_data2[8] -pin DataMem write_data[8] -pin RegFile read_data2[8] -pin operand2_i I1[8]
load net data2[9] -attr @rip read_data2[9] -pin DataMem write_data[9] -pin RegFile read_data2[9] -pin operand2_i I1[9]
load net immediate[0] -attr @rip immediate[0] -pin ImmGen immediate[0] -pin RTL_MUX I0[0] -pin mux2_i I0[0] -pin operand2_i I0[0]
load net immediate[10] -attr @rip immediate[10] -pin ImmGen immediate[10] -pin RTL_MUX I0[10] -pin mux2_i I0[10] -pin operand2_i I0[10]
load net immediate[11] -attr @rip immediate[11] -pin ImmGen immediate[11] -pin RTL_MUX I0[11] -pin mux2_i I0[11] -pin operand2_i I0[11]
load net immediate[12] -attr @rip immediate[12] -pin ImmGen immediate[12] -pin RTL_MUX I0[12] -pin mux2_i I0[12] -pin operand2_i I0[12]
load net immediate[13] -attr @rip immediate[13] -pin ImmGen immediate[13] -pin RTL_MUX I0[13] -pin mux2_i I0[13] -pin operand2_i I0[13]
load net immediate[14] -attr @rip immediate[14] -pin ImmGen immediate[14] -pin RTL_MUX I0[14] -pin mux2_i I0[14] -pin operand2_i I0[14]
load net immediate[15] -attr @rip immediate[15] -pin ImmGen immediate[15] -pin RTL_MUX I0[15] -pin mux2_i I0[15] -pin operand2_i I0[15]
load net immediate[16] -attr @rip immediate[16] -pin ImmGen immediate[16] -pin RTL_MUX I0[16] -pin mux2_i I0[16] -pin operand2_i I0[16]
load net immediate[17] -attr @rip immediate[17] -pin ImmGen immediate[17] -pin RTL_MUX I0[17] -pin mux2_i I0[17] -pin operand2_i I0[17]
load net immediate[18] -attr @rip immediate[18] -pin ImmGen immediate[18] -pin RTL_MUX I0[18] -pin mux2_i I0[18] -pin operand2_i I0[18]
load net immediate[19] -attr @rip immediate[19] -pin ImmGen immediate[19] -pin RTL_MUX I0[19] -pin mux2_i I0[19] -pin operand2_i I0[19]
load net immediate[1] -attr @rip immediate[1] -pin ImmGen immediate[1] -pin RTL_MUX I0[1] -pin mux2_i I0[1] -pin operand2_i I0[1]
load net immediate[20] -attr @rip immediate[20] -pin ImmGen immediate[20] -pin RTL_MUX I0[20] -pin mux2_i I0[20] -pin operand2_i I0[20]
load net immediate[21] -attr @rip immediate[21] -pin ImmGen immediate[21] -pin RTL_MUX I0[21] -pin mux2_i I0[21] -pin operand2_i I0[21]
load net immediate[22] -attr @rip immediate[22] -pin ImmGen immediate[22] -pin RTL_MUX I0[22] -pin mux2_i I0[22] -pin operand2_i I0[22]
load net immediate[23] -attr @rip immediate[23] -pin ImmGen immediate[23] -pin RTL_MUX I0[23] -pin mux2_i I0[23] -pin operand2_i I0[23]
load net immediate[24] -attr @rip immediate[24] -pin ImmGen immediate[24] -pin RTL_MUX I0[24] -pin mux2_i I0[24] -pin operand2_i I0[24]
load net immediate[25] -attr @rip immediate[25] -pin ImmGen immediate[25] -pin RTL_MUX I0[25] -pin mux2_i I0[25] -pin operand2_i I0[25]
load net immediate[26] -attr @rip immediate[26] -pin ImmGen immediate[26] -pin RTL_MUX I0[26] -pin mux2_i I0[26] -pin operand2_i I0[26]
load net immediate[27] -attr @rip immediate[27] -pin ImmGen immediate[27] -pin RTL_MUX I0[27] -pin mux2_i I0[27] -pin operand2_i I0[27]
load net immediate[28] -attr @rip immediate[28] -pin ImmGen immediate[28] -pin RTL_MUX I0[28] -pin mux2_i I0[28] -pin operand2_i I0[28]
load net immediate[29] -attr @rip immediate[29] -pin ImmGen immediate[29] -pin RTL_MUX I0[29] -pin mux2_i I0[29] -pin operand2_i I0[29]
load net immediate[2] -attr @rip immediate[2] -pin ImmGen immediate[2] -pin RTL_MUX I0[2] -pin mux2_i I0[2] -pin operand2_i I0[2]
load net immediate[30] -attr @rip immediate[30] -pin ImmGen immediate[30] -pin RTL_MUX I0[30] -pin mux2_i I0[30] -pin operand2_i I0[30]
load net immediate[31] -attr @rip immediate[31] -pin ImmGen immediate[31] -pin RTL_MUX I0[31] -pin mux2_i I0[31] -pin operand2_i I0[31]
load net immediate[3] -attr @rip immediate[3] -pin ImmGen immediate[3] -pin RTL_MUX I0[3] -pin mux2_i I0[3] -pin operand2_i I0[3]
load net immediate[4] -attr @rip immediate[4] -pin ImmGen immediate[4] -pin RTL_MUX I0[4] -pin mux2_i I0[4] -pin operand2_i I0[4]
load net immediate[5] -attr @rip immediate[5] -pin ImmGen immediate[5] -pin RTL_MUX I0[5] -pin mux2_i I0[5] -pin operand2_i I0[5]
load net immediate[6] -attr @rip immediate[6] -pin ImmGen immediate[6] -pin RTL_MUX I0[6] -pin mux2_i I0[6] -pin operand2_i I0[6]
load net immediate[7] -attr @rip immediate[7] -pin ImmGen immediate[7] -pin RTL_MUX I0[7] -pin mux2_i I0[7] -pin operand2_i I0[7]
load net immediate[8] -attr @rip immediate[8] -pin ImmGen immediate[8] -pin RTL_MUX I0[8] -pin mux2_i I0[8] -pin operand2_i I0[8]
load net immediate[9] -attr @rip immediate[9] -pin ImmGen immediate[9] -pin RTL_MUX I0[9] -pin mux2_i I0[9] -pin operand2_i I0[9]
load net instruction[0] -attr @rip instruction[0] -pin CU opcode[0] -pin ImmGen instruction[0] -pin InstructionMem instruction[0]
load net instruction[10] -attr @rip instruction[10] -pin ImmGen instruction[10] -pin InstructionMem instruction[10] -pin RegFile write_reg_addr[3]
load net instruction[11] -attr @rip instruction[11] -pin ImmGen instruction[11] -pin InstructionMem instruction[11] -pin RegFile write_reg_addr[4]
load net instruction[12] -attr @rip instruction[12] -pin ALU_CU func3[0] -pin ImmGen instruction[12] -pin InstructionMem instruction[12]
load net instruction[13] -attr @rip instruction[13] -pin ALU_CU func3[1] -pin ImmGen instruction[13] -pin InstructionMem instruction[13]
load net instruction[14] -attr @rip instruction[14] -pin ALU_CU func3[2] -pin ImmGen instruction[14] -pin InstructionMem instruction[14]
load net instruction[15] -attr @rip instruction[15] -pin ImmGen instruction[15] -pin InstructionMem instruction[15] -pin RegFile read_reg1[0]
load net instruction[16] -attr @rip instruction[16] -pin ImmGen instruction[16] -pin InstructionMem instruction[16] -pin RegFile read_reg1[1]
load net instruction[17] -attr @rip instruction[17] -pin ImmGen instruction[17] -pin InstructionMem instruction[17] -pin RegFile read_reg1[2]
load net instruction[18] -attr @rip instruction[18] -pin ImmGen instruction[18] -pin InstructionMem instruction[18] -pin RegFile read_reg1[3]
load net instruction[19] -attr @rip instruction[19] -pin ImmGen instruction[19] -pin InstructionMem instruction[19] -pin RegFile read_reg1[4]
load net instruction[1] -attr @rip instruction[1] -pin CU opcode[1] -pin ImmGen instruction[1] -pin InstructionMem instruction[1]
load net instruction[20] -attr @rip instruction[20] -pin ImmGen instruction[20] -pin InstructionMem instruction[20] -pin RegFile read_reg2[0]
load net instruction[21] -attr @rip instruction[21] -pin ImmGen instruction[21] -pin InstructionMem instruction[21] -pin RegFile read_reg2[1]
load net instruction[22] -attr @rip instruction[22] -pin ImmGen instruction[22] -pin InstructionMem instruction[22] -pin RegFile read_reg2[2]
load net instruction[23] -attr @rip instruction[23] -pin ImmGen instruction[23] -pin InstructionMem instruction[23] -pin RegFile read_reg2[3]
load net instruction[24] -attr @rip instruction[24] -pin ImmGen instruction[24] -pin InstructionMem instruction[24] -pin RegFile read_reg2[4]
load net instruction[25] -attr @rip instruction[25] -pin ImmGen instruction[25] -pin InstructionMem instruction[25]
load net instruction[26] -attr @rip instruction[26] -pin ImmGen instruction[26] -pin InstructionMem instruction[26]
load net instruction[27] -attr @rip instruction[27] -pin ImmGen instruction[27] -pin InstructionMem instruction[27]
load net instruction[28] -attr @rip instruction[28] -pin ImmGen instruction[28] -pin InstructionMem instruction[28]
load net instruction[29] -attr @rip instruction[29] -pin ImmGen instruction[29] -pin InstructionMem instruction[29]
load net instruction[2] -attr @rip instruction[2] -pin CU opcode[2] -pin ImmGen instruction[2] -pin InstructionMem instruction[2]
load net instruction[30] -attr @rip instruction[30] -pin ALU_CU bit30 -pin ImmGen instruction[30] -pin InstructionMem instruction[30]
load net instruction[31] -attr @rip instruction[31] -pin ImmGen instruction[31] -pin InstructionMem instruction[31]
load net instruction[3] -attr @rip instruction[3] -pin CU opcode[3] -pin ImmGen instruction[3] -pin InstructionMem instruction[3]
load net instruction[4] -attr @rip instruction[4] -pin CU opcode[4] -pin ImmGen instruction[4] -pin InstructionMem instruction[4]
load net instruction[5] -attr @rip instruction[5] -pin CU opcode[5] -pin ImmGen instruction[5] -pin InstructionMem instruction[5]
load net instruction[6] -attr @rip instruction[6] -pin CU opcode[6] -pin ImmGen instruction[6] -pin InstructionMem instruction[6]
load net instruction[7] -attr @rip instruction[7] -pin ImmGen instruction[7] -pin InstructionMem instruction[7] -pin RegFile write_reg_addr[0]
load net instruction[8] -attr @rip instruction[8] -pin ImmGen instruction[8] -pin InstructionMem instruction[8] -pin RegFile write_reg_addr[1]
load net instruction[9] -attr @rip instruction[9] -pin ImmGen instruction[9] -pin InstructionMem instruction[9] -pin RegFile write_reg_addr[2]
load net jump -pin CU Jump -pin RTL_OR I0 -pin write_data_i S
netloc jump 1 1 5 400 330 740J 510 NJ 510 1470J 470N 1780
load net lui -pin CU lui -pin RTL_MUX S
netloc lui 1 1 3 420 310 820J 350 1130J
load net mem_read -pin CU MemRead -pin DataMem mem_read
netloc mem_read 1 1 1 300 250n
load net mem_reg_mux[0] -attr @rip O[0] -pin RTL_MUX I1[0] -pin mem_reg_mux_i O[0]
load net mem_reg_mux[10] -attr @rip O[10] -pin RTL_MUX I1[10] -pin mem_reg_mux_i O[10]
load net mem_reg_mux[11] -attr @rip O[11] -pin RTL_MUX I1[11] -pin mem_reg_mux_i O[11]
load net mem_reg_mux[12] -attr @rip O[12] -pin RTL_MUX I1[12] -pin mem_reg_mux_i O[12]
load net mem_reg_mux[13] -attr @rip O[13] -pin RTL_MUX I1[13] -pin mem_reg_mux_i O[13]
load net mem_reg_mux[14] -attr @rip O[14] -pin RTL_MUX I1[14] -pin mem_reg_mux_i O[14]
load net mem_reg_mux[15] -attr @rip O[15] -pin RTL_MUX I1[15] -pin mem_reg_mux_i O[15]
load net mem_reg_mux[16] -attr @rip O[16] -pin RTL_MUX I1[16] -pin mem_reg_mux_i O[16]
load net mem_reg_mux[17] -attr @rip O[17] -pin RTL_MUX I1[17] -pin mem_reg_mux_i O[17]
load net mem_reg_mux[18] -attr @rip O[18] -pin RTL_MUX I1[18] -pin mem_reg_mux_i O[18]
load net mem_reg_mux[19] -attr @rip O[19] -pin RTL_MUX I1[19] -pin mem_reg_mux_i O[19]
load net mem_reg_mux[1] -attr @rip O[1] -pin RTL_MUX I1[1] -pin mem_reg_mux_i O[1]
load net mem_reg_mux[20] -attr @rip O[20] -pin RTL_MUX I1[20] -pin mem_reg_mux_i O[20]
load net mem_reg_mux[21] -attr @rip O[21] -pin RTL_MUX I1[21] -pin mem_reg_mux_i O[21]
load net mem_reg_mux[22] -attr @rip O[22] -pin RTL_MUX I1[22] -pin mem_reg_mux_i O[22]
load net mem_reg_mux[23] -attr @rip O[23] -pin RTL_MUX I1[23] -pin mem_reg_mux_i O[23]
load net mem_reg_mux[24] -attr @rip O[24] -pin RTL_MUX I1[24] -pin mem_reg_mux_i O[24]
load net mem_reg_mux[25] -attr @rip O[25] -pin RTL_MUX I1[25] -pin mem_reg_mux_i O[25]
load net mem_reg_mux[26] -attr @rip O[26] -pin RTL_MUX I1[26] -pin mem_reg_mux_i O[26]
load net mem_reg_mux[27] -attr @rip O[27] -pin RTL_MUX I1[27] -pin mem_reg_mux_i O[27]
load net mem_reg_mux[28] -attr @rip O[28] -pin RTL_MUX I1[28] -pin mem_reg_mux_i O[28]
load net mem_reg_mux[29] -attr @rip O[29] -pin RTL_MUX I1[29] -pin mem_reg_mux_i O[29]
load net mem_reg_mux[2] -attr @rip O[2] -pin RTL_MUX I1[2] -pin mem_reg_mux_i O[2]
load net mem_reg_mux[30] -attr @rip O[30] -pin RTL_MUX I1[30] -pin mem_reg_mux_i O[30]
load net mem_reg_mux[31] -attr @rip O[31] -pin RTL_MUX I1[31] -pin mem_reg_mux_i O[31]
load net mem_reg_mux[3] -attr @rip O[3] -pin RTL_MUX I1[3] -pin mem_reg_mux_i O[3]
load net mem_reg_mux[4] -attr @rip O[4] -pin RTL_MUX I1[4] -pin mem_reg_mux_i O[4]
load net mem_reg_mux[5] -attr @rip O[5] -pin RTL_MUX I1[5] -pin mem_reg_mux_i O[5]
load net mem_reg_mux[6] -attr @rip O[6] -pin RTL_MUX I1[6] -pin mem_reg_mux_i O[6]
load net mem_reg_mux[7] -attr @rip O[7] -pin RTL_MUX I1[7] -pin mem_reg_mux_i O[7]
load net mem_reg_mux[8] -attr @rip O[8] -pin RTL_MUX I1[8] -pin mem_reg_mux_i O[8]
load net mem_reg_mux[9] -attr @rip O[9] -pin RTL_MUX I1[9] -pin mem_reg_mux_i O[9]
load net mem_to_reg -pin CU MemToReg -pin mem_reg_mux_i S
netloc mem_to_reg 1 1 2 380 290 780J
load net mem_write -pin CU MemWrite -pin DataMem mem_write
netloc mem_write 1 1 1 280 290n
load net mux1[0] -attr @rip O[0] -pin mux1_i O[0] -pin next_pc_i I0[0]
load net mux1[10] -attr @rip O[10] -pin mux1_i O[10] -pin next_pc_i I0[10]
load net mux1[11] -attr @rip O[11] -pin mux1_i O[11] -pin next_pc_i I0[11]
load net mux1[12] -attr @rip O[12] -pin mux1_i O[12] -pin next_pc_i I0[12]
load net mux1[13] -attr @rip O[13] -pin mux1_i O[13] -pin next_pc_i I0[13]
load net mux1[14] -attr @rip O[14] -pin mux1_i O[14] -pin next_pc_i I0[14]
load net mux1[15] -attr @rip O[15] -pin mux1_i O[15] -pin next_pc_i I0[15]
load net mux1[16] -attr @rip O[16] -pin mux1_i O[16] -pin next_pc_i I0[16]
load net mux1[17] -attr @rip O[17] -pin mux1_i O[17] -pin next_pc_i I0[17]
load net mux1[18] -attr @rip O[18] -pin mux1_i O[18] -pin next_pc_i I0[18]
load net mux1[19] -attr @rip O[19] -pin mux1_i O[19] -pin next_pc_i I0[19]
load net mux1[1] -attr @rip O[1] -pin mux1_i O[1] -pin next_pc_i I0[1]
load net mux1[20] -attr @rip O[20] -pin mux1_i O[20] -pin next_pc_i I0[20]
load net mux1[21] -attr @rip O[21] -pin mux1_i O[21] -pin next_pc_i I0[21]
load net mux1[22] -attr @rip O[22] -pin mux1_i O[22] -pin next_pc_i I0[22]
load net mux1[23] -attr @rip O[23] -pin mux1_i O[23] -pin next_pc_i I0[23]
load net mux1[24] -attr @rip O[24] -pin mux1_i O[24] -pin next_pc_i I0[24]
load net mux1[25] -attr @rip O[25] -pin mux1_i O[25] -pin next_pc_i I0[25]
load net mux1[26] -attr @rip O[26] -pin mux1_i O[26] -pin next_pc_i I0[26]
load net mux1[27] -attr @rip O[27] -pin mux1_i O[27] -pin next_pc_i I0[27]
load net mux1[28] -attr @rip O[28] -pin mux1_i O[28] -pin next_pc_i I0[28]
load net mux1[29] -attr @rip O[29] -pin mux1_i O[29] -pin next_pc_i I0[29]
load net mux1[2] -attr @rip O[2] -pin mux1_i O[2] -pin next_pc_i I0[2]
load net mux1[30] -attr @rip O[30] -pin mux1_i O[30] -pin next_pc_i I0[30]
load net mux1[31] -attr @rip O[31] -pin mux1_i O[31] -pin next_pc_i I0[31]
load net mux1[3] -attr @rip O[3] -pin mux1_i O[3] -pin next_pc_i I0[3]
load net mux1[4] -attr @rip O[4] -pin mux1_i O[4] -pin next_pc_i I0[4]
load net mux1[5] -attr @rip O[5] -pin mux1_i O[5] -pin next_pc_i I0[5]
load net mux1[6] -attr @rip O[6] -pin mux1_i O[6] -pin next_pc_i I0[6]
load net mux1[7] -attr @rip O[7] -pin mux1_i O[7] -pin next_pc_i I0[7]
load net mux1[8] -attr @rip O[8] -pin mux1_i O[8] -pin next_pc_i I0[8]
load net mux1[9] -attr @rip O[9] -pin mux1_i O[9] -pin next_pc_i I0[9]
load net mux2[0] -attr @rip O[0] -pin mux2_i O[0] -pin next_pc_i I1[0]
load net mux2[10] -attr @rip O[10] -pin mux2_i O[10] -pin next_pc_i I1[10]
load net mux2[11] -attr @rip O[11] -pin mux2_i O[11] -pin next_pc_i I1[11]
load net mux2[12] -attr @rip O[12] -pin mux2_i O[12] -pin next_pc_i I1[12]
load net mux2[13] -attr @rip O[13] -pin mux2_i O[13] -pin next_pc_i I1[13]
load net mux2[14] -attr @rip O[14] -pin mux2_i O[14] -pin next_pc_i I1[14]
load net mux2[15] -attr @rip O[15] -pin mux2_i O[15] -pin next_pc_i I1[15]
load net mux2[16] -attr @rip O[16] -pin mux2_i O[16] -pin next_pc_i I1[16]
load net mux2[17] -attr @rip O[17] -pin mux2_i O[17] -pin next_pc_i I1[17]
load net mux2[18] -attr @rip O[18] -pin mux2_i O[18] -pin next_pc_i I1[18]
load net mux2[19] -attr @rip O[19] -pin mux2_i O[19] -pin next_pc_i I1[19]
load net mux2[1] -attr @rip O[1] -pin mux2_i O[1] -pin next_pc_i I1[1]
load net mux2[20] -attr @rip O[20] -pin mux2_i O[20] -pin next_pc_i I1[20]
load net mux2[21] -attr @rip O[21] -pin mux2_i O[21] -pin next_pc_i I1[21]
load net mux2[22] -attr @rip O[22] -pin mux2_i O[22] -pin next_pc_i I1[22]
load net mux2[23] -attr @rip O[23] -pin mux2_i O[23] -pin next_pc_i I1[23]
load net mux2[24] -attr @rip O[24] -pin mux2_i O[24] -pin next_pc_i I1[24]
load net mux2[25] -attr @rip O[25] -pin mux2_i O[25] -pin next_pc_i I1[25]
load net mux2[26] -attr @rip O[26] -pin mux2_i O[26] -pin next_pc_i I1[26]
load net mux2[27] -attr @rip O[27] -pin mux2_i O[27] -pin next_pc_i I1[27]
load net mux2[28] -attr @rip O[28] -pin mux2_i O[28] -pin next_pc_i I1[28]
load net mux2[29] -attr @rip O[29] -pin mux2_i O[29] -pin next_pc_i I1[29]
load net mux2[2] -attr @rip O[2] -pin mux2_i O[2] -pin next_pc_i I1[2]
load net mux2[30] -attr @rip O[30] -pin mux2_i O[30] -pin next_pc_i I1[30]
load net mux2[31] -attr @rip O[31] -pin mux2_i O[31] -pin next_pc_i I1[31]
load net mux2[3] -attr @rip O[3] -pin mux2_i O[3] -pin next_pc_i I1[3]
load net mux2[4] -attr @rip O[4] -pin mux2_i O[4] -pin next_pc_i I1[4]
load net mux2[5] -attr @rip O[5] -pin mux2_i O[5] -pin next_pc_i I1[5]
load net mux2[6] -attr @rip O[6] -pin mux2_i O[6] -pin next_pc_i I1[6]
load net mux2[7] -attr @rip O[7] -pin mux2_i O[7] -pin next_pc_i I1[7]
load net mux2[8] -attr @rip O[8] -pin mux2_i O[8] -pin next_pc_i I1[8]
load net mux2[9] -attr @rip O[9] -pin mux2_i O[9] -pin next_pc_i I1[9]
load net next_pc[0] -attr @rip O[0] -pin PC next_pc[0] -pin next_pc_i O[0]
load net next_pc[10] -attr @rip O[10] -pin PC next_pc[10] -pin next_pc_i O[10]
load net next_pc[11] -attr @rip O[11] -pin PC next_pc[11] -pin next_pc_i O[11]
load net next_pc[12] -attr @rip O[12] -pin PC next_pc[12] -pin next_pc_i O[12]
load net next_pc[13] -attr @rip O[13] -pin PC next_pc[13] -pin next_pc_i O[13]
load net next_pc[14] -attr @rip O[14] -pin PC next_pc[14] -pin next_pc_i O[14]
load net next_pc[15] -attr @rip O[15] -pin PC next_pc[15] -pin next_pc_i O[15]
load net next_pc[16] -attr @rip O[16] -pin PC next_pc[16] -pin next_pc_i O[16]
load net next_pc[17] -attr @rip O[17] -pin PC next_pc[17] -pin next_pc_i O[17]
load net next_pc[18] -attr @rip O[18] -pin PC next_pc[18] -pin next_pc_i O[18]
load net next_pc[19] -attr @rip O[19] -pin PC next_pc[19] -pin next_pc_i O[19]
load net next_pc[1] -attr @rip O[1] -pin PC next_pc[1] -pin next_pc_i O[1]
load net next_pc[20] -attr @rip O[20] -pin PC next_pc[20] -pin next_pc_i O[20]
load net next_pc[21] -attr @rip O[21] -pin PC next_pc[21] -pin next_pc_i O[21]
load net next_pc[22] -attr @rip O[22] -pin PC next_pc[22] -pin next_pc_i O[22]
load net next_pc[23] -attr @rip O[23] -pin PC next_pc[23] -pin next_pc_i O[23]
load net next_pc[24] -attr @rip O[24] -pin PC next_pc[24] -pin next_pc_i O[24]
load net next_pc[25] -attr @rip O[25] -pin PC next_pc[25] -pin next_pc_i O[25]
load net next_pc[26] -attr @rip O[26] -pin PC next_pc[26] -pin next_pc_i O[26]
load net next_pc[27] -attr @rip O[27] -pin PC next_pc[27] -pin next_pc_i O[27]
load net next_pc[28] -attr @rip O[28] -pin PC next_pc[28] -pin next_pc_i O[28]
load net next_pc[29] -attr @rip O[29] -pin PC next_pc[29] -pin next_pc_i O[29]
load net next_pc[2] -attr @rip O[2] -pin PC next_pc[2] -pin next_pc_i O[2]
load net next_pc[30] -attr @rip O[30] -pin PC next_pc[30] -pin next_pc_i O[30]
load net next_pc[31] -attr @rip O[31] -pin PC next_pc[31] -pin next_pc_i O[31]
load net next_pc[3] -attr @rip O[3] -pin PC next_pc[3] -pin next_pc_i O[3]
load net next_pc[4] -attr @rip O[4] -pin PC next_pc[4] -pin next_pc_i O[4]
load net next_pc[5] -attr @rip O[5] -pin PC next_pc[5] -pin next_pc_i O[5]
load net next_pc[6] -attr @rip O[6] -pin PC next_pc[6] -pin next_pc_i O[6]
load net next_pc[7] -attr @rip O[7] -pin PC next_pc[7] -pin next_pc_i O[7]
load net next_pc[8] -attr @rip O[8] -pin PC next_pc[8] -pin next_pc_i O[8]
load net next_pc[9] -attr @rip O[9] -pin PC next_pc[9] -pin next_pc_i O[9]
load net operand1[0] -attr @rip O[0] -pin ALU operand1[0] -pin operand1_i O[0]
load net operand1[10] -attr @rip O[10] -pin ALU operand1[10] -pin operand1_i O[10]
load net operand1[11] -attr @rip O[11] -pin ALU operand1[11] -pin operand1_i O[11]
load net operand1[12] -attr @rip O[12] -pin ALU operand1[12] -pin operand1_i O[12]
load net operand1[13] -attr @rip O[13] -pin ALU operand1[13] -pin operand1_i O[13]
load net operand1[14] -attr @rip O[14] -pin ALU operand1[14] -pin operand1_i O[14]
load net operand1[15] -attr @rip O[15] -pin ALU operand1[15] -pin operand1_i O[15]
load net operand1[16] -attr @rip O[16] -pin ALU operand1[16] -pin operand1_i O[16]
load net operand1[17] -attr @rip O[17] -pin ALU operand1[17] -pin operand1_i O[17]
load net operand1[18] -attr @rip O[18] -pin ALU operand1[18] -pin operand1_i O[18]
load net operand1[19] -attr @rip O[19] -pin ALU operand1[19] -pin operand1_i O[19]
load net operand1[1] -attr @rip O[1] -pin ALU operand1[1] -pin operand1_i O[1]
load net operand1[20] -attr @rip O[20] -pin ALU operand1[20] -pin operand1_i O[20]
load net operand1[21] -attr @rip O[21] -pin ALU operand1[21] -pin operand1_i O[21]
load net operand1[22] -attr @rip O[22] -pin ALU operand1[22] -pin operand1_i O[22]
load net operand1[23] -attr @rip O[23] -pin ALU operand1[23] -pin operand1_i O[23]
load net operand1[24] -attr @rip O[24] -pin ALU operand1[24] -pin operand1_i O[24]
load net operand1[25] -attr @rip O[25] -pin ALU operand1[25] -pin operand1_i O[25]
load net operand1[26] -attr @rip O[26] -pin ALU operand1[26] -pin operand1_i O[26]
load net operand1[27] -attr @rip O[27] -pin ALU operand1[27] -pin operand1_i O[27]
load net operand1[28] -attr @rip O[28] -pin ALU operand1[28] -pin operand1_i O[28]
load net operand1[29] -attr @rip O[29] -pin ALU operand1[29] -pin operand1_i O[29]
load net operand1[2] -attr @rip O[2] -pin ALU operand1[2] -pin operand1_i O[2]
load net operand1[30] -attr @rip O[30] -pin ALU operand1[30] -pin operand1_i O[30]
load net operand1[31] -attr @rip O[31] -pin ALU operand1[31] -pin operand1_i O[31]
load net operand1[3] -attr @rip O[3] -pin ALU operand1[3] -pin operand1_i O[3]
load net operand1[4] -attr @rip O[4] -pin ALU operand1[4] -pin operand1_i O[4]
load net operand1[5] -attr @rip O[5] -pin ALU operand1[5] -pin operand1_i O[5]
load net operand1[6] -attr @rip O[6] -pin ALU operand1[6] -pin operand1_i O[6]
load net operand1[7] -attr @rip O[7] -pin ALU operand1[7] -pin operand1_i O[7]
load net operand1[8] -attr @rip O[8] -pin ALU operand1[8] -pin operand1_i O[8]
load net operand1[9] -attr @rip O[9] -pin ALU operand1[9] -pin operand1_i O[9]
load net operand2[0] -attr @rip O[0] -pin ALU operand2[0] -pin operand2_i O[0]
load net operand2[10] -attr @rip O[10] -pin ALU operand2[10] -pin operand2_i O[10]
load net operand2[11] -attr @rip O[11] -pin ALU operand2[11] -pin operand2_i O[11]
load net operand2[12] -attr @rip O[12] -pin ALU operand2[12] -pin operand2_i O[12]
load net operand2[13] -attr @rip O[13] -pin ALU operand2[13] -pin operand2_i O[13]
load net operand2[14] -attr @rip O[14] -pin ALU operand2[14] -pin operand2_i O[14]
load net operand2[15] -attr @rip O[15] -pin ALU operand2[15] -pin operand2_i O[15]
load net operand2[16] -attr @rip O[16] -pin ALU operand2[16] -pin operand2_i O[16]
load net operand2[17] -attr @rip O[17] -pin ALU operand2[17] -pin operand2_i O[17]
load net operand2[18] -attr @rip O[18] -pin ALU operand2[18] -pin operand2_i O[18]
load net operand2[19] -attr @rip O[19] -pin ALU operand2[19] -pin operand2_i O[19]
load net operand2[1] -attr @rip O[1] -pin ALU operand2[1] -pin operand2_i O[1]
load net operand2[20] -attr @rip O[20] -pin ALU operand2[20] -pin operand2_i O[20]
load net operand2[21] -attr @rip O[21] -pin ALU operand2[21] -pin operand2_i O[21]
load net operand2[22] -attr @rip O[22] -pin ALU operand2[22] -pin operand2_i O[22]
load net operand2[23] -attr @rip O[23] -pin ALU operand2[23] -pin operand2_i O[23]
load net operand2[24] -attr @rip O[24] -pin ALU operand2[24] -pin operand2_i O[24]
load net operand2[25] -attr @rip O[25] -pin ALU operand2[25] -pin operand2_i O[25]
load net operand2[26] -attr @rip O[26] -pin ALU operand2[26] -pin operand2_i O[26]
load net operand2[27] -attr @rip O[27] -pin ALU operand2[27] -pin operand2_i O[27]
load net operand2[28] -attr @rip O[28] -pin ALU operand2[28] -pin operand2_i O[28]
load net operand2[29] -attr @rip O[29] -pin ALU operand2[29] -pin operand2_i O[29]
load net operand2[2] -attr @rip O[2] -pin ALU operand2[2] -pin operand2_i O[2]
load net operand2[30] -attr @rip O[30] -pin ALU operand2[30] -pin operand2_i O[30]
load net operand2[31] -attr @rip O[31] -pin ALU operand2[31] -pin operand2_i O[31]
load net operand2[3] -attr @rip O[3] -pin ALU operand2[3] -pin operand2_i O[3]
load net operand2[4] -attr @rip O[4] -pin ALU operand2[4] -pin operand2_i O[4]
load net operand2[5] -attr @rip O[5] -pin ALU operand2[5] -pin operand2_i O[5]
load net operand2[6] -attr @rip O[6] -pin ALU operand2[6] -pin operand2_i O[6]
load net operand2[7] -attr @rip O[7] -pin ALU operand2[7] -pin operand2_i O[7]
load net operand2[8] -attr @rip O[8] -pin ALU operand2[8] -pin operand2_i O[8]
load net operand2[9] -attr @rip O[9] -pin ALU operand2[9] -pin operand2_i O[9]
load net p_1_out -pin RTL_OR O -pin mux2_i S
netloc p_1_out 1 6 1 2170 580n
load net pc[0] -attr @rip pc[0] -pin InstructionMem read_address[0] -pin PC pc[0] -pin mux1_i I1[0] -pin operand1_i I0[0] -pin pc_plus_4_i I0[0]
load net pc[10] -attr @rip pc[10] -pin InstructionMem read_address[10] -pin PC pc[10] -pin mux1_i I1[10] -pin operand1_i I0[10] -pin pc_plus_4_i I0[10]
load net pc[11] -attr @rip pc[11] -pin InstructionMem read_address[11] -pin PC pc[11] -pin mux1_i I1[11] -pin operand1_i I0[11] -pin pc_plus_4_i I0[11]
load net pc[12] -attr @rip pc[12] -pin InstructionMem read_address[12] -pin PC pc[12] -pin mux1_i I1[12] -pin operand1_i I0[12] -pin pc_plus_4_i I0[12]
load net pc[13] -attr @rip pc[13] -pin InstructionMem read_address[13] -pin PC pc[13] -pin mux1_i I1[13] -pin operand1_i I0[13] -pin pc_plus_4_i I0[13]
load net pc[14] -attr @rip pc[14] -pin InstructionMem read_address[14] -pin PC pc[14] -pin mux1_i I1[14] -pin operand1_i I0[14] -pin pc_plus_4_i I0[14]
load net pc[15] -attr @rip pc[15] -pin InstructionMem read_address[15] -pin PC pc[15] -pin mux1_i I1[15] -pin operand1_i I0[15] -pin pc_plus_4_i I0[15]
load net pc[16] -attr @rip pc[16] -pin InstructionMem read_address[16] -pin PC pc[16] -pin mux1_i I1[16] -pin operand1_i I0[16] -pin pc_plus_4_i I0[16]
load net pc[17] -attr @rip pc[17] -pin InstructionMem read_address[17] -pin PC pc[17] -pin mux1_i I1[17] -pin operand1_i I0[17] -pin pc_plus_4_i I0[17]
load net pc[18] -attr @rip pc[18] -pin InstructionMem read_address[18] -pin PC pc[18] -pin mux1_i I1[18] -pin operand1_i I0[18] -pin pc_plus_4_i I0[18]
load net pc[19] -attr @rip pc[19] -pin InstructionMem read_address[19] -pin PC pc[19] -pin mux1_i I1[19] -pin operand1_i I0[19] -pin pc_plus_4_i I0[19]
load net pc[1] -attr @rip pc[1] -pin InstructionMem read_address[1] -pin PC pc[1] -pin mux1_i I1[1] -pin operand1_i I0[1] -pin pc_plus_4_i I0[1]
load net pc[20] -attr @rip pc[20] -pin InstructionMem read_address[20] -pin PC pc[20] -pin mux1_i I1[20] -pin operand1_i I0[20] -pin pc_plus_4_i I0[20]
load net pc[21] -attr @rip pc[21] -pin InstructionMem read_address[21] -pin PC pc[21] -pin mux1_i I1[21] -pin operand1_i I0[21] -pin pc_plus_4_i I0[21]
load net pc[22] -attr @rip pc[22] -pin InstructionMem read_address[22] -pin PC pc[22] -pin mux1_i I1[22] -pin operand1_i I0[22] -pin pc_plus_4_i I0[22]
load net pc[23] -attr @rip pc[23] -pin InstructionMem read_address[23] -pin PC pc[23] -pin mux1_i I1[23] -pin operand1_i I0[23] -pin pc_plus_4_i I0[23]
load net pc[24] -attr @rip pc[24] -pin InstructionMem read_address[24] -pin PC pc[24] -pin mux1_i I1[24] -pin operand1_i I0[24] -pin pc_plus_4_i I0[24]
load net pc[25] -attr @rip pc[25] -pin InstructionMem read_address[25] -pin PC pc[25] -pin mux1_i I1[25] -pin operand1_i I0[25] -pin pc_plus_4_i I0[25]
load net pc[26] -attr @rip pc[26] -pin InstructionMem read_address[26] -pin PC pc[26] -pin mux1_i I1[26] -pin operand1_i I0[26] -pin pc_plus_4_i I0[26]
load net pc[27] -attr @rip pc[27] -pin InstructionMem read_address[27] -pin PC pc[27] -pin mux1_i I1[27] -pin operand1_i I0[27] -pin pc_plus_4_i I0[27]
load net pc[28] -attr @rip pc[28] -pin InstructionMem read_address[28] -pin PC pc[28] -pin mux1_i I1[28] -pin operand1_i I0[28] -pin pc_plus_4_i I0[28]
load net pc[29] -attr @rip pc[29] -pin InstructionMem read_address[29] -pin PC pc[29] -pin mux1_i I1[29] -pin operand1_i I0[29] -pin pc_plus_4_i I0[29]
load net pc[2] -attr @rip pc[2] -pin InstructionMem read_address[2] -pin PC pc[2] -pin mux1_i I1[2] -pin operand1_i I0[2] -pin pc_plus_4_i I0[2]
load net pc[30] -attr @rip pc[30] -pin InstructionMem read_address[30] -pin PC pc[30] -pin mux1_i I1[30] -pin operand1_i I0[30] -pin pc_plus_4_i I0[30]
load net pc[31] -attr @rip pc[31] -pin InstructionMem read_address[31] -pin PC pc[31] -pin mux1_i I1[31] -pin operand1_i I0[31] -pin pc_plus_4_i I0[31]
load net pc[3] -attr @rip pc[3] -pin InstructionMem read_address[3] -pin PC pc[3] -pin mux1_i I1[3] -pin operand1_i I0[3] -pin pc_plus_4_i I0[3]
load net pc[4] -attr @rip pc[4] -pin InstructionMem read_address[4] -pin PC pc[4] -pin mux1_i I1[4] -pin operand1_i I0[4] -pin pc_plus_4_i I0[4]
load net pc[5] -attr @rip pc[5] -pin InstructionMem read_address[5] -pin PC pc[5] -pin mux1_i I1[5] -pin operand1_i I0[5] -pin pc_plus_4_i I0[5]
load net pc[6] -attr @rip pc[6] -pin InstructionMem read_address[6] -pin PC pc[6] -pin mux1_i I1[6] -pin operand1_i I0[6] -pin pc_plus_4_i I0[6]
load net pc[7] -attr @rip pc[7] -pin InstructionMem read_address[7] -pin PC pc[7] -pin mux1_i I1[7] -pin operand1_i I0[7] -pin pc_plus_4_i I0[7]
load net pc[8] -attr @rip pc[8] -pin InstructionMem read_address[8] -pin PC pc[8] -pin mux1_i I1[8] -pin operand1_i I0[8] -pin pc_plus_4_i I0[8]
load net pc[9] -attr @rip pc[9] -pin InstructionMem read_address[9] -pin PC pc[9] -pin mux1_i I1[9] -pin operand1_i I0[9] -pin pc_plus_4_i I0[9]
load net pc_plus_4[0] -attr @rip O[0] -pin pc_plus_4_i O[0] -pin write_data_i I0[0]
load net pc_plus_4[10] -attr @rip O[10] -pin pc_plus_4_i O[10] -pin write_data_i I0[10]
load net pc_plus_4[11] -attr @rip O[11] -pin pc_plus_4_i O[11] -pin write_data_i I0[11]
load net pc_plus_4[12] -attr @rip O[12] -pin pc_plus_4_i O[12] -pin write_data_i I0[12]
load net pc_plus_4[13] -attr @rip O[13] -pin pc_plus_4_i O[13] -pin write_data_i I0[13]
load net pc_plus_4[14] -attr @rip O[14] -pin pc_plus_4_i O[14] -pin write_data_i I0[14]
load net pc_plus_4[15] -attr @rip O[15] -pin pc_plus_4_i O[15] -pin write_data_i I0[15]
load net pc_plus_4[16] -attr @rip O[16] -pin pc_plus_4_i O[16] -pin write_data_i I0[16]
load net pc_plus_4[17] -attr @rip O[17] -pin pc_plus_4_i O[17] -pin write_data_i I0[17]
load net pc_plus_4[18] -attr @rip O[18] -pin pc_plus_4_i O[18] -pin write_data_i I0[18]
load net pc_plus_4[19] -attr @rip O[19] -pin pc_plus_4_i O[19] -pin write_data_i I0[19]
load net pc_plus_4[1] -attr @rip O[1] -pin pc_plus_4_i O[1] -pin write_data_i I0[1]
load net pc_plus_4[20] -attr @rip O[20] -pin pc_plus_4_i O[20] -pin write_data_i I0[20]
load net pc_plus_4[21] -attr @rip O[21] -pin pc_plus_4_i O[21] -pin write_data_i I0[21]
load net pc_plus_4[22] -attr @rip O[22] -pin pc_plus_4_i O[22] -pin write_data_i I0[22]
load net pc_plus_4[23] -attr @rip O[23] -pin pc_plus_4_i O[23] -pin write_data_i I0[23]
load net pc_plus_4[24] -attr @rip O[24] -pin pc_plus_4_i O[24] -pin write_data_i I0[24]
load net pc_plus_4[25] -attr @rip O[25] -pin pc_plus_4_i O[25] -pin write_data_i I0[25]
load net pc_plus_4[26] -attr @rip O[26] -pin pc_plus_4_i O[26] -pin write_data_i I0[26]
load net pc_plus_4[27] -attr @rip O[27] -pin pc_plus_4_i O[27] -pin write_data_i I0[27]
load net pc_plus_4[28] -attr @rip O[28] -pin pc_plus_4_i O[28] -pin write_data_i I0[28]
load net pc_plus_4[29] -attr @rip O[29] -pin pc_plus_4_i O[29] -pin write_data_i I0[29]
load net pc_plus_4[2] -attr @rip O[2] -pin pc_plus_4_i O[2] -pin write_data_i I0[2]
load net pc_plus_4[30] -attr @rip O[30] -pin pc_plus_4_i O[30] -pin write_data_i I0[30]
load net pc_plus_4[31] -attr @rip O[31] -pin pc_plus_4_i O[31] -pin write_data_i I0[31]
load net pc_plus_4[3] -attr @rip O[3] -pin pc_plus_4_i O[3] -pin write_data_i I0[3]
load net pc_plus_4[4] -attr @rip O[4] -pin pc_plus_4_i O[4] -pin write_data_i I0[4]
load net pc_plus_4[5] -attr @rip O[5] -pin pc_plus_4_i O[5] -pin write_data_i I0[5]
load net pc_plus_4[6] -attr @rip O[6] -pin pc_plus_4_i O[6] -pin write_data_i I0[6]
load net pc_plus_4[7] -attr @rip O[7] -pin pc_plus_4_i O[7] -pin write_data_i I0[7]
load net pc_plus_4[8] -attr @rip O[8] -pin pc_plus_4_i O[8] -pin write_data_i I0[8]
load net pc_plus_4[9] -attr @rip O[9] -pin pc_plus_4_i O[9] -pin write_data_i I0[9]
load net pc_src -pin CU PcSrc -pin mux1_i S
netloc pc_src 1 1 6 340 170 NJ 170 NJ 170 NJ 170 NJ 170 2210J
load net read_data[0] -attr @rip read_data[0] -pin DataMem read_data[0] -pin mem_reg_mux_i I0[0]
load net read_data[10] -attr @rip read_data[10] -pin DataMem read_data[10] -pin mem_reg_mux_i I0[10]
load net read_data[11] -attr @rip read_data[11] -pin DataMem read_data[11] -pin mem_reg_mux_i I0[11]
load net read_data[12] -attr @rip read_data[12] -pin DataMem read_data[12] -pin mem_reg_mux_i I0[12]
load net read_data[13] -attr @rip read_data[13] -pin DataMem read_data[13] -pin mem_reg_mux_i I0[13]
load net read_data[14] -attr @rip read_data[14] -pin DataMem read_data[14] -pin mem_reg_mux_i I0[14]
load net read_data[15] -attr @rip read_data[15] -pin DataMem read_data[15] -pin mem_reg_mux_i I0[15]
load net read_data[16] -attr @rip read_data[16] -pin DataMem read_data[16] -pin mem_reg_mux_i I0[16]
load net read_data[17] -attr @rip read_data[17] -pin DataMem read_data[17] -pin mem_reg_mux_i I0[17]
load net read_data[18] -attr @rip read_data[18] -pin DataMem read_data[18] -pin mem_reg_mux_i I0[18]
load net read_data[19] -attr @rip read_data[19] -pin DataMem read_data[19] -pin mem_reg_mux_i I0[19]
load net read_data[1] -attr @rip read_data[1] -pin DataMem read_data[1] -pin mem_reg_mux_i I0[1]
load net read_data[20] -attr @rip read_data[20] -pin DataMem read_data[20] -pin mem_reg_mux_i I0[20]
load net read_data[21] -attr @rip read_data[21] -pin DataMem read_data[21] -pin mem_reg_mux_i I0[21]
load net read_data[22] -attr @rip read_data[22] -pin DataMem read_data[22] -pin mem_reg_mux_i I0[22]
load net read_data[23] -attr @rip read_data[23] -pin DataMem read_data[23] -pin mem_reg_mux_i I0[23]
load net read_data[24] -attr @rip read_data[24] -pin DataMem read_data[24] -pin mem_reg_mux_i I0[24]
load net read_data[25] -attr @rip read_data[25] -pin DataMem read_data[25] -pin mem_reg_mux_i I0[25]
load net read_data[26] -attr @rip read_data[26] -pin DataMem read_data[26] -pin mem_reg_mux_i I0[26]
load net read_data[27] -attr @rip read_data[27] -pin DataMem read_data[27] -pin mem_reg_mux_i I0[27]
load net read_data[28] -attr @rip read_data[28] -pin DataMem read_data[28] -pin mem_reg_mux_i I0[28]
load net read_data[29] -attr @rip read_data[29] -pin DataMem read_data[29] -pin mem_reg_mux_i I0[29]
load net read_data[2] -attr @rip read_data[2] -pin DataMem read_data[2] -pin mem_reg_mux_i I0[2]
load net read_data[30] -attr @rip read_data[30] -pin DataMem read_data[30] -pin mem_reg_mux_i I0[30]
load net read_data[31] -attr @rip read_data[31] -pin DataMem read_data[31] -pin mem_reg_mux_i I0[31]
load net read_data[3] -attr @rip read_data[3] -pin DataMem read_data[3] -pin mem_reg_mux_i I0[3]
load net read_data[4] -attr @rip read_data[4] -pin DataMem read_data[4] -pin mem_reg_mux_i I0[4]
load net read_data[5] -attr @rip read_data[5] -pin DataMem read_data[5] -pin mem_reg_mux_i I0[5]
load net read_data[6] -attr @rip read_data[6] -pin DataMem read_data[6] -pin mem_reg_mux_i I0[6]
load net read_data[7] -attr @rip read_data[7] -pin DataMem read_data[7] -pin mem_reg_mux_i I0[7]
load net read_data[8] -attr @rip read_data[8] -pin DataMem read_data[8] -pin mem_reg_mux_i I0[8]
load net read_data[9] -attr @rip read_data[9] -pin DataMem read_data[9] -pin mem_reg_mux_i I0[9]
load net reg_write -pin CU RegWrite -pin RegFile reg_write
netloc reg_write 1 1 5 360 210 NJ 210 NJ 210 NJ 210 1840J
load net reset -pin PC reset -port reset
netloc reset 1 0 9 NJ 650 NJ 650 NJ 650 NJ 650 NJ 650 NJ 650 NJ 650 NJ 650 2810J
load net write_data[0] -attr @rip O[0] -pin RegFile write_data[0] -pin write_data_i O[0]
load net write_data[10] -attr @rip O[10] -pin RegFile write_data[10] -pin write_data_i O[10]
load net write_data[11] -attr @rip O[11] -pin RegFile write_data[11] -pin write_data_i O[11]
load net write_data[12] -attr @rip O[12] -pin RegFile write_data[12] -pin write_data_i O[12]
load net write_data[13] -attr @rip O[13] -pin RegFile write_data[13] -pin write_data_i O[13]
load net write_data[14] -attr @rip O[14] -pin RegFile write_data[14] -pin write_data_i O[14]
load net write_data[15] -attr @rip O[15] -pin RegFile write_data[15] -pin write_data_i O[15]
load net write_data[16] -attr @rip O[16] -pin RegFile write_data[16] -pin write_data_i O[16]
load net write_data[17] -attr @rip O[17] -pin RegFile write_data[17] -pin write_data_i O[17]
load net write_data[18] -attr @rip O[18] -pin RegFile write_data[18] -pin write_data_i O[18]
load net write_data[19] -attr @rip O[19] -pin RegFile write_data[19] -pin write_data_i O[19]
load net write_data[1] -attr @rip O[1] -pin RegFile write_data[1] -pin write_data_i O[1]
load net write_data[20] -attr @rip O[20] -pin RegFile write_data[20] -pin write_data_i O[20]
load net write_data[21] -attr @rip O[21] -pin RegFile write_data[21] -pin write_data_i O[21]
load net write_data[22] -attr @rip O[22] -pin RegFile write_data[22] -pin write_data_i O[22]
load net write_data[23] -attr @rip O[23] -pin RegFile write_data[23] -pin write_data_i O[23]
load net write_data[24] -attr @rip O[24] -pin RegFile write_data[24] -pin write_data_i O[24]
load net write_data[25] -attr @rip O[25] -pin RegFile write_data[25] -pin write_data_i O[25]
load net write_data[26] -attr @rip O[26] -pin RegFile write_data[26] -pin write_data_i O[26]
load net write_data[27] -attr @rip O[27] -pin RegFile write_data[27] -pin write_data_i O[27]
load net write_data[28] -attr @rip O[28] -pin RegFile write_data[28] -pin write_data_i O[28]
load net write_data[29] -attr @rip O[29] -pin RegFile write_data[29] -pin write_data_i O[29]
load net write_data[2] -attr @rip O[2] -pin RegFile write_data[2] -pin write_data_i O[2]
load net write_data[30] -attr @rip O[30] -pin RegFile write_data[30] -pin write_data_i O[30]
load net write_data[31] -attr @rip O[31] -pin RegFile write_data[31] -pin write_data_i O[31]
load net write_data[3] -attr @rip O[3] -pin RegFile write_data[3] -pin write_data_i O[3]
load net write_data[4] -attr @rip O[4] -pin RegFile write_data[4] -pin write_data_i O[4]
load net write_data[5] -attr @rip O[5] -pin RegFile write_data[5] -pin write_data_i O[5]
load net write_data[6] -attr @rip O[6] -pin RegFile write_data[6] -pin write_data_i O[6]
load net write_data[7] -attr @rip O[7] -pin RegFile write_data[7] -pin write_data_i O[7]
load net write_data[8] -attr @rip O[8] -pin RegFile write_data[8] -pin write_data_i O[8]
load net write_data[9] -attr @rip O[9] -pin RegFile write_data[9] -pin write_data_i O[9]
load netBundle @alu_result 32 alu_result[31] alu_result[30] alu_result[29] alu_result[28] alu_result[27] alu_result[26] alu_result[25] alu_result[24] alu_result[23] alu_result[22] alu_result[21] alu_result[20] alu_result[19] alu_result[18] alu_result[17] alu_result[16] alu_result[15] alu_result[14] alu_result[13] alu_result[12] alu_result[11] alu_result[10] alu_result[9] alu_result[8] alu_result[7] alu_result[6] alu_result[5] alu_result[4] alu_result[3] alu_result[2] alu_result[1] alu_result[0] -autobundled
netbloc @alu_result 1 1 12 440 350 800 590 NJ 590 1470 670 NJ 670 NJ 670 NJ 670 NJ 670 NJ 670 NJ 670 NJ 670 4000
load netBundle @alu_control 4 alu_control[3] alu_control[2] alu_control[1] alu_control[0] -autobundled
netbloc @alu_control 1 11 1 3720 80n
load netBundle @alu_op 3 alu_op[2] alu_op[1] alu_op[0] -autobundled
netbloc @alu_op 1 1 10 280J 130 NJ 130 NJ 130 NJ 130 NJ 130 NJ 130 NJ 130 NJ 130 NJ 130 3350
load netBundle @read_data 32 read_data[31] read_data[30] read_data[29] read_data[28] read_data[27] read_data[26] read_data[25] read_data[24] read_data[23] read_data[22] read_data[21] read_data[20] read_data[19] read_data[18] read_data[17] read_data[16] read_data[15] read_data[14] read_data[13] read_data[12] read_data[11] read_data[10] read_data[9] read_data[8] read_data[7] read_data[6] read_data[5] read_data[4] read_data[3] read_data[2] read_data[1] read_data[0] -autobundled
netbloc @read_data 1 2 1 760 260n
load netBundle @immediate 32 immediate[31] immediate[30] immediate[29] immediate[28] immediate[27] immediate[26] immediate[25] immediate[24] immediate[23] immediate[22] immediate[21] immediate[20] immediate[19] immediate[18] immediate[17] immediate[16] immediate[15] immediate[14] immediate[13] immediate[12] immediate[11] immediate[10] immediate[9] immediate[8] immediate[7] immediate[6] immediate[5] immediate[4] immediate[3] immediate[2] immediate[1] immediate[0] -autobundled
netbloc @immediate 1 3 8 1150 550 1510J 530 NJ 530 2270 420 NJ 420 NJ 420 NJ 420 NJ
load netBundle @instruction 32 instruction[31] instruction[30] instruction[29] instruction[28] instruction[27] instruction[26] instruction[25] instruction[24] instruction[23] instruction[22] instruction[21] instruction[20] instruction[19] instruction[18] instruction[17] instruction[16] instruction[15] instruction[14] instruction[13] instruction[12] instruction[11] instruction[10] instruction[9] instruction[8] instruction[7] instruction[6] instruction[5] instruction[4] instruction[3] instruction[2] instruction[1] instruction[0] -autobundled
netbloc @instruction 1 0 11 20 530 NJ 530 820 490 NJ 490 NJ 490 1800 410 2250J 380 NJ 380 NJ 380 NJ 380 3370
load netBundle @pc 32 pc[31] pc[30] pc[29] pc[28] pc[27] pc[26] pc[25] pc[24] pc[23] pc[22] pc[21] pc[20] pc[19] pc[18] pc[17] pc[16] pc[15] pc[14] pc[13] pc[12] pc[11] pc[10] pc[9] pc[8] pc[7] pc[6] pc[5] pc[4] pc[3] pc[2] pc[1] pc[0] -autobundled
netbloc @pc 1 3 8 1170 350 NJ 350 1760J 390 2230 400 NJ 400 NJ 400 3060 180 NJ
load netBundle @RTL_MUX_n_ 32 RTL_MUX_n_0 RTL_MUX_n_1 RTL_MUX_n_2 RTL_MUX_n_3 RTL_MUX_n_4 RTL_MUX_n_5 RTL_MUX_n_6 RTL_MUX_n_7 RTL_MUX_n_8 RTL_MUX_n_9 RTL_MUX_n_10 RTL_MUX_n_11 RTL_MUX_n_12 RTL_MUX_n_13 RTL_MUX_n_14 RTL_MUX_n_15 RTL_MUX_n_16 RTL_MUX_n_17 RTL_MUX_n_18 RTL_MUX_n_19 RTL_MUX_n_20 RTL_MUX_n_21 RTL_MUX_n_22 RTL_MUX_n_23 RTL_MUX_n_24 RTL_MUX_n_25 RTL_MUX_n_26 RTL_MUX_n_27 RTL_MUX_n_28 RTL_MUX_n_29 RTL_MUX_n_30 RTL_MUX_n_31 -autobundled
netbloc @RTL_MUX_n_ 1 4 1 1490 270n
load netBundle @data1 32 data1[31] data1[30] data1[29] data1[28] data1[27] data1[26] data1[25] data1[24] data1[23] data1[22] data1[21] data1[20] data1[19] data1[18] data1[17] data1[16] data1[15] data1[14] data1[13] data1[12] data1[11] data1[10] data1[9] data1[8] data1[7] data1[6] data1[5] data1[4] data1[3] data1[2] data1[1] data1[0] -autobundled
netbloc @data1 1 6 5 2190 200 NJ 200 NJ 200 NJ 200 NJ
load netBundle @data2 32 data2[31] data2[30] data2[29] data2[28] data2[27] data2[26] data2[25] data2[24] data2[23] data2[22] data2[21] data2[20] data2[19] data2[18] data2[17] data2[16] data2[15] data2[14] data2[13] data2[12] data2[11] data2[10] data2[9] data2[8] data2[7] data2[6] data2[5] data2[4] data2[3] data2[2] data2[1] data2[0] -autobundled
netbloc @data2 1 1 10 440 550 NJ 550 1130J 530 1490J 510 1840J 460 2170 440 NJ 440 NJ 440 NJ 440 NJ
load netBundle @mem_reg_mux 32 mem_reg_mux[31] mem_reg_mux[30] mem_reg_mux[29] mem_reg_mux[28] mem_reg_mux[27] mem_reg_mux[26] mem_reg_mux[25] mem_reg_mux[24] mem_reg_mux[23] mem_reg_mux[22] mem_reg_mux[21] mem_reg_mux[20] mem_reg_mux[19] mem_reg_mux[18] mem_reg_mux[17] mem_reg_mux[16] mem_reg_mux[15] mem_reg_mux[14] mem_reg_mux[13] mem_reg_mux[12] mem_reg_mux[11] mem_reg_mux[10] mem_reg_mux[9] mem_reg_mux[8] mem_reg_mux[7] mem_reg_mux[6] mem_reg_mux[5] mem_reg_mux[4] mem_reg_mux[3] mem_reg_mux[2] mem_reg_mux[1] mem_reg_mux[0] -autobundled
netbloc @mem_reg_mux 1 3 1 1130 270n
load netBundle @mux1 32 mux1[31] mux1[30] mux1[29] mux1[28] mux1[27] mux1[26] mux1[25] mux1[24] mux1[23] mux1[22] mux1[21] mux1[20] mux1[19] mux1[18] mux1[17] mux1[16] mux1[15] mux1[14] mux1[13] mux1[12] mux1[11] mux1[10] mux1[9] mux1[8] mux1[7] mux1[6] mux1[5] mux1[4] mux1[3] mux1[2] mux1[1] mux1[0] -autobundled
netbloc @mux1 1 7 1 2610 300n
load netBundle @mux2 32 mux2[31] mux2[30] mux2[29] mux2[28] mux2[27] mux2[26] mux2[25] mux2[24] mux2[23] mux2[22] mux2[21] mux2[20] mux2[19] mux2[18] mux2[17] mux2[16] mux2[15] mux2[14] mux2[13] mux2[12] mux2[11] mux2[10] mux2[9] mux2[8] mux2[7] mux2[6] mux2[5] mux2[4] mux2[3] mux2[2] mux2[1] mux2[0] -autobundled
netbloc @mux2 1 7 1 2610 540n
load netBundle @next_pc 32 next_pc[31] next_pc[30] next_pc[29] next_pc[28] next_pc[27] next_pc[26] next_pc[25] next_pc[24] next_pc[23] next_pc[22] next_pc[21] next_pc[20] next_pc[19] next_pc[18] next_pc[17] next_pc[16] next_pc[15] next_pc[14] next_pc[13] next_pc[12] next_pc[11] next_pc[10] next_pc[9] next_pc[8] next_pc[7] next_pc[6] next_pc[5] next_pc[4] next_pc[3] next_pc[2] next_pc[1] next_pc[0] -autobundled
netbloc @next_pc 1 8 1 N 530
load netBundle @operand1 32 operand1[31] operand1[30] operand1[29] operand1[28] operand1[27] operand1[26] operand1[25] operand1[24] operand1[23] operand1[22] operand1[21] operand1[20] operand1[19] operand1[18] operand1[17] operand1[16] operand1[15] operand1[14] operand1[13] operand1[12] operand1[11] operand1[10] operand1[9] operand1[8] operand1[7] operand1[6] operand1[5] operand1[4] operand1[3] operand1[2] operand1[1] operand1[0] -autobundled
netbloc @operand1 1 11 1 N 190
load netBundle @operand2 32 operand2[31] operand2[30] operand2[29] operand2[28] operand2[27] operand2[26] operand2[25] operand2[24] operand2[23] operand2[22] operand2[21] operand2[20] operand2[19] operand2[18] operand2[17] operand2[16] operand2[15] operand2[14] operand2[13] operand2[12] operand2[11] operand2[10] operand2[9] operand2[8] operand2[7] operand2[6] operand2[5] operand2[4] operand2[3] operand2[2] operand2[1] operand2[0] -autobundled
netbloc @operand2 1 11 1 3720 210n
load netBundle @pc_plus_4 32 pc_plus_4[31] pc_plus_4[30] pc_plus_4[29] pc_plus_4[28] pc_plus_4[27] pc_plus_4[26] pc_plus_4[25] pc_plus_4[24] pc_plus_4[23] pc_plus_4[22] pc_plus_4[21] pc_plus_4[20] pc_plus_4[19] pc_plus_4[18] pc_plus_4[17] pc_plus_4[16] pc_plus_4[15] pc_plus_4[14] pc_plus_4[13] pc_plus_4[12] pc_plus_4[11] pc_plus_4[10] pc_plus_4[9] pc_plus_4[8] pc_plus_4[7] pc_plus_4[6] pc_plus_4[5] pc_plus_4[4] pc_plus_4[3] pc_plus_4[2] pc_plus_4[1] pc_plus_4[0] -autobundled
netbloc @pc_plus_4 1 4 1 1470J 400n
load netBundle @write_data 32 write_data[31] write_data[30] write_data[29] write_data[28] write_data[27] write_data[26] write_data[25] write_data[24] write_data[23] write_data[22] write_data[21] write_data[20] write_data[19] write_data[18] write_data[17] write_data[16] write_data[15] write_data[14] write_data[13] write_data[12] write_data[11] write_data[10] write_data[9] write_data[8] write_data[7] write_data[6] write_data[5] write_data[4] write_data[3] write_data[2] write_data[1] write_data[0] -autobundled
netbloc @write_data 1 5 1 1780 330n
levelinfo -pg 1 0 120 560 950 1350 1640 1980 2490 2690 2920 3090 3540 3840 4020
pagesize -pg 1 -db -bbox -sgen -80 0 4020 680
show
fullfit
#
# initialize ictrl to current module rv32i_core work:rv32i_core:NOFILE
ictrl init topinfo |
