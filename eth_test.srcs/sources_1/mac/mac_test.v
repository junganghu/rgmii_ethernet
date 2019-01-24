
//////////////////////////////////////////////////////////////////////////////////////
//Module Name : mac_top
//Description :
//
//////////////////////////////////////////////////////////////////////////////////////
`timescale 1 ns/1 ns
module mac_test
(
 input                rst_n  ,     
 input                gmii_tx_clk ,
 input                gmii_rx_clk ,
 input                gmii_rx_dv,
 input  [7:0]         gmii_rxd,
 output reg           gmii_tx_en,
 output reg [7:0]     gmii_txd 
);

reg                  gmii_rx_dv_d0 ;
reg   [7:0]          gmii_rxd_d0 ;
wire                 gmii_tx_en_tmp ;
wire   [7:0]         gmii_txd_tmp ;


wire [7:0]           udp_rec_ram_rdata ;
reg  [10:0]          udp_rec_ram_read_addr ;
wire [15:0]          udp_rec_data_length ;
wire                 udp_rec_data_valid ;

always@(posedge gmii_rx_clk or negedge rst_n)
  begin
    if(rst_n == 1'b0)
      begin
        gmii_rx_dv_d0 <= 1'b0 ;
        gmii_rxd_d0   <= 8'd0 ;
      end
    else
      begin
        gmii_rx_dv_d0 <= gmii_rx_dv ;
        gmii_rxd_d0   <= gmii_rxd ;
      end
  end
  
always@(posedge gmii_tx_clk or negedge rst_n)
  begin
    if(rst_n == 1'b0)
      begin
        gmii_tx_en <= 1'b0 ;
        gmii_txd   <= 8'd0 ;
      end
    else
      begin
        gmii_tx_en <= gmii_tx_en_tmp ;
        gmii_txd   <= gmii_txd_tmp ;
      end
  end



  
mac_top mac_top0
(
 .gmii_tx_clk                 (gmii_tx_clk)                  ,
 .gmii_rx_clk                 (gmii_rx_clk)                  ,
 .rst_n                       (rst_n)  ,
 
 .source_mac_addr             (48'h00_0a_35_01_fe_c0)   ,       //source mac address
 .TTL                         (8'h80),
 .source_ip_addr              (32'hc0a80002),
 .destination_ip_addr         (32'hc0a80003),
 .udp_send_source_port        (16'h1f90),
 .udp_send_destination_port   (16'h1f90),
 
 .ram_wr_data                 () ,
 .ram_wr_en                   (),
 .udp_ram_data_req            (),
 .udp_send_data_length        (),
 .udp_tx_end                  (),
 .almost_full                 (), 
 
 .udp_tx_req                  (),
 .arp_request_req             (),
 
 .mac_send_end                (),
 .mac_data_valid              (gmii_tx_en_tmp),
 .mac_tx_data                 (gmii_txd_tmp),
 .rx_dv                       (gmii_rx_dv_d0   ),
 .mac_rx_datain               (gmii_rxd_d0 ),
 
 .udp_rec_ram_rdata           (udp_rec_ram_rdata),
 .udp_rec_ram_read_addr       (udp_rec_ram_read_addr),
 .udp_rec_data_length         (udp_rec_data_length ),
 
 .udp_rec_data_valid          (udp_rec_data_valid),
 .arp_found                   (),
 .mac_not_exist               ()
) ;

            
endmodule


