`timescale 1ns/1ns
module tb_temp;
parameter Tamanho_Da_Palavra=16;
reg [Tamanho_Da_Palavra-1:0] Data_in_tb;
wire [Tamanho_Da_Palavra-1:0] Data_out_tb;
wire [Tamanho_Da_Palavra-1:0] saidaUla_tb;
reg io_tb;
assign Data_out_tb=Data_in_tb;

temp DUB(.Data(Data_out_tb), .saidaUla(saidaUla_tb), .io(io_tb));

integer y;
reg [Tamanho_Da_Palavra-1:0] x,z;

always 
begin 
for(y=0 ; y < 10; y=y+1)
begin
$display("y= %d",y);
 x=$random();
io_tb=1;
#10 Data_in_tb=x;
#1 io_tb=0;
#5 io_tb=1;
#20 z=saidaUla_tb;
#10 $display("saida %d valor %d  %d",y,z,x);
// $display("saida %d valor %d %d",y,z,DUB.io);
//#10 io_tb=0;
end
end
endmodule