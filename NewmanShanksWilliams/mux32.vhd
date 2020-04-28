library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity mux32 is
    port (s : in std_logic;
    a, b : in std_logic_vector(31 downto 0);
    y : out std_logic_vector(31 downto 0));
end mux32;

architecture rtl of mux32 is
begin
    y <= a when s = '0' else b;
end rtl;