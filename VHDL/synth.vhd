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
    rx_cnt3 : out std_logic;
    rx_cnt4 : out std_logic;
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
  signal n105_o : std_logic;
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
  signal n151_o : std_logic_vector (2 downto 0);
  signal n152_o : std_logic_vector (2 downto 0);
  signal n154_o : std_logic;
  signal n156_o : std_logic;
  signal n158_o : std_logic;
  signal n160_o : std_logic_vector (2 downto 0);
  signal n162_o : std_logic;
  signal n163_o : std_logic_vector (5 downto 0);
  signal n166_o : std_logic_vector (2 downto 0);
  signal n171_q : std_logic_vector (2 downto 0) := "000";
begin
  rx_cnt3 <= n99_o;
  rx_cnt4 <= n107_o;
  rx_end <= n112_o;
  rx_vld <= n117_o;
  rx_clr <= n122_o;
  -- uart_rx_fsm.vhd:39:12
  state <= n171_q; -- (isignal)
  -- uart_rx_fsm.vhd:41:32
  n92_o <= '1' when state = "001" else '0';
  -- uart_rx_fsm.vhd:42:34
  n94_o <= '1' when state = "100" else '0';
  -- uart_rx_fsm.vhd:41:46
  n95_o <= n92_o or n94_o;
  -- uart_rx_fsm.vhd:43:34
  n97_o <= '1' when state = "101" else '0';
  -- uart_rx_fsm.vhd:42:47
  n98_o <= n95_o or n97_o;
  -- uart_rx_fsm.vhd:41:20
  n99_o <= '0' when n98_o = '0' else '1';
  -- uart_rx_fsm.vhd:44:32
  n103_o <= '1' when state = "010" else '0';
  -- uart_rx_fsm.vhd:45:32
  n105_o <= '1' when state = "011" else '0';
  -- uart_rx_fsm.vhd:44:44
  n106_o <= n103_o or n105_o;
  -- uart_rx_fsm.vhd:44:20
  n107_o <= '0' when n106_o = '0' else '1';
  -- uart_rx_fsm.vhd:46:30
  n111_o <= '1' when state = "011" else '0';
  -- uart_rx_fsm.vhd:46:19
  n112_o <= '0' when n111_o = '0' else '1';
  -- uart_rx_fsm.vhd:47:30
  n116_o <= '1' when state = "100" else '0';
  -- uart_rx_fsm.vhd:47:19
  n117_o <= '0' when n116_o = '0' else '1';
  -- uart_rx_fsm.vhd:48:30
  n121_o <= '1' when state = "101" else '0';
  -- uart_rx_fsm.vhd:48:19
  n122_o <= '0' when n121_o = '0' else '1';
  -- uart_rx_fsm.vhd:55:15
  n126_o <= '1' when rising_edge (clk) else '0';
  -- uart_rx_fsm.vhd:59:28
  n127_o <= not din;
  -- uart_rx_fsm.vhd:59:21
  n129_o <= state when n127_o = '0' else "001";
  -- uart_rx_fsm.vhd:58:17
  n131_o <= '1' when state = "000" else '0';
  -- uart_rx_fsm.vhd:63:29
  n133_o <= '1' when cnt3 = "111" else '0';
  -- uart_rx_fsm.vhd:63:21
  n135_o <= state when n133_o = '0' else "010";
  -- uart_rx_fsm.vhd:62:17
  n137_o <= '1' when state = "001" else '0';
  -- uart_rx_fsm.vhd:67:29
  n139_o <= '1' when cnt4 = "1111" else '0';
  -- uart_rx_fsm.vhd:67:47
  n141_o <= '1' when cnt3 = "111" else '0';
  -- uart_rx_fsm.vhd:67:38
  n142_o <= n139_o and n141_o;
  -- uart_rx_fsm.vhd:67:21
  n144_o <= state when n142_o = '0' else "011";
  -- uart_rx_fsm.vhd:66:17
  n146_o <= '1' when state = "010" else '0';
  -- uart_rx_fsm.vhd:71:29
  n148_o <= '1' when cnt4 = "1111" else '0';
  -- uart_rx_fsm.vhd:72:25
  n151_o <= "101" when din = '0' else "100";
  -- uart_rx_fsm.vhd:71:21
  n152_o <= state when n148_o = '0' else n151_o;
  -- uart_rx_fsm.vhd:70:17
  n154_o <= '1' when state = "011" else '0';
  -- uart_rx_fsm.vhd:78:17
  n156_o <= '1' when state = "100" else '0';
  -- uart_rx_fsm.vhd:81:29
  n158_o <= '1' when cnt3 = "111" else '0';
  -- uart_rx_fsm.vhd:81:21
  n160_o <= state when n158_o = '0' else "000";
  -- uart_rx_fsm.vhd:80:17
  n162_o <= '1' when state = "101" else '0';
  n163_o <= n162_o & n156_o & n154_o & n146_o & n137_o & n131_o;
  -- uart_rx_fsm.vhd:57:13
  with n163_o select n166_o <=
    n160_o when "100000",
    "101" when "010000",
    n152_o when "001000",
    n144_o when "000100",
    n135_o when "000010",
    n129_o when "000001",
    "000" when others;
  -- uart_rx_fsm.vhd:55:9
  process (clk, rst)
  begin
    if rst = '1' then
      n171_q <= "000";
    elsif rising_edge (clk) then
      n171_q <= n166_o;
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
  signal fsm_rx_cnt3 : std_logic;
  signal fsm_rx_cnt4 : std_logic;
  signal fsm_rx_end : std_logic;
  signal fsm_rx_vld : std_logic;
  signal fsm_rx_clr : std_logic;
  signal n9_o : std_logic;
  signal n11_o : std_logic;
  signal n12_o : std_logic;
  signal n14_o : std_logic_vector (3 downto 0);
  signal n16_o : std_logic_vector (3 downto 0);
  signal n19_o : std_logic_vector (7 downto 0);
  signal n21_o : std_logic_vector (3 downto 0);
  signal n23_o : std_logic_vector (2 downto 0);
  signal n24_o : std_logic_vector (2 downto 0);
  signal n26_o : std_logic;
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
  rx_offset <= fsm_rx_cnt3; -- (signal)
  -- uart_rx.vhd:30:12
  rx_read <= fsm_rx_cnt4; -- (signal)
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
    rx_cnt3 => fsm_rx_cnt3,
    rx_cnt4 => fsm_rx_cnt4,
    rx_end => fsm_rx_end,
    rx_vld => fsm_rx_vld,
    rx_clr => fsm_rx_clr);
  -- uart_rx.vhd:58:15
  n9_o <= '1' when rising_edge (wrap_CLK) else '0';
  -- uart_rx.vhd:62:38
  n11_o <= '1' when cnt3 = "111" else '0';
  -- uart_rx.vhd:62:30
  n12_o <= rx_read or n11_o;
  -- uart_rx.vhd:63:30
  n14_o <= std_logic_vector (unsigned (cnt4) + unsigned'("0001"));
  -- uart_rx.vhd:62:13
  n16_o <= "0000" when n12_o = '0' else n14_o;
  -- uart_rx.vhd:67:13
  n19_o <= n46_q when rx_clr = '0' else "00000000";
  -- uart_rx.vhd:67:13
  n21_o <= n16_o when rx_clr = '0' else "0000";
  -- uart_rx.vhd:74:30
  n23_o <= std_logic_vector (unsigned (cnt3) + unsigned'("001"));
  -- uart_rx.vhd:73:13
  n24_o <= cnt3 when rx_offset = '0' else n23_o;
  -- uart_rx.vhd:78:21
  n26_o <= '1' when cnt4 = "1111" else '0';
  -- uart_rx.vhd:78:41
  n27_o <= not rx_end;
  -- uart_rx.vhd:78:30
  n28_o <= n26_o and n27_o;
  -- uart_rx.vhd:79:30
  n30_o <= std_logic_vector (unsigned (cnt3) + unsigned'("001"));
  -- uart_rx.vhd:78:13
  n34_o <= n19_o when n28_o = '0' else n83_o;
  -- uart_rx.vhd:78:13
  n35_o <= n24_o when n28_o = '0' else n30_o;
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
  -- uart_rx.vhd:80:17
  n49_o <= cnt3 (2);
  -- uart_rx.vhd:80:17
  n50_o <= not n49_o;
  -- uart_rx.vhd:80:17
  n51_o <= cnt3 (1);
  -- uart_rx.vhd:80:17
  n52_o <= not n51_o;
  -- uart_rx.vhd:80:17
  n53_o <= n50_o and n52_o;
  -- uart_rx.vhd:80:17
  n54_o <= n50_o and n51_o;
  -- uart_rx.vhd:80:17
  n55_o <= n49_o and n52_o;
  -- uart_rx.vhd:80:17
  n56_o <= n49_o and n51_o;
  -- uart_rx.vhd:80:17
  n57_o <= cnt3 (0);
  -- uart_rx.vhd:80:17
  n58_o <= not n57_o;
  -- uart_rx.vhd:80:17
  n59_o <= n53_o and n58_o;
  -- uart_rx.vhd:80:17
  n60_o <= n53_o and n57_o;
  -- uart_rx.vhd:80:17
  n61_o <= n54_o and n58_o;
  -- uart_rx.vhd:80:17
  n62_o <= n54_o and n57_o;
  -- uart_rx.vhd:80:17
  n63_o <= n55_o and n58_o;
  -- uart_rx.vhd:80:17
  n64_o <= n55_o and n57_o;
  -- uart_rx.vhd:80:17
  n65_o <= n56_o and n58_o;
  -- uart_rx.vhd:80:17
  n66_o <= n56_o and n57_o;
  n67_o <= n19_o (0);
  -- uart_rx.vhd:80:17
  n68_o <= n67_o when n59_o = '0' else wrap_DIN;
  n69_o <= n19_o (1);
  -- uart_rx.vhd:80:17
  n70_o <= n69_o when n60_o = '0' else wrap_DIN;
  n71_o <= n19_o (2);
  -- uart_rx.vhd:80:17
  n72_o <= n71_o when n61_o = '0' else wrap_DIN;
  n73_o <= n19_o (3);
  -- uart_rx.vhd:80:17
  n74_o <= n73_o when n62_o = '0' else wrap_DIN;
  n75_o <= n19_o (4);
  -- uart_rx.vhd:80:17
  n76_o <= n75_o when n63_o = '0' else wrap_DIN;
  n77_o <= n19_o (5);
  -- uart_rx.vhd:80:17
  n78_o <= n77_o when n64_o = '0' else wrap_DIN;
  n79_o <= n19_o (6);
  -- uart_rx.vhd:80:17
  n80_o <= n79_o when n65_o = '0' else wrap_DIN;
  n81_o <= n19_o (7);
  -- uart_rx.vhd:80:17
  n82_o <= n81_o when n66_o = '0' else wrap_DIN;
  n83_o <= n82_o & n80_o & n78_o & n76_o & n74_o & n72_o & n70_o & n68_o;
end rtl;
