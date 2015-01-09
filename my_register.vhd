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

entity my_register is
  generic (
    size : natural := 1);-- size 
  port (
    clk : in  std_logic; -- clock
    rst : in std_logic; --rst
    input : in  std_logic_vector(size - 1 downto 0); -- input
    output : out std_logic_vector(size -1 downto 0)  -- output
--    input : in  std_logic_vector; -- input
--    output : out std_logic_vector  -- output
    );
end my_register;

architecture behavourial of my_register is
begin  -- behavourial
  my_register: process(clk,rst)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        output <= (others => '0');
      else
        output <= input;
      end if;
    end if;
  end process;    
end behavourial;
