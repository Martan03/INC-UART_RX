-- uart_rx.vhd: UART controller - receiving (RX) side
-- Author(s): Name Surname (xlogin00)

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;



-- Entity declaration (DO NOT ALTER THIS PART!)
entity UART_RX is
    port(
        CLK      : in std_logic;
        RST      : in std_logic;
        DIN      : in std_logic;
        DOUT     : out std_logic_vector(7 downto 0);
        DOUT_VLD : out std_logic
    );
end entity;



-- Architecture implementation (INSERT YOUR IMPLEMENTATION HERE)
architecture behavioral of UART_RX is
    -- Defining counters
    signal cnt4 : std_logic_vector(3 downto 0);
    signal cnt3  : std_logic_vector(2 downto 0);
    -- Read done and wait done variables
    signal read_done : std_logic;
    signal wait_done : std_logic;
    -- Outputs from FSM
    signal rx_offset : std_logic;
    signal rx_read   : std_logic;
    signal rx_vhdl   : std_logic;
begin

    -- Instance of RX FSM
    fsm: entity work.UART_RX_FSM
    port map (
        CLK => CLK,
        RST => RST,
        DIN => DIN,
        READ_DONE => read_done,
        WAIT_DONE => wait_done,
        RX_OFFSET => rx_offset,
        RX_READ => rx_read,
        RX_VHDL => rx_vhdl
    );

    DOUT <= (others => '0');
    DOUT_VLD <= rx_vhdl;

    process(CLK) begin
        if not rising_edge(CLK) then
            return;
        end if;

        if rx_offset = '1' then
            cnt3 <= cnt3 + 1;
            cnt4 <= "0001";
        else if rx_read = '1' then
            if cnt4 = "1111" then
                cnt3 <= cnt3 + 1;
            end if;
            cnt4 <= cnt4 + 1;
        end if;
    end process;

end architecture;