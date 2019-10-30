module position_generator (clk,position);
	input clk;
	output[3:0] position;
	reg[3:0] position;
	always @(posedge clk) begin
		if (position == 8)
			position = 0;
		else
			position = position+1;
	end
endmodule 