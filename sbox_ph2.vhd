----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:22:32 04/04/2025 
-- Design Name: 
-- Module Name:    sbox_ph2 - Behavioral 
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

entity sbox_ph2 is
   port(	
		Randomness : in std_logic_vector( 35 downto 0);
		Is1_1, Is2_1, Is3_1, Is1_2, Is2_2, Is3_2 : in std_logic_vector(7 downto 0);
		Os1_1, Os2_1, Os3_1, Os4_1, Os5_1, Os6_1, Os7_1, Os8_1, Os9_1, Os1_2, Os2_2, Os3_2, Os4_2, Os5_2, Os6_2, Os7_2, Os8_2, Os9_2 : out std_logic_vector(3 downto 0)
	);
end sbox_ph2;

architecture Behavioral of sbox_ph2 is

	signal sq_sc1_1, sq_sc2_1, sq_sc3_1, sq_sc1_2, sq_sc2_2, sq_sc3_2 : std_logic_vector(3 downto 0);
	signal mult_1_1, mult_2_1, mult_3_1, mult_4_1, mult_5_1, mult_6_1, mult_7_1, mult_8_1, mult_9_1 : std_logic_vector(3 downto 0);
	signal mult_1_2, mult_2_2, mult_3_2, mult_4_2, mult_5_2, mult_6_2, mult_7_2, mult_8_2, mult_9_2 : std_logic_vector(3 downto 0);

	component Square_Scale 
		port (
			Is1 		:	in std_logic_vector(7 downto 0);
			sq_sc1 	:  out std_logic_vector(3 downto 0)			
		);
	end component Square_Scale;
	
	component GF16_Multiplier_3_9
      port(	Is1_1, Is2_1, Is3_1, Is1_2, Is2_2, Is3_2 : in std_logic_vector(7 downto 0);
		      Os1_1, Os2_1, Os3_1, Os4_1, Os5_1, Os6_1, Os7_1, Os8_1, Os9_1, Os1_2, Os2_2, Os3_2, Os4_2, Os5_2, Os6_2, Os7_2, Os8_2, Os9_2 : out std_logic_vector(3 downto 0)
		);
   end component GF16_Multiplier_3_9;
	
	component Add_Rand -- 
		port(	mult_1, Rand_1, Rand_2 : in std_logic_vector(3 downto 0);
				Os1 : out std_logic_vector(3 downto 0)
		);
	end component Add_Rand;
	
	component Add_Rand_Sq_Sc --
		port(	mult_1, Rand_1, Rand_2, Sq_Sc1 :	in std_logic_vector(3 downto 0);
				Os1 : out std_logic_vector(3 downto 0)
		);
	end component Add_Rand_Sq_Sc;



begin

	-- GF16 Square Scale
	Sq_Sc_1_1: Square_Scale
		port map( Is1_1, sq_sc1_1);
	Sq_Sc_2_1: Square_Scale
		port map( Is2_1, sq_sc2_1);
	Sq_Sc_3_1: Square_Scale
		port map( Is3_1, sq_sc3_1);
		
	Sq_Sc_1_2: Square_Scale
		port map( Is1_2, sq_sc1_2);
	Sq_Sc_2_2: Square_Scale
		port map( Is2_2, sq_sc2_2);
	Sq_Sc_3_2: Square_Scale
		port map( Is3_2, sq_sc3_2);
		
   GF16_Multiplier: GF16_Multiplier_3_9
		port map( Is1_1, Is2_1, Is3_1, Is1_2, Is2_2, Is3_2,
   		       mult_1_1, mult_2_1, mult_3_1, mult_4_1, mult_5_1, mult_6_1, mult_7_1, mult_8_1, mult_9_1,
                mult_1_2, mult_2_2, mult_3_2, mult_4_2, mult_5_2, mult_6_2, mult_7_2, mult_8_2, mult_9_2	);
					 
	Add_Rand_Sq_Sc_1_1: Add_Rand_Sq_Sc
		port map(mult_1_1, Randomness( 7 downto  4), Randomness( 3 downto  0), sq_sc1_1, Os1_1 );
	Add_Rand_Sq_Sc_1_2: Add_Rand_Sq_Sc
		port map(mult_1_2, Randomness( 7 downto  4), Randomness( 3 downto  0), sq_sc1_2, Os1_2 );
		
	Add_Rand_2_1: Add_Rand
		port map(mult_2_1, Randomness( 11 downto  8), Randomness( 7 downto  4), Os2_1);
	Add_Rand_2_2: Add_Rand
		port map(mult_2_2, Randomness( 11 downto  8), Randomness( 7 downto  4), Os2_2);
		
	Add_Rand_3_1: Add_Rand
		port map(mult_3_1, Randomness( 15 downto  12), Randomness( 11 downto  8), Os3_1);
	Add_Rand_3_2: Add_Rand
		port map(mult_3_2, Randomness( 15 downto  12), Randomness( 11 downto  8), Os3_2);


	Add_Rand_4_1: Add_Rand
		port map(mult_4_1, Randomness( 19 downto  16), Randomness( 15 downto  12), Os4_1);
	Add_Rand_4_2: Add_Rand
		port map(mult_4_2, Randomness( 19 downto  16), Randomness( 15 downto  12), Os4_2);
		
	Add_Rand_Sq_Sc_2_1: Add_Rand_Sq_Sc
		port map(mult_5_1, Randomness(23 downto 20), Randomness( 19 downto  16), sq_sc2_1, Os5_1 );
	Add_Rand_Sq_Sc_2_2: Add_Rand_Sq_Sc
		port map(mult_5_2, Randomness(23 downto 20), Randomness( 19 downto  16), sq_sc2_2, Os5_2 );
		
	Add_Rand_6_1: Add_Rand
		port map(mult_6_1, Randomness(27 downto 24), Randomness(23 downto 20), Os6_1);
	Add_Rand_6_2: Add_Rand
		port map(mult_6_2, Randomness(27 downto 24), Randomness(23 downto 20), Os6_2);


	Add_Rand_7_1: Add_Rand
		port map(mult_7_1, Randomness(31 downto 28), Randomness(27 downto 24), Os7_1);
	Add_Rand_7_2: Add_Rand
		port map(mult_7_2, Randomness(31 downto 28), Randomness(27 downto 24), Os7_2);
		
	Add_Rand_8_1: Add_Rand
		port map(mult_8_1, Randomness(35 downto 32), Randomness(31 downto 28), Os8_1);
	Add_Rand_8_2: Add_Rand
		port map(mult_8_2, Randomness(35 downto 32), Randomness(31 downto 28), Os8_2);
		
	Add_Rand_Sq_Sc_3_1: Add_Rand_Sq_Sc
		port map(mult_9_1, Randomness( 3 downto  0), Randomness(35 downto 32), sq_sc3_1, Os9_1 );
	Add_Rand_Sq_Sc_3_2: Add_Rand_Sq_Sc
		port map(mult_9_2, Randomness( 3 downto  0), Randomness(35 downto 32), sq_sc3_2, Os9_2 );


end Behavioral;

