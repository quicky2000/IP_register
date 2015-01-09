--
--    This file is part of IP_register
--    Copyright (C) 2011  Julien Thevenon ( julien_thevenon at yahoo.fr )
--
--    This program is free software: you can redistribute it and/or modify
--    it under the terms of the GNU General Public License as published by
--    the Free Software Foundation, either version 3 of the License, or
--    (at your option) any later version.
--
--    This program is distributed in the hope that it will be useful,
--    but WITHOUT ANY WARRANTY; without even the implied warranty of
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--    GNU General Public License for more details.
--
--    You should have received a copy of the GNU General Public License
--    along with this program.  If not, see <http://www.gnu.org/licenses/>
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity delay_register is
  generic (
    width : positive ;
    delay : natural := 1);               -- delay
  port (
    clk    : in  std_logic;             -- clock
    rst : in std_logic; --rst
    input     : in  std_logic_vector(width - 1 downto 0);             -- input
    output : out std_logic_vector(width - 1 downto 0));            -- output
end delay_register;

architecture behavourial of delay_register is
--  signal delayed_output : std_logic_vector(delay downto 0) := (others => '0');  -- delayed output
  type buffer_t is array (0 to delay) of std_logic_vector(width - 1 downto 0);
  signal delayed_output : buffer_t := (others => (others => '0'));  -- delayed output
begin  -- behavourial
  
  delayed_output(0) <= input;
  delay_non_zero : if delay > 0 generate
    delay_loop: for i in 0 to delay -1 generate
      inst: entity work.my_register
        generic map (
          size => width
          )
        port map (
          clk    => clk,
          rst    => rst,
          input  => delayed_output(i),
          output => delayed_output(i+1));
    end generate delay_loop;
    output <= delayed_output(delay);
  end generate delay_non_zero;
  
  delay_zero: if delay = 0 generate  
    output <= input;
  end generate delay_zero;
  
end behavourial;
