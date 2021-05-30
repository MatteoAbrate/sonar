//
// SONAR MASTER
//


`timescale 1ns / 100ps

module sonar (

   input  wire clk,   // assume 50 MHz input clock from on-board oscillator
   input reg ECHO,
   output reg pulse_width

   ) ;

endmodule


   //////////////////////////////
   //          trigger         //
   //////////////////////////////

module trigger (

   input wire clk,
   output reg trigger,
   input reg [22:0] count 
);

  
 
    
   always @(posedge clk) begin
   
       count <= count + 'b1 ;
	   
	   if (count ==  'b10011000100101101000000) begin  // trigger every 100 ms
           trigger <= 'b1;
		   
		   if (count ==  'b10011000100110100110100) begin //trigger stays 1 for 10 us
           count <= 'b0;                                  //count restart
		   trigger <= 'b0;                                //trigger go to 0
      end 
	  end
	  
	  
   end //always
endmodule


   //////////////////////////////
   //          counter         //
   //////////////////////////////
/*
module counter (

   input wire clk,
   input wire enable,
   input wire rst,
   output reg pulse_width
   
);

input reg [22:0] count_width ;

 always @(posedge clk) begin
   
       
	   
	   if (enable ==  'b1) begin
           count_width <= count_width + 'b1 ; 
           count_width <= 'b0;
      end 
	  
	  else begin 
	     trigger <= 'b0;
	  
	  end
   end 





endmodule
*/