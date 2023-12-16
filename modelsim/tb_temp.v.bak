`timescale 10ns/10ns
module tb_temp;
parameter Tamanho_Da_Palavra=16;
reg [Tamanho_Da_Palavra-1:0] Data_in_tb;
wire [Tamanho_Da_Palavra-1:0] Data_out_tb;
wire [Tamanho_Da_Palavra-1:0] saidaUla_tb;
reg io_tb;
assign Data_out_tb=Data_in_tb;

temp DUV(.Data(Data_out_tb), .saidaUla(saidaUla_tb), .io(io_tb));

initial
begin
$monitor("Valor da Porta Para a Ula Alterado Para :%d",saidaUla_tb);
$display("");
end
integer y;
reg [Tamanho_Da_Palavra-1:0] x,z;

always 
begin 
$display("TESTE DO REGISTRADOR 'temp'");
for(y=0 ; y < 10; y=y+1)
begin
 x=$random();
io_tb=1;
#10 Data_in_tb=x;
#5 io_tb=0;
#10 io_tb=1;
#20 z=saidaUla_tb;
#10 $display("DADO DE ENTRADA %d VALOR SALVO NO REGISTRADOR %d VALOR NA SAIDA PARA A ULA %d",x,DUV.tmp,z);
$display("");
$display("DADO DDISPONIVEL PARA LEITURA NA PORTA DATA %d",Data_out_tb);
end
end
endmodule