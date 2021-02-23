
//SLAVE TEMPLATE
//AUTHORS:
//KAUTILYA JOSHI
//UTKARSH BHIOGADE
module slave #(parameter ADDRW = 32, DATAW = 32)
  (
  input        clk,
  input        rst_n,
  input [ADDRW-1:0]      addr,
  input        write,
  input        sel,
  input        enable,
  input [DATAW-1:0]      wdata,
  output reg [DATAW-1:0] rdata
  );


  // Register Declarations

  reg  [DATAW-1:0] reg1; 
  reg  [DATAW-1:0] reg2; 
  reg  [DATAW-1:0] reg3; 
  reg  [DATAW-1:0] reg4; 
  reg  [DATAW-1:0] reg5; 
  reg  [DATAW-1:0] reg6; 
  reg  [DATAW-1:0] reg7; 
  reg  [DATAW-1:0] reg8; 
  reg  [DATAW-1:0] reg9; 
  reg  [DATAW-1:0] reg10; 

// Fields

  reg  [1:0]    reg1_f1;
  reg  			    reg1_f2;
  reg  			    reg1_f3;
  reg  [27:0]    reg1_f4;
  reg  [3:0]    reg2_f1;
  reg  			    reg2_f2;
  reg  [26:0]    reg2_f3;
  reg  [1:0]    reg3_f1;
  reg  [14:0]    reg3_f2;
  reg  [14:0]    reg3_f3;
  reg  [15:0]    reg4_f1;
  reg  [15:0]    reg4_f2;
  reg  [31:0]    reg5_f1;
  reg  			    reg6_f1;
  reg  [2:0]    reg6_f2;
  reg  [6:0]    reg6_f3;
  reg  [12:0]    reg6_f4;
  reg  [5:0]    reg6_f5;
  reg  			    reg7_f1;
  reg  			    reg7_f2;
  reg  [29:0]    reg7_f3;
  reg  [7:0]    reg8_f1;
  reg  [23:0]    reg8_f2;
  reg  [9:0]    reg9_f1;
  reg  [9:0]    reg9_f2;
  reg  [11:0]    reg9_f3;
  reg  			    reg10_f1;
  reg  			    reg10_f2;
  reg  [29:0]    reg10_f3;

  parameter logic [1:0]   SETUP = 0;
  parameter logic [1:0]   W_ENABLE = 1;
  parameter logic [1:0]   R_ENABLE = 2;


//Always block
  always @(negedge rst_n or posedge clk) begin
    if (rst_n == 0) begin
      bus <= 0;
      prdata <= 0;
      reg1_f1 <= 2'b0;
      reg1_f2 <= 1'd1;
      reg1_f3 <= 1'd1;
      reg1_f4 <= 28'b0;
      reg2_f1 <= 4'b0;
      reg2_f2 <= 1'b0;
      reg2_f3 <= 1'b1;
      reg3_f1 <= 1'b1;
      reg3_f2 <= 15'd0;
      reg3_f3 <= 15'd0;
      reg4_f1 <= 1'b1;
      reg4_f2 <= 16'd66;
      reg5_f1 <= 32'd0;
      reg6_f1 <= 1'd0;
      reg6_f2 <= 3'd2;
      reg6_f3 <= 7'd83;
      reg6_f4 <= 13'd3072;
      reg6_f5 <= 6'd36;
      reg7_f1 <= 1'd0;
      reg7_f2 <= 1'd1;
      reg7_f3 <= 1'b1;
      reg8_f1 <= 8'd0;
      reg8_f2 <= 24'd0;
      reg9_f1 <= 10'd0;
      reg9_f2 <= 10'd0;
      reg9_f3 <= 12'd0;
      reg10_f1 <= 1'd1;
      reg10_f2 <= 1'd1;
      reg10_f3 <= 30'd32;
    end

    else begin
      case (bus)
      SETUP : begin
            // clear the rdata
            rdata <= 0;

            // Move to ENABLE when the sel is asserted
            if (sel && !enable) begin
              if (pwrite) begin
                bus <= W_ENABLE;
              end

              else begin
              bus <= R_ENABLE;
              end
            end
          end
      
      W_ENABLE : begin
            // write wdata to memory
            if (sel && enable && pwrite) begin
              // mem[addr] <= wdata;
              case (addr)

                32'h00000000: begin
                  reg1_f4 <= wdata[27:0];
                  reg1 <= {reg1_f1,reg1_f2,reg1_f3,reg1_f4};
                end

                32'h00000004: begin
                  reg2_f1 <= wdata[31:28];
                  reg2_f2 <= wdata[27];
                  reg2_f3 <= wdata[26:0];
                  reg2 <= {reg2_f1,reg2_f2,reg2_f3};
                end

                32'h00000008: begin
                  reg3_f2 <= wdata[29:15];
                  reg3_f3 <= wdata[14:0];
                  reg3 <= {reg3_f1,reg3_f2,reg3_f3};
                end

                32'h0000000C: begin
                  reg4_f1 <= wdata[31:16];
                  reg4_f2 <= wdata[15:0];
                  reg4 <= {reg4_f1,reg4_f2};
                end

                32'h00000010: begin
                  reg5_f1 <= wdata[31:0];
                  reg5 <= {reg5_f1};
                end

                32'h00000014: begin
                  reg6_f1 <= wdata[31];
                  reg6_f2 <= wdata[28:26];
                  reg6_f3 <= wdata[25:19];
                  reg6_f4 <= wdata[18:6];
                  reg6_f5 <= wdata[5:0];
                  reg6 <= {reg6_f1,reg6_f2,reg6_f3,reg6_f4,reg6_f5};
                end

                32'h00000018: begin
                  reg7_f1 <= wdata[31];
                  reg7_f2 <= wdata[30];
                  reg7_f3 <= wdata[29:0];
                  reg7 <= {reg7_f1,reg7_f2,reg7_f3};
                end

                32'h0000001C: begin
                  reg8_f1 <= wdata[31:24];
                  reg8_f2 <= wdata[23:0];
                  reg8 <= {reg8_f1,reg8_f2};
                end

                32'h00000020: begin
                  reg9_f1 <= wdata[31:22];
                  reg9_f2 <= wdata[21:12];
                  reg9_f3 <= wdata[11:0];
                  reg9 <= {reg9_f1,reg9_f2,reg9_f3};
                end

                32'h00000024: begin
                  reg10_f1 <= wdata[31];
                  reg10_f2 <= wdata[30];
                  reg10_f3 <= wdata[29:0];
                  reg10 <= {reg10_f1,reg10_f2,reg10_f3};
                end
              endcase
            end
            // return to SETUP
            bus <= SETUP;
        end //END Begin of W_ENABLE
      
      R_ENABLE : begin
            // read rdata from memory
            if (sel && enable && !pwrite) begin
              // rdata <= mem[addr];
              case (addr)
                32'h00000000: begin
                  rdata[31:30] <=  reg1_f1;
                  rdata[29] <=  reg1_f2;
                  rdata[28] <=  reg1_f3;
                  rdata[27:0] <=  reg1_f4;
                end
                32'h00000004: begin
                  rdata[31:28] <=  reg2_f1;
                  rdata[27] <=  reg2_f2;
                  rdata[26:0] <=  reg2_f3;
                end
                32'h00000008: begin
                  rdata[31:30] <=  reg3_f1;
                  rdata[29:15] <=  reg3_f2;
                  rdata[14:0] <=  reg3_f3;
                end
                32'h0000000C: begin
                  rdata[31:16] <=  reg4_f1;
                  rdata[15:0] <=  reg4_f2;
                end
                32'h00000010: begin
                  rdata[31:0] <=  reg5_f1;
                end
                32'h00000014: begin
                  rdata[31] <=  reg6_f1;
                  rdata[28:26] <=  reg6_f2;
                  rdata[25:19] <=  reg6_f3;
                  rdata[18:6] <=  reg6_f4;
                  rdata[5:0] <=  reg6_f5;
                end
                32'h00000018: begin
                  rdata[31] <=  reg7_f1;
                  rdata[30] <=  reg7_f2;
                  rdata[29:0] <=  reg7_f3;
                end
                32'h0000001C: begin
                end
                32'h00000020: begin
                  rdata[31:22] <=  reg9_f1;
                  rdata[21:12] <=  reg9_f2;
                  rdata[11:0] <=  reg9_f3;
                end
                32'h00000024: begin
                  rdata[31] <=  reg10_f1;
                  rdata[30] <=  reg10_f2;
                  rdata[29:0] <=  reg10_f3;
                end
              endcase
            end
            // return to SETUP
            bus <= SETUP;
          end
      endcase
    end
  end
endmodule


