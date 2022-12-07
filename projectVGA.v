// 320 pixles on the x
// 240 pixles on the y

module projectVGA(
clk, 
rst,
hole, 
plot, 
VGA_R, 
VGA_G,
VGA_B,
VGA_HS,
VGA_VS,
VGA_BLANK,
VGA_SYNC,
VGA_CLK
);

input [3:0]hole;
input clk, rst;
reg [2:0]color;
reg [8:0]x;
reg [7:0]y;
input plot;
output [9:0]VGA_R;
output [9:0]VGA_G;
output [9:0]VGA_B;
output VGA_HS, VGA_VS, VGA_BLANK, VGA_SYNC, VGA_CLK;


reg [8:0]count_backx;
reg [7:0]count_backy;

reg [8:0]count_molex;
reg [7:0]count_moley;

	
vga_adapter my_vga_adapter(1'b1, clk, color, x, y, plot, VGA_R, VGA_G, VGA_B, VGA_HS, VGA_VS, VGA_BLANK, VGA_SYNC, VGA_CLK);
 
reg [2:0]NS;
reg [2:0]S;

parameter 
	START = 1'b0,
	S_0 = 1'b1;
 
always @(posedge clk or negedge rst)
begin 
	if(rst == 1'b0)
	begin
	S = START;
	
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
			if(count_backy == 8'd240 | hole >= 4'd0)
				NS = S_0;
		S_0:
			NS = S_0;
	endcase
 
end
 
always @(*)
begin
    case(S)
		START:
			if(hole == 4'd0)
			begin
				if(count_backx == 9'd320)
				begin
					count_backy = count_backy + 8'd1;
					count_backx = 9'd0;
				end
				else
				begin
						
						y = count_backy;
						x = count_backx;
						if((((x >= 8) & (x <= 38)) | ((x >= 46) & (x <= 76)) | ((x >= 84) & (x <= 114)) | ((x >= 122) & (x <= 152)) | ((x >= 160) & (x <= 190)) | ((x >= 198) & (x <= 228)) | ((x >= 236) & (x <= 266)) | ((x >= 274) & (x <= 304))) & ((y >= 8'd110) & (y <= 140)))
						begin
							color = 3'd1;
						end
						else
						begin
							color = 3'd0;
						end
						count_backx = count_backx + 8'd1;
				end
			end
		S_0:
			
			if(hole == 4'd1)
			begin
				x = count_molex;
				y = count_moley;
			end
         /*
			if(hole == 4'd2)
			begin
				x = count_molex;
				y = count_moley;
			end
		   
			if(hole == 4'd3)
			begin
				x = count_molex;
				y = count_moley;
			end
		   
			if(hole == 4'd4)
			begin
				x = count_molex;
				y = count_moley;
			end
		   
			if(hole == 4'd5)
			begin
				x = count_molex;
				y = count_moley;
			end
		   
			if(hole == 4'd6)
			begin
				x = count_molex;
				y = count_moley;
			end
		   
			if(hole == 4'd7)
			begin
				x = count_molex;
				y = count_moley;
			end
		   
			if(hole == 4'd8)
			begin
				x = count_molex;
				y = count_moley;
			end
		*/
    endcase
end
 
 
 endmodule
