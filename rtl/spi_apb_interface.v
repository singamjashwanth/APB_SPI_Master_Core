`define SPI_APB_DATA_WIDTH 8
`define SPI_REG_WIDTH 8
`define SPI_APB_ADDR_WIDTH 3

module spi_apb_interface(
	input PCLK,
	input PRESET_n,
	input [`SPI_APB_ADDR_WIDTH-1:0] PADDR_i,
	input PWRITE_i,
	input PSEL_i,
	input PENABLE_i,
	input [`SPI_APB_DATA_WIDTH-1:0] PWDATA_i,
	input ss_i,
	input [`SPI_APB_DATA_WIDTH-1:0] data_miso_i,
	input receive_data_i,
	input tip_i,
	output reg [`SPI_APB_DATA_WIDTH-1:0] PRDATA_i,
	output PREADY_o,
	output PSLVERR_o,
	output reg send_data_o,
	output reg [`SPI_APB_DATA_WIDTH-1:0] data_mosi_o,
	output reg [1:0] spi_mode_o,
	output mstr_o,
	output cpol_o,
	output cpha_o,
	output lsbfe_o,
	output spiswai_o,
	output [2:0] sppr_o,
	output [2:0] spr_o,
	output spi_interrupt_request_o );
	
localparam IDLE = 2'b00;
localparam SETUP = 2'b01;
localparam ENABLE = 2'b10;

localparam spi_run = 2'b00;
localparam spi_wait = 2'b01;
localparam spi_stop = 2'b10;

// masked register values for Control reg 2 and BaudRate register

localparam cr2_mask = 8'h1B;
localparam br_mask = 8'h77;

reg [1:0] state;
reg [1:0] next_state;
reg [1:0] next_mode;
wire spie;
wire sptie;
wire spe;
wire modf;
wire ssoe;
wire modfen;
reg sptef;
reg spif;
wire wr_enb;
wire rd_enb;


// Registers
reg [7:0] SPI_CR_1;
reg [7:0] SPI_CR_2;
reg [7:0] SPI_BR;
reg [7:0] SPI_DR;
reg [7:0] SPI_SR;

// Present State Logic
always@(posedge PCLK or negedge PRESET_n)
 begin
  if(!PRESET_n)
   state <= IDLE;
  else
   state <= next_state;
 end
// Next State APB Logic
always@(*)
 begin
  case(state)
   IDLE :
    begin
	 if(PSEL_i && !PENABLE_i)
	  next_state = SETUP;
	 else
	  next_state = IDLE;
	end
   SETUP :
    begin
	 if(PSEL_i && PENABLE_i)
	  next_state = ENABLE;
	 else if(PSEL_i && !PENABLE_i)
	  next_state = SETUP;
	 else
	  next_state =IDLE;
	end
   ENABLE :
    begin
	 if(PSEL_i)
	  next_state = SETUP;
	 else
	  next_state = IDLE;
	end
	
   default : next_state = IDLE;
   endcase
 end
 
// PREADY_i and PSLVERR_o Logic
assign PREADY_o = (state == ENABLE)?1'b1:1'b0;
assign PSLVERR_o = (state == ENABLE)?~tip_i:1'b0;

// Write Enable and Read_enable Logic
assign wr_enb = PWRITE_i && (state == ENABLE);
assign rd_enb = !PWRITE_i && (state == ENABLE);

// Logic to update the CSR and the send the data to shift register
// Data Register updated with miso data when receive_data is asserted
always @(posedge PCLK or negedge PRESET_n)
 begin
  if (!PRESET_n)
   begin
    SPI_CR_1   <= 8'b0000_0100;
    SPI_CR_2   <= 8'b0000_0000;
    SPI_BR     <= 8'b0000_0000;
    SPI_DR     <= 8'b0000_0000;
    send_data_o <= 1'b0;
   end
  else if (wr_enb)
   begin
    case (PADDR_i)
	 3'b000 : SPI_CR_1 <= PWDATA_i;
     3'b001 : SPI_CR_2 <= (PWDATA_i & cr2_mask);
     3'b010 : SPI_BR   <= (PWDATA_i & br_mask);
     3'b101 : SPI_DR   <= PWDATA_i;

     default : SPI_DR  <= PWDATA_i;
    endcase
   end
  else if (((SPI_DR == PWDATA_i) && (SPI_DR != data_miso_i)) && (spi_mode_o == spi_run || spi_wait))
   begin
    send_data_o <= 1'b1;
    data_mosi_o <= SPI_DR;
    SPI_DR      <= 8'b0;
   end
  else if ((receive_data_i) && (spi_mode_o == spi_run || spi_mode_o == spi_wait))
   begin
    SPI_DR		<= data_miso_i;
    send_data_o <= 1'b0;
   end
  else
   begin
    send_data_o <= 1'b0;
   end
 end
 
always @(*)
 begin
  if (rd_enb)
   begin
    case(PADDR_i)
     3'b000 : PRDATA_i = SPI_CR_1;
     3'b001 : PRDATA_i = SPI_CR_2;
     3'b010 : PRDATA_i = SPI_BR;
     3'b011 : PRDATA_i = SPI_SR;
     3'b101 : PRDATA_i = SPI_DR;

     default : PRDATA_i = 8'b0;
    endcase
   end
  else
   PRDATA_i = 8'b0;
 end
// Logic to update the Register Fields or Flags
assign mstr_o   = SPI_CR_1[4];
assign cpol_o   = SPI_CR_1[3];
assign cpha_o   = SPI_CR_1[2];
assign ssoe     = SPI_CR_1[1];
assign lsbfe_o  = SPI_CR_1[0];
assign spie     = SPI_CR_1[7];
assign spe      = SPI_CR_1[6];
assign sptie    = SPI_CR_1[5];
assign modfen    = SPI_CR_2[4];
assign spiswai_o = SPI_CR_2[1];
// logic to update the sppr_o and spr_o
assign sppr_o = SPI_BR[6:4];
assign spr_o  = SPI_BR[2:0];
// Logic update the flags modf of status register
assign modf = ((~ss_i) && mstr_o && modfen && (~ssoe));
//logic to update the SPI Interrupt Request
assign spi_interrupt_request_o =(!spie && !sptie) ? 0 :( spie && !sptie) ? (spif || modf) :(!spie &&  sptie) ? sptef :(spif || sptef || modf);

// logic to update the SPI Mode
// {run_mode, wait_mode, stop_mode}
always @(posedge PCLK or negedge PRESET_n)
 begin
  if(!PRESET_n)
   spi_mode_o <= spi_run;
  else
   spi_mode_o <= next_mode;
 end
// logic to update the SPI Mode
// {run_mode, wait_mode, stop_mode}

always @(*)
 begin
  case(spi_mode_o)
   spi_run:
    begin
     if(!spe)
      next_mode = spi_wait;
     else
      next_mode = spi_run;
    end
   spi_wait:
    begin
     if(spe)
      next_mode = spi_run;
     else if(spiswai_o)
      next_mode = spi_stop;
     else
      next_mode = spi_wait;
    end
   spi_stop:
    begin
     if(spe)
      next_mode = spi_run;
     else if(!spiswai_o)
      next_mode = spi_wait;
     else
      next_mode = spi_stop;
    end
   default: next_mode = spi_run;
  endcase
 end
// Logic to set the Flags in the status registers
always @(*) // change in schematic
 begin
  if(!PRESET_n)
   SPI_SR = 8'b0010_0000;
  else
   begin
    if(SPI_DR == 8'b0000_0000)
     sptef = 1'b1;
    else
     sptef = 1'b0;
    if(SPI_DR != 8'b0000_0000)
     spif = 1'b1;
    else
     spif = 1'b0;
            
	SPI_SR = {spif,1'b0,sptef,modf,4'b0};

   end
 end

endmodule

	
