----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:51:12 03/31/2025 
-- Design Name: 
-- Module Name:    sbox_ph5 - Behavioral 
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

entity sbox_ph5 is
	port (        Randomness : in std_logic_vector(71 downto 0);
		           Is1_Top_1, Is2_Top_1, Is3_Top_1, Is1_Bot_1, Is2_Bot_1, Is3_Bot_1 : in std_logic_vector(7 downto 0);
					  Is1_Top_2, Is2_Top_2, Is3_Top_2, Is1_Bot_2, Is2_Bot_2, Is3_Bot_2 : in std_logic_vector(7 downto 0); 
		           Os1_1, Os2_1, Os3_1, Os4_1, Os5_1, Os6_1, Os7_1, Os8_1, Os9_1 : out std_logic_vector(7 downto 0);
					  Os1_2, Os2_2, Os3_2, Os4_2, Os5_2, Os6_2, Os7_2, Os8_2, Os9_2 : out std_logic_vector(7 downto 0)
);
end sbox_ph5;

architecture Behavioral of sbox_ph5 is

	signal p1_1, p2_1, p3_1, p4_1, p5_1, p6_1, p7_1, p8_1, p9_1 : std_logic_vector(3 downto 0);
	signal q1_1, q2_1, q3_1, q4_1, q5_1, q6_1, q7_1, q8_1, q9_1 : std_logic_vector(3 downto 0);
	signal p1_2, p2_2, p3_2, p4_2, p5_2, p6_2, p7_2, p8_2, p9_2 : std_logic_vector(3 downto 0);
	signal q1_2, q2_2, q3_2, q4_2, q5_2, q6_2, q7_2, q8_2, q9_2 : std_logic_vector(3 downto 0);

	component GF16_Multiplier_3_9
		port(	
			Is1_1, Is2_1, Is3_1, Is1_2, Is2_2, Is3_2 : in std_logic_vector(7 downto 0);
		   Os1_1, Os2_1, Os3_1, Os4_1, Os5_1, Os6_1, Os7_1, Os8_1, Os9_1, Os1_2, Os2_2, Os3_2, Os4_2, Os5_2, Os6_2, Os7_2, Os8_2, Os9_2 : out std_logic_vector(3 downto 0)
		);
	end component GF16_Multiplier_3_9;
	
	component ConcAdd_Rand_St5_stable 
		port(	
			p1, p2, q1, q2 : in std_logic_vector(3 downto 0);
			Randomness1, Randomness2 : in std_logic_vector(7 downto 0);
			out1, out2 : out std_logic_vector(7 downto 0)
		);
	end component ConcAdd_Rand_St5_stable;

begin

   Top_Multiplier: GF16_Multiplier_3_9
		port map( 	Is1_Top_1, Is2_Top_1, Is3_Top_1, Is1_Top_2, Is2_Top_2, Is3_Top_2,
					   q1_1, q2_1, q3_1, q4_1, q5_1, q6_1, q7_1, q8_1, q9_1, q1_2, q2_2, q3_2, q4_2, q5_2, q6_2, q7_2, q8_2, q9_2 );
	
	Bottom_Multiplier: GF16_multiplier_3_9
		port map( 	Is1_Bot_1, Is2_Bot_1, Is3_Bot_1, Is1_Bot_2, Is2_Bot_2, Is3_Bot_2,
					   p1_1, p2_1, p3_1, p4_1, p5_1, p6_1, p7_1, p8_1, p9_1, p1_2, p2_2, p3_2, p4_2, p5_2, p6_2, p7_2, p8_2, p9_2 );
						
	ConcAdd1 : ConcAdd_Rand_St5_stable
		port map(p1_1, p1_2, q1_1, q1_2, Randomness(15 downto  8), Randomness( 7 downto  0), Os1_1, Os1_2);
	ConcAdd2 : ConcAdd_Rand_St5_stable
		port map(p2_1, p2_2, q2_1, q2_2, Randomness(23 downto 16), Randomness(15 downto  8), Os2_1, Os2_2);
	ConcAdd3 : ConcAdd_Rand_St5_stable
		port map(p3_1, p3_2, q3_1, q3_2, Randomness(31 downto 24), Randomness(23 downto 16), Os3_1, Os3_2);
	ConcAdd4 : ConcAdd_Rand_St5_stable
		port map(p4_1, p4_2, q4_1, q4_2, Randomness(39 downto 32), Randomness(31 downto 24), Os4_1, Os4_2);
	ConcAdd5 : ConcAdd_Rand_St5_stable
		port map(p5_1, p5_2, q5_1, q5_2, Randomness(47 downto 40), Randomness(39 downto 32), Os5_1, Os5_2);
	ConcAdd6 : ConcAdd_Rand_St5_stable
		port map(p6_1, p6_2, q6_1, q6_2, Randomness(55 downto 48), Randomness(47 downto 40), Os6_1, Os6_2);
	ConcAdd7 : ConcAdd_Rand_St5_stable
		port map(p7_1, p7_2, q7_1, q7_2, Randomness(63 downto 56), Randomness(55 downto 48), Os7_1, Os7_2);
	ConcAdd8 : ConcAdd_Rand_St5_stable
		port map(p8_1, p8_2, q8_1, q8_2, Randomness(71 downto 64), Randomness(63 downto 56), Os8_1, Os8_2);
	ConcAdd9 : ConcAdd_Rand_St5_stable
		port map(p9_1, p9_2, q9_1, q9_2, Randomness( 7 downto  0), Randomness(71 downto 64), Os9_1, Os9_2);


end Behavioral;

