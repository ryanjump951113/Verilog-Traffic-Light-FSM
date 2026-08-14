module test_bench;


reg clk,reset;
wire [2:0] led,count;


always #5 clk = ~clk;

initial begin
clk = 1'b0;
reset = 1'b1;

#10;

reset=1'b0;


end

traffic_light DUT(.clk(clk),.reset(reset),.led(led),.count(count));

endmodule 