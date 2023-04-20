-- uart_rx.vhd: UART controller - receiving (RX) side
-- Author(s): Name Surname (xlogin00)

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;


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
    -- Outputs from FSM
    signal rx_offset : std_logic;
    signal rx_read : std_logic;
    signal rx_end : std_logic;
    signal rx_vld : std_logic;
    signal rx_stop : std_logic;
begin

    -- Instance of RX FSM
    fsm: entity work.UART_RX_FSM
    port map (
        CLK => CLK,
        RST => RST,
        DIN => DIN,
        CNT4 => cnt4,
        CNT3 => cnt3,
        RX_OFFSET => rx_offset,
        RX_READ => rx_read,
        RX_END => rx_end,
        RX_VLD => rx_vld,
        RX_STOP => rx_stop
    );

    DOUT_VLD <= rx_vld;
    
    process(CLK) begin
        -- Detect rising edge only
        if rising_edge(CLK) then
            cnt4 <= (others => '0');
            -- Reset
            if RST = '1' then
                cnt3 <= (others => '0');
                cnt4 <= (others => '0');
                DOUT <= (others => '0');
            elsif rx_vld = '1' then
                cnt3 <= (others => '0');
                cnt4 <= (others => '0');
            else
                -- 8 ticks offset for reading
                if rx_offset = '1' then
                    cnt3 <= cnt3 + 1;
                end if;

                -- Sets output to DIN
                if cnt4 = "1111" and not rx_end = '1' then
                    cnt3 <= cnt3 + 1;
                    DOUT(to_integer(unsigned(cnt3))) <= DIN;
                end if;

                if rx_stop = '1' then
                    DOUT <= (others => '0');
                    cnt3 <= cnt3 + 1;
                else
                    -- 16 ticks for reading
                    if rx_read = '1' or cnt3 = "111" or rx_end = '1' then
                        cnt4 <= cnt4 + 1;
                    end if;
                end if;
            end if;
        end if;
    end process;

end architecture;
