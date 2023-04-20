library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
entity UART_RX is
  port (
    CLK: in std_logic;
    RST: in std_logic;
    DIN: in std_logic;
    DOUT: out std_logic_vector (7 downto 0);
    DOUT_VLD: out std_logic
  );
end entity;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uart_rx_fsm is
  port (
    clk : in std_logic;
    rst : in std_logic;
    din : in std_logic;
    cnt3 : in std_logic_vector (2 downto 0);
    cnt4 : in std_logic_vector (3 downto 0);
    rx_offset : out std_logic;
    rx_read : out std_logic;
    rx_end : out std_logic;
    rx_vld : out std_logic;
    rx_stop : out std_logic);
end entity uart_rx_fsm;

architecture rtl of uart_rx_fsm is
  signal state : std_logic_vector (2 downto 0);
  signal n101_o : std_logic;
  signal n102_o : std_logic;
  signal n106_o : std_logic;
  signal n107_o : std_logic;
  signal n111_o : std_logic;
  signal n112_o : std_logic;
  signal n116_o : std_logic;
  signal n117_o : std_logic;
  signal n121_o : std_logic;
  signal n122_o : std_logic;
  signal n126_o : std_logic;
  signal n127_o : std_logic;
  signal n129_o : std_logic_vector (2 downto 0);
  signal n131_o : std_logic;
  signal n133_o : std_logic;
  signal n135_o : std_logic_vector (2 downto 0);
  signal n137_o : std_logic;
  signal n139_o : std_logic;
  signal n141_o : std_logic;
  signal n142_o : std_logic;
  signal n144_o : std_logic_vector (2 downto 0);
  signal n146_o : std_logic;
  signal n148_o : std_logic;
  signal n149_o : std_logic;
  signal n151_o : std_logic_vector (2 downto 0);
  signal n153_o : std_logic;
  signal n155_o : std_logic;
  signal n157_o : std_logic;
  signal n159_o : std_logic_vector (2 downto 0);
  signal n161_o : std_logic;
  signal n162_o : std_logic_vector (5 downto 0);
  signal n165_o : std_logic_vector (2 downto 0);
  signal n167_o : std_logic_vector (2 downto 0);
  signal n170_q : std_logic_vector (2 downto 0) := "000";
begin
  rx_offset <= n102_o;
  rx_read <= n107_o;
  rx_end <= n112_o;
  rx_vld <= n117_o;
  rx_stop <= n122_o;
  -- uart_rx_fsm.vhd:39:12
  state <= n170_q; -- (isignal)
  -- uart_rx_fsm.vhd:41:33
  n101_o <= '1' when state = "001" else '0';
  -- uart_rx_fsm.vhd:41:22
  n102_o <= '0' when n101_o = '0' else '1';
  -- uart_rx_fsm.vhd:42:31
  n106_o <= '1' when state = "010" else '0';
  -- uart_rx_fsm.vhd:42:20
  n107_o <= '0' when n106_o = '0' else '1';
  -- uart_rx_fsm.vhd:43:30
  n111_o <= '1' when state = "011" else '0';
  -- uart_rx_fsm.vhd:43:19
  n112_o <= '0' when n111_o = '0' else '1';
  -- uart_rx_fsm.vhd:44:30
  n116_o <= '1' when state = "100" else '0';
  -- uart_rx_fsm.vhd:44:19
  n117_o <= '0' when n116_o = '0' else '1';
  -- uart_rx_fsm.vhd:45:31
  n121_o <= '1' when state = "101" else '0';
  -- uart_rx_fsm.vhd:45:20
  n122_o <= '0' when n121_o = '0' else '1';
  -- uart_rx_fsm.vhd:49:12
  n126_o <= '1' when rising_edge (clk) else '0';
  -- uart_rx_fsm.vhd:57:32
  n127_o <= not din;
  -- uart_rx_fsm.vhd:57:25
  n129_o <= state when n127_o = '0' else "001";
  -- uart_rx_fsm.vhd:56:21
  n131_o <= '1' when state = "000" else '0';
  -- uart_rx_fsm.vhd:61:33
  n133_o <= '1' when cnt3 = "111" else '0';
  -- uart_rx_fsm.vhd:61:25
  n135_o <= state when n133_o = '0' else "010";
  -- uart_rx_fsm.vhd:60:21
  n137_o <= '1' when state = "001" else '0';
  -- uart_rx_fsm.vhd:65:33
  n139_o <= '1' when cnt4 = "1111" else '0';
  -- uart_rx_fsm.vhd:65:51
  n141_o <= '1' when cnt3 = "111" else '0';
  -- uart_rx_fsm.vhd:65:42
  n142_o <= n139_o and n141_o;
  -- uart_rx_fsm.vhd:65:25
  n144_o <= state when n142_o = '0' else "011";
  -- uart_rx_fsm.vhd:64:21
  n146_o <= '1' when state = "010" else '0';
  -- uart_rx_fsm.vhd:69:47
  n148_o <= '1' when cnt4 = "1111" else '0';
  -- uart_rx_fsm.vhd:69:38
  n149_o <= din and n148_o;
  -- uart_rx_fsm.vhd:69:25
  n151_o <= state when n149_o = '0' else "100";
  -- uart_rx_fsm.vhd:68:21
  n153_o <= '1' when state = "011" else '0';
  -- uart_rx_fsm.vhd:72:21
  n155_o <= '1' when state = "100" else '0';
  -- uart_rx_fsm.vhd:75:33
  n157_o <= '1' when cnt3 = "111" else '0';
  -- uart_rx_fsm.vhd:75:25
  n159_o <= state when n157_o = '0' else "000";
  -- uart_rx_fsm.vhd:74:21
  n161_o <= '1' when state = "101" else '0';
  n162_o <= n161_o & n155_o & n153_o & n146_o & n137_o & n131_o;
  -- uart_rx_fsm.vhd:55:17
  with n162_o select n165_o <=
    n159_o when "100000",
    "101" when "010000",
    n151_o when "001000",
    n144_o when "000100",
    n135_o when "000010",
    n129_o when "000001",
    "XXX" when others;
  -- uart_rx_fsm.vhd:51:13
  n167_o <= n165_o when rst = '0' else "000";
  -- uart_rx_fsm.vhd:49:9
  process (clk)
  begin
    if rising_edge (clk) then
      n170_q <= n167_o;
    end if;
  end process;
end rtl;


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture rtl of uart_rx is
  signal wrap_CLK: std_logic;
  signal wrap_RST: std_logic;
  signal wrap_DIN: std_logic;
  subtype typwrap_DOUT is std_logic_vector (7 downto 0);
  signal wrap_DOUT: typwrap_DOUT;
  signal wrap_DOUT_VLD: std_logic;
  signal cnt4 : std_logic_vector (3 downto 0);
  signal cnt3 : std_logic_vector (2 downto 0);
  signal rx_offset : std_logic;
  signal rx_read : std_logic;
  signal rx_end : std_logic;
  signal rx_vld : std_logic;
  signal rx_stop : std_logic;
  signal fsm_rx_offset : std_logic;
  signal fsm_rx_read : std_logic;
  signal fsm_rx_end : std_logic;
  signal fsm_rx_vld : std_logic;
  signal fsm_rx_stop : std_logic;
  signal n9_o : std_logic;
  signal n11_o : std_logic_vector (2 downto 0);
  signal n12_o : std_logic_vector (2 downto 0);
  signal n14_o : std_logic;
  signal n15_o : std_logic;
  signal n16_o : std_logic;
  signal n18_o : std_logic_vector (2 downto 0);
  signal n22_o : std_logic_vector (7 downto 0);
  signal n23_o : std_logic_vector (2 downto 0);
  signal n25_o : std_logic_vector (2 downto 0);
  signal n27_o : std_logic;
  signal n28_o : std_logic;
  signal n29_o : std_logic;
  signal n31_o : std_logic_vector (3 downto 0);
  signal n33_o : std_logic_vector (3 downto 0);
  signal n35_o : std_logic_vector (7 downto 0);
  signal n37_o : std_logic_vector (3 downto 0);
  signal n38_o : std_logic_vector (2 downto 0);
  signal n39_o : std_logic_vector (7 downto 0);
  signal n41_o : std_logic_vector (3 downto 0);
  signal n43_o : std_logic_vector (2 downto 0);
  signal n45_o : std_logic_vector (7 downto 0);
  signal n47_o : std_logic_vector (3 downto 0);
  signal n50_o : std_logic_vector (2 downto 0);
  signal n55_q : std_logic_vector (7 downto 0);
  signal n56_q : std_logic_vector (3 downto 0);
  signal n57_q : std_logic_vector (2 downto 0);
  signal n58_o : std_logic;
  signal n59_o : std_logic;
  signal n60_o : std_logic;
  signal n61_o : std_logic;
  signal n62_o : std_logic;
  signal n63_o : std_logic;
  signal n64_o : std_logic;
  signal n65_o : std_logic;
  signal n66_o : std_logic;
  signal n67_o : std_logic;
  signal n68_o : std_logic;
  signal n69_o : std_logic;
  signal n70_o : std_logic;
  signal n71_o : std_logic;
  signal n72_o : std_logic;
  signal n73_o : std_logic;
  signal n74_o : std_logic;
  signal n75_o : std_logic;
  signal n76_o : std_logic;
  signal n77_o : std_logic;
  signal n78_o : std_logic;
  signal n79_o : std_logic;
  signal n80_o : std_logic;
  signal n81_o : std_logic;
  signal n82_o : std_logic;
  signal n83_o : std_logic;
  signal n84_o : std_logic;
  signal n85_o : std_logic;
  signal n86_o : std_logic;
  signal n87_o : std_logic;
  signal n88_o : std_logic;
  signal n89_o : std_logic;
  signal n90_o : std_logic;
  signal n91_o : std_logic;
  signal n92_o : std_logic_vector (7 downto 0);
begin
  wrap_clk <= clk;
  wrap_rst <= rst;
  wrap_din <= din;
  dout <= wrap_dout;
  dout_vld <= wrap_dout_vld;
  wrap_DOUT <= n55_q;
  wrap_DOUT_VLD <= rx_vld;
  -- uart_rx.vhd:26:12
  cnt4 <= n56_q; -- (signal)
  -- uart_rx.vhd:27:12
  cnt3 <= n57_q; -- (signal)
  -- uart_rx.vhd:29:12
  rx_offset <= fsm_rx_offset; -- (signal)
  -- uart_rx.vhd:30:12
  rx_read <= fsm_rx_read; -- (signal)
  -- uart_rx.vhd:31:12
  rx_end <= fsm_rx_end; -- (signal)
  -- uart_rx.vhd:32:12
  rx_vld <= fsm_rx_vld; -- (signal)
  -- uart_rx.vhd:33:12
  rx_stop <= fsm_rx_stop; -- (signal)
  -- uart_rx.vhd:37:5
  fsm : entity work.uart_rx_fsm port map (
    clk => wrap_CLK,
    rst => wrap_RST,
    din => wrap_DIN,
    cnt3 => cnt3,
    cnt4 => cnt4,
    rx_offset => fsm_rx_offset,
    rx_read => fsm_rx_read,
    rx_end => fsm_rx_end,
    rx_vld => fsm_rx_vld,
    rx_stop => fsm_rx_stop);
  -- uart_rx.vhd:55:12
  n9_o <= '1' when rising_edge (wrap_CLK) else '0';
  -- uart_rx.vhd:68:34
  n11_o <= std_logic_vector (unsigned (cnt3) + unsigned'("001"));
  -- uart_rx.vhd:67:17
  n12_o <= cnt3 when rx_offset = '0' else n11_o;
  -- uart_rx.vhd:72:25
  n14_o <= '1' when cnt4 = "1111" else '0';
  -- uart_rx.vhd:72:38
  n15_o <= not rx_end;
  -- uart_rx.vhd:72:34
  n16_o <= n14_o and n15_o;
  -- uart_rx.vhd:73:34
  n18_o <= std_logic_vector (unsigned (cnt3) + unsigned'("001"));
  -- uart_rx.vhd:72:17
  n22_o <= n55_q when n16_o = '0' else n92_o;
  -- uart_rx.vhd:72:17
  n23_o <= n12_o when n16_o = '0' else n18_o;
  -- uart_rx.vhd:79:34
  n25_o <= std_logic_vector (unsigned (cnt3) + unsigned'("001"));
  -- uart_rx.vhd:82:46
  n27_o <= '1' when cnt3 = "111" else '0';
  -- uart_rx.vhd:82:38
  n28_o <= rx_read or n27_o;
  -- uart_rx.vhd:82:54
  n29_o <= n28_o or rx_end;
  -- uart_rx.vhd:83:38
  n31_o <= std_logic_vector (unsigned (cnt4) + unsigned'("0001"));
  -- uart_rx.vhd:82:21
  n33_o <= "0000" when n29_o = '0' else n31_o;
  -- uart_rx.vhd:77:17
  n35_o <= n22_o when rx_stop = '0' else "00000000";
  -- uart_rx.vhd:77:17
  n37_o <= n33_o when rx_stop = '0' else "0000";
  -- uart_rx.vhd:77:17
  n38_o <= n23_o when rx_stop = '0' else n25_o;
  -- uart_rx.vhd:62:13
  n39_o <= n35_o when rx_vld = '0' else n55_q;
  -- uart_rx.vhd:62:13
  n41_o <= n37_o when rx_vld = '0' else "0000";
  -- uart_rx.vhd:62:13
  n43_o <= n38_o when rx_vld = '0' else "000";
  -- uart_rx.vhd:58:13
  n45_o <= n39_o when wrap_RST = '0' else "00000000";
  -- uart_rx.vhd:58:13
  n47_o <= n41_o when wrap_RST = '0' else "0000";
  -- uart_rx.vhd:58:13
  n50_o <= n43_o when wrap_RST = '0' else "000";
  -- uart_rx.vhd:55:9
  process (wrap_CLK)
  begin
    if rising_edge (wrap_CLK) then
      n55_q <= n45_o;
    end if;
  end process;
  -- uart_rx.vhd:55:9
  process (wrap_CLK)
  begin
    if rising_edge (wrap_CLK) then
      n56_q <= n47_o;
    end if;
  end process;
  -- uart_rx.vhd:55:9
  process (wrap_CLK)
  begin
    if rising_edge (wrap_CLK) then
      n57_q <= n50_o;
    end if;
  end process;
  -- uart_rx.vhd:74:21
  n58_o <= cnt3 (2);
  -- uart_rx.vhd:74:21
  n59_o <= not n58_o;
  -- uart_rx.vhd:74:21
  n60_o <= cnt3 (1);
  -- uart_rx.vhd:74:21
  n61_o <= not n60_o;
  -- uart_rx.vhd:74:21
  n62_o <= n59_o and n61_o;
  -- uart_rx.vhd:74:21
  n63_o <= n59_o and n60_o;
  -- uart_rx.vhd:74:21
  n64_o <= n58_o and n61_o;
  -- uart_rx.vhd:74:21
  n65_o <= n58_o and n60_o;
  -- uart_rx.vhd:74:21
  n66_o <= cnt3 (0);
  -- uart_rx.vhd:74:21
  n67_o <= not n66_o;
  -- uart_rx.vhd:74:21
  n68_o <= n62_o and n67_o;
  -- uart_rx.vhd:74:21
  n69_o <= n62_o and n66_o;
  -- uart_rx.vhd:74:21
  n70_o <= n63_o and n67_o;
  -- uart_rx.vhd:74:21
  n71_o <= n63_o and n66_o;
  -- uart_rx.vhd:74:21
  n72_o <= n64_o and n67_o;
  -- uart_rx.vhd:74:21
  n73_o <= n64_o and n66_o;
  -- uart_rx.vhd:74:21
  n74_o <= n65_o and n67_o;
  -- uart_rx.vhd:74:21
  n75_o <= n65_o and n66_o;
  n76_o <= n55_q (0);
  -- uart_rx.vhd:74:21
  n77_o <= n76_o when n68_o = '0' else wrap_DIN;
  n78_o <= n55_q (1);
  -- uart_rx.vhd:74:21
  n79_o <= n78_o when n69_o = '0' else wrap_DIN;
  n80_o <= n55_q (2);
  -- uart_rx.vhd:74:21
  n81_o <= n80_o when n70_o = '0' else wrap_DIN;
  n82_o <= n55_q (3);
  -- uart_rx.vhd:74:21
  n83_o <= n82_o when n71_o = '0' else wrap_DIN;
  n84_o <= n55_q (4);
  -- uart_rx.vhd:74:21
  n85_o <= n84_o when n72_o = '0' else wrap_DIN;
  n86_o <= n55_q (5);
  -- uart_rx.vhd:74:21
  n87_o <= n86_o when n73_o = '0' else wrap_DIN;
  n88_o <= n55_q (6);
  -- uart_rx.vhd:74:21
  n89_o <= n88_o when n74_o = '0' else wrap_DIN;
  n90_o <= n55_q (7);
  -- uart_rx.vhd:74:21
  n91_o <= n90_o when n75_o = '0' else wrap_DIN;
  n92_o <= n91_o & n89_o & n87_o & n85_o & n83_o & n81_o & n79_o & n77_o;
end rtl;
