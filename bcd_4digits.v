module bcd_4digits (binary,digits);
	input[15:0] binary;
	
	output[15:0] digits;
	wire[15:0] digits;
	
	assign digits[3:0] = binary%10;
	assign digits[7:4] = (binary/10)%10;
	assign digits[11:8] = (binary/100)%10;
	assign digits[15:12] = (binary/1000);
endmodule 