module whack_a_mole (clk,buttons,p1_leds,p2_leds,p1_score_seg,p2_score_seg,countdown);
	input clk;	
	input[8:0] buttons;
	
	output[3:0] p1_leds;
	output[3:0] p2_leds;
	output[27:0] p1_score_seg;
	output[27:0] p2_score_seg;
	output[7:0] countdown;
	
	wire clk_1hz;
	wire clk_and;
	wire[26:0] delay;
	wire[3:0] position;
	wire[3:0] p1_next_pos;
	wire[3:0] p2_next_pos;
	wire[15:0] p1_score;
	wire[15:0] p2_score;
	
	
	clk_generator(clk,clk_1hz);
	countdown_99_sec(clk_1hz,countdown);
	assign clk_and = clk && countdown;
	delay_generator(clk_and,delay);
	position_generator(clk_and,position);
	player1_module (clk_and,buttons,p2_leds,p2_next_pos,position,delay,p1_leds,p1_next_pos,p1_score);
	player2_module (clk_and,buttons,p1_leds,p1_next_pos,position,delay,p2_leds,p2_next_pos,p2_score);
	seven_seg_dec (p1_score[3:0],p1_score_seg[6:0]);
	seven_seg_dec (p1_score[7:4],p1_score_seg[13:7]);
	seven_seg_dec (p1_score[11:8],p1_score_seg[20:14]);
	seven_seg_dec (p1_score[15:12],p1_score_seg[26:21]);
	seven_seg_dec (p2_score[3:0],p2_score_seg[6:0]);
	seven_seg_dec (p2_score[7:4],p2_score_seg[13:7]);
	seven_seg_dec (p2_score[11:8],p2_score_seg[20:14]);
	seven_seg_dec (p2_score[15:12],p2_score_seg[26:21]);

	
	
endmodule 