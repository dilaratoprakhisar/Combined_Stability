----------------------------------------------------------------------------------
-- Company: 
-- Engineer:  Thomas De Cnudde
-- 
-- Create Date: 01/12/2015 
-- Design Name: AES d+1 
-- Module Name: GF16_Mult_Y1
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
library ieee;
use ieee.std_logic_1164.all;

-- unsigned datatype is not used
--use ieee.numeric_std.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity GF16_Mult_Y1 is
  port (
	A, B 	:	in std_logic_vector(3 downto 0);
	Y 		:	out std_logic_vector(3 downto 0)
  ) ;
end entity ; -- GF16_Mult_Y1

architecture Behavioral of GF16_Mult_Y1 is

signal a0b0, a0b1, a0b2, a0b3, a1b0, a1b1, a1b2, a1b3, a2b0, a2b1, a2b2, a2b3, a3b0, a3b1, a3b2, a3b3: std_logic;

begin

a0b0 <= A(0) and B(0);
a0b1 <= A(0) and B(1);
a0b2 <= A(0) and B(2);
a0b3 <= A(0) and B(3);
a1b0 <= A(1) and B(0);
a1b1 <= A(1) and B(1);
a1b2 <= A(1) and B(2);
a1b3 <= A(1) and B(3);
a2b0 <= A(2) and B(0);
a2b1 <= A(2) and B(1);
a2b2 <= A(2) and B(2);
a2b3 <= A(2) and B(3);
a3b0 <= A(3) and B(0);
a3b1 <= A(3) and B(1);
a3b2 <= A(3) and B(2);
a3b3 <= A(3) and B(3);


	Y(3) <= 	(a3b3)
			xor	(a1b3)
			xor	(a0b3)
			xor	(a2b2)
			xor	(a1b2)
			xor	(a3b1)
			xor	(a2b1)
			xor	(a1b1)
			xor	(a0b1)
			xor	(a3b0)
			xor	(a1b0);

	Y(2) <= 	(a2b3)
			xor	(a1b3)
			xor	(a3b2)
			xor	(a2b2)
			xor	(a0b2)
			xor	(a3b1)
			xor	(a1b1)
			xor	(a2b0)
			xor	(a0b0);

	Y(1) <= 	(a3b3)
			xor	(a2b3)
			xor	(a1b3)
			xor	(a0b3)
			xor	(a3b2)
			xor	(a1b2)
			xor	(a3b1)
			xor	(a2b1)
			xor	(a1b1)
			xor	(a3b0)
			xor	(a0b0);

	Y(0) <= 	(a3b3)
			xor	(a1b3)
			xor	(a2b2)
			xor	(a0b2)
			xor	(a3b1)
			xor	(a0b1)
			xor	(a2b0)
			xor	(a1b0)
			xor	(a0b0);
	
	--Y(3) <= 	(A(3) and B(3))
	--		xor	(A(1) and B(3))
	--		xor	(A(0) and B(3))
	--		xor	(A(2) and B(2))
	--		xor	(A(1) and B(2))
	--		xor	(A(3) and B(1))
	--		xor	(A(2) and B(1))
	--		xor	(A(1) and B(1))
	--		xor	(A(0) and B(1))
	--		xor	(A(3) and B(0))
	--		xor	(A(1) and B(0));

	--Y(2) <= 	(A(2) and B(3))
	--		xor	(A(1) and B(3))
	--		xor	(A(3) and B(2))
	--		xor	(A(2) and B(2))
	--		xor	(A(0) and B(2))
	--		xor	(A(3) and B(1))
	--		xor	(A(1) and B(1))
	--		xor	(A(2) and B(0))
	--		xor	(A(0) and B(0));

	--Y(1) <= 	(A(3) and B(3))
	--		xor	(A(2) and B(3))
	--		xor	(A(1) and B(3))
	--		xor	(A(0) and B(3))
	--		xor	(A(3) and B(2))
	--		xor	(A(1) and B(2))
	--		xor	(A(3) and B(1))
	--		xor	(A(2) and B(1))
	--		xor	(A(1) and B(1))
	--		xor	(A(3) and B(0))
	--		xor	(A(0) and B(0));

	--Y(0) <= 	(A(3) and B(3))
	--		xor	(A(1) and B(3))
	--		xor	(A(2) and B(2))
	--		xor	(A(0) and B(2))
	--		xor	(A(3) and B(1))
	--		xor	(A(0) and B(1))
	--		xor	(A(2) and B(0))
	--		xor	(A(1) and B(0))
	--		xor	(A(0) and B(0));
			
end Behavioral;
