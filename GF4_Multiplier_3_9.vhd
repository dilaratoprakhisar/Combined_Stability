----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Dilara Toprakhisar
-- 
-- Create Date:    15:40:03 03/24/2025 
-- Design Name: 
-- Module Name:    GF4_Multiplier_3_9 - Behavioral 
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

entity GF4_Multiplier_3_9 is
	port(	
		Is1_1, Is2_1, Is3_1, Is1_2, Is2_2, Is3_2 : in std_logic_vector(3 downto 0);
		Os1_1, Os2_1, Os3_1, Os4_1, Os5_1, Os6_1, Os7_1, Os8_1, Os9_1, Os1_2, Os2_2, Os3_2, Os4_2, Os5_2, Os6_2, Os7_2, Os8_2, Os9_2 : out std_logic_vector(1 downto 0)
	);
end GF4_Multiplier_3_9;

architecture Behavioral of GF4_Multiplier_3_9 is

   signal Xs1_1, Ys1_1, Xs2_1, Ys2_1, Xs3_1, Ys3_1 : std_logic_vector(1 downto 0);
	signal Xs1_2, Ys1_2, Xs2_2, Ys2_2, Xs3_2, Ys3_2 : std_logic_vector(1 downto 0);
	
  	component GF4_Mult_Y1    
      port	(	A, B 	:	in std_logic_vector(1 downto 0);
					Y 		:	out std_logic_vector(1 downto 0)
		);
   end component GF4_Mult_Y1;
	
	component GF4_stable_mul is
	port(	
		Is1_1, Is1_2, Is2_1, Is2_2 : in std_logic_vector(1 downto 0);
		Os_1, Os_2 : out std_logic_vector(1 downto 0)
	);
   end component GF4_stable_mul;

begin

	Xs1_1 <= Is1_1(3 downto 2);
	Ys1_1 <= Is1_1(1 downto 0);
	Xs2_1 <= Is2_1(3 downto 2);
	Ys2_1 <= Is2_1(1 downto 0);
	Xs3_1 <= Is3_1(3 downto 2);
	Ys3_1 <= Is3_1(1 downto 0);
	
	Xs1_2 <= Is1_2(3 downto 2);
	Ys1_2 <= Is1_2(1 downto 0);
	Xs2_2 <= Is2_2(3 downto 2);
	Ys2_2 <= Is2_2(1 downto 0);
	Xs3_2 <= Is3_2(3 downto 2);
	Ys3_2 <= Is3_2(1 downto 0);
	
	Multiplier_1_stable : GF4_stable_mul
			port map( 	Xs1_1, Xs1_2, Ys1_1, Ys1_2,
							Os1_1, Os1_2);
							
	Multiplier_2_1 : GF4_Mult_Y1
			port map( 	Xs1_1, Ys2_1,
							Os2_1);
	Multiplier_2_2 : GF4_Mult_Y1
			port map( 	Xs1_2, Ys2_2,
							Os2_2);
							
	Multiplier_3_1 : GF4_Mult_Y1
			port map( 	Xs1_1, Ys3_1,
							Os3_1);
	Multiplier_3_2 : GF4_Mult_Y1
			port map( 	Xs1_2, Ys3_2,
							Os3_2);		
							
							
	Multiplier_4_1 : GF4_Mult_Y1
			port map( 	Xs2_1, Ys1_1,
							Os4_1);
	Multiplier_4_2 : GF4_Mult_Y1
			port map( 	Xs2_2, Ys1_2,
							Os4_2);						
							
	Multiplier_5_stable : GF4_stable_mul
			port map( 	Xs2_1, Xs2_2, Ys2_1, Ys2_2,
							Os5_1, Os5_2);
							
	Multiplier_6_1 : GF4_Mult_Y1
			port map( 	Xs2_1, Ys3_1,
							Os6_1);
	Multiplier_6_2 : GF4_Mult_Y1
			port map( 	Xs2_2, Ys3_2,
							Os6_2);						
							
							
	Multiplier_7_1 : GF4_Mult_Y1
			port map( 	Xs3_1, Ys1_1,
							Os7_1);
	Multiplier_7_2 : GF4_Mult_Y1
			port map( 	Xs3_2, Ys1_2,
							Os7_2);						
							
	Multiplier_8_1 : GF4_Mult_Y1
			port map( 	Xs3_1, Ys2_1,
							Os8_1);
	Multiplier_8_2 : GF4_Mult_Y1
			port map( 	Xs3_2, Ys2_2,
							Os8_2);						
							
	Multiplier_9_stable : GF4_stable_mul
			port map( 	Xs3_1, Xs3_2, Ys3_1, Ys3_2,
							Os9_1, Os9_2);

end Behavioral;




 	

