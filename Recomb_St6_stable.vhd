----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:45:36 03/31/2025 
-- Design Name: 
-- Module Name:    Recomb_St6_stable - Behavioral 
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

entity Recomb_St6_stable is
	port(
		Is1_1, Is2_1, Is3_1, Is1_2, Is2_2, Is3_2 : in std_logic_vector(7 downto 0);
		Recombined_Is1_1, Recombined_Is1_2 : out std_logic_vector(7 downto 0)
	);
end Recomb_St6_stable;

architecture Behavioral of Recomb_St6_stable is

signal check1, check2, check3, check12 : std_logic_vector(7 downto 0);

begin

	--check1 <= Is1_1 xor Is1_2;
	--check2 <= Is2_1 xor Is2_2;
	--check3 <= Is3_1 xor Is3_2;
	--check12 <= check1 and check2;

	--Recombined_Is1_1 <= Is1_1 xor Is2_1 xor Is3_1 xor check12 xor (check3 and (check1 xor check2 xor check12));
	--Recombined_Is1_2 <= Is1_2 xor Is2_2 xor Is3_2;
	
	check1 <= Is1_1 xor Is1_2;
	check2 <= Is2_1 xor Is2_2 xor Is3_1 xor Is3_2;

	Recombined_Is1_1 <= Is1_1 xor Is2_1 xor Is3_1 xor (check1 and check2);
	Recombined_Is1_2 <= Is1_2 xor Is2_2 xor Is3_2;


end Behavioral;

