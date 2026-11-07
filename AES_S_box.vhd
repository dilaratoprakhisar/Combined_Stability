----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:18:52 03/21/2025 
-- Design Name: 
-- Module Name:    AES_S_box - Behavioral 
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
library work;
 use work.MPC_globals.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AES_S_box is
	Port ( clk : in  STD_LOGIC;
		  S_in_1 : in  shared_value;
		  S_in_2 : in  shared_value;
		  r : in std_logic_vector(161 downto 0);
		  S_out_1 : out  shared_value;
		  S_out_2 : out  shared_value
	);
end AES_S_box;

architecture Behavioral of AES_S_box is



	--Block to calculate the inverse
	COMPONENT S_box_AES_3_9
		Port (	clk : in std_logic;
					Randomness : in std_logic_vector(161 downto 0);
					Is1_1, Is2_1, Is3_1 : in  std_logic_vector(7 downto 0);
					Is1_2, Is2_2, Is3_2 : in  std_logic_vector(7 downto 0);
				   Os1_1, Os2_1, Os3_1: out std_logic_vector(7 downto 0);
					Os1_2, Os2_2, Os3_2: out std_logic_vector(7 downto 0)
		);
	end COMPONENT;

	COMPONENT Aff_with_tag
	  port (
		 clk : in std_logic;
		 x_1 : in shared_value;
		 x_2 : in shared_value;
		 x_Aff_1 : out shared_value;
		 x_Aff_2 : out shared_value
	  );
	end COMPONENT;

signal Sin_inv_1 : shared_value;
signal Sin_inv_2 : shared_value;

begin

	val_inv : S_box_AES_3_9

		port map(clk => clk, Randomness => r, 
					Is1_1 => S_in_1(0), Is2_1 => S_in_1(1), Is3_1 => S_in_1(2),
					Is1_2 => S_in_2(0), Is2_2 => S_in_2(1), Is3_2 => S_in_2(2),
					Os1_1 => Sin_inv_1(0), Os2_1 => Sin_inv_1(1), Os3_1 => Sin_inv_1(2),
               Os1_2 => Sin_inv_2(0), Os2_2 => Sin_inv_2(1), Os3_2 => Sin_inv_2(2)					
					);

	Affffine : Aff_with_tag
	
		port map(clk => clk, x_1 => Sin_inv_1, x_2 => Sin_inv_2, x_Aff_1 => S_out_1, x_Aff_2 => S_out_2);



end Behavioral;


