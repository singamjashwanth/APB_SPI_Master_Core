`define APB_DATA_WIDTH 8
`define SPI_REG_WIDTH  8
`define APB_ADDR_WIDTH 3

module spi_apb_slave_tb();

reg PCLK = 1'b0;
reg PRESET_n;
reg [`APB_ADDR_WIDTH-1:0] PADDR;
reg PWRITE;
reg PSEL;
reg PENABLE;
reg [`APB_DATA_WIDTH-1:0] PWDATA;
reg receive_data;

wire send_data;
wire [`APB_DATA_WIDTH-1:0] PRDATA;
wire PREADY;
wire PSLVERR;

reg tip;
reg ss;

reg  [`APB_DATA_WIDTH-1:0] miso_data;
wire [`APB_DATA_WIDTH-1:0] mosi_data;

wire [1:0] spi_mode;
wire mstr;
wire cpol;
wire cpha;
wire lsbfe;
wire spiswai;
wire [2:0] sppr;
wire [2:0] spr;
wire spi_interrupt_request;

spi_apb_interface DUT (
    .PCLK(PCLK),
    .PRESET_n(PRESET_n),
    .PADDR_i(PADDR),
    .PWRITE_i(PWRITE),
    .PSEL_i(PSEL),
    .PENABLE_i(PENABLE),
    .PWDATA_i(PWDATA),
    .PRDATA_i(PRDATA),
    .PREADY_o(PREADY),
    .receive_data_i(receive_data),
    .send_data_o(send_data),
    .ss_i(ss),
    .data_miso_i(miso_data),
    .data_mosi_o(mosi_data),
    .spi_mode_o(spi_mode),
    .mstr_o(mstr),
    .cpol_o(cpol),
    .cpha_o(cpha),
    .lsbfe_o(lsbfe),
    .spiswai_o(spiswai),
    .sppr_o(sppr),
    .spr_o(spr),
    .spi_interrupt_request_o(spi_interrupt_request),
    .tip_i(tip),
    .PSLVERR_o(PSLVERR)
);

always #5 PCLK = ~PCLK;

// Reset Task
task reset;
begin
    @(negedge PCLK)
    PRESET_n = 1'b0;

    @(negedge PCLK)
    PRESET_n = 1'b1;
end
endtask

// Initialize Task
task initialize;
begin

    @(negedge PCLK)
    PADDR   = 3'b000;
    PWRITE  = 1'b1;
    PSEL    = 1'b1;
    PENABLE = 1'b0;
    PWDATA  = 8'b1111_0100;
    ss      = 1'b1;
    tip     = 1'b0;

    @(negedge PCLK)
    PADDR   = 3'b000;
    PWRITE  = 1'b1;
    PSEL    = 1'b1;
    PENABLE = 1'b1;
    PWDATA  = 8'b1111_0100;

    @(negedge PCLK)
    PADDR   = 3'b000;
    PWRITE  = 1'b1;
    PSEL    = 1'b1;
    PENABLE = 1'b0;
    PWDATA  = 8'b1111_0100;

    @(negedge PCLK)
    PADDR   = 3'b001;
    PWRITE  = 1'b1;
    PSEL    = 1'b1;
    PENABLE = 1'b0;
    PWDATA  = 8'b1100_0010;

    @(negedge PCLK)
    PADDR   = 3'b001;
    PWRITE  = 1'b1;
    PSEL    = 1'b1;
    PENABLE = 1'b1;
    PWDATA  = 8'b1100_0010;

    @(negedge PCLK)
    PADDR   = 3'b010;
    PWRITE  = 1'b1;
    PSEL    = 1'b1;
    PENABLE = 1'b0;
    PWDATA  = 8'b0010_0111;

    @(negedge PCLK)
    PADDR   = 3'b010;
    PWRITE  = 1'b1;
    PSEL    = 1'b1;
    PENABLE = 1'b1;
    PWDATA  = 8'b0010_0111;

end
endtask

// Write Task
task write;
begin
    @(negedge PCLK)
    PADDR   = 3'b101;
    PWRITE  = 1'b1;
    PSEL    = 1'b1;
    PENABLE = 1'b0;
    PWDATA  = 8'b1100_1111;
    tip     = 1'b0;

    @(negedge PCLK)
    PADDR   = 3'b101;
    PWRITE  = 1'b1;
    PSEL    = 1'b1;
    PENABLE = 1'b1;
    PWDATA  = 8'b1100_1111;
end
endtask

// Read Task
task read;
begin
    @(negedge PCLK)
    PADDR   = 3'b101;
    PWRITE  = 1'b0;
    PSEL    = 1'b1;
    PENABLE = 1'b0;

    @(negedge PCLK)
    PADDR   = 3'b101;
    PWRITE  = 1'b0;
    PSEL    = 1'b1;
    PENABLE = 1'b1;
end
endtask

// Test Sequence
initial
begin
    #5;
    reset;

    #10;
    initialize;

    #10;
    write;

    #10;
    miso_data     = 8'hFF;
    ss            = 1'b0;
    receive_data  = 1'b1;

    read;

    #20;
    receive_data = 1'b0;

    #50;
    $finish();
end

endmodule
