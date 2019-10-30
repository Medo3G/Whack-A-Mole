module seven_seg_dec(num,segments);
	input[3:0]num;
	output[6:0]segments;
	reg [6:0] segments;
	always@(num) begin
		case (num)
			0: segments <= ~7'b0111111; // "6 5 4 3 2 1 0"
			1: segments <= ~7'b0000110;
			2: segments <= ~7'b1011011; // --0--
			3: segments <= ~7'b1001111; // | |
			4: segments <= ~7'b1100110; // 5 1
			5: segments <= ~7'b1101101; // | |
			6: segments <= ~7'b1111101; // --6--
			7: segments <= ~7'b0000111; // | |
			8: segments <= ~7'b1111111; // 4 2
			9: segments <= ~7'b1101111; // | |
			default: segments <= 7'bx; // --3-- 
		endcase
	end
endmodule