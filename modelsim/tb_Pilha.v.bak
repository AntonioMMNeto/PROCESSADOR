`timescale 10ns/1ns
module tb_Pilha;
parameter Largura_da_pilha=16 ,Tamanho_da_pilha=64 ,Tamanho_endereco=6;

reg [Largura_da_pilha-1:0] Data_in_tb;
wire [Largura_da_pilha-1:0] Data_out_tb;
reg [Tamanho_endereco-1:0] Endereco_tb;
reg io_tb;
reg clk_tb;

assign Data_out_tb=Data_in_tb;

reg [Largura_da_pilha-1:0] valor [0:Tamanho_da_pilha-1];
reg [Tamanho_endereco-1:0] y;

Pilha Pilha_tb(.Data(Data_out_tb), .Endereco(Endereco_tb), .clk(clk_tb), .io(io_tb));

integer saida[0:Tamanho_da_pilha-1],s=0;


initial
begin
$monitor("CARREGANDO VALORES ALEATORIOS NA PILHA");
$display("");
for(y=0 ; (y+1) < Tamanho_da_pilha ; y=y+1)
begin
	valor[y]=$random(10);
	io_tb=1;
	#10
	Endereco_tb=y;
	Data_in_tb=valor[y];
	#1
	clk_tb=1;
	

	#1
	clk_tb=0;
	#5
	io_tb=0;
end
s=1;
end


always 
begin
wait(s);
$monitor("CHECANDO SE A SAÍDA DA PILHA É IGUAL AOS VALORES DA ENTRADA");
$display("");
for(y=0 ; y <(Tamanho_da_pilha-1) ; y=y+1)
begin
Endereco_tb=y;
saida[y]=Data_out_tb;
io_tb=0;
clk_tb=1;
#10
clk_tb=0;
if(valor[y]==saida[y])
begin
$monitor("Valor %d OK",y);
end
else
begin
$monitor("Valor %d errado",y);
end
end
$stop;
end


/*reg [Tamanho_Da_Palavra-1:0] x,z;

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
end*/
endmodule
