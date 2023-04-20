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
    rx_vhdl : out std_logic);
end entity uart_rx_fsm;

architecture rtl of uart_rx_fsm is
  signal state : std_logic_vector (2 downto 0);
  signal n87_o : std_logic;
  signal n88_o : std_logic;
  signal n92_o : std_logic;
  signal n93_o : std_logic;
  signal n97_o : std_logic;
  signal n98_o : std_logic;
  signal n102_o : std_logic;
  signal n103_o : std_logic;
  signal n105_o : std_logic_vector (2 downto 0);
  signal n107_o : std_logic;
  signal n109_o : std_logic;
  signal n111_o : std_logic_vector (2 downto 0);
  signal n113_o : std_logic;
  signal n115_o : std_logic;
  signal n117_o : std_logic;
  signal n118_o : std_logic;
  signal n120_o : std_logic_vector (2 downto 0);
  signal n122_o : std_logic;
  signal n124_o : std_logic_vector (2 downto 0);
  signal n126_o : std_logic;
  signal n128_o : std_logic;
  signal n129_o : std_logic_vector (4 downto 0);
  signal n132_o : std_logic_vector (2 downto 0);
  signal n134_o : std_logic_vector (2 downto 0);
  signal n137_q : std_logic_vector (2 downto 0) := "000";
begin
  rx_offset <= n88_o;
  rx_read <= n93_o;
  rx_vhdl <= n98_o;
  -- uart_rx_fsm.vhd:36:12
  state <= n137_q; -- (isignal)
  -- uart_rx_fsm.vhd:38:33
  n87_o <= '1' when state = "001" else '0';
  -- uart_rx_fsm.vhd:38:22
  n88_o <= '0' when n87_o = '0' else '1';
  -- uart_rx_fsm.vhd:39:31
  n92_o <= '1' when state = "010" else '0';
  -- uart_rx_fsm.vhd:39:20
  n93_o <= '0' when n92_o = '0' else '1';
  -- uart_rx_fsm.vhd:40:31
  n97_o <= '1' when state = "100" else '0';
  -- uart_rx_fsm.vhd:40:20
  n98_o <= '0' when n97_o = '0' else '1';
  -- uart_rx_fsm.vhd:44:12
  n102_o <= '1' when rising_edge (clk) else '0';
  -- uart_rx_fsm.vhd:52:32
  n103_o <= not din;
  -- uart_rx_fsm.vhd:52:25
  n105_o <= state when n103_o = '0' else "001";
  -- uart_rx_fsm.vhd:51:21
  n107_o <= '1' when state = "000" else '0';
  -- uart_rx_fsm.vhd:56:33
  n109_o <= '1' when cnt3 = "111" else '0';
  -- uart_rx_fsm.vhd:56:25
  n111_o <= state when n109_o = '0' else "010";
  -- uart_rx_fsm.vhd:55:21
  n113_o <= '1' when state = "001" else '0';
  -- uart_rx_fsm.vhd:60:33
  n115_o <= '1' when cnt4 = "1111" else '0';
  -- uart_rx_fsm.vhd:60:51
  n117_o <= '1' when cnt3 = "111" else '0';
  -- uart_rx_fsm.vhd:60:42
  n118_o <= n115_o and n117_o;
  -- uart_rx_fsm.vhd:60:25
  n120_o <= state when n118_o = '0' else "011";
  -- uart_rx_fsm.vhd:59:21
  n122_o <= '1' when state = "010" else '0';
  -- uart_rx_fsm.vhd:64:25
  n124_o <= state when din = '0' else "100";
  -- uart_rx_fsm.vhd:63:21
  n126_o <= '1' when state = "011" else '0';
  -- uart_rx_fsm.vhd:67:21
  n128_o <= '1' when state = "100" else '0';
  n129_o <= n128_o & n126_o & n122_o & n113_o & n107_o;
  -- uart_rx_fsm.vhd:50:17
  with n129_o select n132_o <=
    "000" when "10000",
    n124_o when "01000",
    n120_o when "00100",
    n111_o when "00010",
    n105_o when "00001",
    "XXX" when others;
  -- uart_rx_fsm.vhd:46:13
  n134_o <= n132_o when rst = '0' else "000";
  -- uart_rx_fsm.vhd:44:9
  process (clk)
  begin
    if rising_edge (clk) then
      n137_q <= n134_o;
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
  signal fsm_rx_offset : std_logic;
  signal fsm_rx_read : std_logic;
  signal fsm_rx_vhdl : std_logic;
  signal n7_o : std_logic;
  signal n9_o : std_logic;
  signal n11_o : std_logic_vector (3 downto 0);
  signal n12_o : std_logic_vector (3 downto 0);
  signal n14_o : std_logic_vector (2 downto 0);
  signal n16_o : std_logic;
  signal n21_o : std_logic_vector (2 downto 0);
  signal n22_o : std_logic_vector (7 downto 0);
  signal n23_o : std_logic_vector (2 downto 0);
  signal n25_o : std_logic_vector (3 downto 0);
  signal n26_o : std_logic;
  signal n27_o : std_logic_vector (3 downto 0);
  signal n28_o : std_logic;
  signal n29_o : std_logic_vector (7 downto 0);
  signal n30_o : std_logic_vector (3 downto 0);
  signal n31_o : std_logic_vector (2 downto 0);
  signal n33_o : std_logic_vector (7 downto 0);
  signal n35_o : std_logic_vector (3 downto 0);
  signal n37_o : std_logic_vector (2 downto 0);
  signal n42_q : std_logic_vector (7 downto 0);
  signal n43_q : std_logic_vector (3 downto 0);
  signal n44_q : std_logic_vector (2 downto 0);
  signal n46_o : std_logic;
  signal n47_o : std_logic;
  signal n48_o : std_logic;
  signal n49_o : std_logic;
  signal n50_o : std_logic;
  signal n51_o : std_logic;
  signal n52_o : std_logic;
  signal n53_o : std_logic;
  signal n54_o : std_logic;
  signal n55_o : std_logic;
  signal n56_o : std_logic;
  signal n57_o : std_logic;
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
  signal n80_o : std_logic_vector (7 downto 0);
begin
  wrap_clk <= clk;
  wrap_rst <= rst;
  wrap_din <= din;
  dout <= wrap_dout;
  dout_vld <= wrap_dout_vld;
  wrap_DOUT <= n42_q;
  wrap_DOUT_VLD <= fsm_rx_vhdl;
  -- uart_rx.vhd:26:12
  cnt4 <= n43_q; -- (signal)
  -- uart_rx.vhd:27:12
  cnt3 <= n44_q; -- (signal)
  -- uart_rx.vhd:29:12
  rx_offset <= fsm_rx_offset; -- (signal)
  -- uart_rx.vhd:30:12
  rx_read <= fsm_rx_read; -- (signal)
  -- uart_rx.vhd:35:5
  fsm : entity work.uart_rx_fsm port map (
    clk => wrap_CLK,
    rst => wrap_RST,
    din => wrap_DIN,
    cnt3 => cnt3,
    cnt4 => cnt4,
    rx_offset => fsm_rx_offset,
    rx_read => fsm_rx_read,
    rx_vhdl => fsm_rx_vhdl);
  -- uart_rx.vhd:49:12
  n7_o <= '1' when rising_edge (wrap_CLK) else '0';
  -- uart_rx.vhd:57:25
  n9_o <= '1' when cnt3 = "111" else '0';
  -- uart_rx.vhd:58:34
  n11_o <= std_logic_vector (unsigned (cnt4) + unsigned'("0001"));
  -- uart_rx.vhd:57:17
  n12_o <= cnt4 when n9_o = '0' else n11_o;
  -- uart_rx.vhd:60:30
  n14_o <= std_logic_vector (unsigned (cnt3) + unsigned'("001"));
  -- uart_rx.vhd:63:25
  n16_o <= '1' when cnt4 = "1111" else '0';
  -- uart_rx.vhd:65:34
  n21_o <= std_logic_vector (unsigned (cnt3) + unsigned'("001"));
  -- uart_rx.vhd:62:13
  n22_o <= n42_q when n26_o = '0' else n80_o;
  -- uart_rx.vhd:62:13
  n23_o <= cnt3 when n28_o = '0' else n21_o;
  -- uart_rx.vhd:67:30
  n25_o <= std_logic_vector (unsigned (cnt4) + unsigned'("0001"));
  -- uart_rx.vhd:62:13
  n26_o <= rx_read and n16_o;
  -- uart_rx.vhd:62:13
  n27_o <= cnt4 when rx_read = '0' else n25_o;
  -- uart_rx.vhd:62:13
  n28_o <= rx_read and n16_o;
  -- uart_rx.vhd:56:13
  n29_o <= n22_o when rx_offset = '0' else n42_q;
  -- uart_rx.vhd:56:13
  n30_o <= n27_o when rx_offset = '0' else n12_o;
  -- uart_rx.vhd:56:13
  n31_o <= n23_o when rx_offset = '0' else n14_o;
  -- uart_rx.vhd:51:13
  n33_o <= n29_o when wrap_RST = '0' else "00000000";
  -- uart_rx.vhd:51:13
  n35_o <= n30_o when wrap_RST = '0' else "0000";
  -- uart_rx.vhd:51:13
  n37_o <= n31_o when wrap_RST = '0' else "000";
  -- uart_rx.vhd:49:9
  process (wrap_CLK)
  begin
    if rising_edge (wrap_CLK) then
      n42_q <= n33_o;
    end if;
  end process;
  -- uart_rx.vhd:49:9
  process (wrap_CLK)
  begin
    if rising_edge (wrap_CLK) then
      n43_q <= n35_o;
    end if;
  end process;
  -- uart_rx.vhd:49:9
  process (wrap_CLK)
  begin
    if rising_edge (wrap_CLK) then
      n44_q <= n37_o;
    end if;
  end process;
  -- uart_rx.vhd:64:21
  n46_o <= cnt3 (2);
  -- uart_rx.vhd:64:21
  n47_o <= not n46_o;
  -- uart_rx.vhd:64:21
  n48_o <= cnt3 (1);
  -- uart_rx.vhd:64:21
  n49_o <= not n48_o;
  -- uart_rx.vhd:64:21
  n50_o <= n47_o and n49_o;
  -- uart_rx.vhd:64:21
  n51_o <= n47_o and n48_o;
  -- uart_rx.vhd:64:21
  n52_o <= n46_o and n49_o;
  -- uart_rx.vhd:64:21
  n53_o <= n46_o and n48_o;
  -- uart_rx.vhd:64:21
  n54_o <= cnt3 (0);
  -- uart_rx.vhd:64:21
  n55_o <= not n54_o;
  -- uart_rx.vhd:64:21
  n56_o <= n50_o and n55_o;
  -- uart_rx.vhd:64:21
  n57_o <= n50_o and n54_o;
  -- uart_rx.vhd:64:21
  n58_o <= n51_o and n55_o;
  -- uart_rx.vhd:64:21
  n59_o <= n51_o and n54_o;
  -- uart_rx.vhd:64:21
  n60_o <= n52_o and n55_o;
  -- uart_rx.vhd:64:21
  n61_o <= n52_o and n54_o;
  -- uart_rx.vhd:64:21
  n62_o <= n53_o and n55_o;
  -- uart_rx.vhd:64:21
  n63_o <= n53_o and n54_o;
  n64_o <= n42_q (0);
  -- uart_rx.vhd:64:21
  n65_o <= n64_o when n56_o = '0' else wrap_DIN;
  n66_o <= n42_q (1);
  -- uart_rx.vhd:64:21
  n67_o <= n66_o when n57_o = '0' else wrap_DIN;
  n68_o <= n42_q (2);
  -- uart_rx.vhd:64:21
  n69_o <= n68_o when n58_o = '0' else wrap_DIN;
  n70_o <= n42_q (3);
  -- uart_rx.vhd:64:21
  n71_o <= n70_o when n59_o = '0' else wrap_DIN;
  n72_o <= n42_q (4);
  -- uart_rx.vhd:64:21
  n73_o <= n72_o when n60_o = '0' else wrap_DIN;
  n74_o <= n42_q (5);
  -- uart_rx.vhd:64:21
  n75_o <= n74_o when n61_o = '0' else wrap_DIN;
  n76_o <= n42_q (6);
  -- uart_rx.vhd:64:21
  n77_o <= n76_o when n62_o = '0' else wrap_DIN;
  n78_o <= n42_q (7);
  -- uart_rx.vhd:64:21
  n79_o <= n78_o when n63_o = '0' else wrap_DIN;
  n80_o <= n79_o & n77_o & n75_o & n73_o & n71_o & n69_o & n67_o & n65_o;
end rtl;
