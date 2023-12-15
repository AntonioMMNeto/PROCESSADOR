`timescale 10ns/10ns
module tb_Barramento;
Barramento(io_0,io_1,io_2,io_3,io_4,io_5,ctrl_0,ctrl_1,ctrl_2,ctrl_3,ctrl_4,ctrl_5,clk);

parameter Largura_barramento=16;

inout reg [Largura_barramento-1:0]io_0,io_1,io_2,io_3,io_4,io_5;
input reg [1:0] ctrl_0,ctrl_1,ctrl_2,ctrl_3,ctrl_4,ctrl_5; //bit 0 ler; bit 1 escrever
input wire clk;reg [Largura_da_pilha-1:0] Data_in_tb;
wire [Largura_da_pilha-1:0] Data_out_tb;
reg [Tamanho_endereco-1:0] Endereco_tb;
reg io_tb;
reg clk_tb;

assign Data_out_tb=Data_in_tb;

reg [Largura_da_pilha-1:0] valor [0:Tamanho_da_pilha-1];
reg [Tamanho_endereco-1:0] y;

Pilha Pilha_tb(.Data(Data_out_tb), .Endereco(Endereco_tb), .clk(clk_tb), .io(io_tb));

integer saida[0:Tamanho_da_pilha-1],s=0;
endmodule
