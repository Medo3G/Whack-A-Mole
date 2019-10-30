module player2_module (clk,buttons,other_player_pos,other_player_next_pos,rand_pos,random_delay,my_pos,next_pos,score);

	input clk;
	input[8:0] buttons;
	input[3:0] other_player_pos;
	input[3:0] other_player_next_pos;
	input[3:0] rand_pos;
	input[26:0] random_delay;
	
	output[3:0] my_pos;
	output[3:0] next_pos;
	output[15:0] score;
	
	reg[3:0] my_pos;
	reg[15:0] score;
	
	reg[3:0] next_pos;
	reg[26:0] delay_countdown;
	reg[26:0] timeout_countdown;
	
	always@(posedge clk) begin
		
		if (delay_countdown > 0) begin
			if (next_pos == other_player_pos || next_pos == other_player_next_pos)
				next_pos <= (next_pos+2)%9;
			
			delay_countdown <= delay_countdown -1;
		end
		else if (delay_countdown == 0) begin
			my_pos <= next_pos;
			next_pos <= 4'bx;
			timeout_countdown <= 26'd75_000_000;
		end
		else begin
			if (timeout_countdown > 0) 
				if (buttons[my_pos]) begin
					my_pos <= 4'bx;
					next_pos <= rand_pos;
					delay_countdown <= 25_000_000 + random_delay;
					if (timeout_countdown > 26'd50_000_000)
							score <=  score + 200;
					else if (timeout_countdown > 26'd25_000_000)
						score <= score + 100;
					else
						score <= score + 50;
				end					
		
			else begin
				my_pos <= 4'bx;
				next_pos <= rand_pos;
				delay_countdown <= 25_000_000 + random_delay;
			end
		end
	end
endmodule
