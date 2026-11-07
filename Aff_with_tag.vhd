----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:12:46 03/21/2025 
-- Design Name: 
-- Module Name:    Aff_with_tag - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library work;
 use work.MPC_globals.all;

entity Aff_with_tag is
  port (
    clk : in std_logic;
    x_1 : in shared_value;
	 x_2 : in shared_value;
    x_Aff_1 : out shared_value;
	 x_Aff_2 : out shared_value
  );
end Aff_with_tag;

architecture Behavioral of Aff_with_tag is 

  component Lin_unshared 
    Port ( x : in  STD_LOGIC_VECTOR (7 downto 0);
           x_Lin : out  STD_LOGIC_VECTOR (7 downto 0)
           );
  end component;
  
  component Aff_unshared 
    Port ( x : in  STD_LOGIC_VECTOR (7 downto 0);
           x_Aff : out  STD_LOGIC_VECTOR (7 downto 0)
           );
  end component;
  
  
  signal x_Aff_value_next_1, x_Aff_value_reg_1 : shared_value;
  signal x_Aff_value_next_2, x_Aff_value_reg_2 : shared_value;

begin 
  
  -- Apply affine transform to values (affine to share 0 and linear to the rest) (no registers)
  share_0_1 : Aff_unshared port map( x => x_1(0), x_Aff => x_Aff_value_next_1(0));
  genshares_1 : for I in 1 to D-1 generate 
    share_i_1 : Lin_unshared port map( x=> x_1(I), x_Lin => x_Aff_value_next_1(I));
  end generate;
  
  share_0_2 : Aff_unshared port map( x => x_2(0), x_Aff => x_Aff_value_next_2(0));
  genshares_2 : for I in 1 to D-1 generate 
    share_i_2 : Lin_unshared port map( x=> x_2(I), x_Lin => x_Aff_value_next_2(I));
  end generate;
  
  
  x_Aff_1 <= x_Aff_value_reg_1;
  x_Aff_2 <= x_Aff_value_reg_2;
  
  sequential : process(clk)
	begin
		if (rising_edge(clk)) then
			x_Aff_value_reg_1 <= x_Aff_value_next_1;
			x_Aff_value_reg_2 <= x_Aff_value_next_2;
		end if;
	end process;

end Behavioral;