// Copyright (C) 2023  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 22.1std.2 Build 922 07/20/2023 SC Lite Edition"
// CREATED		"Sun Dec 10 10:47:45 2023"

module Block1(
	clk,
	processar,
	reset,
	clk11,
	io,
	clk12,
	io13,
	io14,
	ctrl_0,
	ctrl_1,
	ctrl_2,
	ctrl_3,
	ctrl_4,
	ctrl_5,
	Endereco,
	op,
	concluido,
	io_0,
	io_1
);


input wire	clk;
input wire	processar;
input wire	reset;
input wire	clk11;
input wire	io;
input wire	clk12;
input wire	io13;
input wire	io14;
input wire	[1:0] ctrl_0;
input wire	[1:0] ctrl_1;
input wire	[1:0] ctrl_2;
input wire	[1:0] ctrl_3;
input wire	[1:0] ctrl_4;
input wire	[1:0] ctrl_5;
input wire	[15:0] Endereco;
input wire	[3:0] op;
output wire	concluido;
inout wire	[15:0] io_0;
inout wire	[15:0] io_1;

wire	[15:0] gdfx_temp0;
wire	[15:0] gdfx_temp1;
wire	[15:0] gdfx_temp2;
wire	[15:0] SYNTHESIZED_WIRE_0;
wire	[15:0] SYNTHESIZED_WIRE_1;
wire	[15:0] SYNTHESIZED_WIRE_2;





ULA	b2v_inst(
	.clk(clk),
	.processar(processar),
	.reset(reset),
	.ETp1(SYNTHESIZED_WIRE_0),
	.ETp2(SYNTHESIZED_WIRE_1),
	.op(op),
	.concluido(concluido),
	.Data(SYNTHESIZED_WIRE_2));
	defparam	b2v_inst.cmp = 8;
	defparam	b2v_inst.divisao = 3;
	defparam	b2v_inst.e = 4;
	defparam	b2v_inst.espera = 0;
	defparam	b2v_inst.executando = 1;
	defparam	b2v_inst.multiplicacao = 2;
	defparam	b2v_inst.nao = 9;
	defparam	b2v_inst.ne = 5;
	defparam	b2v_inst.ou = 6;
	defparam	b2v_inst.saidaDados = 2;
	defparam	b2v_inst.soma = 0;
	defparam	b2v_inst.subtracao = 1;
	defparam	b2v_inst.Tamanho_Da_Palavra = 16;
	defparam	b2v_inst.Xou = 7;


Barramento	b2v_inst10(
	.clk(clk12),
	.ctrl_0(ctrl_0),
	.ctrl_1(ctrl_1),
	.ctrl_2(ctrl_2),
	.ctrl_3(ctrl_3),
	.ctrl_4(ctrl_4),
	.ctrl_5(ctrl_5),
	.io_0(io_0),
	.io_1(io_1),
	.io_2(SYNTHESIZED_WIRE_2),
	.io_3(gdfx_temp1),
	.io_4(gdfx_temp2),
	.io_5(gdfx_temp0)
	
	
	
	
	
	);
	defparam	b2v_inst10.Largura_barramento = 16;


Pilha	b2v_inst3(
	.clk(clk11),
	.io(io),
	.Data(gdfx_temp0),
	.Endereco(Endereco)
	);
	defparam	b2v_inst3.Largura_da_pilha = 16;
	defparam	b2v_inst3.Tamanho_da_pilha = 64;
	defparam	b2v_inst3.Tamanho_endereco = 6;


temp	b2v_temp1(
	.io(io14),
	.Data(gdfx_temp1),
	
	.saidaUla(SYNTHESIZED_WIRE_0));
	defparam	b2v_temp1.Tamanho_Da_Palavra = 16;


temp	b2v_temp2(
	.io(io13),
	.Data(gdfx_temp2),
	
	.saidaUla(SYNTHESIZED_WIRE_1));
	defparam	b2v_temp2.Tamanho_Da_Palavra = 16;


endmodule
