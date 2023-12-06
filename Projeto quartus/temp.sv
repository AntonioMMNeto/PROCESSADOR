module temp (Data,saidaUla,io);

parameter Tamanho_Da_Palavra=16;

inout wire [Tamanho_Da_Palavra-1:0] Data;
output wire [Tamanho_Da_Palavra-1:0] saidaUla;
input wire io;

reg [Tamanho_Da_Palavra-1:0] tmp;
wire  [Tamanho_Da_Palavra-1:0] wo;
wire [Tamanho_Da_Palavra-1:0] wI;

assign saidaUla=tmp;

genvar x;
generate 
	for(x = 0; x < Tamanho_Da_Palavra;x = x + 1)
		begin:bf
		bufif0  ctrl_o  (Data[x],wo[x],io);
		bufif1  ctrl_i  (wI[x],Data[x],io);
		end
endgenerate


always @(io)
begin
	if(io)
	begin
		tmp=wI;
	end
   else
	begin
		wo=tmp;
	end	
end


endmodule	