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
