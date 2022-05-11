/*
  Author : Rakotojaona Nambinina
  email : Andrianoelisoa.Rakotojaona@gmail.com
  Description : Comparator code that compare two signal data1 and data2 when tx signal is 1
*/

module compare (
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

/*
Simulation code for comparator module

module test1(

    );
  // parameter 
  parameter DATAWIDTH = 32;
  // input port 
  reg clk;
  reg rst;
  reg tx;
  reg [DATAWIDTH-1:0] data1;
  reg [DATAWIDTH-1:0] data2;
  // output port 
  wire  [DATAWIDTH-1:0] data;
  wire  data_same;
  
    compare uut (
       clk,
       rst,
       tx,
       data1,
       data2,
       data,
       data_same
       );
       
  initial
    begin
      clk =0;
      rst =1;
      tx =0;
      data1 = 32'd1;
      data2 = 32'd2;
      #10 
      rst =0;
      #100 
      data2= 32'd1;
      tx=1;
    end 
  always 
    begin
      #5 clk = ! clk;
    end 

endmodule


*/
