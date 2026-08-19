`define SPI_APB_DATA_WIDTH 8
`define SPI_APB_ADDR_WIDTH 3

module spi_core_top(

    input                           PCLK,
    input                           PRESET_n,

    input  [`SPI_APB_ADDR_WIDTH-1:0] PADDR_i,
    input                           PWRITE_i,
    input                           PSEL_i,
    input                           PENABLE_i,
    input  [`SPI_APB_DATA_WIDTH-1:0] PWDATA_i,

    input                           miso_i,

    output [`SPI_APB_DATA_WIDTH-1:0] PRDATA_o,
    output                          PREADY_o,
    output                          PSLVERR_o,

    output                          spi_interrupt_request_o,

    output                          ss_o,
    output                          sclk_o,
    output                          mosi_o

);

// Internal Signals
wire [1:0] spi_mode_s;
wire mstr_s;
wire cpol_s;
wire cpha_s;
wire lsbfe_s;
wire spiswai_s;

wire [2:0] sppr_s;
wire [2:0] spr_s;

wire send_data_s;
wire receive_data_s;
wire tip_s;

wire [7:0] data_mosi_s;
wire [7:0] data_miso_s;

wire miso_receive_sclk_s;
wire miso_receive_sclk0_s;

wire mosi_send_sclk_s;
wire mosi_send_sclk0_s;

wire [11:0] BaudRateDivisor_s;

wire ss_s;

// APB Interface

spi_apb_interface DUT1(

    .PCLK                       (PCLK),
    .PRESET_n                   (PRESET_n),

    .PADDR_i                    (PADDR_i),
    .PWRITE_i                   (PWRITE_i),
    .PSEL_i                     (PSEL_i),
    .PENABLE_i                  (PENABLE_i),
    .PWDATA_i                   (PWDATA_i),

    .ss_i                       (ss_s),

    .data_miso_i                (data_miso_s),
    .receive_data_i             (receive_data_s),
    .tip_i                      (tip_s),

    .PRDATA_i                   (PRDATA_o),

    .PREADY_o                   (PREADY_o),
    .PSLVERR_o                  (PSLVERR_o),

    .send_data_o                (send_data_s),
    .data_mosi_o                (data_mosi_s),

    .spi_mode_o                 (spi_mode_s),

    .mstr_o                     (mstr_s),
    .cpol_o                     (cpol_s),
    .cpha_o                     (cpha_s),
    .lsbfe_o                    (lsbfe_s),
    .spiswai_o                  (spiswai_s),

    .sppr_o                     (sppr_s),
    .spr_o                      (spr_s),

    .spi_interrupt_request_o    (spi_interrupt_request_o)

);

// Serial Clock Generator

serial_clock_generator DUT2(

    .PCLK                       (PCLK),
    .PRESET_n                   (PRESET_n),

    .spi_mode_i                 (spi_mode_s),
    .spiswai_i                  (spiswai_s),

    .sppr_i                     (sppr_s),
    .spr_i                      (spr_s),

    .cpol_i                     (cpol_s),
    .cpha_i                     (cpha_s),

    .ss_i                       (ss_s),

    .sclk_o                     (sclk_o),

    .miso_receive_sclk_o        (miso_receive_sclk_s),
    .miso_receive_sclk0_o       (miso_receive_sclk0_s),

    .mosi_send_sclk_o           (mosi_send_sclk_s),
    .mosi_send_sclk0_o          (mosi_send_sclk0_s),

    .BaudRateDivisor_o          (BaudRateDivisor_s)

);

// SPI Slave Control

spi_slave_control DUT3(

    .PRESET_n                   (PRESET_n),

    .spi_mode_i                 (spi_mode_s),
    .mstr_i                     (mstr_s),
    .spiswai_i                  (spiswai_s),

    .PCLK                       (PCLK),

    .send_data_i                (send_data_s),

    .BaudRateDivisor_i          (BaudRateDivisor_s),

    .ss_o                       (ss_s),

    .receive_data_o             (receive_data_s),

    .tip_o                      (tip_s)

);

// SPI Shifter

spi_shifter DUT4(

    .PCLK                       (PCLK),
    .PRESET_n                   (PRESET_n),

    .ss_i                       (ss_s),

    .send_data_i                (send_data_s),

    .lsbfe_i                    (lsbfe_s),

    .cpha_i                     (cpha_s),
    .cpol_i                     (cpol_s),

    .miso_receive_sclk_i        (miso_receive_sclk_s),
    .miso_receive_sclk0_i       (miso_receive_sclk0_s),

    .mosi_send_sclk_i           (mosi_send_sclk_s),
    .mosi_send_sclk0_i          (mosi_send_sclk0_s),

    .data_mosi_i                (data_mosi_s),

    .miso_i                     (miso_i),

    .receive_data_i             (receive_data_s),

    .data_miso_o                (data_miso_s),

    .mosi_o                     (mosi_o)

);
// Top-Level Outputs

assign ss_o = ss_s;

endmodule
