library ieee;
use ieee.std_logic_1164.all;



entity aes_core_tb is 
	generic(constant c1 : std_logic_vector(0 to 127) := x"f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4";
		constant c2 : std_logic_vector(0 to 127) := x"a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3");
end;



architecture aa of aes_core_tb is 
	signal clk, sync_reset, enc_enable, source : std_logic := '1';
	signal data_ctrl : std_logic_vector(0 to 1);
	signal in_block : std_logic_vector(0 to 127);
	signal out_block : std_logic_vector(0 to 127);
	signal wr_full, rd_empty, mux_ctrl, wr_req, rd_req : std_logic;
	
	
	component aes_core is port(clk, wr_full, rd_empty, sync_reset, enc_enable, source : in std_logic;
		  data_ctrl : in std_logic_vector(0 to 1);
		  in_block : in std_logic_vector(0 to 127);
		  wr_req, rd_req, mux_ctrl : out std_logic;
		  data_out : out std_logic_vector(0 to 127));
	end component;

	begin 
		clk <= not clk after 1ns;
		enc_enable <= '0', '1' after 1ns;
		sync_reset <= '1', '0' after 1ns;
		source <= '1', '0' after 20ns;
		data_ctrl <= "00", "01" after 30ns, "10" after 33ns, "11" after 38ns;
		
		rd_empty <= '0', '1' after 180ns;
		wr_full <= '0', '1' after 160ns;
		
		in_block <= x"22222222222222222222222222222222", c1 after 20ns, c2 after 40ns;
		
		aes : aes_core port map(clk, wr_full, rd_empty, sync_reset, enc_enable, source, data_ctrl, in_block, wr_req, rd_req, mux_ctrl, out_block);
		
end;