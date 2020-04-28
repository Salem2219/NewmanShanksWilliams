library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity opc is
    port (
    a, b : in std_logic_vector(31 downto 0);
    c : out std_logic_vector(31 downto 0));
end opc;

architecture rtl of opc is
component adder is
    port (a, b : in std_logic_vector(31 downto 0);
    y : out std_logic_vector(31 downto 0));
end component;
component multi is
    port (a : in std_logic_vector(31 downto 0);
    y : out std_logic_vector(31 downto 0));
end component;
signal b_sh : std_logic_vector(31 downto 0);
begin
    u2 : multi port map (b, b_sh);
    u3 : adder port map (b_sh, a, c);
end rtl;