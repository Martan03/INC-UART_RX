-- uart_rx_fsm.vhd: UART controller - finite state machine controlling RX side
-- Author(s): Martin Slezák (xsleza26)

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;



entity UART_RX_FSM is
    port(
        -- inputs
        CLK : in std_logic;
        RST : in std_logic;
        DIN : in std_logic;
        CNT3 : in std_logic_vector(2 downto 0);
        CNT4 : in std_logic_vector(3 downto 0);
        -- outputs
        RX_CNT3 : out std_logic;
        RX_CNT4 : out std_logic;
        RX_END : out std_logic;
        RX_VLD : out std_logic;
        RX_CLR : out std_logic
    );
end entity;



architecture behavioral of UART_RX_FSM is
    -- FSM states
    type state_t is (
        WAIT_START,
        WAIT_OFFSET,
        WAIT_READ,
        WAIT_END,
        DATA_VALID,
        WAIT_END_OFFSET
    );
    signal state : state_t := WAIT_START;
begin
    RX_CNT3 <= '1' when (state = WAIT_OFFSET or
                           state = DATA_VALID or
                           state = WAIT_END_OFFSET) else '0';
    RX_CNT4 <= '1' when (state = WAIT_READ or
                         state = WAIT_END) else '0';
    RX_END <= '1' when state = WAIT_END else '0';
    RX_VLD <= '1' when state = DATA_VALID else '0';
    RX_CLR <= '1' when state = WAIT_END_OFFSET else '0';

    process (CLK, RST) begin
        -- Reset
        if RST = '1' then
            state <= WAIT_START;
        -- Detect rising edge only
        elsif rising_edge(CLK) then
            -- Moving to next state
            case state is
                when WAIT_START =>
                    if DIN = '0' then
                        state <= WAIT_OFFSET;
                    end if;
                when WAIT_OFFSET =>
                    if CNT3 = "111" then
                        state <= WAIT_READ;
                    end if;
                when WAIT_READ =>
                    if CNT4 = "1111" and CNT3 = "111" then
                        state <= WAIT_END;
                    end if;
                when WAIT_END =>
                    if CNT4 = "1111" then
                        if DIN = '1' then
                            state <= DATA_VALID;
                        else
                            state <= WAIT_END_OFFSET;
                        end if;
                    end if;
                when DATA_VALID =>
                    state <= WAIT_END_OFFSET;
                when WAIT_END_OFFSET =>
                    if CNT3 = "111" then
                        state <= WAIT_START;
                    end if;
                when others =>
                    state <= WAIT_START;
            end case;
        end if;
    end process;
end architecture;
