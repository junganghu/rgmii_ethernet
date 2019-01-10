`timescale 1ns / 1ps  
//////////////////////////////////////////////////////////////////////////////////
// Module Name:    ethernet_test 
//////////////////////////////////////////////////////////////////////////////////
module ethernet_2port(
input clk_50m, 
output e1_reset,
output e1_mdc,
inout  e1_mdio,
output[3:0] rgmii1_txd,
output rgmii1_txctl,
output rgmii1_txc,
input[3:0] rgmii1_rxd,
input rgmii1_rxctl,
input rgmii1_rxc,
output e2_reset,
output e2_mdc,
inout  e2_mdio,
output[3:0] rgmii2_txd,
output rgmii2_txctl,
output rgmii2_txc,
input[3:0] rgmii2_rxd,
input rgmii2_rxctl,
input rgmii2_rxc	

); 
    //=========================================================================
    // ���ʱ��ת���ɵ���ʱ��
    //===========================================================================
  wire clk_125m;

  
  clk_wiz_0 sys_clk
  (
  .clk_out1(clk_125m),
  .clk_in1(clk_50m)
  );
              
ethernet_test u1(
.sys_clk(clk_125m),
.rst_n(1'b1),
.e_reset(e1_reset),          
.e_mdc(e1_mdc),
.e_mdio(e1_mdio),               

.rgmii_txd(rgmii1_txd),
.rgmii_txctl(rgmii1_txctl),     
.rgmii_txc(rgmii1_txc),
.rgmii_rxd(rgmii1_rxd),     
.rgmii_rxctl(rgmii1_rxctl),
.rgmii_rxc(rgmii1_rxc) 
      
);
          
ethernet_test u2(
.sys_clk(clk_125m),
.rst_n(1'b1),
.e_reset(e2_reset),          
.e_mdc(e2_mdc),
.e_mdio(e2_mdio),               

.rgmii_txd(rgmii2_txd),
.rgmii_txctl(rgmii2_txctl),     
.rgmii_txc(rgmii2_txc),
.rgmii_rxd(rgmii2_rxd),     
.rgmii_rxctl(rgmii2_rxctl),
.rgmii_rxc(rgmii2_rxc) 
    
);           
endmodule                      
