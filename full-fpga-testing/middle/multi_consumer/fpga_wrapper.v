`timescale 1ns/100ps

module multi_consumer
(
    d_in,
    d_out_1, d_out_2, d_out_4, d_out_7,
    clock, rst, rdy
);

    input clock;
    input rst;

    input [15:0] d_in;

    output [15:0] d_out_1, d_out_2, d_out_4, d_out_7;

    output reg rdy;
    wire [79:0]fpga_top_in;
    wire [79:0] fpga_top_out;
    wire [79:0] fpga_bot_in;
    wire [79:0] fpga_bot_out;
    wire [79:0] fpga_left_in;
    wire [79:0] fpga_left_out;
    wire [79:0] fpga_right_in;
    wire [79:0] fpga_right_out;
    reg [383:0] fpga_configs_in;
    reg [266:0] fpga_configs_en;

    assign d_out_2[4] = fpga_top_out[74];
    assign d_out_4[6] = fpga_top_out[78];
    assign d_out_4[1] = fpga_top_out[79];
    assign d_out_2[0] = fpga_right_out[0];
    assign d_out_7[9] = fpga_right_out[1];
    assign d_out_4[0] = fpga_right_out[2];
    assign d_out_7[15] = fpga_right_out[5];
    assign d_out_7[2] = fpga_right_out[8];
    assign d_out_2[14] = fpga_right_out[9];
    assign d_out_4[14] = fpga_right_out[10];
    assign d_out_1[0] = fpga_right_out[11];
    assign d_out_7[1] = fpga_right_out[12];
    assign d_out_1[14] = fpga_right_out[13];
    assign d_out_7[0] = fpga_right_out[14];
    assign d_out_1[2] = fpga_right_out[15];
    assign d_out_4[3] = fpga_right_out[16];
    assign d_out_1[4] = fpga_right_out[17];
    assign d_out_2[2] = fpga_right_out[18];
    assign d_out_4[2] = fpga_right_out[20];
    assign d_out_4[4] = fpga_right_out[21];
    assign d_out_2[3] = fpga_right_out[23];
    assign d_out_7[10] = fpga_right_out[24];
    assign d_out_7[14] = fpga_right_out[30];
    assign d_out_7[13] = fpga_right_out[31];
    assign d_out_1[12] = fpga_right_out[32];
    assign d_out_1[13] = fpga_right_out[34];
    assign d_out_4[13] = fpga_right_out[36];
    assign d_out_2[13] = fpga_right_out[38];
    assign d_out_4[12] = fpga_right_out[39];
    assign d_out_2[15] = fpga_right_out[42];
    assign d_out_1[1] = fpga_right_out[43];
    assign d_out_1[15] = fpga_right_out[44];
    assign d_out_2[12] = fpga_right_out[45];
    assign d_out_1[11] = fpga_right_out[46];
    assign d_out_2[11] = fpga_right_out[47];
    assign d_out_2[8] = fpga_right_out[48];
    assign d_out_7[12] = fpga_right_out[49];
    assign d_out_4[11] = fpga_right_out[51];
    assign d_out_2[1] = fpga_right_out[52];
    assign d_out_7[11] = fpga_right_out[53];
    assign d_out_1[7] = fpga_right_out[54];
    assign d_out_4[10] = fpga_right_out[55];
    assign d_out_2[10] = fpga_right_out[56];
    assign d_out_1[9] = fpga_right_out[57];
    assign d_out_4[9] = fpga_right_out[59];
    assign d_out_2[9] = fpga_right_out[60];
    assign d_out_1[8] = fpga_right_out[61];
    assign d_out_4[8] = fpga_right_out[62];
    assign d_out_1[3] = fpga_right_out[64];
    assign d_out_1[6] = fpga_right_out[65];
    assign d_out_7[4] = fpga_right_out[66];
    assign d_out_2[5] = fpga_right_out[67];
    assign d_out_1[5] = fpga_right_out[68];
    assign d_out_4[15] = fpga_right_out[69];
    assign d_out_7[3] = fpga_right_out[70];
    assign d_out_4[5] = fpga_right_out[71];
    assign d_out_7[6] = fpga_right_out[72];
    assign d_out_1[10] = fpga_right_out[73];
    assign d_out_7[5] = fpga_right_out[74];
    assign d_out_7[7] = fpga_right_out[75];
    assign d_out_7[8] = fpga_right_out[76];
    assign d_out_2[7] = fpga_right_out[77];
    assign d_out_2[6] = fpga_right_out[78];
    assign d_out_4[7] = fpga_right_out[79];
    assign fpga_top_in[0] = 1'b0;
    assign fpga_top_in[1] = 1'b0;
    assign fpga_top_in[2] = 1'b0;
    assign fpga_top_in[3] = 1'b0;
    assign fpga_top_in[4] = 1'b0;
    assign fpga_top_in[5] = 1'b0;
    assign fpga_top_in[6] = 1'b0;
    assign fpga_top_in[7] = 1'b0;
    assign fpga_top_in[8] = 1'b0;
    assign fpga_top_in[9] = 1'b0;
    assign fpga_top_in[10] = 1'b0;
    assign fpga_top_in[11] = 1'b0;
    assign fpga_top_in[12] = 1'b0;
    assign fpga_top_in[13] = 1'b0;
    assign fpga_top_in[14] = 1'b0;
    assign fpga_top_in[15] = 1'b0;
    assign fpga_top_in[16] = 1'b0;
    assign fpga_top_in[17] = 1'b0;
    assign fpga_top_in[18] = 1'b0;
    assign fpga_top_in[19] = 1'b0;
    assign fpga_top_in[20] = 1'b0;
    assign fpga_top_in[21] = 1'b0;
    assign fpga_top_in[22] = 1'b0;
    assign fpga_top_in[23] = 1'b0;
    assign fpga_top_in[24] = 1'b0;
    assign fpga_top_in[25] = 1'b0;
    assign fpga_top_in[26] = 1'b0;
    assign fpga_top_in[27] = 1'b0;
    assign fpga_top_in[28] = 1'b0;
    assign fpga_top_in[29] = 1'b0;
    assign fpga_top_in[30] = 1'b0;
    assign fpga_top_in[31] = 1'b0;
    assign fpga_top_in[32] = 1'b0;
    assign fpga_top_in[33] = 1'b0;
    assign fpga_top_in[34] = 1'b0;
    assign fpga_top_in[35] = 1'b0;
    assign fpga_top_in[36] = 1'b0;
    assign fpga_top_in[37] = 1'b0;
    assign fpga_top_in[38] = 1'b0;
    assign fpga_top_in[39] = 1'b0;
    assign fpga_top_in[40] = 1'b0;
    assign fpga_top_in[41] = 1'b0;
    assign fpga_top_in[42] = 1'b0;
    assign fpga_top_in[43] = 1'b0;
    assign fpga_top_in[44] = 1'b0;
    assign fpga_top_in[45] = 1'b0;
    assign fpga_top_in[46] = 1'b0;
    assign fpga_top_in[47] = 1'b0;
    assign fpga_top_in[48] = 1'b0;
    assign fpga_top_in[49] = 1'b0;
    assign fpga_top_in[50] = 1'b0;
    assign fpga_top_in[51] = 1'b0;
    assign fpga_top_in[52] = 1'b0;
    assign fpga_top_in[53] = 1'b0;
    assign fpga_top_in[54] = 1'b0;
    assign fpga_top_in[55] = 1'b0;
    assign fpga_top_in[56] = 1'b0;
    assign fpga_top_in[57] = 1'b0;
    assign fpga_top_in[58] = 1'b0;
    assign fpga_top_in[59] = 1'b0;
    assign fpga_top_in[60] = 1'b0;
    assign fpga_top_in[61] = 1'b0;
    assign fpga_top_in[62] = 1'b0;
    assign fpga_top_in[63] = 1'b0;
    assign fpga_top_in[64] = 1'b0;
    assign fpga_top_in[65] = 1'b0;
    assign fpga_top_in[66] = 1'b0;
    assign fpga_top_in[67] = 1'b0;
    assign fpga_top_in[68] = 1'b0;
    assign fpga_top_in[69] = 1'b0;
    assign fpga_top_in[70] = 1'b0;
    assign fpga_top_in[71] = 1'b0;
    assign fpga_top_in[72] = 1'b0;
    assign fpga_top_in[73] = 1'b0;
    assign fpga_top_in[74] = 1'b0;
    assign fpga_top_in[75] = 1'b0;
    assign fpga_top_in[76] = 1'b0;
    assign fpga_top_in[77] = 1'b0;
    assign fpga_top_in[78] = 1'b0;
    assign fpga_top_in[79] = 1'b0;
    assign fpga_bot_in[0] = 1'b0;
    assign fpga_bot_in[1] = 1'b0;
    assign fpga_bot_in[2] = 1'b0;
    assign fpga_bot_in[3] = 1'b0;
    assign fpga_bot_in[4] = 1'b0;
    assign fpga_bot_in[5] = 1'b0;
    assign fpga_bot_in[6] = 1'b0;
    assign fpga_bot_in[7] = 1'b0;
    assign fpga_bot_in[8] = 1'b0;
    assign fpga_bot_in[9] = 1'b0;
    assign fpga_bot_in[10] = 1'b0;
    assign fpga_bot_in[11] = 1'b0;
    assign fpga_bot_in[12] = 1'b0;
    assign fpga_bot_in[13] = 1'b0;
    assign fpga_bot_in[14] = 1'b0;
    assign fpga_bot_in[15] = 1'b0;
    assign fpga_bot_in[16] = 1'b0;
    assign fpga_bot_in[17] = 1'b0;
    assign fpga_bot_in[18] = 1'b0;
    assign fpga_bot_in[19] = 1'b0;
    assign fpga_bot_in[20] = 1'b0;
    assign fpga_bot_in[21] = 1'b0;
    assign fpga_bot_in[22] = 1'b0;
    assign fpga_bot_in[23] = 1'b0;
    assign fpga_bot_in[24] = 1'b0;
    assign fpga_bot_in[25] = 1'b0;
    assign fpga_bot_in[26] = 1'b0;
    assign fpga_bot_in[27] = 1'b0;
    assign fpga_bot_in[28] = 1'b0;
    assign fpga_bot_in[29] = 1'b0;
    assign fpga_bot_in[30] = 1'b0;
    assign fpga_bot_in[31] = 1'b0;
    assign fpga_bot_in[32] = 1'b0;
    assign fpga_bot_in[33] = 1'b0;
    assign fpga_bot_in[34] = 1'b0;
    assign fpga_bot_in[35] = 1'b0;
    assign fpga_bot_in[36] = 1'b0;
    assign fpga_bot_in[37] = 1'b0;
    assign fpga_bot_in[38] = 1'b0;
    assign fpga_bot_in[39] = 1'b0;
    assign fpga_bot_in[40] = 1'b0;
    assign fpga_bot_in[41] = 1'b0;
    assign fpga_bot_in[42] = 1'b0;
    assign fpga_bot_in[43] = 1'b0;
    assign fpga_bot_in[44] = 1'b0;
    assign fpga_bot_in[45] = 1'b0;
    assign fpga_bot_in[46] = 1'b0;
    assign fpga_bot_in[47] = 1'b0;
    assign fpga_bot_in[48] = 1'b0;
    assign fpga_bot_in[49] = 1'b0;
    assign fpga_bot_in[50] = 1'b0;
    assign fpga_bot_in[51] = 1'b0;
    assign fpga_bot_in[52] = 1'b0;
    assign fpga_bot_in[53] = 1'b0;
    assign fpga_bot_in[54] = 1'b0;
    assign fpga_bot_in[55] = 1'b0;
    assign fpga_bot_in[56] = 1'b0;
    assign fpga_bot_in[57] = 1'b0;
    assign fpga_bot_in[58] = 1'b0;
    assign fpga_bot_in[59] = 1'b0;
    assign fpga_bot_in[60] = 1'b0;
    assign fpga_bot_in[61] = 1'b0;
    assign fpga_bot_in[62] = 1'b0;
    assign fpga_bot_in[63] = 1'b0;
    assign fpga_bot_in[64] = 1'b0;
    assign fpga_bot_in[65] = 1'b0;
    assign fpga_bot_in[66] = 1'b0;
    assign fpga_bot_in[67] = 1'b0;
    assign fpga_bot_in[68] = 1'b0;
    assign fpga_bot_in[69] = 1'b0;
    assign fpga_bot_in[70] = 1'b0;
    assign fpga_bot_in[71] = 1'b0;
    assign fpga_bot_in[72] = 1'b0;
    assign fpga_bot_in[73] = 1'b0;
    assign fpga_bot_in[74] = 1'b0;
    assign fpga_bot_in[75] = 1'b0;
    assign fpga_bot_in[76] = 1'b0;
    assign fpga_bot_in[77] = 1'b0;
    assign fpga_bot_in[78] = 1'b0;
    assign fpga_bot_in[79] = 1'b0;
    assign fpga_left_in[0] = 1'b0;
    assign fpga_left_in[1] = 1'b0;
    assign fpga_left_in[2] = 1'b0;
    assign fpga_left_in[3] = 1'b0;
    assign fpga_left_in[4] = 1'b0;
    assign fpga_left_in[5] = 1'b0;
    assign fpga_left_in[6] = 1'b0;
    assign fpga_left_in[7] = 1'b0;
    assign fpga_left_in[8] = 1'b0;
    assign fpga_left_in[9] = 1'b0;
    assign fpga_left_in[10] = 1'b0;
    assign fpga_left_in[11] = 1'b0;
    assign fpga_left_in[12] = 1'b0;
    assign fpga_left_in[13] = 1'b0;
    assign fpga_left_in[14] = 1'b0;
    assign fpga_left_in[15] = 1'b0;
    assign fpga_left_in[16] = 1'b0;
    assign fpga_left_in[17] = 1'b0;
    assign fpga_left_in[18] = 1'b0;
    assign fpga_left_in[19] = 1'b0;
    assign fpga_left_in[20] = 1'b0;
    assign fpga_left_in[21] = 1'b0;
    assign fpga_left_in[22] = 1'b0;
    assign fpga_left_in[23] = 1'b0;
    assign fpga_left_in[24] = 1'b0;
    assign fpga_left_in[25] = 1'b0;
    assign fpga_left_in[26] = 1'b0;
    assign fpga_left_in[27] = 1'b0;
    assign fpga_left_in[28] = 1'b0;
    assign fpga_left_in[29] = 1'b0;
    assign fpga_left_in[30] = 1'b0;
    assign fpga_left_in[31] = 1'b0;
    assign fpga_left_in[32] = 1'b0;
    assign fpga_left_in[33] = 1'b0;
    assign fpga_left_in[34] = 1'b0;
    assign fpga_left_in[35] = 1'b0;
    assign fpga_left_in[36] = 1'b0;
    assign fpga_left_in[37] = 1'b0;
    assign fpga_left_in[38] = 1'b0;
    assign fpga_left_in[39] = 1'b0;
    assign fpga_left_in[40] = 1'b0;
    assign fpga_left_in[41] = 1'b0;
    assign fpga_left_in[42] = 1'b0;
    assign fpga_left_in[43] = 1'b0;
    assign fpga_left_in[44] = 1'b0;
    assign fpga_left_in[45] = 1'b0;
    assign fpga_left_in[46] = 1'b0;
    assign fpga_left_in[47] = 1'b0;
    assign fpga_left_in[48] = 1'b0;
    assign fpga_left_in[49] = 1'b0;
    assign fpga_left_in[50] = 1'b0;
    assign fpga_left_in[51] = 1'b0;
    assign fpga_left_in[52] = 1'b0;
    assign fpga_left_in[53] = 1'b0;
    assign fpga_left_in[54] = 1'b0;
    assign fpga_left_in[55] = 1'b0;
    assign fpga_left_in[56] = 1'b0;
    assign fpga_left_in[57] = 1'b0;
    assign fpga_left_in[58] = 1'b0;
    assign fpga_left_in[59] = 1'b0;
    assign fpga_left_in[60] = 1'b0;
    assign fpga_left_in[61] = 1'b0;
    assign fpga_left_in[62] = 1'b0;
    assign fpga_left_in[63] = 1'b0;
    assign fpga_left_in[64] = 1'b0;
    assign fpga_left_in[65] = 1'b0;
    assign fpga_left_in[66] = 1'b0;
    assign fpga_left_in[67] = 1'b0;
    assign fpga_left_in[68] = 1'b0;
    assign fpga_left_in[69] = 1'b0;
    assign fpga_left_in[70] = 1'b0;
    assign fpga_left_in[71] = 1'b0;
    assign fpga_left_in[72] = 1'b0;
    assign fpga_left_in[73] = 1'b0;
    assign fpga_left_in[74] = 1'b0;
    assign fpga_left_in[75] = 1'b0;
    assign fpga_left_in[76] = 1'b0;
    assign fpga_left_in[77] = 1'b0;
    assign fpga_left_in[78] = 1'b0;
    assign fpga_left_in[79] = 1'b0;
    assign fpga_right_in[0] = 1'b0;
    assign fpga_right_in[1] = 1'b0;
    assign fpga_right_in[2] = 1'b0;
    assign fpga_right_in[3] = d_in[0];
    assign fpga_right_in[4] = 1'b0;
    assign fpga_right_in[5] = 1'b0;
    assign fpga_right_in[6] = 1'b0;
    assign fpga_right_in[7] = 1'b0;
    assign fpga_right_in[8] = 1'b0;
    assign fpga_right_in[9] = 1'b0;
    assign fpga_right_in[10] = 1'b0;
    assign fpga_right_in[11] = 1'b0;
    assign fpga_right_in[12] = 1'b0;
    assign fpga_right_in[13] = 1'b0;
    assign fpga_right_in[14] = 1'b0;
    assign fpga_right_in[15] = 1'b0;
    assign fpga_right_in[16] = 1'b0;
    assign fpga_right_in[17] = 1'b0;
    assign fpga_right_in[18] = 1'b0;
    assign fpga_right_in[19] = d_in[14];
    assign fpga_right_in[20] = 1'b0;
    assign fpga_right_in[21] = 1'b0;
    assign fpga_right_in[22] = d_in[13];
    assign fpga_right_in[23] = 1'b0;
    assign fpga_right_in[24] = 1'b0;
    assign fpga_right_in[25] = d_in[12];
    assign fpga_right_in[26] = d_in[9];
    assign fpga_right_in[27] = d_in[1];
    assign fpga_right_in[28] = d_in[11];
    assign fpga_right_in[29] = d_in[15];
    assign fpga_right_in[30] = 1'b0;
    assign fpga_right_in[31] = 1'b0;
    assign fpga_right_in[32] = 1'b0;
    assign fpga_right_in[33] = d_in[4];
    assign fpga_right_in[34] = 1'b0;
    assign fpga_right_in[35] = d_in[6];
    assign fpga_right_in[36] = 1'b0;
    assign fpga_right_in[37] = d_in[8];
    assign fpga_right_in[38] = 1'b0;
    assign fpga_right_in[39] = 1'b0;
    assign fpga_right_in[40] = d_in[2];
    assign fpga_right_in[41] = d_in[3];
    assign fpga_right_in[42] = 1'b0;
    assign fpga_right_in[43] = 1'b0;
    assign fpga_right_in[44] = 1'b0;
    assign fpga_right_in[45] = 1'b0;
    assign fpga_right_in[46] = 1'b0;
    assign fpga_right_in[47] = 1'b0;
    assign fpga_right_in[48] = 1'b0;
    assign fpga_right_in[49] = 1'b0;
    assign fpga_right_in[50] = d_in[7];
    assign fpga_right_in[51] = 1'b0;
    assign fpga_right_in[52] = 1'b0;
    assign fpga_right_in[53] = 1'b0;
    assign fpga_right_in[54] = 1'b0;
    assign fpga_right_in[55] = 1'b0;
    assign fpga_right_in[56] = 1'b0;
    assign fpga_right_in[57] = 1'b0;
    assign fpga_right_in[58] = d_in[10];
    assign fpga_right_in[59] = 1'b0;
    assign fpga_right_in[60] = 1'b0;
    assign fpga_right_in[61] = 1'b0;
    assign fpga_right_in[62] = 1'b0;
    assign fpga_right_in[63] = d_in[5];
    assign fpga_right_in[64] = 1'b0;
    assign fpga_right_in[65] = 1'b0;
    assign fpga_right_in[66] = 1'b0;
    assign fpga_right_in[67] = 1'b0;
    assign fpga_right_in[68] = 1'b0;
    assign fpga_right_in[69] = 1'b0;
    assign fpga_right_in[70] = 1'b0;
    assign fpga_right_in[71] = 1'b0;
    assign fpga_right_in[72] = 1'b0;
    assign fpga_right_in[73] = 1'b0;
    assign fpga_right_in[74] = 1'b0;
    assign fpga_right_in[75] = 1'b0;
    assign fpga_right_in[76] = 1'b0;
    assign fpga_right_in[77] = 1'b0;
    assign fpga_right_in[78] = 1'b0;
    assign fpga_right_in[79] = 1'b0;


    reg ff_en;
    integer in_f;

    integer read_status;    initial begin
       in_f = $fopen("multi_consumer.bs", "r");
       fpga_configs_in = 1'b0;
       ff_en = 1'b0;
       rdy = 1'b0;
       fpga_configs_en = 1'b1;
    end

    initial begin
        repeat (10) @ (posedge clock);
        while ( ! $feof(in_f)) begin
        @ (posedge clock);
        read_status = $fscanf(in_f, "%b\n", fpga_configs_in);
        @ (posedge clock);
        fpga_configs_en = fpga_configs_en << 1;
        end
        repeat (10) @ (posedge clock);
        $fclose(in_f);
        #100 ff_en = 1'b1;
        #100 rdy = 1'b1;
    end

    fpga fpag_dut (
        .top_in(fpga_top_in),
        .bot_in(fpga_bot_in),
        .left_in(fpga_left_in),
        .right_in(fpga_right_in),
        .top_out(fpga_top_out),
        .bot_out(fpga_bot_out),
        .left_out(fpga_left_out),
        .right_out(fpga_right_out),
        .ff_en(ff_en),
        .configs_en(fpga_configs_en),
        .configs_in(fpga_configs_in),
        .clock(clock),
        .rst(rst)
    );

endmodule