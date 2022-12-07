// 320 pixles on the x
// 240 pixles on the y
//gotten off github
module projectVGA(
clk, 
rst, 
plot,
hole, 
VGA_R, 
VGA_G,
VGA_B,
VGA_HS,
VGA_VS,
VGA_BLANK,
VGA_SYNC,
VGA_CLK
);
input clk, rst;
reg [2:0]color;
reg [2:0]colorIn;
input [7:0]hole;
reg [9:0]xback;
reg [8:0]yback;
reg [9:0]x;
reg [8:0]y;
input plot;
output [9:0]VGA_R;
output [9:0]VGA_G;
output [9:0]VGA_B;
output VGA_HS, VGA_VS, VGA_BLANK, VGA_SYNC, VGA_CLK;


rectangle background(clk,rst,hole,3'b010,9'd0, 8'd0, 9'd320, 8'd240, plot, x, y, color);




vga_adapter my_vga_adapter(1'b1, clk, color, x, y, 1'b1, VGA_R, VGA_G, VGA_B, VGA_HS, VGA_VS, VGA_BLANK, VGA_SYNC, VGA_CLK);

/*
reg [2:0] NS;
reg [2:0] S;

parameter 
	START = 2'd0,
	S_0 = 2'd1;


always @(posedge clk or negedge rst)
begin
	if(rst == 1'b0)
	begin
		S <= START;
	end
	else
	begin
		S <= NS;
	end
end
	
always @(*)
begin
	case(S)
		START:
			if(x == 9'd320 && y == 8'd240)
			begin
				NS = S_0;
			end
		S_0:
			NS = S_0;
	
	endcase
end

always @(*)
begin
	case(S)
		START:
			if((x >= 9'd8 & x <= 9'd38) & (y >= 8'd110 & y <= 8'd140))
			begin
				colorIn = 3'b101;
			end
			else
			begin
				colorIn = 3'b110;
			end
			
	endcase
end
*/
endmodule
