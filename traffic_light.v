module traffic_light(
input clk,
      reset,
		
output reg [2:0] led, //light of red,yellow,green
output reg [2:0] count //counter

);

parameter green=2'b00,
          yellow=2'b01,
		    red=2'b10;
		 
reg [1:0] current_state, next_state;		 


always@(posedge clk or posedge reset)begin

if(reset)begin 

current_state <= green;
count <= 3'd5;
led <= 3'b001;
end 
else begin

    case(current_state)
	  green:begin
	      led<=3'b001;
			
			if(count==0) begin 
			current_state <= yellow;
			count <= 3'd3;
			end
			else begin
			count <= count-1;
			end
		end
	  yellow:begin
	      led<=3'b010;
			
			if(count==0) begin 
			current_state <= red;
			count <= 3'd4;
			end
			else begin
			count <= count-1;
			end
		end
	  red:begin
	      led<=3'b100;
			
			if(count==0) begin 
			current_state <= green;
			count <= 3'd5;
			end
			else begin
			count <= count-1;
			end
	   end
		endcase

end
end
endmodule
