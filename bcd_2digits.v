module bcd_2digits (binary,digits);
	input[7:0] binary;
	
	output[7:0]digits;
	
	wire[7:0] digits;
	
	assign digits[3:0] = binary%10;
	assign digits[7:4] = binary/10;
endmodule 