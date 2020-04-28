library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity toplevel is
    port (clk, rst, start : in std_logic;
    n : in std_logic_vector(3 downto 0);
    y : out std_logic_vector(31 downto 0));
end toplevel;

architecture rtl of toplevel is
component dp is
    port(clk, rst, ld, sel : in std_logic;
    n : in std_logic_vector(3 downto 0);
    x1, x2 : out std_logic;
    y : out std_logic_vector(31 downto 0));
end component;
component ctrl is
    port(clk,rst, start, x1, x2: in std_logic;
       ld, sel: out std_logic);
end component;

component mux32 is
    port (s : in std_logic;
    a, b : in std_logic_vector(31 downto 0);
    y : out std_logic_vector(31 downto 0));
end component;
signal ld, sel, x1, x2: std_logic;
signal  y_in :std_logic_vector(31 downto 0);
begin
    datapath : dp port map (clk, rst, ld, sel, n, x1, x2, y_in);
    control : ctrl port map (clk, rst, start, x1, x2, ld, sel);
    y_mux :  mux32 port map (x2, "00000000000000000000000000000001", y_in, y);
end rtl;