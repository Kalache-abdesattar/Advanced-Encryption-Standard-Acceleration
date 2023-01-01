library ieee;
use ieee.std_logic_1164.all;


entity sbox_lut is 
	port(in_byte : in std_logic_vector(0 to 7);
		 out_byte : out std_logic_vector(0 to 7));
end sbox_lut;


architecture arc of sbox_lut is 
	begin 
		with in_byte select 
			out_byte <= "01100011" when "00000000",
						"01111100" when "00000001",
						"01110111" when "00000010",
						"01111011" when "00000011",
						"11110010" when "00000100",
						"01101011" when "00000101",
						"01101111" when "00000110",
						"11000101" when "00000111",
						"00110000" when "00001000",
						"00000001" when "00001001",
						"01100111" when "00001010",
						"00101011" when "00001011",
						"11111110" when "00001100",
						"11010111" when "00001101",
						"10101011" when "00001110",
						"01110110" when "00001111",
						"11001010" when "00010000",
						"10000010" when "00010001",
						"11001001" when "00010010",
						"01111101" when "00010011",
						"11111010" when "00010100",
						"01011001" when "00010101",
						"01000111" when "00010110",
						"11110000" when "00010111",
						"10101101" when "00011000",
						"11010100" when "00011001",
						"10100010" when "00011010",
						"10101111" when "00011011",
						"10011100" when "00011100",
						"10100100" when "00011101",
						"01110010" when "00011110",
						"11000000" when "00011111",
						"10110111" when "00100000",
						"11111101" when "00100001",
						"10010011" when "00100010",
						"00100110" when "00100011",
						"00110110" when "00100100",
						"00111111" when "00100101",
						"11110111" when "00100110",
						"11001100" when "00100111",
						"00110100" when "00101000",
						"10100101" when "00101001",
						"11100101" when "00101010",
						"11110001" when "00101011",
						"01110001" when "00101100",
						"11011000" when "00101101",
						"00110001" when "00101110",
						"00010101" when "00101111",
						"00000100" when "00110000",
						"11000111" when "00110001",
						"00100011" when "00110010",
						"11000011" when "00110011",
						"00011000" when "00110100",
						"10010110" when "00110101",
						"00000101" when "00110110",
						"10011010" when "00110111",
						"00000111" when "00111000",
						"00010010" when "00111001",
						"10000000" when "00111010",
						"11100010" when "00111011",
						"11101011" when "00111100",
						"00100111" when "00111101",
						"10110010" when "00111110",
						"01110101" when "00111111",
						"00001001" when "01000000",
						"10000011" when "01000001",
						"00101100" when "01000010",
						"00011010" when "01000011",
						"00011011" when "01000100",
						"01101110" when "01000101",
						"01011010" when "01000110",
						"10100000" when "01000111",
						"01010010" when "01001000",
						"00111011" when "01001001",
						"11010110" when "01001010",
						"10110011" when "01001011",
						"00101001" when "01001100",
						"11100011" when "01001101",
						"00101111" when "01001110",
						"10000100" when "01001111",
						"01010011" when "01010000",
						"11010001" when "01010001",
						"00000000" when "01010010",
						"11101101" when "01010011",
						"00100000" when "01010100",
						"11111100" when "01010101",
						"10110001" when "01010110",
						"01011011" when "01010111",
						"01101010" when "01011000",
						"11001011" when "01011001",
						"10111110" when "01011010",
						"00111001" when "01011011",
						"01001010" when "01011100",
						"01001100" when "01011101",
						"01011000" when "01011110",
						"11001111" when "01011111",
						"11010000" when "01100000",
						"11101111" when "01100001",
						"10101010" when "01100010",
						"11111011" when "01100011",
						"01000011" when "01100100",
						"01001101" when "01100101",
						"00110011" when "01100110",
						"10000101" when "01100111",
						"01000101" when "01101000",
						"11111001" when "01101001",
						"00000010" when "01101010",
						"01111111" when "01101011",
						"01010000" when "01101100",
						"00111100" when "01101101",
						"10011111" when "01101110",
						"10101000" when "01101111",
						"01010001" when "01110000",
						"10100011" when "01110001",
						"01000000" when "01110010",
						"10001111" when "01110011",
						"10010010" when "01110100",
						"10011101" when "01110101",
						"00111000" when "01110110",
						"11110101" when "01110111",
						"10111100" when "01111000",
						"10110110" when "01111001",
						"11011010" when "01111010",
						"00100001" when "01111011",
						"00010000" when "01111100",
						"11111111" when "01111101",
						"11110011" when "01111110",
						"11010010" when "01111111",
						"11001101" when "10000000",
						"00001100" when "10000001",
						"00010011" when "10000010",
						"11101100" when "10000011",
						"01011111" when "10000100",
						"10010111" when "10000101",
						"01000100" when "10000110",
						"00010111" when "10000111",
						"11000100" when "10001000",
						"10100111" when "10001001",
						"01111110" when "10001010",
						"00111101" when "10001011",
						"01100100" when "10001100",
						"01011101" when "10001101",
						"00011001" when "10001110",
						"01110011" when "10001111",
						"01100000" when "10010000",
						"10000001" when "10010001",
						"01001111" when "10010010",
						"11011100" when "10010011",
						"00100010" when "10010100",
						"00101010" when "10010101",
						"10010000" when "10010110",
						"10001000" when "10010111",
						"01000110" when "10011000",
						"11101110" when "10011001",
						"10111000" when "10011010",
						"00010100" when "10011011",
						"11011110" when "10011100",
						"01011110" when "10011101",
						"00001011" when "10011110",
						"11011011" when "10011111",
						"11100000" when "10100000",
						"00110010" when "10100001",
						"00111010" when "10100010",
						"00001010" when "10100011",
						"01001001" when "10100100",
						"00000110" when "10100101",
						"00100100" when "10100110",
						"01011100" when "10100111",
						"11000010" when "10101000",
						"11010011" when "10101001",
						"10101100" when "10101010",
						"01100010" when "10101011",
						"10010001" when "10101100",
						"10010101" when "10101101",
						"11100100" when "10101110",
						"01111001" when "10101111",
						"11100111" when "10110000",
						"11001000" when "10110001",
						"00110111" when "10110010",
						"01101101" when "10110011",
						"10001101" when "10110100",
						"11010101" when "10110101",
						"01001110" when "10110110",
						"10101001" when "10110111",
						"01101100" when "10111000",
						"01010110" when "10111001",
						"11110100" when "10111010",
						"11101010" when "10111011",
						"01100101" when "10111100",
						"01111010" when "10111101",
						"10101110" when "10111110",
						"00001000" when "10111111",
						"10111010" when "11000000",
						"01111000" when "11000001",
						"00100101" when "11000010",
						"00101110" when "11000011",
						"00011100" when "11000100",
						"10100110" when "11000101",
						"10110100" when "11000110",
						"11000110" when "11000111",
						"11101000" when "11001000",
						"11011101" when "11001001",
						"01110100" when "11001010",
						"00011111" when "11001011",
						"01001011" when "11001100",
						"10111101" when "11001101",
						"10001011" when "11001110",
						"10001010" when "11001111",
						"01110000" when "11010000",
						"00111110" when "11010001",
						"10110101" when "11010010",
						"01100110" when "11010011",
						"01001000" when "11010100",
						"00000011" when "11010101",
						"11110110" when "11010110",
						"00001110" when "11010111",
						"01100001" when "11011000",
						"00110101" when "11011001",
						"01010111" when "11011010",
						"10111001" when "11011011",
						"10000110" when "11011100",
						"11000001" when "11011101",
						"00011101" when "11011110",
						"10011110" when "11011111",
						"11100001" when "11100000",
						"11111000" when "11100001",
						"10011000" when "11100010",
						"00010001" when "11100011",
						"01101001" when "11100100",
						"11011001" when "11100101",
						"10001110" when "11100110",
						"10010100" when "11100111",
						"10011011" when "11101000",
						"00011110" when "11101001",
						"10000111" when "11101010",
						"11101001" when "11101011",
						"11001110" when "11101100",
						"01010101" when "11101101",
						"00101000" when "11101110",
						"11011111" when "11101111",
						"10001100" when "11110000",
						"10100001" when "11110001",
						"10001001" when "11110010",
						"00001101" when "11110011",
						"10111111" when "11110100",
						"11100110" when "11110101",
						"01000010" when "11110110",
						"01101000" when "11110111",
						"01000001" when "11111000",
						"10011001" when "11111001",
						"00101101" when "11111010",
						"00001111" when "11111011",
						"10110000" when "11111100",
						"01010100" when "11111101",
						"10111011" when "11111110",
						"00010110" when "11111111",
						UNAFFECTED when others;
end;


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


library ieee;				 
use ieee.std_logic_1164.all;


entity mix_columns is 
	port(in_block : in std_logic_vector(0 to 127);
		 mixed_block : out std_logic_vector(0 to 127));
end mix_columns;



architecture arc of mix_columns is 
	signal mult_by2, mult_by3 : std_logic_vector(0 to 127);
	begin 
		process(in_block)
			variable shift_2 : std_logic_vector(0 to 8);
			begin
				for i in 0 to 15 loop
					shift_2 := in_block(i * 8 to i * 8 + 7) & '0';
					if(shift_2(0) = '0') then
						mult_by2(i * 8 to i * 8 + 7) <= shift_2(1 to 8);
					else mult_by2(i * 8 to i * 8 + 7) <= shift_2(1 to 8) xor "00011011";
					end if;
				end loop;
		end process;
		
		
		process(in_block)
			variable shift_3 : std_logic_vector(0 to 8);
			begin
				for i in 0 to 15 loop
					shift_3 := (in_block(i * 8 to i * 8 + 7) & '0') xor ('0' & in_block(i * 8 to i * 8 + 7));
					if(shift_3(0) = '0') then
						mult_by3(i * 8 to i * 8 + 7) <= shift_3(1 to 8);
					else mult_by3(i * 8 to i * 8 + 7) <= shift_3(1 to 8) xor "00011011";
					end if;
				end loop;
		end process;
		
			
			
		mixed_block(0 to 31) <= (mult_by2(0 to 7) xor mult_by3(8 to 15) xor in_block(16 to 23) xor in_block(24 to 31)) & (in_block(0 to 7) xor mult_by2(8 to 15) xor mult_by3(16 to 23) xor in_block(24 to 31)) & (in_block(0 to 7) xor in_block(8 to 15) xor mult_by2(16 to 23) xor mult_by3(24 to 31)) & (mult_by3(0 to 7) xor in_block(8 to 15) xor in_block(16 to 23) xor mult_by2(24 to 31));
		
		mixed_block(32 to 63) <= (mult_by2(32 to 39) xor mult_by3(40 to 47) xor in_block(48 to 55) xor in_block(56 to 63)) & (in_block(32 to 39) xor mult_by2(40 to 47) xor mult_by3(48 to 55) xor in_block(56 to 63)) & (in_block(32 to 39) xor in_block(40 to 47) xor mult_by2(48 to 55) xor mult_by3(56 to 63)) & (mult_by3(32 to 39) xor in_block(40 to 47) xor in_block(48 to 55) xor mult_by2(56 to 63));
		
		mixed_block(64 to 95) <= (mult_by2(64 to 71) xor mult_by3(72 to 79) xor in_block(80 to 87) xor in_block(88 to 95)) & (in_block(64 to 71) xor mult_by2(72 to 79) xor mult_by3(80 to 87) xor in_block(88 to 95)) & (in_block(64 to 71) xor in_block(72 to 79) xor mult_by2(80 to 87) xor mult_by3(88 to 95)) & (mult_by3(64 to 71) xor in_block(72 to 79) xor in_block(80 to 87) xor mult_by2(88 to 95));
		
		mixed_block(96 to 127) <= (mult_by2(96 to 103) xor mult_by3(104 to 111) xor in_block(112 to 119) xor in_block(120 to 127)) & (in_block(96 to 103) xor mult_by2(104 to 111) xor mult_by3(112 to 119) xor in_block(120 to 127)) & (in_block(96 to 103) xor in_block(104 to 111) xor mult_by2(112 to 119) xor mult_by3(120 to 127)) & (mult_by3(96 to 103) xor in_block(104 to 111) xor in_block(112 to 119) xor mult_by2(120 to 127));
end;	
		
		

--------------------------------------------------------------------
------
-- THE ADVANCED ENCRYPTION STANDARD'S ROUND FUNTCTION : 
	-- TODO :
		-- ==THIS IMPLEMENTATION IS HEAVILY RELIED ON LARGE LUTs FOR SUBSTITUTION BOXES 
		-- ==AN ALTERNATIVE COMPUTATION BASED SBOX IS TO PRESENTED LATER TO REDUCE PROPAGATION DELAYS
	
-- ROUND FUNCTION COMPONENT :
	-- SBOX (ABOVE)
	-- MIXCOLS (ABOVE)
------
--------------------------------------------------------------------

		

library ieee;
use ieee.std_logic_1164.all;


entity aes_round is 
	port(in_block : in std_logic_vector(0 to 127);
		 round_key : in std_logic_vector(0 to 127);
		 last_round, ena : in std_logic;
		 out_block : out std_logic_vector(0 to 127));
end aes_round;


architecture beh of aes_round is 
	type router_type is array(0 to 15) of integer range 0 to 120;
	constant router : router_type := (0, 104, 80, 56, 32, 8, 112, 88, 64, 40, 16, 120, 96, 72, 48, 24);
	signal subbed_block, mixed_block, rounded : std_logic_vector(0 to 127);
	
	component sbox_lut is port(in_byte : in std_logic_vector(0 to 7);
		 out_byte : out std_logic_vector(0 to 7));
	end component;
	component mix_columns is port(in_block : in std_logic_vector(0 to 127); 
		 mixed_block : out std_logic_vector(0 to 127));
	end component;
	
	begin 
		---SUBBYTES AND SHIFTROWS STEPS
		gen_0 : for i in 0 to 15 generate 
			sbox_inst : sbox_lut port map(in_block(i * 8 to i * 8 + 7), subbed_block(router(i) to router(i) + 7));
		end generate;
		
		
		---MIXCOLUMNS STEP (EXCEPT FOR THE LAST ROUND)
		mix : mix_columns port map(subbed_block, mixed_block);
		
		
		---ADD ROUNDKEY STEP
		rounded <= (mixed_block xor round_key) when last_round = '0' else (subbed_block xor round_key);
		
		out_block <= rounded when ena = '1' else in_block;
end beh;


--------------------------------------------------------------------
------
-- THE ADVANCED ENCRYPTION STANDARD'S KEY EXPANSION : 
	-- TODO :
		-- ==THIS IMPLEMENTATION IS HEAVILY RELIED ON LARGE LUTs FOR SUBSTITUTION BOXES 
		-- ==AN ALTERNATIVE COMPUTATION BASED SBOX IS TO PRESENTED LATER TO REDUCE PROPAGATION DELAYS
------
--------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;


entity key_sch is 
	port(key_in : in std_logic_vector(0 to 127);
		 round_const : in std_logic_vector(0 to 31);
		 key_sel : in std_logic;
		 key_out : out std_logic_vector(0 to 127));
end key_sch;



architecture arc of key_sch is 	
	component sbox_lut is port(in_byte : in std_logic_vector(0 to 7);
		 out_byte : out std_logic_vector(0 to 7));
	end component;
	
	signal subbed_0, shifted_0, tmp_sig : std_logic_vector(0 to 31);
	begin 
		---SHIFT THE FIRST WORD TO THE LEFT (<<< 1)
		shifted_0 <= key_in(104 to 127) & key_in(96 to 103);
		
		
		---SUBBYTES OF THE FIRST WORD 
		gen_00 : for i in 0 to 3 generate 
			s : sbox_lut port map(shifted_0(i * 8 to i * 8 + 7), subbed_0(i * 8 to i * 8 + 7));
		end generate;
		
		
		---XOR THE FIRST WORD WITH ROUND CONSTANT 
		tmp_sig <= (subbed_0 xor round_const xor key_in(0 to 31));
		
		
		---COMBINE THE FIRST WORD WITH THE REMAINING WORDS 
		key_out <= tmp_sig & (tmp_sig xor key_in(32 to 63)) & (tmp_sig xor key_in(32 to 63) xor key_in(64 to 95)) & (tmp_sig xor key_in(32 to 63) xor key_in(64 to 95) xor key_in(96 to 127)) when key_sel = '0' else key_in; 
end;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;


entity datapath_reg is 
	port(clk : in std_logic;
		 data : in std_logic_vector(0 to 127);
		 dout : out std_logic_vector(0 to 127));
end;


architecture arc of datapath_reg is 
	begin 
		process(clk)
			begin 
				if(clk'event and clk = '1') then 
					dout <= data;
				end if;
		end process;
end;



library ieee;
use ieee.std_logic_1164.all;


entity dataout_reg is 
	port(clk : in std_logic;
		 data : in std_logic_vector(0 to 127);
		 dout : out std_logic_vector(0 to 127));
end;


architecture arc of dataout_reg is 
	begin 
		process(clk)
			begin 
				if(clk'event and clk = '0') then 
					dout <= data;
				end if;
		end process;
end;






library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity aes_ram is 
	port(key : in std_logic_vector(0 to 127);
		 clk, reset : in std_logic;
		 data_out, block_in : out std_logic_vector(0 to 127));
end aes_ram;


architecture arc of aes_ram is 
	type memory is array(0 to 1) of std_logic_vector(0 to 127);
	signal myram : memory := (0 => (others => '1'), 
							  others => (others => '0'));
	attribute ram_init_file : string;
	attribute ram_init_file of myram : signal is "ram_contents.mif";


	constant nonce : std_logic_vector(0 to 95) := (others => '1');
	signal counter : unsigned(0 to 31);
	
	type state is (init, round1, round2, round3, round4, round5, round6, round7, round8, round9, round10, increment, write_data);
	signal pr_state, next_state : state;

	signal din, kin, tmp_sig, reg_out, tmp_round_key, key_reg_out, tmp_ram, tmp_ram_2 : std_logic_vector(0 to 127);
	signal round_const : std_logic_vector(0 to 31);
	signal mux_in, last_round, key_sel, ena, encr : std_logic;
	
	component aes_round is port(in_block : in std_logic_vector(0 to 127); round_key : in std_logic_vector(0 to 127); last_round, ena : in std_logic; out_block : out std_logic_vector(0 to 127));
	end component;
	
	component datapath_reg is port(clk : in std_logic; data : in std_logic_vector(0 to 127); dout : out std_logic_vector(0 to 127));
	end component;
	
	component dataout_reg is port(clk : in std_logic; data : in std_logic_vector(0 to 127); dout : out std_logic_vector(0 to 127));
	end component;
	
	component key_sch is port(key_in : in std_logic_vector(0 to 127); round_const : in std_logic_vector(0 to 31); key_sel : in std_logic; key_out : out std_logic_vector(0 to 127));
	end component;


	begin
		---FSM CONTROL UNIT
		process(reset, clk)
			begin 
				if(reset = '1') then 
					pr_state <= init;
				elsif(clk'event and clk = '1') then 
					pr_state <= next_state;
				end if;
		end process;
		
		
		process(pr_state, key)
			begin 
				case pr_state is 
					when init => 
						mux_in <= '0';
						last_round <= 'X';
						key_sel <= '1';
						round_const <= (others => 'X');
						ena <= '0';
						encr <= '0';
						next_state <= round1;
					when round1 =>
						mux_in <= '1';
						last_round <= '0';
						key_sel <= '0';
						encr <= '0';
						round_const <= "00000001000000000000000000000000";
						ena <= '1';
						next_state <= round2;
					when round2 => 
						mux_in <= '1';
						last_round <= '0';
						key_sel <= '0';
						round_const <= "00000010000000000000000000000000";
						ena <= '1';
						encr <= '0';
						next_state <= round3;
					when round3 =>
						mux_in <= '1';
						last_round <= '0';
						key_sel <= '0';
						round_const <= "00000100000000000000000000000000";
						ena <= '1';
						encr <= '0';
						next_state <= round4;
					when round4 =>
						mux_in <= '1';
						last_round <= '0';
						key_sel <= '0';
						round_const <= "00001000000000000000000000000000";
						ena <= '1';
						encr <= '0';
						next_state <= round5;
					when round5 =>
						mux_in <= '1';
						last_round <= '0';
						key_sel <= '0';
						round_const <= "00010000000000000000000000000000";
						ena <= '1';
						encr <= '0';
						next_state <= round6;
					when round6 =>
						mux_in <= '1';
						last_round <= '0';
						key_sel <= '0';
						round_const <= "00100000000000000000000000000000";
						ena <= '1';
						encr <= '0';
						next_state <= round7;
					when round7 =>
						mux_in <= '1';
						last_round <= '0';
						key_sel <= '0';
						round_const <= "01000000000000000000000000000000";
						ena <= '1';
						encr <= '0';
						next_state <= round8;
					when round8 =>
						mux_in <= '1';
						last_round <= '0';
						key_sel <= '0';
						encr <= '0';
						round_const <= "10000000000000000000000000000000";
						ena <= '1';
						encr <= '0';
						next_state <= round9;
					when round9 =>
						mux_in <= '1';
						last_round <= '0';
						key_sel <= '0';
						round_const <= "00011011000000000000000000000000";
						ena <= '1';
						encr <= '0';
						next_state <= round10;
					when round10 =>						
						mux_in <= '1';
						last_round <= '1';
						key_sel <= '0';
						round_const <= "00110110000000000000000000000000";
						ena <= '1';
						encr <= '0';
						next_state <= write_data;
					when write_data => 
						mux_in <= '0';
						last_round <= 'X';
						key_sel <= '0';
						round_const <= (others => 'X');
						ena <= '0';
						encr <= '0';
						next_state <= increment;
					when increment => 
						mux_in <= '1';
						last_round <= 'X';
						key_sel <= '0';
						round_const <= (others => 'X');
						ena <= '0';
						encr <= '1';
						next_state <= init;
				end case;
		end process;
		
		
		
		process(clk, reset)
			begin 
				if(reset = '1') then 
					counter <= (others => '0');
				elsif(clk'event and clk = '1') then
					if(encr = '1') then 
						if(counter = 1) then 
							counter <= (others => '0');
						else counter <= counter + 1;
						end if;
					end if;
				end if;
		end process;
		
		
		
		---NON PIPELINED AES DATAPATH 
		din <= ((nonce & std_logic_vector(counter)) xor key) when (mux_in = '0') else reg_out;
		kin <= key when(mux_in = '0') else key_reg_out;
				
		sch_0 : key_sch port map(kin, round_const, key_sel, tmp_round_key);
		reg_0 : datapath_reg port map(clk, tmp_round_key, key_reg_out);
		
		r_0 : aes_round port map(din, tmp_round_key, last_round, ena, tmp_sig);
		reg_1 : datapath_reg port map(clk, tmp_sig, reg_out);
						
		tmp_ram <= (reg_out xor myram(to_integer(counter))) when(mux_in = '0') else (others => 'Z');
		reg_2 : dataout_reg port map(clk, tmp_ram, tmp_ram_2);
		
		data_out <= myram(to_integer(counter));
		block_in <= din when(mux_in = '0') else (others => 'Z');
		

		process(clk)
			begin
				if(clk'event and clk = '1') then 
					if(pr_state = write_data) then 
						myram(to_integer(counter)) <= tmp_ram_2;
					end if;
				end if;
		end process;
end;