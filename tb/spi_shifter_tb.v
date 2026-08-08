module spi_shifter_tb;

reg PCLK;
reg PRESET_n;

//  SPI Configuration 
reg ss_i;
reg send_data_i;
reg receive_data_i;
reg lsbfe_i;
reg cpha_i;
reg cpol_i;

reg [1:0] spi_mode_i;
reg spiswai_i;
reg [2:0] sppr_i;
reg [2:0] spr_i;

// 	Data
reg [7:0] data_mosi_i;
reg [7:0] rx_data;
reg miso_i;

wire [7:0] data_miso_o;
wire mosi_o;

//	 Baud Connections 
wire sclk_o;
wire miso_receive_sclk_o;
wire miso_receive_sclk0_o;
wire mosi_send_sclk_o;
wire mosi_send_sclk0_o;
wire [11:0] BaudRateDivisor_o;

integer i;

// 	DUTs

serial_clock_generator BAUD(
	.PCLK(PCLK),
	.PRESET_n(PRESET_n),
	.spi_mode_i(spi_mode_i),
	.spiswai_i(spiswai_i),
	.sppr_i(sppr_i),
	.spr_i(spr_i),
	.cpol_i(cpol_i),
	.cpha_i(cpha_i),
	.ss_i(ss_i),
	.sclk_o(sclk_o),
	.miso_receive_sclk_o(miso_receive_sclk_o),
	.miso_receive_sclk0_o(miso_receive_sclk0_o),
	.mosi_send_sclk_o(mosi_send_sclk_o),
	.mosi_send_sclk0_o(mosi_send_sclk0_o),
	.BaudRateDivisor_o(BaudRateDivisor_o)
);

spi_shifter DUT(
	.PCLK(PCLK),
	.PRESET_n(PRESET_n),
	.ss_i(ss_i),
	.send_data_i(send_data_i),
	.lsbfe_i(lsbfe_i),
	.cpha_i(cpha_i),
	.cpol_i(cpol_i),
	.mosi_send_sclk_i(mosi_send_sclk_o),
	.mosi_send_sclk0_i(mosi_send_sclk0_o),
	.miso_receive_sclk_i(miso_receive_sclk_o),
	.miso_receive_sclk0_i(miso_receive_sclk0_o),
	.data_mosi_i(data_mosi_i),
	.miso_i(miso_i),
	.receive_data_i(receive_data_i),
	.data_miso_o(data_miso_o),
	.mosi_o(mosi_o)
);
// 	Clock
initial PCLK=0;
always #5 PCLK=~PCLK;

//	Tasks
//	TASK INITIALIZE
task initialize;
begin
  PRESET_n=1'b1;
  ss_i=1'b1;
  send_data_i=1'b0;
  receive_data_i=1'b0;
  lsbfe_i=1'b0;
  cpol_i=1'b0;
  cpha_i=1'b0;
  spi_mode_i=2'b00;
  spiswai_i=1'b0;
  sppr_i=3'd0;
  spr_i=3'd2;
  miso_i=1'b0;
  data_mosi_i=8'd0;
end
endtask

//	TASK RESET
task reset;
begin
  PRESET_n=0;
  repeat(2) @(posedge PCLK);
  PRESET_n=1;
  repeat(2) @(posedge PCLK);
end
endtask

//	TASK INPUTS
task inputs;
input m,n,l;

begin
  cpol_i=m;
  cpha_i=n;
  lsbfe_i=l;
  spi_mode_i=2'b00;
  sppr_i=3'd0;
  spr_i=3'd2;
end
endtask

//	TASK MODE
task load_tx;
input [7:0] din;
begin
  data_mosi_i=din;
  send_data_i=1;
  @(posedge PCLK);
  send_data_i=0;
end
endtask

//	TASK SEND MISO
task send_miso0;
begin
    if(cpol_i != cpha_i)
    begin
   	// Preload first bit
	miso_i = rx_data[7];
        // DUT samples on falling edge,
        // so slave changes on rising edge.
        for(i=7;i>=0;i=i-1)
        begin
            @(posedge sclk_o);
            miso_i = rx_data[i];
	    repeat(2) @(posedge PCLK);
        end
    end
    else
    begin
        // DUT samples on rising edge,
        // so slave changes on falling edge.
        for(i=7;i>=0;i=i-1)
        begin
            @(posedge sclk_o);
            miso_i = rx_data[i];
	    repeat(2) @(posedge PCLK);
        end
    end
end
endtask

// task to be choosed based on lsbfe
task lsb;
input l;
begin
   
   if(l)
     send_miso1;
   else
     send_miso0;
end
endtask

task send_miso1;
begin
    if(cpol_i != cpha_i)
    begin
   	// Preload first bit
	miso_i = rx_data[0];
        // DUT samples on falling edge,
        // so slave changes on rising edge.
        for(i=0;i<=7;i=i+1)
        begin
            @(posedge sclk_o);
            miso_i = rx_data[i];
	    repeat(2) @(posedge PCLK);
        end
    end
    else
    begin
        // DUT samples on rising edge,
        // so slave changes on falling edge.
        for(i=0;i<=7;i=i+1)
        begin
            @(posedge sclk_o);
            miso_i = rx_data[i];
	    repeat(2) @(posedge PCLK);
        end
    end
end
endtask

//	TASK TRANSFER
task mode_transfer;
input p,q,l;
begin
  inputs(p,q,l);
  load_tx(8'hA5);
  ss_i=0;
  fork
    lsb(l);
    repeat(8) @(posedge sclk_o);
  join
  repeat(4) @(posedge PCLK);
  receive_data_i=1;
  repeat(4) @(posedge PCLK);
  receive_data_i=0;

  ss_i=1;
  repeat(2) @(posedge PCLK);
end
endtask

//	STIMULUS

initial
begin
  initialize;
  reset;

  rx_data = 8'h3C;
  mode_transfer(0,0,1);

  #100;

  rx_data = 8'h5A;
  mode_transfer(1,0,1);

  #100;
  rx_data = 8'h5C;
  mode_transfer(1,1,1);

  #100;
  rx_data = 8'hAA;
  mode_transfer(0,1,1);

  #100;
  $finish;
end

endmodule
