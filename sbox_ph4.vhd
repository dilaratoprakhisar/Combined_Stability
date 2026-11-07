----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:46:56 03/24/2025 
-- Design Name: 
-- Module Name:    sbox_ph4 - Behavioral 
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

entity sbox_ph4 is
	port(
		Randomness : in std_logic_vector(35 downto 0);
		Is1_Top_1, Is2_Top_1, Is3_Top_1 : in std_logic_vector(3 downto 0);
		Is1_Bot_1, Is2_Bot_1, Is3_Bot_1 : in std_logic_vector(3 downto 0);
		Is1_Top_2, Is2_Top_2, Is3_Top_2 : in std_logic_vector(3 downto 0);
		Is1_Bot_2, Is2_Bot_2, Is3_Bot_2 : in std_logic_vector(3 downto 0);
		Os1_1, Os2_1, Os3_1, Os4_1, Os5_1, Os6_1, Os7_1, Os8_1, Os9_1 : out std_logic_vector(3 downto 0);
		Os1_2, Os2_2, Os3_2, Os4_2, Os5_2, Os6_2, Os7_2, Os8_2, Os9_2 : out std_logic_vector(3 downto 0)
	);
end sbox_ph4;

architecture Behavioral of sbox_ph4 is

	signal p1_1, p2_1, p3_1, p4_1, p5_1, p6_1, p7_1, p8_1, p9_1 : std_logic_vector(1 downto 0);
	signal q1_1, q2_1, q3_1, q4_1, q5_1, q6_1, q7_1, q8_1, q9_1 : std_logic_vector(1 downto 0);
	signal p1_2, p2_2, p3_2, p4_2, p5_2, p6_2, p7_2, p8_2, p9_2 : std_logic_vector(1 downto 0);
	signal q1_2, q2_2, q3_2, q4_2, q5_2, q6_2, q7_2, q8_2, q9_2 : std_logic_vector(1 downto 0);

   component GF4_Multiplier_3_9
      port(	Is1_1, Is2_1, Is3_1, Is1_2, Is2_2, Is3_2 : in std_logic_vector(3 downto 0);
		      Os1_1, Os2_1, Os3_1, Os4_1, Os5_1, Os6_1, Os7_1, Os8_1, Os9_1, Os1_2, Os2_2, Os3_2, Os4_2, Os5_2, Os6_2, Os7_2, Os8_2, Os9_2 : out std_logic_vector(1 downto 0)
		);
   end component GF4_Multiplier_3_9;

   component Add_Conc_St4 
		port(	p1, q1 :	in std_logic_vector(1 downto 0);
				Rand1, Rand2 : in std_logic_vector(3 downto 0);
				Os1 : out std_logic_vector(3 downto 0)
		);
	end component Add_Conc_St4;


begin

   Top_Multiplier: GF4_Multiplier_3_9
		port map( 	Is1_Top_1, Is2_Top_1, Is3_Top_1, Is1_Top_2, Is2_Top_2, Is3_Top_2,
					   q1_1, q2_1, q3_1, q4_1, q5_1, q6_1, q7_1, q8_1, q9_1, q1_2, q2_2, q3_2, q4_2, q5_2, q6_2, q7_2, q8_2, q9_2 );
	
	Bottom_Multiplier: GF4_multiplier_3_9
		port map( 	Is1_Bot_1, Is2_Bot_1, Is3_Bot_1, Is1_Bot_2, Is2_Bot_2, Is3_Bot_2,
					   p1_1, p2_1, p3_1, p4_1, p5_1, p6_1, p7_1, p8_1, p9_1, p1_2, p2_2, p3_2, p4_2, p5_2, p6_2, p7_2, p8_2, p9_2 );

	Add_Conc_1_1 : Add_Conc_St4
		port map(p1_1, q1_1, Randomness( 7 downto  4), Randomness( 3 downto  0), Os1_1);
	Add_Conc_1_2 : Add_Conc_St4
		port map(p1_2, q1_2, Randomness( 7 downto  4), Randomness( 3 downto  0), Os1_2);
		
	Add_Conc_2_1 : Add_Conc_St4
		port map(p2_1, q2_1, Randomness(11 downto  8), Randomness( 7 downto  4), Os2_1);
	Add_Conc_2_2 : Add_Conc_St4
		port map(p2_2, q2_2, Randomness(11 downto  8), Randomness( 7 downto  4), Os2_2);
		
	Add_Conc_3_1 : Add_Conc_St4
		port map(p3_1, q3_1, Randomness(15 downto 12), Randomness(11 downto  8), Os3_1);  
	Add_Conc_3_2 : Add_Conc_St4
		port map(p3_2, q3_2, Randomness(15 downto 12), Randomness(11 downto  8), Os3_2);
		
	Add_Conc_4_1 : Add_Conc_St4
		port map(p4_1, q4_1, Randomness(19 downto 16), Randomness(15 downto 12), Os4_1);
	Add_Conc_4_2 : Add_Conc_St4
		port map(p4_2, q4_2, Randomness(19 downto 16), Randomness(15 downto 12), Os4_2);
		
	Add_Conc_5_1 : Add_Conc_St4
		port map(p5_1, q5_1, Randomness(23 downto 20), Randomness(19 downto 16), Os5_1);
	Add_Conc_5_2 : Add_Conc_St4
		port map(p5_2, q5_2, Randomness(23 downto 20), Randomness(19 downto 16), Os5_2);
		
	Add_Conc_6_1 : Add_Conc_St4
		port map(p6_1, q6_1, Randomness(27 downto 24), Randomness(23 downto 20), Os6_1);
	Add_Conc_6_2 : Add_Conc_St4
		port map(p6_2, q6_2, Randomness(27 downto 24), Randomness(23 downto 20), Os6_2);
		
	Add_Conc_7_1 : Add_Conc_St4
		port map(p7_1, q7_1, Randomness(31 downto 28), Randomness(27 downto 24), Os7_1);  
	Add_Conc_7_2 : Add_Conc_St4
		port map(p7_2, q7_2, Randomness(31 downto 28), Randomness(27 downto 24), Os7_2); 	
	
	Add_Conc_8_1 : Add_Conc_St4
		port map(p8_1, q8_1, Randomness(35 downto 32), Randomness(31 downto 28), Os8_1);
	Add_Conc_8_2 : Add_Conc_St4
		port map(p8_2, q8_2, Randomness(35 downto 32), Randomness(31 downto 28), Os8_2);
		
	Add_Conc_9_1 : Add_Conc_St4
		port map(p9_1, q9_1, Randomness( 3 downto  0), Randomness(35 downto 32), Os9_1);
	Add_Conc_9_2 : Add_Conc_St4
		port map(p9_2, q9_2, Randomness( 3 downto  0), Randomness(35 downto 32), Os9_2);

end Behavioral;

