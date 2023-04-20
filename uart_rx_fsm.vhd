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
        RX_OFFSET : out std_logic;
        RX_READ : out std_logic;
        RX_VHDL : out std_logic
    );
end entity;



architecture behavioral of UART_RX_FSM is
    -- FSM states
    type state_t is (
        WAIT_START,
        WAIT_OFFSET,
        WAIT_READ,
        WAIT_END,
        DATA_VALID
    );
    signal state : state_t := WAIT_START;
begin
    RX_OFFSET <= '1' when state = WAIT_OFFSET else '0';
    RX_READ <= '1' when state = WAIT_READ else '0';
    RX_VHDL <= '1' when state = DATA_VALID else '0'; 

    process (CLK) begin
        -- Detect rising edge only
        if rising_edge(CLK) then
            -- Reset
            if RST = '1' then
                state <= WAIT_START;
            else
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
                        if DIN = '1' then
                            state <= DATA_VALID;
                        end if;
                    when DATA_VALID =>
                        state <= WAIT_START;
                end case;
            end if;
        end if;
    end process;
end architecture;
