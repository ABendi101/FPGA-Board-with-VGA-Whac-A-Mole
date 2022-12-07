//WRITTEN BY JACOB GARDNER
// Edited Alex Benintendi
module rectangle(clock,rst, hole, colour,x, y, L, W, plot, newX, newY, Color);
input clock,rst;
input [8:0]x;
input [7:0]y;
input [2:0]colour;
input plot;
input [8:0] L;
input [7:0] W;
input [7:0] hole;
output reg [8:0] newX;
output reg [7:0] newY;
output reg [2:0] Color;


reg [2:0] S;
reg [2:0] NS;
reg [8:0] i;
parameter START = 3'd0,
FCOND = 3'd1,
XINC = 3'd2,
YINC = 3'd5,
FINC = 3'd3,
EXIT = 3'd4,
ERROR = 3'hF;

always @(posedge clock or negedge rst)
begin
	if (rst == 1'b0) 
		S <= START;
	else
		S <= NS;
end


always @(*)
begin
	if((((newX >= 9'd8) & (newX <= 9'd38)) | ((newX >= 9'd46) & (newX <= 9'd76)) | ((newX >= 9'd84) & (newX <= 9'd114)) | ((newX >= 9'd122) & (newX <= 9'd152)) | ((newX >= 9'd160) & (newX <= 9'd190)) | ((newX >= 9'd198) & (newX <= 9'd228)) | ((newX >= 9'd236) & (newX <= 9'd266)) | ((newX >= 9'd274) & (newX <= 9'd304))) & ((newY >= 8'd110) & (newY <= 8'd140)))
	begin
			
		Color = 3'b000;
	end
	else
	begin
		Color = 3'b010;
	end

	if(hole[0] == 1'b1)
	begin
		if(((newX == 9'd288) & (newY == 8'd84)) | (((newX >= 9'd287) & (newX <= 9'd289)) & (newY == 8'd85)) | (((newX >= 9'd286) & (newX <= 9'd290)) & (newY == 8'd86)) | (((newX >= 9'd285) & (newX <= 9'd291)) & (newY == 8'd87)) | (((newX >= 9'd284) & (newX <= 9'd292)) & (newY == 8'd88)) | (((newX >= 9'd283) & (newX <= 9'd293)) & (newY == 8'd89)) | (((newX >= 9'd282) & (newX <= 9'd294)) & ((newY >= 8'd90) & (newY <= 8'd130))))
		begin
			Color = 3'b110;
		end
	
		if(((newX == 9'd286) & (newY == 8'd100)) | ((newX == 9'd290) & (newY == 8'd100)) | (((newX >= 9'd286) & (newX <= 9'd290)) & (newY == 8'd120)))
		begin
			Color = 3'b000;
		end
	
	
	end
	
	if(hole[1] == 1'b1)
	begin
		if(((newX == 9'd250) & (newY == 8'd84)) | (((newX >= 9'd249) & (newX <= 9'd251)) & (newY == 8'd85)) | (((newX >= 9'd248) & (newX <= 9'd252)) & (newY == 8'd86)) | (((newX >= 9'd247) & (newX <= 9'd253)) & (newY == 8'd87)) | (((newX >= 9'd246) & (newX <= 9'd254)) & (newY == 8'd88)) | (((newX >= 9'd245) & (newX <= 9'd255)) & (newY == 8'd89)) | (((newX >= 9'd244) & (newX <= 9'd256)) & ((newY >= 8'd90) & (newY <= 8'd130))))
		begin
			Color = 3'b110;
		end
	
		if(((newX == 9'd248) & (newY == 8'd100)) | ((newX == 9'd252) & (newY == 8'd100)) | (((newX >= 9'd248) & (newX <= 9'd252)) & (newY == 8'd120)))
		begin
			Color = 3'b000;
		end
	
	
	end
	
	if(hole[2] == 1'b1)
	begin
		if(((newX == 9'd212) & (newY == 8'd84)) | (((newX >= 9'd211) & (newX <= 9'd213)) & (newY == 8'd85)) | (((newX >= 9'd210) & (newX <= 9'd214)) & (newY == 8'd86)) | (((newX >= 9'd209) & (newX <= 9'd215)) & (newY == 8'd87)) | (((newX >= 9'd208) & (newX <= 9'd216)) & (newY == 8'd88)) | (((newX >= 9'd207) & (newX <= 9'd217)) & (newY == 8'd89)) | (((newX >= 9'd206) & (newX <= 9'd218)) & ((newY >= 8'd90) & (newY <= 8'd130))))
		begin
			Color = 3'b110;
		end
	
		if(((newX == 9'd210) & (newY == 8'd100)) | ((newX == 9'd214) & (newY == 8'd100)) | (((newX >= 9'd210) & (newX <= 9'd214)) & (newY == 8'd120)))
		begin
			Color = 3'b000;
		end
	
	
	end
	
	if(hole[3] == 1'b1)
	begin
		if(((newX == 9'd174) & (newY == 8'd84)) | (((newX >= 9'd173) & (newX <= 9'd175)) & (newY == 8'd85)) | (((newX >= 9'd172) & (newX <= 9'd176)) & (newY == 8'd86)) | (((newX >= 9'd171) & (newX <= 9'd177)) & (newY == 8'd87)) | (((newX >= 9'd170) & (newX <= 9'd178)) & (newY == 8'd88)) | (((newX >= 9'd169) & (newX <= 9'd179)) & (newY == 8'd89)) | (((newX >= 9'd168) & (newX <= 9'd180)) & ((newY >= 8'd90) & (newY <= 8'd130))))
		begin
			Color = 3'b110;
		end
	
		if(((newX == 9'd172) & (newY == 8'd100)) | ((newX == 9'd176) & (newY == 8'd100)) | (((newX >= 9'd172) & (newX <= 9'd176)) & (newY == 8'd120)))
		begin
			Color = 3'b000;
		end
	
	
	
	
	end
	
	
	if(hole[4] == 1'b1)
	begin
		if(((newX == 9'd136) & (newY == 8'd84)) | (((newX >= 9'd135) & (newX <= 9'd137)) & (newY == 8'd85)) | (((newX >= 9'd134) & (newX <= 9'd138)) & (newY == 8'd86)) | (((newX >= 9'd133) & (newX <= 9'd139)) & (newY == 8'd87)) | (((newX >= 9'd132) & (newX <= 9'd140)) & (newY == 8'd88)) | (((newX >= 9'd131) & (newX <= 9'd141)) & (newY == 8'd89)) | (((newX >= 9'd130) & (newX <= 9'd142)) & ((newY >= 8'd90) & (newY <= 8'd130))))
		begin
			Color = 3'b110;
		end
	
		if(((newX == 9'd134) & (newY == 8'd100)) | ((newX == 9'd138) & (newY == 8'd100)) | (((newX >= 9'd134) & (newX <= 9'd138)) & (newY == 8'd120)))
		begin
			Color = 3'b000;
		end
	
	
	
	end
	
	
	if(hole[5] == 1'b1)
	begin
		if(((newX == 9'd98) & (newY == 8'd84)) | (((newX >= 9'd97) & (newX <= 9'd99)) & (newY == 8'd85)) | (((newX >= 9'd96) & (newX <= 9'd100)) & (newY == 8'd86)) | (((newX >= 9'd95) & (newX <= 9'd101)) & (newY == 8'd87)) | (((newX >= 9'd94) & (newX <= 9'd102)) & (newY == 8'd88)) | (((newX >= 9'd93) & (newX <= 9'd103)) & (newY == 8'd89)) | (((newX >= 9'd92) & (newX <= 9'd104)) & ((newY >= 8'd90) & (newY <= 8'd130))))
		begin
			Color = 3'b110;
		end
	
		if(((newX == 9'd96) & (newY == 8'd100)) | ((newX == 9'd100) & (newY == 8'd100)) | (((newX >= 9'd96) & (newX <= 9'd100)) & (newY == 8'd120)))
		begin
			Color = 3'b000;
		end
	
	
	end
	
	
	if(hole[6] == 1'b1)
	begin
		if(((newX == 9'd60) & (newY == 8'd84)) | (((newX >= 9'd59) & (newX <= 9'd61)) & (newY == 8'd85)) | (((newX >= 9'd58) & (newX <= 9'd62)) & (newY == 8'd86)) | (((newX >= 9'd57) & (newX <= 9'd63)) & (newY == 8'd87)) | (((newX >= 9'd56) & (newX <= 9'd64)) & (newY == 8'd88)) | (((newX >= 9'd55) & (newX <= 9'd65)) & (newY == 8'd89)) | (((newX >= 9'd54) & (newX <= 9'd66)) & ((newY >= 8'd90) & (newY <= 8'd130))))
		begin
			Color = 3'b110;
		end
	
		if(((newX == 9'd58) & (newY == 8'd100)) | ((newX == 9'd62) & (newY == 8'd100)) | (((newX >= 9'd58) & (newX <= 9'd62)) & (newY == 8'd120)))
		begin
			Color = 3'b000;
		end
	
	
	
	end
	
	if(hole[7] == 1'b1)
	begin
		if(((newX == 9'd22) & (newY == 8'd84)) | (((newX >= 9'd21) & (newX <= 9'd23)) & (newY == 8'd85)) | (((newX >= 9'd20) & (newX <= 9'd24)) & (newY == 8'd86)) | (((newX >= 9'd19) & (newX <= 9'd25)) & (newY == 8'd87)) | (((newX >= 9'd18) & (newX <= 9'd26)) & (newY == 8'd88)) | (((newX >= 9'd17) & (newX <= 9'd27)) & (newY == 8'd89)) | (((newX >= 9'd16) & (newX <= 9'd28)) & ((newY >= 8'd90) & (newY <= 8'd130))))
		begin
			Color = 3'b110;
		end
		
		if(((newX == 9'd20) & (newY == 8'd100)) | ((newX == 9'd24) & (newY == 8'd100)) | (((newX >= 9'd20) & (newX <= 9'd24)) & (newY == 8'd120)))
		begin
			Color = 3'b000;
		end
	
	
	
	end
	
	
	
	
	
	
	
end




always @(*)
begin
	case (S)
		START: NS <= FCOND;
		FCOND: begin
			if(i < L && newY <= (y + W))
				NS <= XINC;
			else if (i == L && newY != (y + W))
				NS <= YINC;
			else 
				NS <= START;
		end
		FINC: NS <= FCOND;
		XINC: NS <= FINC;
		YINC: NS <= FCOND;
		default NS <= ERROR;
			
	endcase	
end

always @(posedge clock)
begin
		case (S)
			START:begin
			newX = x;
			newY = y;
			i <= 9'd0;
			
			end
			XINC:newX <= newX + 1'b1;
			YINC: begin
			newY = newY + 1'b1;
			newX <= x;
			i <= 9'd0;
			end
			FINC: i <= i + 1'd1;
		endcase
end


endmodule