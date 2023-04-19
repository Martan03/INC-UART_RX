-- uart_rx_fsm.vhd: UART controller - finite state machine controlling RX side
-- Author(s): Martin Slezák (xsleza26)

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;



entity UART_RX_FSM is
    port(
        CLK : in std_logic;
        RST : in std_logic;
        DIN : in std_logic;
        READ_DONE : in std_logic;
        WAIT_DONE : in std_logic;
        RX_OFFSET : in std_logic;
        RX_READ : in std_logic;
        RX_VHDL : in std_logic
    );
end entity;



architecture behavioral of UART_RX_FSM is
    -- FSM states
    type state_t is (
        WAIT_START,
        WAIT_OFFSET,
        WAIT_FIRST,
        WAIT_READ,
        WAIT_END,
        DATA_VALID
    );
    signal state : state_t := WAIT_START;
begin
    process (CLK) begin
        -- Detect rising edge only
        if not rising_edge(CLK) then
            return;
        end if;

        -- Reset state
        if RST = '1' then
            state <= WAIT_START;
            return;
        end if;

        -- Moving to next state
        case state is
            when WAIT_START =>
                if DIN = '0' then
                    state <= WAIT_OFFSET;
                end if;
            when WAIT_OFFSET =>
                if READ_DONE = '1' then
                    state <= WAIT_FIRST;
                end if;
            when WAIT_FIRST =>
                if WAIT_DONE = '1' then
                    state <= WAIT_READ;
                end if;
            when WAIT_READ =>
                if (WAIT_DONE = '1') and (WAIT_DONE = '1') then
                    state <= WAIT_END;
                end if;
            when WAIT_END =>
                if DIN = '1' then
                    state <= DATA_VALID;
                end if;
            when DATA_VALID =>
                state <= WAIT_START;
            when others => null;
        end case;
    end process;
end architecture;
