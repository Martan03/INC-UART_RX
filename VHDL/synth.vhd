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
    rx_clr : out std_logic);
end entity uart_rx_fsm;

architecture rtl of uart_rx_fsm is
  signal state : std_logic_vector (2 downto 0);
  signal n91_o : std_logic;
  signal n92_o : std_logic;
  signal n96_o : std_logic;
  signal n97_o : std_logic;
  signal n101_o : std_logic;
  signal n102_o : std_logic;
  signal n106_o : std_logic;
  signal n107_o : std_logic;
  signal n111_o : std_logic;
  signal n112_o : std_logic;
  signal n114_o : std_logic_vector (2 downto 0);
  signal n116_o : std_logic;
  signal n118_o : std_logic;
  signal n120_o : std_logic_vector (2 downto 0);
  signal n122_o : std_logic;
  signal n124_o : std_logic;
  signal n126_o : std_logic;
  signal n127_o : std_logic;
  signal n129_o : std_logic_vector (2 downto 0);
  signal n131_o : std_logic;
  signal n133_o : std_logic;
  signal n134_o : std_logic;
  signal n136_o : std_logic_vector (2 downto 0);
  signal n138_o : std_logic;
  signal n140_o : std_logic;
  signal n141_o : std_logic_vector (4 downto 0);
  signal n144_o : std_logic_vector (2 downto 0);
  signal n146_o : std_logic_vector (2 downto 0);
  signal n149_q : std_logic_vector (2 downto 0) := "000";
  constant n150_o : std_logic := 'Z';
begin
  rx_offset <= n92_o;
  rx_read <= n97_o;
  rx_end <= n102_o;
  rx_vld <= n107_o;
  rx_clr <= n150_o;
  -- uart_rx_fsm.vhd:38:12
  state <= n149_q; -- (isignal)
  -- uart_rx_fsm.vhd:40:33
  n91_o <= '1' when state = "001" else '0';
  -- uart_rx_fsm.vhd:40:22
  n92_o <= '0' when n91_o = '0' else '1';
  -- uart_rx_fsm.vhd:41:31
  n96_o <= '1' when state = "010" else '0';
  -- uart_rx_fsm.vhd:41:20
  n97_o <= '0' when n96_o = '0' else '1';
  -- uart_rx_fsm.vhd:42:30
  n101_o <= '1' when state = "011" else '0';
  -- uart_rx_fsm.vhd:42:19
  n102_o <= '0' when n101_o = '0' else '1';
  -- uart_rx_fsm.vhd:43:30
  n106_o <= '1' when state = "100" else '0';
  -- uart_rx_fsm.vhd:43:19
  n107_o <= '0' when n106_o = '0' else '1';
  -- uart_rx_fsm.vhd:47:12
  n111_o <= '1' when rising_edge (clk) else '0';
  -- uart_rx_fsm.vhd:55:32
  n112_o <= not din;
  -- uart_rx_fsm.vhd:55:25
  n114_o <= state when n112_o = '0' else "001";
  -- uart_rx_fsm.vhd:54:21
  n116_o <= '1' when state = "000" else '0';
  -- uart_rx_fsm.vhd:59:33
  n118_o <= '1' when cnt3 = "111" else '0';
  -- uart_rx_fsm.vhd:59:25
  n120_o <= state when n118_o = '0' else "010";
  -- uart_rx_fsm.vhd:58:21
  n122_o <= '1' when state = "001" else '0';
  -- uart_rx_fsm.vhd:63:33
  n124_o <= '1' when cnt4 = "1111" else '0';
  -- uart_rx_fsm.vhd:63:51
  n126_o <= '1' when cnt3 = "111" else '0';
  -- uart_rx_fsm.vhd:63:42
  n127_o <= n124_o and n126_o;
  -- uart_rx_fsm.vhd:63:25
  n129_o <= state when n127_o = '0' else "011";
  -- uart_rx_fsm.vhd:62:21
  n131_o <= '1' when state = "010" else '0';
  -- uart_rx_fsm.vhd:67:47
  n133_o <= '1' when cnt4 = "1111" else '0';
  -- uart_rx_fsm.vhd:67:38
  n134_o <= din and n133_o;
  -- uart_rx_fsm.vhd:67:25
  n136_o <= state when n134_o = '0' else "100";
  -- uart_rx_fsm.vhd:66:21
  n138_o <= '1' when state = "011" else '0';
  -- uart_rx_fsm.vhd:70:21
  n140_o <= '1' when state = "100" else '0';
  n141_o <= n140_o & n138_o & n131_o & n122_o & n116_o;
  -- uart_rx_fsm.vhd:53:17
  with n141_o select n144_o <=
    "000" when "10000",
    n136_o when "01000",
    n129_o when "00100",
    n120_o when "00010",
    n114_o when "00001",
    "XXX" when others;
  -- uart_rx_fsm.vhd:49:13
  n146_o <= n144_o when rst = '0' else "000";
  -- uart_rx_fsm.vhd:47:9
  process (clk)
  begin
    if rising_edge (clk) then
      n149_q <= n146_o;
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
  signal fsm_rx_offset : std_logic;
  signal fsm_rx_read : std_logic;
  signal fsm_rx_end : std_logic;
  signal fsm_rx_vld : std_logic;
  signal fsm_rx_clr : std_logic;
  signal n8_o : std_logic;
  signal n10_o : std_logic_vector (2 downto 0);
  signal n11_o : std_logic_vector (2 downto 0);
  signal n13_o : std_logic;
  signal n14_o : std_logic;
  signal n15_o : std_logic;
  signal n17_o : std_logic_vector (2 downto 0);
  signal n21_o : std_logic_vector (7 downto 0);
  signal n22_o : std_logic_vector (2 downto 0);
  signal n24_o : std_logic;
  signal n25_o : std_logic;
  signal n26_o : std_logic;
  signal n28_o : std_logic_vector (3 downto 0);
  signal n29_o : std_logic_vector (3 downto 0);
  signal n30_o : std_logic_vector (7 downto 0);
  signal n32_o : std_logic_vector (3 downto 0);
  signal n34_o : std_logic_vector (2 downto 0);
  signal n36_o : std_logic_vector (7 downto 0);
  signal n38_o : std_logic_vector (3 downto 0);
  signal n40_o : std_logic_vector (2 downto 0);
  signal n45_q : std_logic_vector (7 downto 0);
  signal n46_q : std_logic_vector (3 downto 0);
  signal n47_q : std_logic_vector (2 downto 0);
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
  signal n80_o : std_logic;
  signal n81_o : std_logic;
  signal n82_o : std_logic_vector (7 downto 0);
begin
  wrap_clk <= clk;
  wrap_rst <= rst;
  wrap_din <= din;
  dout <= wrap_dout;
  dout_vld <= wrap_dout_vld;
  wrap_DOUT <= n45_q;
  wrap_DOUT_VLD <= rx_vld;
  -- uart_rx.vhd:26:12
  cnt4 <= n46_q; -- (signal)
  -- uart_rx.vhd:27:12
  cnt3 <= n47_q; -- (signal)
  -- uart_rx.vhd:29:12
  rx_offset <= fsm_rx_offset; -- (signal)
  -- uart_rx.vhd:30:12
  rx_read <= fsm_rx_read; -- (signal)
  -- uart_rx.vhd:31:12
  rx_end <= fsm_rx_end; -- (signal)
  -- uart_rx.vhd:32:12
  rx_vld <= fsm_rx_vld; -- (signal)
  -- uart_rx.vhd:36:5
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
    rx_clr => open);
  -- uart_rx.vhd:53:12
  n8_o <= '1' when rising_edge (wrap_CLK) else '0';
  -- uart_rx.vhd:65:34
  n10_o <= std_logic_vector (unsigned (cnt3) + unsigned'("001"));
  -- uart_rx.vhd:64:17
  n11_o <= cnt3 when rx_offset = '0' else n10_o;
  -- uart_rx.vhd:69:25
  n13_o <= '1' when cnt4 = "1111" else '0';
  -- uart_rx.vhd:69:38
  n14_o <= not rx_end;
  -- uart_rx.vhd:69:34
  n15_o <= n13_o and n14_o;
  -- uart_rx.vhd:70:34
  n17_o <= std_logic_vector (unsigned (cnt3) + unsigned'("001"));
  -- uart_rx.vhd:69:17
  n21_o <= n45_q when n15_o = '0' else n82_o;
  -- uart_rx.vhd:69:17
  n22_o <= n11_o when n15_o = '0' else n17_o;
  -- uart_rx.vhd:75:42
  n24_o <= '1' when cnt3 = "111" else '0';
  -- uart_rx.vhd:75:34
  n25_o <= rx_read or n24_o;
  -- uart_rx.vhd:75:50
  n26_o <= n25_o or rx_end;
  -- uart_rx.vhd:76:34
  n28_o <= std_logic_vector (unsigned (cnt4) + unsigned'("0001"));
  -- uart_rx.vhd:75:17
  n29_o <= cnt4 when n26_o = '0' else n28_o;
  -- uart_rx.vhd:59:13
  n30_o <= n21_o when rx_vld = '0' else n45_q;
  -- uart_rx.vhd:59:13
  n32_o <= n29_o when rx_vld = '0' else "0000";
  -- uart_rx.vhd:59:13
  n34_o <= n22_o when rx_vld = '0' else "000";
  -- uart_rx.vhd:55:13
  n36_o <= n30_o when wrap_RST = '0' else "00000000";
  -- uart_rx.vhd:55:13
  n38_o <= n32_o when wrap_RST = '0' else "0000";
  -- uart_rx.vhd:55:13
  n40_o <= n34_o when wrap_RST = '0' else "000";
  -- uart_rx.vhd:53:9
  process (wrap_CLK)
  begin
    if rising_edge (wrap_CLK) then
      n45_q <= n36_o;
    end if;
  end process;
  -- uart_rx.vhd:53:9
  process (wrap_CLK)
  begin
    if rising_edge (wrap_CLK) then
      n46_q <= n38_o;
    end if;
  end process;
  -- uart_rx.vhd:53:9
  process (wrap_CLK)
  begin
    if rising_edge (wrap_CLK) then
      n47_q <= n40_o;
    end if;
  end process;
  -- uart_rx.vhd:71:21
  n48_o <= cnt3 (2);
  -- uart_rx.vhd:71:21
  n49_o <= not n48_o;
  -- uart_rx.vhd:71:21
  n50_o <= cnt3 (1);
  -- uart_rx.vhd:71:21
  n51_o <= not n50_o;
  -- uart_rx.vhd:71:21
  n52_o <= n49_o and n51_o;
  -- uart_rx.vhd:71:21
  n53_o <= n49_o and n50_o;
  -- uart_rx.vhd:71:21
  n54_o <= n48_o and n51_o;
  -- uart_rx.vhd:71:21
  n55_o <= n48_o and n50_o;
  -- uart_rx.vhd:71:21
  n56_o <= cnt3 (0);
  -- uart_rx.vhd:71:21
  n57_o <= not n56_o;
  -- uart_rx.vhd:71:21
  n58_o <= n52_o and n57_o;
  -- uart_rx.vhd:71:21
  n59_o <= n52_o and n56_o;
  -- uart_rx.vhd:71:21
  n60_o <= n53_o and n57_o;
  -- uart_rx.vhd:71:21
  n61_o <= n53_o and n56_o;
  -- uart_rx.vhd:71:21
  n62_o <= n54_o and n57_o;
  -- uart_rx.vhd:71:21
  n63_o <= n54_o and n56_o;
  -- uart_rx.vhd:71:21
  n64_o <= n55_o and n57_o;
  -- uart_rx.vhd:71:21
  n65_o <= n55_o and n56_o;
  n66_o <= n45_q (0);
  -- uart_rx.vhd:71:21
  n67_o <= n66_o when n58_o = '0' else wrap_DIN;
  n68_o <= n45_q (1);
  -- uart_rx.vhd:71:21
  n69_o <= n68_o when n59_o = '0' else wrap_DIN;
  n70_o <= n45_q (2);
  -- uart_rx.vhd:71:21
  n71_o <= n70_o when n60_o = '0' else wrap_DIN;
  n72_o <= n45_q (3);
  -- uart_rx.vhd:71:21
  n73_o <= n72_o when n61_o = '0' else wrap_DIN;
  n74_o <= n45_q (4);
  -- uart_rx.vhd:71:21
  n75_o <= n74_o when n62_o = '0' else wrap_DIN;
  n76_o <= n45_q (5);
  -- uart_rx.vhd:71:21
  n77_o <= n76_o when n63_o = '0' else wrap_DIN;
  n78_o <= n45_q (6);
  -- uart_rx.vhd:71:21
  n79_o <= n78_o when n64_o = '0' else wrap_DIN;
  n80_o <= n45_q (7);
  -- uart_rx.vhd:71:21
  n81_o <= n80_o when n65_o = '0' else wrap_DIN;
  n82_o <= n81_o & n79_o & n77_o & n75_o & n73_o & n71_o & n69_o & n67_o;
end rtl;
