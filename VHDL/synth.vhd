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
  signal n92_o : std_logic;
  signal n94_o : std_logic;
  signal n95_o : std_logic;
  signal n97_o : std_logic;
  signal n98_o : std_logic;
  signal n99_o : std_logic;
  signal n103_o : std_logic;
  signal n104_o : std_logic;
  signal n108_o : std_logic;
  signal n109_o : std_logic;
  signal n113_o : std_logic;
  signal n114_o : std_logic;
  signal n118_o : std_logic;
  signal n119_o : std_logic;
  signal n123_o : std_logic;
  signal n124_o : std_logic;
  signal n126_o : std_logic_vector (2 downto 0);
  signal n128_o : std_logic;
  signal n130_o : std_logic;
  signal n132_o : std_logic_vector (2 downto 0);
  signal n134_o : std_logic;
  signal n136_o : std_logic;
  signal n138_o : std_logic;
  signal n139_o : std_logic;
  signal n141_o : std_logic_vector (2 downto 0);
  signal n143_o : std_logic;
  signal n145_o : std_logic;
  signal n148_o : std_logic_vector (2 downto 0);
  signal n149_o : std_logic_vector (2 downto 0);
  signal n151_o : std_logic;
  signal n153_o : std_logic;
  signal n155_o : std_logic;
  signal n157_o : std_logic_vector (2 downto 0);
  signal n159_o : std_logic;
  signal n160_o : std_logic_vector (5 downto 0);
  signal n163_o : std_logic_vector (2 downto 0);
  signal n168_q : std_logic_vector (2 downto 0) := "000";
begin
  rx_offset <= n99_o;
  rx_read <= n104_o;
  rx_end <= n109_o;
  rx_vld <= n114_o;
  rx_clr <= n119_o;
  -- uart_rx_fsm.vhd:39:12
  state <= n168_q; -- (isignal)
  -- uart_rx_fsm.vhd:41:34
  n92_o <= '1' when state = "001" else '0';
  -- uart_rx_fsm.vhd:42:34
  n94_o <= '1' when state = "100" else '0';
  -- uart_rx_fsm.vhd:41:48
  n95_o <= n92_o or n94_o;
  -- uart_rx_fsm.vhd:43:34
  n97_o <= '1' when state = "101" else '0';
  -- uart_rx_fsm.vhd:42:47
  n98_o <= n95_o or n97_o;
  -- uart_rx_fsm.vhd:41:22
  n99_o <= '0' when n98_o = '0' else '1';
  -- uart_rx_fsm.vhd:44:31
  n103_o <= '1' when state = "010" else '0';
  -- uart_rx_fsm.vhd:44:20
  n104_o <= '0' when n103_o = '0' else '1';
  -- uart_rx_fsm.vhd:45:30
  n108_o <= '1' when state = "011" else '0';
  -- uart_rx_fsm.vhd:45:19
  n109_o <= '0' when n108_o = '0' else '1';
  -- uart_rx_fsm.vhd:46:30
  n113_o <= '1' when state = "100" else '0';
  -- uart_rx_fsm.vhd:46:19
  n114_o <= '0' when n113_o = '0' else '1';
  -- uart_rx_fsm.vhd:47:30
  n118_o <= '1' when state = "101" else '0';
  -- uart_rx_fsm.vhd:47:19
  n119_o <= '0' when n118_o = '0' else '1';
  -- uart_rx_fsm.vhd:54:15
  n123_o <= '1' when rising_edge (clk) else '0';
  -- uart_rx_fsm.vhd:58:28
  n124_o <= not din;
  -- uart_rx_fsm.vhd:58:21
  n126_o <= state when n124_o = '0' else "001";
  -- uart_rx_fsm.vhd:57:17
  n128_o <= '1' when state = "000" else '0';
  -- uart_rx_fsm.vhd:62:29
  n130_o <= '1' when cnt3 = "111" else '0';
  -- uart_rx_fsm.vhd:62:21
  n132_o <= state when n130_o = '0' else "010";
  -- uart_rx_fsm.vhd:61:17
  n134_o <= '1' when state = "001" else '0';
  -- uart_rx_fsm.vhd:66:29
  n136_o <= '1' when cnt4 = "1111" else '0';
  -- uart_rx_fsm.vhd:66:47
  n138_o <= '1' when cnt3 = "111" else '0';
  -- uart_rx_fsm.vhd:66:38
  n139_o <= n136_o and n138_o;
  -- uart_rx_fsm.vhd:66:21
  n141_o <= state when n139_o = '0' else "011";
  -- uart_rx_fsm.vhd:65:17
  n143_o <= '1' when state = "010" else '0';
  -- uart_rx_fsm.vhd:70:29
  n145_o <= '1' when cnt4 = "1111" else '0';
  -- uart_rx_fsm.vhd:71:25
  n148_o <= "101" when din = '0' else "100";
  -- uart_rx_fsm.vhd:70:21
  n149_o <= state when n145_o = '0' else n148_o;
  -- uart_rx_fsm.vhd:69:17
  n151_o <= '1' when state = "011" else '0';
  -- uart_rx_fsm.vhd:77:17
  n153_o <= '1' when state = "100" else '0';
  -- uart_rx_fsm.vhd:80:29
  n155_o <= '1' when cnt3 = "111" else '0';
  -- uart_rx_fsm.vhd:80:21
  n157_o <= state when n155_o = '0' else "000";
  -- uart_rx_fsm.vhd:79:17
  n159_o <= '1' when state = "101" else '0';
  n160_o <= n159_o & n153_o & n151_o & n143_o & n134_o & n128_o;
  -- uart_rx_fsm.vhd:56:13
  with n160_o select n163_o <=
    n157_o when "100000",
    "101" when "010000",
    n149_o when "001000",
    n141_o when "000100",
    n132_o when "000010",
    n126_o when "000001",
    "000" when others;
  -- uart_rx_fsm.vhd:54:9
  process (clk, rst)
  begin
    if rst = '1' then
      n168_q <= "000";
    elsif rising_edge (clk) then
      n168_q <= n163_o;
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
  signal rx_clr : std_logic;
  signal fsm_rx_offset : std_logic;
  signal fsm_rx_read : std_logic;
  signal fsm_rx_end : std_logic;
  signal fsm_rx_vld : std_logic;
  signal fsm_rx_clr : std_logic;
  signal n9_o : std_logic;
  signal n11_o : std_logic;
  signal n12_o : std_logic;
  signal n13_o : std_logic;
  signal n15_o : std_logic_vector (3 downto 0);
  signal n17_o : std_logic_vector (3 downto 0);
  signal n19_o : std_logic_vector (7 downto 0);
  signal n21_o : std_logic_vector (3 downto 0);
  signal n24_o : std_logic_vector (2 downto 0);
  signal n25_o : std_logic_vector (2 downto 0);
  signal n27_o : std_logic;
  signal n28_o : std_logic;
  signal n30_o : std_logic_vector (2 downto 0);
  signal n34_o : std_logic_vector (7 downto 0);
  signal n35_o : std_logic_vector (2 downto 0);
  signal n46_q : std_logic_vector (7 downto 0);
  signal n47_q : std_logic_vector (3 downto 0);
  signal n48_q : std_logic_vector (2 downto 0);
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
  signal n82_o : std_logic;
  signal n83_o : std_logic_vector (7 downto 0);
begin
  wrap_clk <= clk;
  wrap_rst <= rst;
  wrap_din <= din;
  dout <= wrap_dout;
  dout_vld <= wrap_dout_vld;
  wrap_DOUT <= n46_q;
  wrap_DOUT_VLD <= fsm_rx_vld;
  -- uart_rx.vhd:26:12
  cnt4 <= n47_q; -- (signal)
  -- uart_rx.vhd:27:12
  cnt3 <= n48_q; -- (signal)
  -- uart_rx.vhd:29:12
  rx_offset <= fsm_rx_offset; -- (signal)
  -- uart_rx.vhd:30:12
  rx_read <= fsm_rx_read; -- (signal)
  -- uart_rx.vhd:31:12
  rx_end <= fsm_rx_end; -- (signal)
  -- uart_rx.vhd:32:12
  rx_clr <= fsm_rx_clr; -- (signal)
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
    rx_clr => fsm_rx_clr);
  -- uart_rx.vhd:58:15
  n9_o <= '1' when rising_edge (wrap_CLK) else '0';
  -- uart_rx.vhd:66:42
  n11_o <= '1' when cnt3 = "111" else '0';
  -- uart_rx.vhd:66:34
  n12_o <= rx_read or n11_o;
  -- uart_rx.vhd:66:50
  n13_o <= n12_o or rx_end;
  -- uart_rx.vhd:67:34
  n15_o <= std_logic_vector (unsigned (cnt4) + unsigned'("0001"));
  -- uart_rx.vhd:66:17
  n17_o <= "0000" when n13_o = '0' else n15_o;
  -- uart_rx.vhd:62:13
  n19_o <= n46_q when rx_clr = '0' else "00000000";
  -- uart_rx.vhd:62:13
  n21_o <= n17_o when rx_clr = '0' else "0000";
  -- uart_rx.vhd:73:30
  n24_o <= std_logic_vector (unsigned (cnt3) + unsigned'("001"));
  -- uart_rx.vhd:72:13
  n25_o <= cnt3 when rx_offset = '0' else n24_o;
  -- uart_rx.vhd:77:21
  n27_o <= '1' when cnt4 = "1111" else '0';
  -- uart_rx.vhd:77:30
  n28_o <= n27_o and rx_read;
  -- uart_rx.vhd:78:30
  n30_o <= std_logic_vector (unsigned (cnt3) + unsigned'("001"));
  -- uart_rx.vhd:77:13
  n34_o <= n19_o when n28_o = '0' else n83_o;
  -- uart_rx.vhd:77:13
  n35_o <= n25_o when n28_o = '0' else n30_o;
  -- uart_rx.vhd:58:9
  process (wrap_CLK, wrap_RST)
  begin
    if wrap_RST = '1' then
      n46_q <= "00000000";
    elsif rising_edge (wrap_CLK) then
      n46_q <= n34_o;
    end if;
  end process;
  -- uart_rx.vhd:58:9
  process (wrap_CLK, wrap_RST)
  begin
    if wrap_RST = '1' then
      n47_q <= "0000";
    elsif rising_edge (wrap_CLK) then
      n47_q <= n21_o;
    end if;
  end process;
  -- uart_rx.vhd:58:9
  process (wrap_CLK, wrap_RST)
  begin
    if wrap_RST = '1' then
      n48_q <= "000";
    elsif rising_edge (wrap_CLK) then
      n48_q <= n35_o;
    end if;
  end process;
  -- uart_rx.vhd:79:17
  n49_o <= cnt3 (2);
  -- uart_rx.vhd:79:17
  n50_o <= not n49_o;
  -- uart_rx.vhd:79:17
  n51_o <= cnt3 (1);
  -- uart_rx.vhd:79:17
  n52_o <= not n51_o;
  -- uart_rx.vhd:79:17
  n53_o <= n50_o and n52_o;
  -- uart_rx.vhd:79:17
  n54_o <= n50_o and n51_o;
  -- uart_rx.vhd:79:17
  n55_o <= n49_o and n52_o;
  -- uart_rx.vhd:79:17
  n56_o <= n49_o and n51_o;
  -- uart_rx.vhd:79:17
  n57_o <= cnt3 (0);
  -- uart_rx.vhd:79:17
  n58_o <= not n57_o;
  -- uart_rx.vhd:79:17
  n59_o <= n53_o and n58_o;
  -- uart_rx.vhd:79:17
  n60_o <= n53_o and n57_o;
  -- uart_rx.vhd:79:17
  n61_o <= n54_o and n58_o;
  -- uart_rx.vhd:79:17
  n62_o <= n54_o and n57_o;
  -- uart_rx.vhd:79:17
  n63_o <= n55_o and n58_o;
  -- uart_rx.vhd:79:17
  n64_o <= n55_o and n57_o;
  -- uart_rx.vhd:79:17
  n65_o <= n56_o and n58_o;
  -- uart_rx.vhd:79:17
  n66_o <= n56_o and n57_o;
  n67_o <= n19_o (0);
  -- uart_rx.vhd:79:17
  n68_o <= n67_o when n59_o = '0' else wrap_DIN;
  n69_o <= n19_o (1);
  -- uart_rx.vhd:79:17
  n70_o <= n69_o when n60_o = '0' else wrap_DIN;
  n71_o <= n19_o (2);
  -- uart_rx.vhd:79:17
  n72_o <= n71_o when n61_o = '0' else wrap_DIN;
  n73_o <= n19_o (3);
  -- uart_rx.vhd:79:17
  n74_o <= n73_o when n62_o = '0' else wrap_DIN;
  n75_o <= n19_o (4);
  -- uart_rx.vhd:79:17
  n76_o <= n75_o when n63_o = '0' else wrap_DIN;
  n77_o <= n19_o (5);
  -- uart_rx.vhd:79:17
  n78_o <= n77_o when n64_o = '0' else wrap_DIN;
  n79_o <= n19_o (6);
  -- uart_rx.vhd:79:17
  n80_o <= n79_o when n65_o = '0' else wrap_DIN;
  n81_o <= n19_o (7);
  -- uart_rx.vhd:79:17
  n82_o <= n81_o when n66_o = '0' else wrap_DIN;
  n83_o <= n82_o & n80_o & n78_o & n76_o & n74_o & n72_o & n70_o & n68_o;
end rtl;
