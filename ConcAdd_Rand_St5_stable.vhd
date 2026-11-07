----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:07:36 03/31/2025 
-- Design Name: 
-- Module Name:    ConcAdd_Rand_St5_stable - Behavioral 
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

entity ConcAdd_Rand_St5_stable is
port(	
	p1, p2, q1, q2 : in std_logic_vector(3 downto 0);
	Randomness1, Randomness2 : in std_logic_vector(7 downto 0);
	out1, out2 : out std_logic_vector(7 downto 0)
);
end ConcAdd_Rand_St5_stable;

architecture Behavioral of ConcAdd_Rand_St5_stable is

begin

	out1 <= (p1 & q1) xor Randomness1 xor Randomness2;
	out2 <= (p2 & q2) xor Randomness1 xor Randomness2;

end Behavioral;

