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
  signal n93_o : std_logic;
  signal n95_o : std_logic;
  signal n96_o : std_logic;
  signal n97_o : std_logic;
  signal n101_o : std_logic;
  signal n102_o : std_logic;
  signal n106_o : std_logic;
  signal n107_o : std_logic;
  signal n111_o : std_logic;
  signal n112_o : std_logic;
  signal n116_o : std_logic;
  signal n117_o : std_logic;
  signal n119_o : std_logic_vector (2 downto 0);
  signal n121_o : std_logic;
  signal n123_o : std_logic;
  signal n125_o : std_logic_vector (2 downto 0);
  signal n127_o : std_logic;
  signal n129_o : std_logic;
  signal n131_o : std_logic;
  signal n132_o : std_logic;
  signal n134_o : std_logic_vector (2 downto 0);
  signal n136_o : std_logic;
  signal n138_o : std_logic;
  signal n139_o : std_logic;
  signal n141_o : std_logic_vector (2 downto 0);
  signal n143_o : std_logic;
  signal n145_o : std_logic;
  signal n147_o : std_logic;
  signal n149_o : std_logic_vector (2 downto 0);
  signal n151_o : std_logic;
  signal n152_o : std_logic_vector (5 downto 0);
  signal n155_o : std_logic_vector (2 downto 0);
  signal n157_o : std_logic_vector (2 downto 0);
  signal n160_q : std_logic_vector (2 downto 0) := "000";
  constant n161_o : std_logic := 'Z';
begin
  rx_offset <= n97_o;
  rx_read <= n102_o;
  rx_end <= n107_o;
  rx_vld <= n112_o;
  rx_clr <= n161_o;
  -- uart_rx_fsm.vhd:39:12
  state <= n160_q; -- (isignal)
  -- uart_rx_fsm.vhd:41:33
  n93_o <= '1' when state = "001" else '0';
  -- uart_rx_fsm.vhd:41:56
  n95_o <= '1' when state = "101" else '0';
  -- uart_rx_fsm.vhd:41:47
  n96_o <= n93_o or n95_o;
  -- uart_rx_fsm.vhd:41:22
  n97_o <= '0' when n96_o = '0' else '1';
  -- uart_rx_fsm.vhd:42:31
  n101_o <= '1' when state = "010" else '0';
  -- uart_rx_fsm.vhd:42:20
  n102_o <= '0' when n101_o = '0' else '1';
  -- uart_rx_fsm.vhd:43:30
  n106_o <= '1' when state = "011" else '0';
  -- uart_rx_fsm.vhd:43:19
  n107_o <= '0' when n106_o = '0' else '1';
  -- uart_rx_fsm.vhd:44:30
  n111_o <= '1' when state = "100" else '0';
  -- uart_rx_fsm.vhd:44:19
  n112_o <= '0' when n111_o = '0' else '1';
  -- uart_rx_fsm.vhd:48:12
  n116_o <= '1' when rising_edge (clk) else '0';
  -- uart_rx_fsm.vhd:56:32
  n117_o <= not din;
  -- uart_rx_fsm.vhd:56:25
  n119_o <= state when n117_o = '0' else "001";
  -- uart_rx_fsm.vhd:55:21
  n121_o <= '1' when state = "000" else '0';
  -- uart_rx_fsm.vhd:60:33
  n123_o <= '1' when cnt3 = "111" else '0';
  -- uart_rx_fsm.vhd:60:25
  n125_o <= state when n123_o = '0' else "010";
  -- uart_rx_fsm.vhd:59:21
  n127_o <= '1' when state = "001" else '0';
  -- uart_rx_fsm.vhd:64:33
  n129_o <= '1' when cnt4 = "1111" else '0';
  -- uart_rx_fsm.vhd:64:51
  n131_o <= '1' when cnt3 = "111" else '0';
  -- uart_rx_fsm.vhd:64:42
  n132_o <= n129_o and n131_o;
  -- uart_rx_fsm.vhd:64:25
  n134_o <= state when n132_o = '0' else "011";
  -- uart_rx_fsm.vhd:63:21
  n136_o <= '1' when state = "010" else '0';
  -- uart_rx_fsm.vhd:68:47
  n138_o <= '1' when cnt4 = "1111" else '0';
  -- uart_rx_fsm.vhd:68:38
  n139_o <= din and n138_o;
  -- uart_rx_fsm.vhd:68:25
  n141_o <= state when n139_o = '0' else "100";
  -- uart_rx_fsm.vhd:67:21
  n143_o <= '1' when state = "011" else '0';
  -- uart_rx_fsm.vhd:71:21
  n145_o <= '1' when state = "100" else '0';
  -- uart_rx_fsm.vhd:74:33
  n147_o <= '1' when cnt3 = "111" else '0';
  -- uart_rx_fsm.vhd:74:25
  n149_o <= state when n147_o = '0' else "000";
  -- uart_rx_fsm.vhd:73:21
  n151_o <= '1' when state = "101" else '0';
  n152_o <= n151_o & n145_o & n143_o & n136_o & n127_o & n121_o;
  -- uart_rx_fsm.vhd:54:17
  with n152_o select n155_o <=
    n149_o when "100000",
    "101" when "010000",
    n141_o when "001000",
    n134_o when "000100",
    n125_o when "000010",
    n119_o when "000001",
    "XXX" when others;
  -- uart_rx_fsm.vhd:50:13
  n157_o <= n155_o when rst = '0' else "000";
  -- uart_rx_fsm.vhd:48:9
  process (clk)
  begin
    if rising_edge (clk) then
      n160_q <= n157_o;
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
  signal n30_o : std_logic_vector (3 downto 0);
  signal n31_o : std_logic_vector (7 downto 0);
  signal n33_o : std_logic_vector (3 downto 0);
  signal n35_o : std_logic_vector (2 downto 0);
  signal n37_o : std_logic_vector (7 downto 0);
  signal n39_o : std_logic_vector (3 downto 0);
  signal n42_o : std_logic_vector (2 downto 0);
  signal n47_q : std_logic_vector (7 downto 0);
  signal n48_q : std_logic_vector (3 downto 0);
  signal n49_q : std_logic_vector (2 downto 0);
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
  signal n82_o : std_logic;
  signal n83_o : std_logic;
  signal n84_o : std_logic_vector (7 downto 0);
begin
  wrap_clk <= clk;
  wrap_rst <= rst;
  wrap_din <= din;
  dout <= wrap_dout;
  dout_vld <= wrap_dout_vld;
  wrap_DOUT <= n47_q;
  wrap_DOUT_VLD <= rx_vld;
  -- uart_rx.vhd:26:12
  cnt4 <= n48_q; -- (signal)
  -- uart_rx.vhd:27:12
  cnt3 <= n49_q; -- (signal)
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
  -- uart_rx.vhd:66:34
  n10_o <= std_logic_vector (unsigned (cnt3) + unsigned'("001"));
  -- uart_rx.vhd:65:17
  n11_o <= cnt3 when rx_offset = '0' else n10_o;
  -- uart_rx.vhd:70:25
  n13_o <= '1' when cnt4 = "1111" else '0';
  -- uart_rx.vhd:70:38
  n14_o <= not rx_end;
  -- uart_rx.vhd:70:34
  n15_o <= n13_o and n14_o;
  -- uart_rx.vhd:71:34
  n17_o <= std_logic_vector (unsigned (cnt3) + unsigned'("001"));
  -- uart_rx.vhd:70:17
  n21_o <= n47_q when n15_o = '0' else n84_o;
  -- uart_rx.vhd:70:17
  n22_o <= n11_o when n15_o = '0' else n17_o;
  -- uart_rx.vhd:76:42
  n24_o <= '1' when cnt3 = "111" else '0';
  -- uart_rx.vhd:76:34
  n25_o <= rx_read or n24_o;
  -- uart_rx.vhd:76:50
  n26_o <= n25_o or rx_end;
  -- uart_rx.vhd:77:34
  n28_o <= std_logic_vector (unsigned (cnt4) + unsigned'("0001"));
  -- uart_rx.vhd:76:17
  n30_o <= "0000" when n26_o = '0' else n28_o;
  -- uart_rx.vhd:60:13
  n31_o <= n21_o when rx_vld = '0' else n47_q;
  -- uart_rx.vhd:60:13
  n33_o <= n30_o when rx_vld = '0' else "0000";
  -- uart_rx.vhd:60:13
  n35_o <= n22_o when rx_vld = '0' else "000";
  -- uart_rx.vhd:56:13
  n37_o <= n31_o when wrap_RST = '0' else "00000000";
  -- uart_rx.vhd:56:13
  n39_o <= n33_o when wrap_RST = '0' else "0000";
  -- uart_rx.vhd:56:13
  n42_o <= n35_o when wrap_RST = '0' else "000";
  -- uart_rx.vhd:53:9
  process (wrap_CLK)
  begin
    if rising_edge (wrap_CLK) then
      n47_q <= n37_o;
    end if;
  end process;
  -- uart_rx.vhd:53:9
  process (wrap_CLK)
  begin
    if rising_edge (wrap_CLK) then
      n48_q <= n39_o;
    end if;
  end process;
  -- uart_rx.vhd:53:9
  process (wrap_CLK)
  begin
    if rising_edge (wrap_CLK) then
      n49_q <= n42_o;
    end if;
  end process;
  -- uart_rx.vhd:72:21
  n50_o <= cnt3 (2);
  -- uart_rx.vhd:72:21
  n51_o <= not n50_o;
  -- uart_rx.vhd:72:21
  n52_o <= cnt3 (1);
  -- uart_rx.vhd:72:21
  n53_o <= not n52_o;
  -- uart_rx.vhd:72:21
  n54_o <= n51_o and n53_o;
  -- uart_rx.vhd:72:21
  n55_o <= n51_o and n52_o;
  -- uart_rx.vhd:72:21
  n56_o <= n50_o and n53_o;
  -- uart_rx.vhd:72:21
  n57_o <= n50_o and n52_o;
  -- uart_rx.vhd:72:21
  n58_o <= cnt3 (0);
  -- uart_rx.vhd:72:21
  n59_o <= not n58_o;
  -- uart_rx.vhd:72:21
  n60_o <= n54_o and n59_o;
  -- uart_rx.vhd:72:21
  n61_o <= n54_o and n58_o;
  -- uart_rx.vhd:72:21
  n62_o <= n55_o and n59_o;
  -- uart_rx.vhd:72:21
  n63_o <= n55_o and n58_o;
  -- uart_rx.vhd:72:21
  n64_o <= n56_o and n59_o;
  -- uart_rx.vhd:72:21
  n65_o <= n56_o and n58_o;
  -- uart_rx.vhd:72:21
  n66_o <= n57_o and n59_o;
  -- uart_rx.vhd:72:21
  n67_o <= n57_o and n58_o;
  n68_o <= n47_q (0);
  -- uart_rx.vhd:72:21
  n69_o <= n68_o when n60_o = '0' else wrap_DIN;
  n70_o <= n47_q (1);
  -- uart_rx.vhd:72:21
  n71_o <= n70_o when n61_o = '0' else wrap_DIN;
  n72_o <= n47_q (2);
  -- uart_rx.vhd:72:21
  n73_o <= n72_o when n62_o = '0' else wrap_DIN;
  n74_o <= n47_q (3);
  -- uart_rx.vhd:72:21
  n75_o <= n74_o when n63_o = '0' else wrap_DIN;
  n76_o <= n47_q (4);
  -- uart_rx.vhd:72:21
  n77_o <= n76_o when n64_o = '0' else wrap_DIN;
  n78_o <= n47_q (5);
  -- uart_rx.vhd:72:21
  n79_o <= n78_o when n65_o = '0' else wrap_DIN;
  n80_o <= n47_q (6);
  -- uart_rx.vhd:72:21
  n81_o <= n80_o when n66_o = '0' else wrap_DIN;
  n82_o <= n47_q (7);
  -- uart_rx.vhd:72:21
  n83_o <= n82_o when n67_o = '0' else wrap_DIN;
  n84_o <= n83_o & n81_o & n79_o & n77_o & n75_o & n73_o & n71_o & n69_o;
end rtl;
