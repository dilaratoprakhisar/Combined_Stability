----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:08:35 03/21/2025 
-- Design Name: 
-- Module Name:    sbox_ph1 - Behavioral 
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

entity sbox_ph1 is
   port(	
		Is1, Is2, Is3  : in std_logic_vector(7 downto 0);
		Os1, Os2, Os3 	: out std_logic_vector(7 downto 0)
	);
end entity;

architecture behavior of sbox_ph1 is
	
	component linear_map    -- duplicates entity port
		port(	Xs :	in std_logic_vector(7 downto 0);
				Ys :	out std_logic_vector(7 downto 0) );
	end component linear_map;

begin

	-- Linear Map
	LM1: linear_map
		port map( Is1, Os1 );
	LM2: linear_map
		port map( Is2, Os2 );
	LM3: linear_map
		port map( Is3, Os3 );
		 
end architecture;

