module ULA(concluido,Data,ETp1,ETp2,op,clk,processar,reset);

parameter Tamanho_Da_Palavra=16, 
soma=0,
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
 ;
output wire concluido;
output wire [Tamanho_Da_Palavra-1:0] Data;
input wire [Tamanho_Da_Palavra-1:0] ETp1; //entrada para temp1 
input wire [Tamanho_Da_Palavra-1:0] ETp2; //entrada para temp2 
input wire [3:0]op; //entrada da operação para a ula
input wire clk;
input wire processar;
input wire reset;

reg [Tamanho_Da_Palavra-1:0]Resultado;
reg [1:0] estadoAtual,estadoFuturo,estadoIntermediario;
reg executa;
always @ ( posedge clk)
begin
if (executa)
begin
	case (op)
		soma: 	  begin
					Resultado<= ETp1 + ETp2;
					estadoIntermediario<=saidaDados;
		     end
		subtracao: begin
					Resultado<= ETp1 - ETp2;
					estadoIntermediario<=saidaDados;
		     end
		multiplicacao: begin
					Resultado<= ETp1 * ETp2;
					estadoIntermediario<=saidaDados;
		     end
		divisao:   begin
					Resultado<= ETp1 / ETp2;
					estadoIntermediario<=saidaDados;
		     end
		e:     	  begin
					Resultado<= ETp1 && ETp2;
					estadoIntermediario<=saidaDados;
		     end
		ne:        begin
					Resultado<= !(ETp1 && ETp2);
					estadoIntermediario<=saidaDados;
		     end
		ou:        begin
					Resultado<= ETp1 || ETp2;
					estadoIntermediario<=saidaDados;
		     end
		Xou:       begin
					Resultado<= ((ETp1 && !ETp2)||(!ETp1 && ETp2));
					estadoIntermediario<=saidaDados;
		     end	
		cmp:  	  begin
					Resultado<= (ETp1 == ETp2);
					estadoIntermediario<=saidaDados;
		     end
		nao:       begin
					Resultado<= !ETp1;
					estadoIntermediario<=saidaDados;
		     end  
		default:	  begin
					//executa<=0;
					estadoIntermediario<=executando;
			  end
	endcase
end	
end
always @ ( posedge clk)
begin
		case (estadoAtual)
		espera:begin
					if(processar)
					begin
						estadoFuturo<=executando;
					end
					else
					begin
						estadoFuturo<=espera;
						concluido<=0;
						Data<=0;
						executa<=1'b0;
					end
				 end
	 executando: begin
						executa<=1'b1;
						estadoFuturo<=estadoIntermediario;
				   end
	saidaDados: begin
						Data<=Resultado;
						concluido<=1'b1;
						estadoFuturo<=espera;
						executa<=1'b0;
					end
	endcase					
end
always @ ( posedge clk)
begin
if (reset)
	begin
		estadoAtual<=espera;
	end
	else
	begin
		estadoAtual<=estadoFuturo;
	end
end

endmodule