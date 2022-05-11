module (
       clk,
       rst,
       tx,
       data1,
       data2,
       data,
       data_same
       );
  // parameter 
  parameter DATAWIDTH = 32;
  // input port 
  input clk;
  input rst;
  input tx;
  input [DATAWIDTH-1:0] data1;
  input [DATAWIDTH-1:0] data2;
  // output port 
  output reg [DATAWIDTH-1:0] data;
  output reg data_same;
  
  //execute every positive edge clk
  always @ (posedge clk)
    begin
      if (rst)
        begin
          data_same <=1'bx;
          data <= 32'dx;
        end
      else
        begin
          if (tx)
            begin
              if (data1 ==data2)
                begin
                  data <= data1;
                  data_same <= 1;
                end
              else
                begin
                  data <= 32'dx;
                  data_same <= 0;
                end 
            end
          else
            begin
              data <=32'dx;
              data_same <= 0;
            end 
        end 
    end 
  
endmodule
