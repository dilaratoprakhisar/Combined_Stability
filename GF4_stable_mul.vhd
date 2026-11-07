----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:58:39 03/24/2025 
-- Design Name: 
-- Module Name:    GF4_stable_mul - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity GF4_stable_mul is
	port(	
		Is1_1, Is1_2, Is2_1, Is2_2 : in std_logic_vector(1 downto 0);
		Os_1, Os_2 : out std_logic_vector(1 downto 0)
	);
end GF4_stable_mul;

architecture Behavioral of GF4_stable_mul is

   signal unstable : std_logic_vector(1 downto 0);
	signal check1, check2: std_logic_vector(1 downto 0);

  	component GF4_Mult_Y1    
      port	(	A, B 	:	in std_logic_vector(1 downto 0);
					Y 		:	out std_logic_vector(1 downto 0)
		);
   end component GF4_Mult_Y1;

begin

	Multiplier_1 : GF4_Mult_Y1
			port map( 	Is1_1, Is2_1,
							unstable);
							
	Multiplier_2 : GF4_Mult_Y1
			port map( 	Is1_2, Is2_2,
							Os_2);
					
   check1 <= "11" when Is2_2 = "00" else "00";	
   check2 <= "11" when Is1_2 = "00" else "00";		

	Os_1 <= unstable xor (((Is1_1 xor Is1_2) and check1) xor ((Is2_1 xor Is2_2) and check2));

end Behavioral;