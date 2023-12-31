`timescale 10ns/1ns
module tb_ULA;

parameter Tamanho_Da_Palavra=16; 
/*soma=0,
subtracao=1,
multiplicacao=2,
divisao=3,
 e=4,
 ne=5,
 ou=6,
 Xou=7,
 cmp=8,
 nao=9,
 espera=0,
 executando=1,
 saidaDados=2
 ;*/

wire concluido;
wire [Tamanho_Da_Palavra-1:0] Data_out_tb;
//reg [Tamanho_Da_Palavra-1:0] Data_in_tb;
reg [Tamanho_Da_Palavra-1:0] ETp1_tb; //entrada para temp1 
reg [Tamanho_Da_Palavra-1:0] ETp2_tb; //entrada para temp2 
reg [3:0]op_tb; //entrada da operação para a ula
reg clk_tb;
reg processar_tb;
reg reset_tb;
reg [Tamanho_Da_Palavra-1:0] valor_de_test_1_tb;
reg [Tamanho_Da_Palavra-1:0] valor_de_test_2_tb;
reg [Tamanho_Da_Palavra-1:0] valor_data;

//assign Data_out_tb=Data_in_tb;


initial
begin
$monitor("Estado da Maquina de estado da ULA :%d",ula_tb.estadoAtual);
	clk_tb=0;
end
ULA ula_tb(.concluido(concluido),.Data(Data_out_tb),.ETp1(ETp1_tb),.ETp2(ETp2_tb),.op(op_tb),.clk(clk_tb),.processar(processar_tb),.reset(reset_tb));
always
begin
	#1 clk_tb=~clk_tb;
end



task soma_teste();
begin
	reset_tb=1;
	#3
	reset_tb=0;
	#1
	valor_de_test_1_tb=$random();
	valor_de_test_2_tb=$random();
	op_tb=1;
	ETp1_tb=valor_de_test_1_tb;
	ETp2_tb=valor_de_test_2_tb;
	#10 processar_tb=1;

	#10 processar_tb=0;
	#10
	valor_de_test_1_tb=valor_de_test_1_tb - valor_de_test_2_tb;
	if(valor_de_test_1_tb==valor_data)
	begin
		$display("Valor de soma efetuardo corretamente");
	end
	else
	begin
		$display("Erro ao efetuardo soma");
	end
	
end
endtask

task ssubtracao_teste();
begin
	reset_tb=1;
	#3
	reset_tb=0;
	#1
	valor_de_test_1_tb=$random();
	valor_de_test_2_tb=$random();
	op_tb=0;
	ETp1_tb=valor_de_test_1_tb;
	ETp2_tb=valor_de_test_2_tb;
	#10 processar_tb=1;

	#10 processar_tb=0;
	#10
	valor_de_test_1_tb=valor_de_test_1_tb + valor_de_test_2_tb;
	if(valor_de_test_1_tb==valor_data)
	begin
		$display("Valor de subrita��o efetuardo corretamente");
	end
	else
	begin
		$display("Erro ao efetuardo subrita��o");
	end
	
end
endtask


task multiplicacao_teste();
begin
	reset_tb=1;
	#3
	reset_tb=0;
	#1
	valor_de_test_1_tb=$random();
	valor_de_test_2_tb=$random();
	op_tb=2;
	ETp1_tb=valor_de_test_1_tb;
	ETp2_tb=valor_de_test_2_tb;
	#10 processar_tb=1;

	#10 processar_tb=0;
	#10
	valor_de_test_1_tb=valor_de_test_1_tb * valor_de_test_2_tb;
	if(valor_de_test_1_tb==valor_data)
	begin
		$display("Valor de multiplicacao efetuardo corretamente");
	end
	else
	begin
		$display("Erro ao efetuardo multiplicacao");
	end
	
end
endtask

task divisao_teste();
begin
	reset_tb=1;
	#3
	reset_tb=0;
	#1
	valor_de_test_1_tb=$random();
	valor_de_test_2_tb=$random();
	op_tb=3;
	ETp1_tb=valor_de_test_1_tb;
	ETp2_tb=valor_de_test_2_tb;
	#10 processar_tb=1;

	#10 processar_tb=0;
	#10
	valor_de_test_1_tb=valor_de_test_1_tb / valor_de_test_2_tb;
	if(valor_de_test_1_tb==valor_data)
	begin
		$display("Valor de dovisap efetuardo corretamente");
	end
	else
	begin
		$display("Erro ao efetuardo divisao");
	end
	
end
endtask

task e_v_teste();
begin
	reset_tb=1;
	#3
	reset_tb=0;
	#1
	valor_de_test_1_tb=1;
	valor_de_test_2_tb=1;
	op_tb=4;
	ETp1_tb=valor_de_test_1_tb;
	ETp2_tb=valor_de_test_2_tb;
	#10 processar_tb=1;

	#10 processar_tb=0;
	#10
	if(1 && valor_data)
	begin
		$display("Opera��o E efetuardo corretamente");
	end
	else
	begin
		$display("Erro ao efetuardo Opera��o E");
	end
	
end
endtask


task e_f_teste();
begin
	reset_tb=1;
	#3
	reset_tb=0;
	#1
	valor_de_test_1_tb=1;
	valor_de_test_2_tb=0;
	op_tb=4;
	ETp1_tb=valor_de_test_1_tb;
	ETp2_tb=valor_de_test_2_tb;
	#10 processar_tb=1;

	#10 processar_tb=0;
	#10
	if(1 && !valor_data)
	begin
		$display("Opera��o E efetuardo corretamente");
	end
	else
	begin
		$display("Erro ao efetuardo Opera��o E");
	end
	
end
endtask

task comparacao_teste();
begin
	reset_tb=1;
	#3
	reset_tb=0;
	#1
	valor_de_test_1_tb=$random();
	valor_de_test_2_tb=$random();
	op_tb=8;
	ETp1_tb=valor_de_test_1_tb;
	ETp2_tb=valor_de_test_2_tb;
	#10 processar_tb=1;

	#10 processar_tb=0;
	#10
	valor_de_test_1_tb=valor_de_test_1_tb == valor_de_test_2_tb;
	if(valor_de_test_1_tb==valor_data)
	begin
		$display("Opera��o de compara��o efetuardo corretamente");
	end
	else
	begin
		$display("Erro ao efetuardo Opera��o de compara��o");
	end
	
end
endtask



always @(posedge concluido)
begin
#1
valor_data=Data_out_tb;
end


always
begin
soma_teste();
ssubtracao_teste();
multiplicacao_teste();
divisao_teste();
comparacao_teste();
e_f_teste();
e_v_teste();

#10

$stop;
end

endmodule
