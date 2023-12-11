module Pilha (Data,Endereco,clk,io);
parameter Largura_da_pilha=16 ,Tamanho_da_pilha=64 ,Tamanho_endereco=6;

//Declaração de portas
inout wire [Largura_da_pilha-1:0] Data; //A porta Data é bidirecional.
input wire [Largura_da_pilha-1:0]Endereco;
input wire clk;
input wire io;


//Declaração de memoria e fios internos
reg [Largura_da_pilha-1:0] BancoReg [Tamanho_da_pilha-1:0];
reg  [Largura_da_pilha-1:0] wo;
wire [Largura_da_pilha-1:0] wI;


// geração dos bufs de controle de entrada/saída
genvar x;
generate 
	for(x = 0; x < Largura_da_pilha;x = x + 1)
		begin:bf
		bufif0  ctrl_o  (Data[x],wo[x],io);
		bufif1  ctrl_i  (wI[x],Data[x],io);
		end
endgenerate



always @(posedge clk)
begin
	if (io)
		begin
			BancoReg[Endereco]<= wI;
		end
	else
		begin
			wo<= BancoReg[Endereco];
		end
end
endmodule