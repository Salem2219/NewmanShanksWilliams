library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity dp is
    port(clk, rst, ld, sel : in std_logic;
    n : in std_logic_vector(3 downto 0);
    x1, x2 : out std_logic;
    y : out std_logic_vector(31 downto 0));
end dp;

architecture rtl of dp is
component comp is
    port (
    a, b : in std_logic_vector(3 downto 0);
    y : out std_logic);
end component;
component opc is
    port (
    a, b : in std_logic_vector(31 downto 0);
    c : out std_logic_vector(31 downto 0));
end component;
component mux4 is
    port (s : in std_logic;
    a, b : in std_logic_vector(3 downto 0);
    y : out std_logic_vector(3 downto 0));
end component;
component mux32 is
    port (s : in std_logic;
    a, b : in std_logic_vector(31 downto 0);
    y : out std_logic_vector(31 downto 0));
end component;
component reg4 is
port (clk, rst, en: in std_logic;
reg_in: in std_logic_vector(3 downto 0);
reg_out: out std_logic_vector(3 downto 0));
end component;
component reg32 is
port (clk, rst, en: in std_logic;
reg_in: in std_logic_vector(31 downto 0);
reg_out: out std_logic_vector(31 downto 0));
end component;
component plus1 is
    port (a : in std_logic_vector(3 downto 0);
    y : out std_logic_vector(3 downto 0));
end component;
signal a, a_in, b, b_in, c, c_in : std_logic_vector(31 downto 0);
signal i, i_in, iplus1 : std_logic_vector(3 downto 0);
begin
    a_reg : reg32 port map (clk, rst, ld, a_in, a);
    a_mux : mux32 port map (sel, "00000000000000000000000000000001", b, a_in);    
    b_reg : reg32 port map (clk, rst, ld, b_in, b);
    b_mux : mux32 port map (sel, "00000000000000000000000000000001", c_in, b_in);
    c_operation : opc port map ( a, b, c_in);
    c_reg : reg32 port map (clk, rst, ld, c_in, c);
    i_reg : reg4 port map (clk, rst, ld, i_in, i);
    i_mux : mux4 port map (sel, "0010", iplus1, i_in);
    i_operation : plus1 port map (i, iplus1);
    in_comp : comp port map(i, n, x1);
    n_comp : comp port map(n, "0001", x2);
    y <= c;
end rtl;