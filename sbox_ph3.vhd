----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Dilara Toprakhisar
-- 
-- Create Date:    15:24:31 03/24/2025 
-- Design Name: 
-- Module Name:    sbox_ph3 - Behavioral 
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

entity sbox_ph3 is
   port(	
		Randomness : in std_logic_vector( 17 downto 0);
		Is1_1, Is2_1, Is3_1, Is1_2, Is2_2, Is3_2 : in std_logic_vector(3 downto 0);
		Os1_1, Os2_1, Os3_1, Os4_1, Os5_1, Os6_1, Os7_1, Os8_1, Os9_1, Os1_2, Os2_2, Os3_2, Os4_2, Os5_2, Os6_2, Os7_2, Os8_2, Os9_2 : out std_logic_vector(1 downto 0)
	);

end sbox_ph3;

architecture Behavioral of sbox_ph3 is

	signal c1_1, c2_1, c3_1, c1_2, c2_2, c3_2 : std_logic_vector(1 downto 0);
	signal mult_1_1, mult_2_1, mult_3_1, mult_4_1, mult_5_1, mult_6_1, mult_7_1, mult_8_1, mult_9_1 : std_logic_vector(1 downto 0);
	signal mult_1_2, mult_2_2, mult_3_2, mult_4_2, mult_5_2, mult_6_2, mult_7_2, mult_8_2, mult_9_2 : std_logic_vector(1 downto 0);

	component NxF_St3 
		port(
				Is1 : in std_logic_vector(3 downto 0);
				c1 : out std_logic_vector(1 downto 0)
		);
	end component NxF_St3;
	
	component GF4_Multiplier_3_9
      port(	Is1_1, Is2_1, Is3_1, Is1_2, Is2_2, Is3_2 : in std_logic_vector(3 downto 0);
		      Os1_1, Os2_1, Os3_1, Os4_1, Os5_1, Os6_1, Os7_1, Os8_1, Os9_1, Os1_2, Os2_2, Os3_2, Os4_2, Os5_2, Os6_2, Os7_2, Os8_2, Os9_2 : out std_logic_vector(1 downto 0)
		);
   end component GF4_Multiplier_3_9;
	
	component Add_Rand_St3  
		port(	d1, Rand_1, Rand_2 :	in std_logic_vector(1 downto 0);
				Os1 : out std_logic_vector(1 downto 0)
		);
	end component Add_Rand_St3;
	
	component Add_Rand_NxF_St3 
		port(	d1, Rand_1, Rand_2, NxF1 :	in std_logic_vector(1 downto 0);
				Os1 : out std_logic_vector(1 downto 0)
		);
	end component Add_Rand_NxF_St3;


begin

	NxF1_1 : NxF_St3
		port map(Is1_1, c1_1);
	NxF2_1 : NxF_St3
		port map(Is2_1, c2_1);
	NxF3_1 : NxF_St3
		port map(Is3_1, c3_1);
		
	NxF1_2 : NxF_St3
		port map(Is1_2, c1_2);
	NxF2_2 : NxF_St3
		port map(Is2_2, c2_2);
	NxF3_2 : NxF_St3
		port map(Is3_2, c3_2);

	-- GF4 Multiplier
	GF4_Multiplier: GF4_Multiplier_3_9
		port map( Is1_1, Is2_1, Is3_1, Is1_2, Is2_2, Is3_2,
   		       mult_1_1, mult_2_1, mult_3_1, mult_4_1, mult_5_1, mult_6_1, mult_7_1, mult_8_1, mult_9_1,
                mult_1_2, mult_2_2, mult_3_2, mult_4_2, mult_5_2, mult_6_2, mult_7_2, mult_8_2, mult_9_2	);
					 
	Add_Rand_NxF_1_1: Add_Rand_NxF_St3
		port map(mult_1_1, Randomness( 3 downto  2), Randomness( 1 downto  0), c1_1, Os1_1 );
	Add_Rand_NxF_1_2: Add_Rand_NxF_St3
		port map(mult_1_2, Randomness( 3 downto  2), Randomness( 1 downto  0), c1_2, Os1_2 );
		
	Add_Rand_2_1: Add_Rand_St3
		port map(mult_2_1, Randomness( 5 downto  4), Randomness( 3 downto  2), Os2_1);
	Add_Rand_2_2: Add_Rand_St3
		port map(mult_2_2, Randomness( 5 downto  4), Randomness( 3 downto  2), Os2_2);
		
	Add_Rand_3_1: Add_Rand_St3
		port map(mult_3_1, Randomness( 7 downto  6), Randomness( 5 downto  4), Os3_1);
	Add_Rand_3_2: Add_Rand_St3
		port map(mult_3_2, Randomness( 7 downto  6), Randomness( 5 downto  4), Os3_2);


	Add_Rand_4_1: Add_Rand_St3
		port map(mult_4_1, Randomness( 9 downto  8), Randomness( 7 downto  6), Os4_1);
	Add_Rand_4_2: Add_Rand_St3
		port map(mult_4_2, Randomness( 9 downto  8), Randomness( 7 downto  6), Os4_2);
		
	Add_Rand_NxF_2_1: Add_Rand_NxF_St3
		port map(mult_5_1, Randomness(11 downto 10), Randomness( 9 downto  8), c2_1, Os5_1 );
	Add_Rand_NxF_2_2: Add_Rand_NxF_St3
		port map(mult_5_2, Randomness(11 downto 10), Randomness( 9 downto  8), c2_2, Os5_2 );
		
	Add_Rand_6_1: Add_Rand_St3
		port map(mult_6_1, Randomness(13 downto 12), Randomness(11 downto 10), Os6_1);
	Add_Rand_6_2: Add_Rand_St3
		port map(mult_6_2, Randomness(13 downto 12), Randomness(11 downto 10), Os6_2);


	Add_Rand_7_1: Add_Rand_St3
		port map(mult_7_1, Randomness(15 downto 14), Randomness(13 downto 12), Os7_1);
	Add_Rand_7_2: Add_Rand_St3
		port map(mult_7_2, Randomness(15 downto 14), Randomness(13 downto 12), Os7_2);
		
	Add_Rand_8_1: Add_Rand_St3
		port map(mult_8_1, Randomness(17 downto 16), Randomness(15 downto 14), Os8_1);
	Add_Rand_8_2: Add_Rand_St3
		port map(mult_8_2, Randomness(17 downto 16), Randomness(15 downto 14), Os8_2);
		
	Add_Rand_NxF_3_1: Add_Rand_NxF_St3
		port map(mult_9_1, Randomness( 1 downto  0), Randomness(17 downto 16), c3_1, Os9_1 );
	Add_Rand_NxF_3_2: Add_Rand_NxF_St3
		port map(mult_9_2, Randomness( 1 downto  0), Randomness(17 downto 16), c3_2, Os9_2 );


end Behavioral;

