module serial_clock_generator (
	input PCLK,
	input PRESET_n,
	input [1:0] spi_mode_i,
	input spiswai_i,
	input [2:0] sppr_i,
	input [2:0] spr_i,
	input cpol_i,
	input cpha_i,
	input ss_i,
	output reg sclk_o,
	output reg miso_recieve_sclk_o,
	output reg miso_recieve_sclk0_o,
	output reg mosi_send_sclk_o,
	output reg mosi_send_sclk0_o,
	output [11:0] BaudRateDivisor_o
	);

wire pre_sclk_s;
reg[11:0] count_s;
//reg[11:0] count1_s;
wire[11:0] BaudRateDivisor;


// Baud Rate Divisor
assign BaudRateDivisor = ((sppr_i+1)*(2**(spr_i+1)));
assign BaudRateDivisor_o = BaudRateDivisor/2;

// Logic to Generate Pre_sclk based on cpol
assign pre_sclk_s = cpol_i?1'b1 : 1'b0;

// Logic to generate the sclk
always@(posedge PCLK or negedge PRESET_n)
   begin
 	 if(!PRESET_n)
	   begin
	     count_s <= 12'b0;
	     sclk_o <= pre_sclk_s;
	   end
	 else if((~ss_i) && ((spi_mode_i == 2'b00) || (spi_mode_i == 2'b01)) && (~spiswai_i))
	  begin
	     if(count_s == (BaudRateDivisor_o - 1'b1))
		begin
		count_s <= 12'b0;
		sclk_o <= ~sclk_o;
		end
	     else
		count_s <= count_s + 1'b1;
	  end
	 else
	      begin
		sclk_o <= pre_sclk_s;
		count_s <= 12'b0;
	      end
   end

// Logic to generate the flag to recive miso data
always@(posedge PCLK or negedge PRESET_n)
   begin
      if(!PRESET_n)
	begin
	   miso_recieve_sclk_o <= 1'b0;
	   miso_recieve_sclk0_o <= 1'b0;
	end
      else
        begin
	    if((!cpha_i && cpol_i)||(cpha_i && !cpol_i))  	// falling edge sampling data on miso
	      begin
	        if(sclk_o)
		  if(count_s == (BaudRateDivisor_o-2'b01))
			miso_recieve_sclk0_o <= 1'b1;
		  else
			miso_recieve_sclk0_o <= 1'b0;
	        else
		   miso_recieve_sclk0_o <= 1'b0;
	      end
	    else 						// rising edge sampling data on miso
	      begin
	        if(~sclk_o)
	           begin
		     if(count_s == (BaudRateDivisor_o-2'b01))
		        miso_recieve_sclk_o <= 1'b1;
		     else
		        miso_recieve_sclk_o <= 1'b0;
	           end
	        else
		 miso_recieve_sclk_o <= 1'b0;
	      end
	  end
   end

// Logic to generate the flag to send mosi data
always@(posedge PCLK or negedge PRESET_n)
   begin
      if(!PRESET_n)
	begin
	   mosi_send_sclk0_o <= 1'b0;
	   mosi_send_sclk_o <= 1'b0;
	end
      else
	begin
	 if((!cpha_i && cpol_i) || (cpha_i && !cpol_i))			// falling edge sampling data on mosi
	    begin
	       if(sclk_o)
		  if(count_s == (BaudRateDivisor_o-2'b10))
		     mosi_send_sclk0_o <= 1'b1;
		  else
		     mosi_send_sclk0_o <= 1'b0;
	       else
		     mosi_send_sclk0_o <= 1'b0;
	    end
	 else 								// rising edge sampling data on mosi
	     begin
		if(~sclk_o)
		   if(count_s == (BaudRateDivisor_o-2'b10))
		     mosi_send_sclk_o <= 1'b1;
		   else
		     mosi_send_sclk_o <= 1'b0;	 
		else
		     mosi_send_sclk_o <= 1'b0;
	      end
	end
   end
endmodule


  

