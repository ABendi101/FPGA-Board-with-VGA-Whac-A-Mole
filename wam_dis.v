// VGA code, source 

// LED and digital tube display
//
// by nyLiao, April, 2019

module wam_led (            // LED output
    input  wire [7:0] holes,
    output wire [7:0] ld
    );

    assign ld = holes;
endmodule // wam_led

module wam_lst (            // digital first bit (hardness bit) flashing for tap or hardness change
    input wire clk_19,
    input wire [7:0] tap,
    input wire lft,
    input wire rgt,
    input wire cout0,
    output reg lstn
    );

    reg  [3:0] cnt;     // counter
    wire trg;           // trigger signal
    wire cout0s;        // cout0 signal conveter

    wam_tch tchc( .clk_19(clk_19), .btn(cout0), .tch(cout0s));
    assign trg = tap[0] | tap[1] | tap[2] | tap[3] | tap[4] | tap[5] | tap[6] | tap[7] | lft | rgt | cout0s;

    always @ (posedge clk_19) begin
        if (cnt > 0) begin                  // lasting
            if (cnt > 4'b0100) begin        // long enough
                cnt <= 4'b0000;
                lstn <= 0;                  // dim
            end
            else begin
                cnt <= cnt + 1;
            end
        end
        else begin                          // idle
            if (trg) begin                  // if trigger then light up
                cnt <= 4'b0001;
                lstn <= 1;
            end
        end
    end
endmodule // wam_lst

module wam_dis(
input [11:0]score,
input [3:0] hrdn,
output [6:0]hardness,
output [6:0]seg7_dig0,
output [6:0]seg7_dig1);

reg [3:0] result_one_digit;
reg [3:0] result_ten_digit;
reg [3:0] result_hundred_digit;
reg result_is_negative;

seven_segment mmsb(score[7:4], seg7_dig1);
seven_segment lsb(score[3:0], seg7_dig0);
seven_segment dis_hrdn(hrdn, hardness);



endmodule

