module countdown_99_sec (clk_1hz,sec);
	input clk_1hz;
	
	output[7:0] sec;
	
	reg[7:0] sec;
	
	initial 
		sec <= {4'd9,4'd9};
	
	always @(posedge clk_1hz) begin
		if (sec> 0)
			if (sec[3:0] > 0)
				sec <= sec -1;
			else begin
				sec[7:4] <= sec[7:4] -1;
				sec[3:0] <= 9;
			end
		else
			sec <= 0;
	end
endmodule 