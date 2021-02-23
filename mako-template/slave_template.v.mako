<%!
import math
from collections import deque
def log2(x): return int(math.ceil(math.log(x, 2)))
%>
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

% for i in range(len(reg_data)):
  reg  [DATAW-1:0] ${reg_data[i][0]}; 
% endfor

// Fields

% for j in range(len(reg_data)):
  %for k in range(len(reg_data[j][2])):
  reg  ${reg_data[j][6][k]}    ${reg_data[j][2][k]};
  % endfor
% endfor

  parameter logic [1:0]   SETUP = 0;
  parameter logic [1:0]   W_ENABLE = 1;
  parameter logic [1:0]   R_ENABLE = 2;


//Always block
  always @(negedge rst_n or posedge clk) begin
    if (rst_n == 0) begin
      bus <= 0;
      prdata <= 0;
% for m in range(len(reg_data)):
  %for n in range(len(reg_data[m][2])):
      ${reg_data[m][2][n]} <= ${reg_data[m][4][n]};
  % endfor
% endfor
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
## Printing case wise address for write
%for i in range(len(reg_data)):
<% reg_f = ",".join(reg_data[i][2][0:])%>
                ${reg_data[i][1]}: begin
                %for j in range(len(reg_data[i][2])):
                  %if reg_data[i][5][j].upper() != 'RO':
                  ${reg_data[i][2][j]} <= wdata${reg_data[i][3][j]};
                  % endif
                % endfor
                  ${reg_data[i][0]} <= {${reg_f}};
                end
% endfor
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
## Printing case wise address for read
%for i in range(len(reg_data)):
                ${reg_data[i][1]}: begin
                %for j in range(len(reg_data[i][2])):
                  %if reg_data[i][5][j].upper() != 'WO':
                  rdata${reg_data[i][3][j]} <=  ${reg_data[i][2][j]};
                  % endif
                % endfor
                end
% endfor
              endcase
            end
            // return to SETUP
            bus <= SETUP;
          end
      endcase
    end
  end
endmodule

## ### ## ### END OF TEMPLATE ## ### ## ### ## 