----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:21:48 03/21/2025 
-- Design Name: 
-- Module Name:    S_box_AES_3_9 - Behavioral 
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

entity S_box_AES_3_9 is
   Port (	clk : in std_logic;
				Randomness : in std_logic_vector(161 downto 0);
				Is1_1, Is2_1, Is3_1 : in  std_logic_vector(7 downto 0);
				Is1_2, Is2_2, Is3_2 : in  std_logic_vector(7 downto 0);
				Os1_1, Os2_1, Os3_1: out std_logic_vector(7 downto 0);
				Os1_2, Os2_2, Os3_2: out std_logic_vector(7 downto 0)
	);
end S_box_AES_3_9;


architecture Behavioral of S_box_AES_3_9 is
	-- Randomness
   signal St2_Randomness : std_logic_vector(35 downto 0);
	signal St3_Randomness : std_logic_vector(17 downto 0);
	signal St4_Randomness : std_logic_vector(35 downto 0);
	signal St5_Randomness : std_logic_vector(71 downto 0);
	
	-- Output Signals
	signal St1_Os1_1, St1_Os2_1, St1_Os3_1, St1_Os1_2, St1_Os2_2, St1_Os3_2 : std_logic_vector(7 downto 0);
	
	signal St2_Os1_1, St2_Os2_1, St2_Os3_1, St2_Os4_1, St2_Os5_1, St2_Os6_1, St2_Os7_1, St2_Os8_1, St2_Os9_1 : std_logic_vector(3 downto 0);
	signal St2_Os1_2, St2_Os2_2, St2_Os3_2, St2_Os4_2, St2_Os5_2, St2_Os6_2, St2_Os7_2, St2_Os8_2, St2_Os9_2 : std_logic_vector(3 downto 0);
	
	signal St3_Os1_1, St3_Os2_1, St3_Os3_1, St3_Os4_1, St3_Os5_1, St3_Os6_1, St3_Os7_1, St3_Os8_1, St3_Os9_1 : std_logic_vector(1 downto 0);
	signal St3_Os1_2, St3_Os2_2, St3_Os3_2, St3_Os4_2, St3_Os5_2, St3_Os6_2, St3_Os7_2, St3_Os8_2, St3_Os9_2 : std_logic_vector(1 downto 0);
	
	signal St4_Os1_1, St4_Os2_1, St4_Os3_1, St4_Os4_1, St4_Os5_1, St4_Os6_1, St4_Os7_1, St4_Os8_1, St4_Os9_1 : std_logic_vector(3 downto 0);
	signal St4_Os1_2, St4_Os2_2, St4_Os3_2, St4_Os4_2, St4_Os5_2, St4_Os6_2, St4_Os7_2, St4_Os8_2, St4_Os9_2 : std_logic_vector(3 downto 0);
	
	signal St5_Os1_1, St5_Os2_1, St5_Os3_1, St5_Os4_1, St5_Os5_1, St5_Os6_1, St5_Os7_1, St5_Os8_1, St5_Os9_1 : std_logic_vector(7 downto 0);
	signal St5_Os1_2, St5_Os2_2, St5_Os3_2, St5_Os4_2, St5_Os5_2, St5_Os6_2, St5_Os7_2, St5_Os8_2, St5_Os9_2 : std_logic_vector(7 downto 0);

	
	-- Register Output Signals
	signal St2_Is1_1, St2_Is2_1, St2_Is3_1, St2_Is1_2, St2_Is2_2, St2_Is3_2 : std_logic_vector(7 downto 0);
	
	signal St3_Is1_1, St3_Is2_1, St3_Is3_1, St3_Is4_1, St3_Is5_1, St3_Is6_1, St3_Is7_1, St3_Is8_1, St3_Is9_1 : std_logic_vector(3 downto 0);
	signal St3_Is1_2, St3_Is2_2, St3_Is3_2, St3_Is4_2, St3_Is5_2, St3_Is6_2, St3_Is7_2, St3_Is8_2, St3_Is9_2 : std_logic_vector(3 downto 0);

	signal St4_Is1_1, St4_Is2_1, St4_Is3_1, St4_Is4_1, St4_Is5_1, St4_Is6_1, St4_Is7_1, St4_Is8_1, St4_Is9_1 : std_logic_vector(1 downto 0);
	signal St4_Is1_2, St4_Is2_2, St4_Is3_2, St4_Is4_2, St4_Is5_2, St4_Is6_2, St4_Is7_2, St4_Is8_2, St4_Is9_2 : std_logic_vector(1 downto 0);

	signal St5_Is1_1, St5_Is2_1, St5_Is3_1, St5_Is4_1, St5_Is5_1, St5_Is6_1, St5_Is7_1, St5_Is8_1, St5_Is9_1 : std_logic_vector(3 downto 0);
	signal St5_Is1_2, St5_Is2_2, St5_Is3_2, St5_Is4_2, St5_Is5_2, St5_Is6_2, St5_Is7_2, St5_Is8_2, St5_Is9_2 : std_logic_vector(3 downto 0);
	
	signal St6_Is1_1, St6_Is2_1, St6_Is3_1, St6_Is4_1, St6_Is5_1, St6_Is6_1, St6_Is7_1, St6_Is8_1, St6_Is9_1 : std_logic_vector(7 downto 0);
	signal St6_Is1_2, St6_Is2_2, St6_Is3_2, St6_Is4_2, St6_Is5_2, St6_Is6_2, St6_Is7_2, St6_Is8_2, St6_Is9_2 : std_logic_vector(7 downto 0);

	-- Hull Registers
	signal St3_Is_Top1_1, St3_Is_Top2_1, St3_Is_Top3_1, St3_Is_Bottom1_1, St3_Is_Bottom2_1, St3_Is_Bottom3_1 : std_logic_vector(3 downto 0);
	signal St3_Is_Top1_2, St3_Is_Top2_2, St3_Is_Top3_2, St3_Is_Bottom1_2, St3_Is_Bottom2_2, St3_Is_Bottom3_2 : std_logic_vector(3 downto 0);

	signal St4_Is_Top1_1, St4_Is_Top2_1, St4_Is_Top3_1, St4_Is_Bottom1_1, St4_Is_Bottom2_1, St4_Is_Bottom3_1 : std_logic_vector(3 downto 0);
	signal St4_Is_Top1_2, St4_Is_Top2_2, St4_Is_Top3_2, St4_Is_Bottom1_2, St4_Is_Bottom2_2, St4_Is_Bottom3_2 : std_logic_vector(3 downto 0);
	
	signal St4_Is_Top_lvl2_1_1, St4_Is_Top_lvl2_2_1, St4_Is_Top_lvl2_3_1 : std_logic_vector(1 downto 0); 
	signal St4_Is_Bottom_lvl2_1_1, St4_Is_Bottom_lvl2_2_1, St4_Is_Bottom_lvl2_3_1 : std_logic_vector(1 downto 0);
	signal St4_Is_Top_lvl2_1_2, St4_Is_Top_lvl2_2_2, St4_Is_Top_lvl2_3_2 : std_logic_vector(1 downto 0); 
	signal St4_Is_Bottom_lvl2_1_2, St4_Is_Bottom_lvl2_2_2, St4_Is_Bottom_lvl2_3_2 : std_logic_vector(1 downto 0);
	
	signal St5_Is_Top1_1, St5_Is_Top2_1, St5_Is_Top3_1, St5_Is_Bottom1_1, St5_Is_Bottom2_1, St5_Is_Bottom3_1 : std_logic_vector(3 downto 0);
	signal St5_Is_Top1_2, St5_Is_Top2_2, St5_Is_Top3_2, St5_Is_Bottom1_2, St5_Is_Bottom2_2, St5_Is_Bottom3_2 : std_logic_vector(3 downto 0);
	
	-- Recombined Signals
	signal St3_Recombined_Is1_1, St3_Recombined_Is2_1, St3_Recombined_Is3_1, St3_Recombined_Is1_2, St3_Recombined_Is2_2, St3_Recombined_Is3_2 : std_logic_vector(3 downto 0);
	signal St4_Recombined_Is1_1, St4_Recombined_Is2_1, St4_Recombined_Is3_1, St4_Recombined_Is1_2, St4_Recombined_Is2_2, St4_Recombined_Is3_2 : std_logic_vector(1 downto 0);
	
	signal St4_Recombined_Is1_Inv_1, St4_Recombined_Is2_Inv_1, St4_Recombined_Is3_Inv_1 : std_logic_vector(1 downto 0);
	signal St4_Recombined_Is1_Inv_2, St4_Recombined_Is2_Inv_2, St4_Recombined_Is3_Inv_2 : std_logic_vector(1 downto 0);
	
	signal St5_Recombined_Is1_1, St5_Recombined_Is2_1, St5_Recombined_Is3_1, St5_Recombined_Is1_2, St5_Recombined_Is2_2, St5_Recombined_Is3_2 : std_logic_vector(3 downto 0);

	signal St6_Recombined_Is1_1, St6_Recombined_Is2_1, St6_Recombined_Is3_1, St6_Recombined_Is1_2, St6_Recombined_Is2_2, St6_Recombined_Is3_2 : std_logic_vector(7 downto 0);

	-- Multiplier Inputs 
   signal St4_Recombined_Is_Top1_1, St4_Recombined_Is_Top2_1, St4_Recombined_Is_Top3_1, St4_Recombined_Is_Bottom1_1, St4_Recombined_Is_Bottom2_1, St4_Recombined_Is_Bottom3_1 : std_logic_vector(3 downto 0);
	signal St4_Recombined_Is_Top1_2, St4_Recombined_Is_Top2_2, St4_Recombined_Is_Top3_2, St4_Recombined_Is_Bottom1_2, St4_Recombined_Is_Bottom2_2, St4_Recombined_Is_Bottom3_2 : std_logic_vector(3 downto 0);
	
	signal St5_Is1_Top_1, St5_Is2_Top_1, St5_Is3_Top_1, St5_Is1_Bot_1, St5_Is2_Bot_1, St5_Is3_Bot_1 : std_logic_vector(7 downto 0);
	signal St5_Is1_Top_2, St5_Is2_Top_2, St5_Is3_Top_2, St5_Is1_Bot_2, St5_Is2_Bot_2, St5_Is3_Bot_2 : std_logic_vector(7 downto 0);
	
	
	component Recomb_St3_stable 
	   port(
			St3_Is1_1, St3_Is2_1, St3_Is3_1, St3_Is1_2, St3_Is2_2, St3_Is3_2 : in std_logic_vector(3 downto 0);
			St3_Recombined_Is1_1, St3_Recombined_Is1_2 : out std_logic_vector(3 downto 0)
	   );
   end component Recomb_St3_stable;
	
	component Recomb_St4_stable 
	   port(
			St4_Is1_1, St4_Is2_1, St4_Is3_1, St4_Is1_2, St4_Is2_2, St4_Is3_2 : in std_logic_vector(1 downto 0);
			St4_Recombined_Is1_1, St4_Recombined_Is1_2 : out std_logic_vector(1 downto 0)
	   );
   end component Recomb_St4_stable;
	
	component Recomb_St5_stable
	port(
		St4_Is1_1, St4_Is2_1, St4_Is3_1, St4_Is1_2, St4_Is2_2, St4_Is3_2 : in std_logic_vector(3 downto 0);
		St4_Recombined_Is1_1, St4_Recombined_Is1_2 : out std_logic_vector(3 downto 0)
	);
   end component Recomb_St5_stable;
	
	component Recomb_St6_stable is
	port(
		Is1_1, Is2_1, Is3_1, Is1_2, Is2_2, Is3_2 : in std_logic_vector(7 downto 0);
		Recombined_Is1_1, Recombined_Is1_2 : out std_logic_vector(7 downto 0)
	);
	end component Recomb_St6_stable;
	
	-- 8 bit register
	component Regs_Shares1
		port(
			clk : in std_logic;
			St1_Os1 : in std_logic_vector(7 downto 0);
			St2_Is1 : out std_logic_vector(7 downto 0)
		);
	end component Regs_Shares1;
	
	-- 4 bit register
	component Regs_Shares2
		port(
			clk : in std_logic;
			St1_Os1 : in std_logic_vector(3 downto 0);
			St2_Is1 : out std_logic_vector(3 downto 0)
		);
	end component Regs_Shares2;
	
	-- 2 bit register
	component Regs_Shares3
		port(
			clk : in std_logic;
			St1_Os1 : in std_logic_vector(1 downto 0);
			St2_Is1 : out std_logic_vector(1 downto 0)
		);
	end component Regs_Shares3;
	
	component sbox_ph1
		port(	Is1, Is2, Is3  : in std_logic_vector(7 downto 0);
				Os1, Os2, Os3 	: out std_logic_vector(7 downto 0) 
		);
	end component sbox_ph1;
	
	component sbox_ph2
		port(	Randomness : in std_logic_vector(35 downto 0);
			   Is1_1, Is2_1, Is3_1, Is1_2, Is2_2, Is3_2 : in std_logic_vector(7 downto 0);
			   Os1_1, Os2_1, Os3_1, Os4_1, Os5_1, Os6_1, Os7_1, Os8_1, Os9_1, Os1_2, Os2_2, Os3_2, Os4_2, Os5_2, Os6_2, Os7_2, Os8_2, Os9_2 : out std_logic_vector(3 downto 0)	
		);
	end component sbox_ph2;
	
	component sbox_ph3 
   port(	
		Randomness : in std_logic_vector( 17 downto 0);
		Is1_1, Is2_1, Is3_1, Is1_2, Is2_2, Is3_2 : in std_logic_vector(3 downto 0);
		Os1_1, Os2_1, Os3_1, Os4_1, Os5_1, Os6_1, Os7_1, Os8_1, Os9_1, Os1_2, Os2_2, Os3_2, Os4_2, Os5_2, Os6_2, Os7_2, Os8_2, Os9_2 : out std_logic_vector(1 downto 0)
	);
   end component sbox_ph3;

   component sbox_ph4 is
	port(
		Randomness : in std_logic_vector(35 downto 0);
		Is1_Top_1, Is2_Top_1, Is3_Top_1 : in std_logic_vector(3 downto 0);
		Is1_Bot_1, Is2_Bot_1, Is3_Bot_1 : in std_logic_vector(3 downto 0);
		Is1_Top_2, Is2_Top_2, Is3_Top_2 : in std_logic_vector(3 downto 0);
		Is1_Bot_2, Is2_Bot_2, Is3_Bot_2 : in std_logic_vector(3 downto 0);
		Os1_1, Os2_1, Os3_1, Os4_1, Os5_1, Os6_1, Os7_1, Os8_1, Os9_1 : out std_logic_vector(3 downto 0);
		Os1_2, Os2_2, Os3_2, Os4_2, Os5_2, Os6_2, Os7_2, Os8_2, Os9_2 : out std_logic_vector(3 downto 0)
	);
   end component sbox_ph4;
	
	component sbox_ph5 is
	port (        Randomness : in std_logic_vector(71 downto 0);
		           Is1_Top_1, Is2_Top_1, Is3_Top_1, Is1_Bot_1, Is2_Bot_1, Is3_Bot_1 : in std_logic_vector(7 downto 0);
					  Is1_Top_2, Is2_Top_2, Is3_Top_2, Is1_Bot_2, Is2_Bot_2, Is3_Bot_2 : in std_logic_vector(7 downto 0); 
		           Os1_1, Os2_1, Os3_1, Os4_1, Os5_1, Os6_1, Os7_1, Os8_1, Os9_1 : out std_logic_vector(7 downto 0);
					  Os1_2, Os2_2, Os3_2, Os4_2, Os5_2, Os6_2, Os7_2, Os8_2, Os9_2 : out std_logic_vector(7 downto 0)
	);
	end component sbox_ph5;
	
	component sbox_ph6 is
   port(	
		Is1, Is2, Is3	: in std_logic_vector(7 downto 0);
		Os1, Os2, Os3	: out std_logic_vector(7 downto 0)
	);
	end component sbox_ph6;
	
begin
	-- Assign Randomness
	St2_Randomness <= Randomness(161 downto 126);
	St3_Randomness <= Randomness(125 downto 108);
	St4_Randomness <= Randomness(107 downto  72);
	St5_Randomness <= Randomness( 71 downto   0);
	
	--
	-- Stage 1
	--
	Stage1_Register_S1_1 : Regs_Shares1
		port map (clk, St1_Os1_1, St2_Is1_1);
	Stage1_Register_S2_1 : Regs_Shares1
		port map (clk, St1_Os2_1, St2_Is2_1);
	Stage1_Register_S3_1 : Regs_Shares1
		port map (clk, St1_Os3_1, St2_Is3_1);
	Stage1_Register_S1_2 : Regs_Shares1
		port map (clk, St1_Os1_2, St2_Is1_2);
	Stage1_Register_S2_2 : Regs_Shares1
		port map (clk, St1_Os2_2, St2_Is2_2);
	Stage1_Register_S3_2 : Regs_Shares1
		port map (clk, St1_Os3_2, St2_Is3_2);	
		
	Stage1_1 : sbox_ph1
		port map ( Is1_1, Is2_1, Is3_1, St1_Os1_1, St1_Os2_1, St1_Os3_1);
	Stage1_2 : sbox_ph1
		port map ( Is1_2, Is2_2, Is3_2, St1_Os1_2, St1_Os2_2, St1_Os3_2);
	--
	-- Stage 2
	--
	Stage2 : sbox_ph2
		port map ( St2_Randomness, St2_Is1_1, St2_Is2_1, St2_Is3_1, St2_Is1_2, St2_Is2_2, St2_Is3_2,
		           St2_Os1_1, St2_Os2_1, St2_Os3_1, St2_Os4_1, St2_Os5_1, St2_Os6_1, St2_Os7_1, St2_Os8_1, St2_Os9_1, 
					  St2_Os1_2, St2_Os2_2, St2_Os3_2, St2_Os4_2, St2_Os5_2, St2_Os6_2, St2_Os7_2, St2_Os8_2, St2_Os9_2 );
	
	
	Stage2_Register_S1_1 : Regs_Shares2
		port map (clk, St2_Os1_1, St3_Is1_1);
	Stage2_Register_S2_1 : Regs_Shares2
		port map (clk, St2_Os2_1, St3_Is2_1);
	Stage2_Register_S3_1 : Regs_Shares2
		port map (clk, St2_Os3_1, St3_Is3_1);
	Stage2_Register_S4_1 : Regs_Shares2
		port map (clk, St2_Os4_1, St3_Is4_1);
	Stage2_Register_S5_1 : Regs_Shares2
		port map (clk, St2_Os5_1, St3_Is5_1);
	Stage2_Register_S6_1 : Regs_Shares2
		port map (clk, St2_Os6_1, St3_Is6_1);
	Stage2_Register_S7_1 : Regs_Shares2
		port map (clk, St2_Os7_1, St3_Is7_1);
	Stage2_Register_S8_1 : Regs_Shares2
		port map (clk, St2_Os8_1, St3_Is8_1);
	Stage2_Register_S9_1 : Regs_Shares2
		port map (clk, St2_Os9_1, St3_Is9_1);

	Stage2_Register_S1_2 : Regs_Shares2
		port map (clk, St2_Os1_2, St3_Is1_2);
	Stage2_Register_S2_2 : Regs_Shares2
		port map (clk, St2_Os2_2, St3_Is2_2);
	Stage2_Register_S3_2 : Regs_Shares2
		port map (clk, St2_Os3_2, St3_Is3_2);
	Stage2_Register_S4_2 : Regs_Shares2
		port map (clk, St2_Os4_2, St3_Is4_2);
	Stage2_Register_S5_2 : Regs_Shares2
		port map (clk, St2_Os5_2, St3_Is5_2);
	Stage2_Register_S6_2 : Regs_Shares2
		port map (clk, St2_Os6_2, St3_Is6_2);
	Stage2_Register_S7_2 : Regs_Shares2
		port map (clk, St2_Os7_2, St3_Is7_2);
	Stage2_Register_S8_2 : Regs_Shares2
		port map (clk, St2_Os8_2, St3_Is8_2);
	Stage2_Register_S9_2 : Regs_Shares2
		port map (clk, St2_Os9_2, St3_Is9_2);
		
		
	Stage2_Register_S_Top1_1 : Regs_Shares2
		port map (clk, St2_Is1_1(7 downto 4), St3_Is_Top1_1);
	Stage2_Register_S_Top2_1 : Regs_Shares2
		port map (clk, St2_Is2_1(7 downto 4), St3_Is_Top2_1);
	Stage2_Register_S_Top3_1 : Regs_Shares2
		port map (clk, St2_Is3_1(7 downto 4), St3_Is_Top3_1);
	Stage2_Register_S_Bot1_1 : Regs_Shares2
		port map (clk, St2_Is1_1(3 downto 0), St3_Is_Bottom1_1);
	Stage2_Register_S_Bot2_1 : Regs_Shares2
		port map (clk, St2_Is2_1(3 downto 0), St3_Is_Bottom2_1);
	Stage2_Register_S_Bot3_1 : Regs_Shares2
		port map (clk, St2_Is3_1(3 downto 0), St3_Is_Bottom3_1);

	Stage2_Register_S_Top1_2 : Regs_Shares2
		port map (clk, St2_Is1_2(7 downto 4), St3_Is_Top1_2);
	Stage2_Register_S_Top2_2 : Regs_Shares2
		port map (clk, St2_Is2_2(7 downto 4), St3_Is_Top2_2);
	Stage2_Register_S_Top3_2 : Regs_Shares2
		port map (clk, St2_Is3_2(7 downto 4), St3_Is_Top3_2);
	Stage2_Register_S_Bot1_2 : Regs_Shares2
		port map (clk, St2_Is1_2(3 downto 0), St3_Is_Bottom1_2);
	Stage2_Register_S_Bot2_2 : Regs_Shares2
		port map (clk, St2_Is2_2(3 downto 0), St3_Is_Bottom2_2);
	Stage2_Register_S_Bot3_2 : Regs_Shares2
		port map (clk, St2_Is3_2(3 downto 0), St3_Is_Bottom3_2);
		
	--
	-- Stage 3
	--
	-- 
	--Stage3_Recombination1 : Recomb_St3_stable
		--port map (St3_Is1_1, St3_Is2_1, St3_Is3_1, St3_Is1_2, St3_Is2_2, St3_Is3_2, St3_Recombined_Is1_1, St3_Recombined_Is1_2);
	--Stage3_Recombination2 : Recomb_St3_stable
		--port map (St3_Is4_1, St3_Is5_1, St3_Is6_1, St3_Is4_2, St3_Is5_2, St3_Is6_2, St3_Recombined_Is2_1, St3_Recombined_Is2_2);
	--Stage3_Recombination3 : Recomb_St3_stable
		--port map (St3_Is7_1, St3_Is8_1, St3_Is9_1, St3_Is7_2, St3_Is8_2, St3_Is9_2, St3_Recombined_Is3_1, St3_Recombined_Is3_2);

	Stage3_Recombination1 : Recomb_St3_stable
		port map (St3_Is1_1, St3_Is2_1, St3_Is3_1, St3_Is1_2, St3_Is2_2, St3_Is3_2, St3_Recombined_Is1_1, St3_Recombined_Is1_2);
	Stage3_Recombination2 : Recomb_St3_stable
		port map (St3_Is5_1, St3_Is4_1, St3_Is6_1, St3_Is5_2, St3_Is4_2, St3_Is6_2, St3_Recombined_Is2_1, St3_Recombined_Is2_2);
	Stage3_Recombination3 : Recomb_St3_stable
		port map (St3_Is9_1, St3_Is8_1, St3_Is7_1, St3_Is9_2, St3_Is8_2, St3_Is7_2, St3_Recombined_Is3_1, St3_Recombined_Is3_2);

	Stage3 : sbox_ph3
		port map ( St3_Randomness, St3_Recombined_Is1_1, St3_Recombined_Is2_1, St3_Recombined_Is3_1, St3_Recombined_Is1_2, St3_Recombined_Is2_2, St3_Recombined_Is3_2, 
		           St3_Os1_1, St3_Os2_1, St3_Os3_1, St3_Os4_1, St3_Os5_1, St3_Os6_1, St3_Os7_1, St3_Os8_1, St3_Os9_1,
					  St3_Os1_2, St3_Os2_2, St3_Os3_2, St3_Os4_2, St3_Os5_2, St3_Os6_2, St3_Os7_2, St3_Os8_2, St3_Os9_2);

	
	Stage3_Register_S1_1 : Regs_Shares3
		port map (clk, St3_Os1_1, St4_Is1_1);
	Stage3_Register_S2_1 : Regs_Shares3
		port map (clk, St3_Os2_1, St4_Is2_1);
	Stage3_Register_S3_1 : Regs_Shares3
		port map (clk, St3_Os3_1, St4_Is3_1);
	Stage3_Register_S4_1 : Regs_Shares3
		port map (clk, St3_Os4_1, St4_Is4_1);
	Stage3_Register_S5_1 : Regs_Shares3
		port map (clk, St3_Os5_1, St4_Is5_1);
	Stage3_Register_S6_1 : Regs_Shares3
		port map (clk, St3_Os6_1, St4_Is6_1);
	Stage3_Register_S7_1 : Regs_Shares3
		port map (clk, St3_Os7_1, St4_Is7_1);
	Stage3_Register_S8_1 : Regs_Shares3
		port map (clk, St3_Os8_1, St4_Is8_1);
	Stage3_Register_S9_1 : Regs_Shares3
		port map (clk, St3_Os9_1, St4_Is9_1);

	Stage3_Register_S1_2 : Regs_Shares3
		port map (clk, St3_Os1_2, St4_Is1_2);
	Stage3_Register_S2_2 : Regs_Shares3
		port map (clk, St3_Os2_2, St4_Is2_2);
	Stage3_Register_S3_2 : Regs_Shares3
		port map (clk, St3_Os3_2, St4_Is3_2);
	Stage3_Register_S4_2 : Regs_Shares3
		port map (clk, St3_Os4_2, St4_Is4_2);
	Stage3_Register_S5_2 : Regs_Shares3
		port map (clk, St3_Os5_2, St4_Is5_2);
	Stage3_Register_S6_2 : Regs_Shares3
		port map (clk, St3_Os6_2, St4_Is6_2);
	Stage3_Register_S7_2 : Regs_Shares3
		port map (clk, St3_Os7_2, St4_Is7_2);
	Stage3_Register_S8_2 : Regs_Shares3
		port map (clk, St3_Os8_2, St4_Is8_2);
	Stage3_Register_S9_2 : Regs_Shares3
		port map (clk, St3_Os9_2, St4_Is9_2);
		
	Stage3_Register_S_Top1_1 : Regs_Shares2
		port map (clk, St3_Is_Top1_1, St4_Is_Top1_1);
	Stage3_Register_S_Top2_1 : Regs_Shares2
		port map (clk, St3_Is_Top2_1, St4_Is_Top2_1);
	Stage3_Register_S_Top3_1 : Regs_Shares2
		port map (clk, St3_Is_Top3_1, St4_Is_Top3_1);
	Stage3_Register_S_Bot1_1 : Regs_Shares2
		port map (clk, St3_Is_Bottom1_1, St4_Is_Bottom1_1);
	Stage3_Register_S_Bot2_1 : Regs_Shares2
		port map (clk, St3_Is_Bottom2_1, St4_Is_Bottom2_1);
	Stage3_Register_S_Bot3_1 : Regs_Shares2
		port map (clk, St3_Is_Bottom3_1, St4_Is_Bottom3_1);

	Stage3_Register_S_Top1_2 : Regs_Shares2
		port map (clk, St3_Is_Top1_2, St4_Is_Top1_2);
	Stage3_Register_S_Top2_2 : Regs_Shares2
		port map (clk, St3_Is_Top2_2, St4_Is_Top2_2);
	Stage3_Register_S_Top3_2 : Regs_Shares2
		port map (clk, St3_Is_Top3_2, St4_Is_Top3_2);
	Stage3_Register_S_Bot1_2 : Regs_Shares2
		port map (clk, St3_Is_Bottom1_2, St4_Is_Bottom1_2);
	Stage3_Register_S_Bot2_2 : Regs_Shares2
		port map (clk, St3_Is_Bottom2_2, St4_Is_Bottom2_2);
	Stage3_Register_S_Bot3_2 : Regs_Shares2
		port map (clk, St3_Is_Bottom3_2, St4_Is_Bottom3_2);
		

	Stage3_Register_S_Top_lvl2_1_1 : Regs_Shares3
		port map (clk, St3_Recombined_Is1_1(3 downto 2), St4_Is_Top_lvl2_1_1);
	Stage3_Register_S_Top_lvl2_2_1 : Regs_Shares3
		port map (clk, St3_Recombined_Is2_1(3 downto 2), St4_Is_Top_lvl2_2_1);
	Stage3_Register_S_Top_lvl2_3_1 : Regs_Shares3
		port map (clk, St3_Recombined_Is3_1(3 downto 2), St4_Is_Top_lvl2_3_1);
	Stage3_Register_S_Bot_lvl2_1_1 : Regs_Shares3
		port map (clk, St3_Recombined_Is1_1(1 downto 0), St4_Is_Bottom_lvl2_1_1);
	Stage3_Register_S_Bot_lvl2_2_1 : Regs_Shares3
		port map (clk, St3_Recombined_Is2_1(1 downto 0), St4_Is_Bottom_lvl2_2_1);
	Stage3_Register_S_Bot_lvl2_3_1 : Regs_Shares3
		port map (clk, St3_Recombined_Is3_1(1 downto 0), St4_Is_Bottom_lvl2_3_1);
	
	Stage3_Register_S_Top_lvl2_1_2 : Regs_Shares3
		port map (clk, St3_Recombined_Is1_2(3 downto 2), St4_Is_Top_lvl2_1_2);
	Stage3_Register_S_Top_lvl2_2_2 : Regs_Shares3
		port map (clk, St3_Recombined_Is2_2(3 downto 2), St4_Is_Top_lvl2_2_2);
	Stage3_Register_S_Top_lvl2_3_2 : Regs_Shares3
		port map (clk, St3_Recombined_Is3_2(3 downto 2), St4_Is_Top_lvl2_3_2);
	Stage3_Register_S_Bot_lvl2_1_2 : Regs_Shares3
		port map (clk, St3_Recombined_Is1_2(1 downto 0), St4_Is_Bottom_lvl2_1_2);
	Stage3_Register_S_Bot_lvl2_2_2 : Regs_Shares3
		port map (clk, St3_Recombined_Is2_2(1 downto 0), St4_Is_Bottom_lvl2_2_2);
	Stage3_Register_S_Bot_lvl2_3_2 : Regs_Shares3
		port map (clk, St3_Recombined_Is3_2(1 downto 0), St4_Is_Bottom_lvl2_3_2);	
	
	--
	-- Stage 4
	--
	St4_Recombined_Is_Top1_1 <= St4_Is_Top_lvl2_1_1 & St4_Recombined_Is1_Inv_1;
	St4_Recombined_Is_Bottom1_1 <= St4_Is_Bottom_lvl2_1_1 & St4_Recombined_Is1_Inv_1;
	
	St4_Recombined_Is_Top2_1 <= St4_Is_Top_lvl2_2_1 & St4_Recombined_Is2_Inv_1;
	St4_Recombined_Is_Bottom2_1 <= St4_Is_Bottom_lvl2_2_1 & St4_Recombined_Is2_Inv_1;
	
	St4_Recombined_Is_Top3_1 <= St4_Is_Top_lvl2_3_1 & St4_Recombined_Is3_Inv_1;
	St4_Recombined_Is_Bottom3_1 <= St4_Is_Bottom_lvl2_3_1 & St4_Recombined_Is3_Inv_1;


	St4_Recombined_Is_Top1_2 <= St4_Is_Top_lvl2_1_2 & St4_Recombined_Is1_Inv_2;
	St4_Recombined_Is_Bottom1_2 <= St4_Is_Bottom_lvl2_1_2 & St4_Recombined_Is1_Inv_2;
	
	St4_Recombined_Is_Top2_2 <= St4_Is_Top_lvl2_2_2 & St4_Recombined_Is2_Inv_2;
	St4_Recombined_Is_Bottom2_2 <= St4_Is_Bottom_lvl2_2_2 & St4_Recombined_Is2_Inv_2;
	
	St4_Recombined_Is_Top3_2 <= St4_Is_Top_lvl2_3_2 & St4_Recombined_Is3_Inv_2;
	St4_Recombined_Is_Bottom3_2 <= St4_Is_Bottom_lvl2_3_2 & St4_Recombined_Is3_Inv_2;
	
	
	--Stage4_Recombination1 : Recomb_St4_stable
		--port map (St4_Is1_1, St4_Is2_1, St4_Is3_1, St4_Is1_2, St4_Is2_2, St4_Is3_2, St4_Recombined_Is1_1, St4_Recombined_Is1_2);
	--Stage4_Recombination2 : Recomb_St4_stable
		--port map (St4_Is4_1, St4_Is5_1, St4_Is6_1, St4_Is4_2, St4_Is5_2, St4_Is6_2, St4_Recombined_Is2_1, St4_Recombined_Is2_2);
	--Stage4_Recombination3 : Recomb_St4_stable
		--port map (St4_Is7_1, St4_Is8_1, St4_Is9_1, St4_Is7_2, St4_Is8_2, St4_Is9_2, St4_Recombined_Is3_1, St4_Recombined_Is3_2);	

	Stage4_Recombination1 : Recomb_St4_stable
		port map (St4_Is1_1, St4_Is2_1, St4_Is3_1, St4_Is1_2, St4_Is2_2, St4_Is3_2, St4_Recombined_Is1_1, St4_Recombined_Is1_2);
	Stage4_Recombination2 : Recomb_St4_stable
		port map (St4_Is5_1, St4_Is4_1, St4_Is6_1, St4_Is5_2, St4_Is4_2, St4_Is6_2, St4_Recombined_Is2_1, St4_Recombined_Is2_2);
	Stage4_Recombination3 : Recomb_St4_stable
		port map (St4_Is9_1, St4_Is8_1, St4_Is7_1, St4_Is9_2, St4_Is8_2, St4_Is7_2, St4_Recombined_Is3_1, St4_Recombined_Is3_2);

	St4_Recombined_Is1_Inv_1 <= St4_Recombined_Is1_1(0) & St4_Recombined_Is1_1(1);
	St4_Recombined_Is2_Inv_1 <= St4_Recombined_Is2_1(0) & St4_Recombined_Is2_1(1);
	St4_Recombined_Is3_Inv_1 <= St4_Recombined_Is3_1(0) & St4_Recombined_Is3_1(1);

	St4_Recombined_Is1_Inv_2 <= St4_Recombined_Is1_2(0) & St4_Recombined_Is1_2(1);
	St4_Recombined_Is2_Inv_2 <= St4_Recombined_Is2_2(0) & St4_Recombined_Is2_2(1);
	St4_Recombined_Is3_Inv_2 <= St4_Recombined_Is3_2(0) & St4_Recombined_Is3_2(1);

	
	Stage4 : sbox_ph4
		port map ( St4_Randomness, 
		           St4_Recombined_Is_Top1_1, St4_Recombined_Is_Top2_1, St4_Recombined_Is_Top3_1, St4_Recombined_Is_Bottom1_1, St4_Recombined_Is_Bottom2_1, St4_Recombined_Is_Bottom3_1, 
					  St4_Recombined_Is_Top1_2, St4_Recombined_Is_Top2_2, St4_Recombined_Is_Top3_2, St4_Recombined_Is_Bottom1_2, St4_Recombined_Is_Bottom2_2, St4_Recombined_Is_Bottom3_2, 
		           St4_Os1_1, St4_Os2_1, St4_Os3_1, St4_Os4_1, St4_Os5_1, St4_Os6_1, St4_Os7_1, St4_Os8_1, St4_Os9_1,
					  St4_Os1_2, St4_Os2_2, St4_Os3_2, St4_Os4_2, St4_Os5_2, St4_Os6_2, St4_Os7_2, St4_Os8_2, St4_Os9_2);


	Stage4_Register_S1_1 : Regs_Shares2
		port map (clk, St4_Os1_1, St5_Is1_1);
	Stage4_Register_S2_1 : Regs_Shares2
		port map (clk, St4_Os2_1, St5_Is2_1);
	Stage4_Register_S3_1 : Regs_Shares2
		port map (clk, St4_Os3_1, St5_Is3_1);
	Stage4_Register_S4_1 : Regs_Shares2
		port map (clk, St4_Os4_1, St5_Is4_1);
	Stage4_Register_S5_1 : Regs_Shares2
		port map (clk, St4_Os5_1, St5_Is5_1);
	Stage4_Register_S6_1 : Regs_Shares2
		port map (clk, St4_Os6_1, St5_Is6_1);
	Stage4_Register_S7_1 : Regs_Shares2
		port map (clk, St4_Os7_1, St5_Is7_1);
	Stage4_Register_S8_1 : Regs_Shares2
		port map (clk, St4_Os8_1, St5_Is8_1);
	Stage4_Register_S9_1 : Regs_Shares2
		port map (clk, St4_Os9_1, St5_Is9_1);

	Stage4_Register_S1_2 : Regs_Shares2
		port map (clk, St4_Os1_2, St5_Is1_2);
	Stage4_Register_S2_2 : Regs_Shares2
		port map (clk, St4_Os2_2, St5_Is2_2);
	Stage4_Register_S3_2 : Regs_Shares2
		port map (clk, St4_Os3_2, St5_Is3_2);
	Stage4_Register_S4_2 : Regs_Shares2
		port map (clk, St4_Os4_2, St5_Is4_2);
	Stage4_Register_S5_2 : Regs_Shares2
		port map (clk, St4_Os5_2, St5_Is5_2);
	Stage4_Register_S6_2 : Regs_Shares2
		port map (clk, St4_Os6_2, St5_Is6_2);
	Stage4_Register_S7_2 : Regs_Shares2
		port map (clk, St4_Os7_2, St5_Is7_2);
	Stage4_Register_S8_2 : Regs_Shares2
		port map (clk, St4_Os8_2, St5_Is8_2);
	Stage4_Register_S9_2 : Regs_Shares2
		port map (clk, St4_Os9_2, St5_Is9_2);


	Stage4_Register_S_Top1_1 : Regs_Shares2
		port map (clk, St4_Is_Top1_1, St5_Is_Top1_1);
	Stage4_Register_S_Top2_1 : Regs_Shares2
		port map (clk, St4_Is_Top2_1, St5_Is_Top2_1);
	Stage4_Register_S_Top3_1 : Regs_Shares2
		port map (clk, St4_Is_Top3_1, St5_Is_Top3_1);
	Stage4_Register_S_Bot1_1 : Regs_Shares2
		port map (clk, St4_Is_Bottom1_1, St5_Is_Bottom1_1);
	Stage4_Register_S_Bot2_1 : Regs_Shares2
		port map (clk, St4_Is_Bottom2_1, St5_Is_Bottom2_1);
	Stage4_Register_S_Bot3_1 : Regs_Shares2
		port map (clk, St4_Is_Bottom3_1, St5_Is_Bottom3_1);

	Stage4_Register_S_Top1_2 : Regs_Shares2
		port map (clk, St4_Is_Top1_2, St5_Is_Top1_2);
	Stage4_Register_S_Top2_2 : Regs_Shares2
		port map (clk, St4_Is_Top2_2, St5_Is_Top2_2);
	Stage4_Register_S_Top3_2 : Regs_Shares2
		port map (clk, St4_Is_Top3_2, St5_Is_Top3_2);
	Stage4_Register_S_Bot1_2 : Regs_Shares2
		port map (clk, St4_Is_Bottom1_2, St5_Is_Bottom1_2);
	Stage4_Register_S_Bot2_2 : Regs_Shares2
		port map (clk, St4_Is_Bottom2_2, St5_Is_Bottom2_2);
	Stage4_Register_S_Bot3_2 : Regs_Shares2
		port map (clk, St4_Is_Bottom3_2, St5_Is_Bottom3_2);

	--
	-- Stage 5
	--		
	St5_Is1_Top_1 <= St5_Is_Top1_1 & St5_Recombined_Is1_1;
	St5_Is1_Bot_1 <= St5_Is_Bottom1_1 & St5_Recombined_Is1_1;	
	St5_Is2_Top_1 <= St5_Is_Top2_1 & St5_Recombined_Is2_1;
	St5_Is2_Bot_1 <= St5_Is_Bottom2_1 & St5_Recombined_Is2_1;	
	St5_Is3_Top_1 <= St5_Is_Top3_1 & St5_Recombined_Is3_1;
	St5_Is3_Bot_1 <= St5_Is_Bottom3_1 & St5_Recombined_Is3_1;	
	
	St5_Is1_Top_2 <= St5_Is_Top1_2 & St5_Recombined_Is1_2;
	St5_Is1_Bot_2 <= St5_Is_Bottom1_2 & St5_Recombined_Is1_2;	
	St5_Is2_Top_2 <= St5_Is_Top2_2 & St5_Recombined_Is2_2;
	St5_Is2_Bot_2 <= St5_Is_Bottom2_2 & St5_Recombined_Is2_2;	
	St5_Is3_Top_2 <= St5_Is_Top3_2 & St5_Recombined_Is3_2;
	St5_Is3_Bot_2 <= St5_Is_Bottom3_2 & St5_Recombined_Is3_2;


	--Stage5_Recombination1 : Recomb_St5_stable
		--port map (St5_Is1_1, St5_Is2_1, St5_Is3_1, St5_Is1_2, St5_Is2_2, St5_Is3_2, St5_Recombined_Is1_1, St5_Recombined_Is1_2);
	--Stage5_Recombination2 : Recomb_St5_stable
		--port map (St5_Is4_1, St5_Is5_1, St5_Is6_1, St5_Is4_2, St5_Is5_2, St5_Is6_2, St5_Recombined_Is2_1, St5_Recombined_Is2_2);
	--Stage5_Recombination3 : Recomb_St5_stable
		--port map (St5_Is7_1, St5_Is8_1, St5_Is9_1, St5_Is7_2, St5_Is8_2, St5_Is9_2, St5_Recombined_Is3_1, St5_Recombined_Is3_2);

	Stage5_Recombination1 : Recomb_St5_stable
		port map (St5_Is1_1, St5_Is2_1, St5_Is3_1, St5_Is1_2, St5_Is2_2, St5_Is3_2, St5_Recombined_Is1_1, St5_Recombined_Is1_2);
	Stage5_Recombination2 : Recomb_St5_stable
		port map (St5_Is5_1, St5_Is4_1, St5_Is6_1, St5_Is5_2, St5_Is4_2, St5_Is6_2, St5_Recombined_Is2_1, St5_Recombined_Is2_2);
	Stage5_Recombination3 : Recomb_St5_stable
		port map (St5_Is9_1, St5_Is8_1, St5_Is7_1, St5_Is9_2, St5_Is8_2, St5_Is7_2, St5_Recombined_Is3_1, St5_Recombined_Is3_2);

	Stage5 : sbox_ph5
		port map ( St5_Randomness, 
		           St5_Is1_Top_1, St5_Is2_Top_1, St5_Is3_Top_1, St5_Is1_Bot_1, St5_Is2_Bot_1, St5_Is3_Bot_1, 
					  St5_Is1_Top_2, St5_Is2_Top_2, St5_Is3_Top_2, St5_Is1_Bot_2, St5_Is2_Bot_2, St5_Is3_Bot_2, 
		           St5_Os1_1, St5_Os2_1, St5_Os3_1, St5_Os4_1, St5_Os5_1, St5_Os6_1, St5_Os7_1, St5_Os8_1, St5_Os9_1,
					  St5_Os1_2, St5_Os2_2, St5_Os3_2, St5_Os4_2, St5_Os5_2, St5_Os6_2, St5_Os7_2, St5_Os8_2, St5_Os9_2);

	Stage5_Register_S1_1 : Regs_Shares1
		port map (clk, St5_Os1_1, St6_Is1_1);
	Stage5_Register_S2_1 : Regs_Shares1
		port map (clk, St5_Os2_1, St6_Is2_1);
	Stage5_Register_S3_1 : Regs_Shares1
		port map (clk, St5_Os3_1, St6_Is3_1);
	Stage5_Register_S4_1 : Regs_Shares1
		port map (clk, St5_Os4_1, St6_Is4_1);
	Stage5_Register_S5_1 : Regs_Shares1
		port map (clk, St5_Os5_1, St6_Is5_1);
	Stage5_Register_S6_1 : Regs_Shares1
		port map (clk, St5_Os6_1, St6_Is6_1);
	Stage5_Register_S7_1 : Regs_Shares1
		port map (clk, St5_Os7_1, St6_Is7_1);
	Stage5_Register_S8_1 : Regs_Shares1
		port map (clk, St5_Os8_1, St6_Is8_1);
	Stage5_Register_S9_1 : Regs_Shares1
		port map (clk, St5_Os9_1, St6_Is9_1);

	Stage5_Register_S1_2 : Regs_Shares1
		port map (clk, St5_Os1_2, St6_Is1_2);
	Stage5_Register_S2_2 : Regs_Shares1
		port map (clk, St5_Os2_2, St6_Is2_2);
	Stage5_Register_S3_2 : Regs_Shares1
		port map (clk, St5_Os3_2, St6_Is3_2);
	Stage5_Register_S4_2 : Regs_Shares1
		port map (clk, St5_Os4_2, St6_Is4_2);
	Stage5_Register_S5_2 : Regs_Shares1
		port map (clk, St5_Os5_2, St6_Is5_2);
	Stage5_Register_S6_2 : Regs_Shares1
		port map (clk, St5_Os6_2, St6_Is6_2);
	Stage5_Register_S7_2 : Regs_Shares1
		port map (clk, St5_Os7_2, St6_Is7_2);
	Stage5_Register_S8_2 : Regs_Shares1
		port map (clk, St5_Os8_2, St6_Is8_2);
	Stage5_Register_S9_2 : Regs_Shares1
		port map (clk, St5_Os9_2, St6_Is9_2);

	--
	-- Stage 6
	--			
	Stage6_Recombination1 : Recomb_St6_stable
		port map (St6_Is1_1, St6_Is2_1, St6_Is3_1, St6_Is1_2, St6_Is2_2, St6_Is3_2, St6_Recombined_Is1_1, St6_Recombined_Is1_2);
	Stage6_Recombination2 : Recomb_St6_stable
		port map (St6_Is5_1, St6_Is4_1, St6_Is6_1, St6_Is5_2, St6_Is4_2, St6_Is6_2, St6_Recombined_Is2_1, St6_Recombined_Is2_2);
	Stage6_Recombination3 : Recomb_St6_stable
		port map (St6_Is9_1, St6_Is8_1, St6_Is7_1, St6_Is9_2, St6_Is8_2, St6_Is7_2, St6_Recombined_Is3_1, St6_Recombined_Is3_2);		
 
	Stage6_1 : sbox_ph6
		port map ( St6_Recombined_Is1_1, St6_Recombined_Is2_1, St6_Recombined_Is3_1, Os1_1, Os2_1, Os3_1);
	Stage6_2 : sbox_ph6
		port map ( St6_Recombined_Is1_2, St6_Recombined_Is2_2, St6_Recombined_Is3_2, Os1_2, Os2_2, Os3_2);

end Behavioral;

