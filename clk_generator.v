module clk_generator(clk,clk_1hz);
	input clk;
	output clk_1hz;
	reg clk_1hz;
	reg [25:0] counter;
	always @(posedge clk) begin
		if (counter == 49_999_999) begin 
			clk_1hz <= 1;
			counter <= 0;
		end
		else begin
			clk_1hz <= 0;
			counter <= counter+1;
		end
	end
endmodule 
