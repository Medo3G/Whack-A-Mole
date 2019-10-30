module delay_generator (clk,delay);
	input clk;
	output[26:0] delay;
	reg[26:0] delay;
	always @(posedge clk) begin
		if (delay == 25_000_000)
			delay = 0;
		else
			delay = delay+1;
	end
endmodule 