----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Dilara Toprakhisar
-- 
-- Create Date:    14:48:34 03/24/2025 
-- Design Name: 
-- Module Name:    Recomb_St3_stable - Behavioral 
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

entity Recomb_St3_stable is
	port(
		St3_Is1_1, St3_Is2_1, St3_Is3_1, St3_Is1_2, St3_Is2_2, St3_Is3_2 : in std_logic_vector(3 downto 0);
		St3_Recombined_Is1_1, St3_Recombined_Is1_2 : out std_logic_vector(3 downto 0)
	);
end Recomb_St3_stable;

architecture Behavioral of Recomb_St3_stable is

signal check1, check2, check3, check12 : std_logic_vector(3 downto 0);

begin

	--check1 <= St3_Is1_1 xor St3_Is1_2;
	--check2 <= St3_Is2_1 xor St3_Is2_2;
	--check3 <= St3_Is3_1 xor St3_Is3_2;
	--check12 <= check1 and check2;

	--St3_Recombined_Is1_1 <= St3_Is1_1 xor St3_Is2_1 xor St3_Is3_1 xor check12 xor (check3 and (check1 xor check2 xor check12));
	--St3_Recombined_Is1_2 <= St3_Is1_2 xor St3_Is2_2 xor St3_Is3_2;

	check1 <= St3_Is1_1 xor St3_Is1_2;
	check2 <= St3_Is2_1 xor St3_Is2_2 xor St3_Is3_1 xor St3_Is3_2;

	St3_Recombined_Is1_1 <= St3_Is1_1 xor St3_Is2_1 xor St3_Is3_1 xor (check1 and check2);
	St3_Recombined_Is1_2 <= St3_Is1_2 xor St3_Is2_2 xor St3_Is3_2;

end Behavioral;

