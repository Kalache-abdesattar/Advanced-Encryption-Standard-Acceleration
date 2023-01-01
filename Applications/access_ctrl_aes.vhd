library ieee;
use ieee.std_logic_1164.all;



entity ssd is 
		port(res_0 : in std_logic_vector(3 downto 0);
			 hex : out std_logic_vector(6 downto 0));
end;


architecture ar of ssd is 
	begin
		process(res_0)
			begin 
				case res_0 is
					when "0000" => hex <= not "0111111";
					when "0001" => hex <= not "0000110";
					when "0010" => hex <= not "1011011";
					when "0011" => hex <= not "1001111";
					when "0100" => hex <= not "1100110";
					when "0101" => hex <= not "1101101";
					when "0110" => hex <= not "1111101";
					when "0111" => hex <= not "0000111";
					when "1000" => hex <= not "1111111";
					when "1001" => hex <= not "1101111";
					when "1010" => hex <= not "1110111";
					when "1011" => hex <= not "1111100";
					when "1100" => hex <= not "0111001";
					when "1101" => hex <= not "1011110";
					when "1110" => hex <= not "1111001";
					when "1111" => hex <= not "1110001";
					when others => hex <= not "0000000";
				end case;
		end process;
end;






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
-- THE ADVANCED ENCRYPTION STANDARD'S ROUND FUNCTION : 
	-- TODO :
		-- ==THIS IMPLEMENTATION IS HEAVILY RELIED ON LARGE LUTs FOR SUBSTITUTION BOXES 
		-- ==AN ALTERNATIVE COMPUTATION BASED SBOX IS TO BE PRESENTED LATER TO REDUCE PROPAGATION DELAYS
	
-- ROUND FUNCTION MAIN COMPONENTS :
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



entity flicker is 
	port(reset, clk, ctr, slow : in std_logic;
		 led, ctr_led : out std_logic);
end;




architecture arc of flicker is 
	signal slow_clk : std_logic;
	signal thress : integer range 0 to 50_000_000 := 100000;
	begin 
		process(ctr, reset)
			begin 
				if(reset = '1') then 
					thress <= 1000000;
				elsif(ctr'event and ctr = '1') then 
					if(slow = '1') then 
						thress <= thress + 200000;
					else thress <= thress - 200000;
					end if;
				end if;
		end process;
		
		
		process(clk, reset)
			variable counter : integer range 0 to 100_000_000;
			begin 
				if(reset = '1') then 
					counter := 0;
				elsif(clk'event and clk = '1') then 
					if(counter > thress) then 
						counter := 0;
						slow_clk <= not slow_clk;
					else counter := counter + 1;
					end if;
				end if;
		end process;
		
		
		led <= slow_clk;
		ctr_led <= ctr;
end;



library ieee;
use ieee.std_logic_1164.all;



entity ps2_access is 
	generic(deb_cycles : integer := 200;
			idle_cycles : integer := 3000);
	port(clk, reset : in std_logic;
		 ps2clk, din : in bit;
		 access_on : out std_logic);
end ps2_access;



architecture arc of ps2_access is 
	signal data_reg, data, DATA_TMP : bit_vector(10 downto 0);
	signal deb_ps2clk, deb_ps2data, idle : bit;
	type state is (init, A, B, D, O);
	TYPE STATE_W IS (STANDBY, GETKEY, HALT);
	signal pr_state, next_state : state;
	SIGNAL PR_STATE_W, NEXT_STATE_W : STATE_W;
	SIGNAL ENA : STD_LOGIC;
	
	signal lcd_encode : bit_vector(7 downto 0);
	
	begin
		process(clk) 
			variable counter : integer range 0 to deb_cycles;
			begin 
				if(clk'event and clk = '1') then 
					if(deb_ps2clk = ps2clk) then 
						counter := 0;
					else 
						counter := counter + 1;
						if(counter = deb_cycles) then
							deb_ps2clk <= ps2clk;
							counter := 0;
						end if;
					end if;
				end if;
		end process;
		

		process(clk)
			variable counter : integer range 0 to deb_cycles;
			begin 
				if(clk'event and clk = '1') then 
					if(deb_ps2data = din) then 
						counter := 0;
					else 
						counter := counter + 1;
						if(counter = deb_cycles) then
							deb_ps2data <= din;
							counter := 0;
						end if;
					end if;
				end if;
		end process;
				
				
	PROCESS (clk)
		VARIABLE count: INTEGER RANGE 0 TO idle_cycles;
			BEGIN
				IF (clk'EVENT AND clk='0') THEN
					IF (deb_ps2data='0') THEN
						idle <= '0';
						count := 0;
					ELSIF (deb_ps2clk='1') THEN
						count := count + 1;
						IF (count=idle_cycles) THEN
							idle <= '1';
						END IF;
					ELSE
						count := 0;
					END IF;
				END IF;
	END PROCESS;
						
						
		process(deb_ps2clk)
			variable i : integer range 0 to 15;
			begin 
				if(deb_ps2clk'event and deb_ps2clk = '0') then 
					if(idle = '1') then 
						i := 0;
					else
						data_reg(i) <= deb_ps2data;
						i := i + 1;
						if(i = 11) then
							data <= data_reg;
							i := 0;
						end if;
					end if;
				end if;
		end process;
				
				
		
		PROCESS(DATA, PR_STATE_W, ENA) 
			BEGIN 
				CASE PR_STATE_W IS 
					WHEN HALT =>
						IF(data(8 downto 1) = "11110000") THEN	
							ENA <= '0'; 
							NEXT_STATE_W <= STANDBY;
						ELSE 
							ENA <= '0';
							NEXT_STATE_W <= HALT;
						END IF;
					WHEN STANDBY =>
						IF(data(8 downto 1) = "11110000") THEN 
							ENA <= '0';
							NEXT_STATE_W <= STANDBY;
						ELSE 
							ENA <= '0';
							NEXT_STATE_W <= GETKEY;
						END IF;
					WHEN GETKEY =>
						ENA <= '1';
						NEXT_STATE_W <= HALT;
				END CASE;
		END PROCESS;
		
		
		DATA_TMP <= data when(ena = '1') else (others => '1');		
		
	
		process(clk, reset)
			begin 
				if(reset = '1') then 
					pr_state <= init;
					PR_STATE_W <= HALT;
				elsif(clk'event and clk = '1') then 
					pr_state <= next_state;
					PR_STATE_W <= NEXT_STATE_W;
				end if;
		end process;
		
		
		process(pr_state, data_TMP)
			begin
				case pr_state is
					when init =>
						if(data_TMP(8 downto 1) = "00010101") then 
							access_on <= '0';
							next_state <= A;
						else 
							access_on <= '0';
							next_state <= init;
						end if;
					when A =>
						if(data_TMP(8 downto 1) = "00110010") then 
							access_on <= '0';
							next_state <= B;
						elsif(data_TMP(8 downto 1) = "11111111") then
							access_on <= '0';
							next_state <= A;
						else 
							access_on <= '0';
							next_state <= init;
						end if;
					when B =>
						if(data_TMP(8 downto 1) = "00100011") then 
							access_on <= '0';
							next_state <= D;
						elsif(data_TMP(8 downto 1) = "11111111") then
							access_on <= '0';
							next_state <= B;
						else 
							access_on <= '0';
							next_state <= init;
						end if;
					when D =>
						if(data_TMP(8 downto 1) = "01000100") then 
							access_on <= '0';
							next_state <= O;
						elsif(data_TMP(8 downto 1) = "11111111") then
							access_on <= '0';
							next_state <= D;
						else 
							access_on <= '0';
							next_state <= init;
						end if;
					when O =>
						if(data_TMP(8 downto 1) = "11111111") then
							access_on <= '1';
							next_state <= O;
						else 
							access_on <= '1';
							next_state <= init;
						end if;
				end case;
		end process;		
end;




library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity access_ctrl_aes is 
	port(clk, reset, push, ctr : in std_logic;
		 input : in std_logic_vector(0 to 15);
		 f : out std_logic_vector(0 to 3);
		 ctr_led : out std_logic; 
		 hex_0, hex_1, hex_2, hex_3, hex_4, hex_5, hex_6, hex_7 : out std_logic_vector(6 downto 0);
		 ps2clk, ps2in : in bit;
		 outp : buffer std_logic_vector(0 to 31));
end access_ctrl_aes;


architecture arc of access_ctrl_aes is 
	constant nonce : std_logic_vector(0 to 95) := (others => '1');
	signal counter : unsigned(0 to 31);
	constant in_block : std_logic_vector(0 to 127) := (others => '0');
	
	type state is (halt, get_key_0, get_key_1, get_key_2, get_key_3, get_key_4, get_key_5, get_key_6, get_key_7, done, init, round1, round2, round3, round4, round5, round6, round7, round8, round9, round10, increment);
	signal pr_state, next_state : state;

	signal din, kin, tmp_sig, reg_out, tmp_round_key, key_reg_out, key : std_logic_vector(0 to 127);
	signal round_const : std_logic_vector(0 to 31);
	signal mux_in, last_round, key_sel, ena, encr, slow_clk : std_logic;
	
	component ssd is port(res_0 : in std_logic_vector(3 downto 0);
			 hex : out std_logic_vector(6 downto 0));
	end component;

	component aes_round is port(in_block : in std_logic_vector(0 to 127); round_key : in std_logic_vector(0 to 127); last_round, ena : in std_logic; out_block : out std_logic_vector(0 to 127));
	end component;
	
	component datapath_reg is port(clk : in std_logic; data : in std_logic_vector(0 to 127); dout : out std_logic_vector(0 to 127));
	end component;
	
	component dataout_reg is port(clk : in std_logic; data : in std_logic_vector(0 to 127); dout : out std_logic_vector(0 to 127));
	end component;
	
	component key_sch is port(key_in : in std_logic_vector(0 to 127); round_const : in std_logic_vector(0 to 31); key_sel : in std_logic; key_out : out std_logic_vector(0 to 127));
	end component;
	
	component flicker is port(reset, clk, ctr, slow : in std_logic; led, ctr_led : out std_logic);
	end component;

	component ps2_access is generic(deb_cycles : integer := 200; idle_cycles : integer := 3000);
		port(clk, reset : in std_logic; ps2clk, din : in bit; access_on : out std_logic);
	end component;
	
	----------
	signal access_on, access_on_dff : std_logic;

	begin
		---PS/2 CONTROL
		PS : ps2_access generic map(200, 3000) port map(clk, reset, ps2clk, ps2in, access_on);

		ctr_led <= access_on;
		
		---FREQUENCY CONTROL
		freq : flicker port map(reset, clk, ctr, push, slow_clk, open);
	
	
		---FSM CONTROL UNIT
		process(reset, slow_clk)
			begin 
				if(reset = '1') then 
					pr_state <= halt;
				elsif(slow_clk'event and slow_clk = '1') then 
					pr_state <= next_state;
				end if;
		end process;
		
		
		process(pr_state, push)
			begin 
				case pr_state is  
					when halt =>
						f <= "0000";
						mux_in <= '0';
						last_round <= 'X';
						key_sel <= '0';
						round_const <= (others => 'X');
						ena <= '0';
						encr <= '1';
						if(push = '0') then
							next_state <= get_key_0;
						else next_state <= halt;
						end if;
						
					when get_key_0 => 
						f <= "0001";
						mux_in <= '0';
						last_round <= 'X';
						key_sel <= '0';
						round_const <= (others => 'X');
						ena <= '0';
						encr <= '1';
						if(push = '1') then
							next_state <= get_key_1;
						else
							next_state <= get_key_0;
						end if;
						
					when get_key_1 => 
						f <= "0010";
						mux_in <= '0';
						last_round <= 'X';
						key_sel <= '0';
						round_const <= (others => 'X');
						ena <= '0';
						encr <= '1';
						if(push = '0') then
							next_state <= get_key_2;
						else 
							next_state <= get_key_1;
						end if;
						
					when get_key_2 =>
						f <= "0011";
						mux_in <= '0';
						last_round <= 'X';
						key_sel <= '0';
						round_const <= (others => 'X');
						ena <= '0';
						encr <= '1';
						if(push = '1') then 
							next_state <= get_key_3;
						else 
							next_state <= get_key_2;
						end if;
						
					when get_key_3 => 
						f <= "0100";
						mux_in <= '0';
						last_round <= 'X';
						key_sel <= '0';
						round_const <= (others => 'X');
						ena <= '0';
						encr <= '1';
						if(push = '0') then
							next_state <= get_key_4;
						else 
							next_state <= get_key_3;
						end if;
						
					when get_key_4 => 
						f <= "0101";
						mux_in <= '0';
						last_round <= 'X';
						key_sel <= '0';
						round_const <= (others => 'X');
						ena <= '0';
						encr <= '1';
						if(push = '1') then
							next_state <= get_key_5;
						else 
							next_state <= get_key_4;
						end if;
						
					when get_key_5 =>
						f <= "0110";
						mux_in <= '0';
						last_round <= 'X';
						key_sel <= '0';
						round_const <= (others => 'X');
						ena <= '0';
						encr <= '1';
						if(push = '0') then
							next_state <= get_key_6;
						else 
							next_state <= get_key_5;
						end if;
						
					when get_key_6 => 
						f <= "0111";
						mux_in <= '0';
						last_round <= 'X';
						key_sel <= '0';
						round_const <= (others => 'X');
						ena <= '0';
						encr <= '1';
						if(push = '1') then
							next_state <= get_key_7;
						else 
							next_state <= get_key_6;
						end if;
						
					when get_key_7 => 
						f <= "1000";
						mux_in <= '0';
						last_round <= 'X';
						key_sel <= '0';
						round_const <= (others => 'X');
						ena <= '0';
						encr <= '1';
						if(push = '0') then 
							next_state <= done;
						else 
							next_state <= get_key_7;
						end if;
						
					when done => 
						mux_in <= '0';
						last_round <= 'X';
						key_sel <= '0';
						round_const <= (others => 'X');
						ena <= '0';
						encr <= '1';
						f <= "1001";
						next_state <= init;
	
	
					when init => 
						f <= "1111";
						mux_in <= '0';
						last_round <= 'X';
						key_sel <= '1';
						round_const <= (others => 'X');
						ena <= '0';
						encr <= '0';
						next_state <= round1;
						
					when round1 =>
						f <= "1111";
						mux_in <= '1';
						last_round <= '0';
						key_sel <= '0';
						encr <= '0';
						round_const <= "00000001000000000000000000000000";
						ena <= '1';
						next_state <= round2;
						
					when round2 => 
						f <= "1111";
						mux_in <= '1';
						last_round <= '0';
						key_sel <= '0';
						round_const <= "00000010000000000000000000000000";
						ena <= '1';
						encr <= '0';
						next_state <= round3;
						
					when round3 =>
						f <= "1111";
						mux_in <= '1';
						last_round <= '0';
						key_sel <= '0';
						round_const <= "00000100000000000000000000000000";
						ena <= '1';
						encr <= '0';
						next_state <= round4;
						
					when round4 =>
						f <= "1111";
						mux_in <= '1';
						last_round <= '0';
						key_sel <= '0';
						round_const <= "00001000000000000000000000000000";
						ena <= '1';
						encr <= '0';
						next_state <= round5;
						
					when round5 =>
						f <= "1111";
						mux_in <= '1';
						last_round <= '0';
						key_sel <= '0';
						round_const <= "00010000000000000000000000000000";
						ena <= '1';
						encr <= '0';
						next_state <= round6;
						
					when round6 =>
						f <= "1111";
						mux_in <= '1';
						last_round <= '0';
						key_sel <= '0';
						round_const <= "00100000000000000000000000000000";
						ena <= '1';
						encr <= '0';
						next_state <= round7;
						
					when round7 =>
						f <= "1111";
						mux_in <= '1';
						last_round <= '0';
						key_sel <= '0';
						round_const <= "01000000000000000000000000000000";
						ena <= '1';
						encr <= '0';
						next_state <= round8;
						
					when round8 =>
						f <= "1111";
						mux_in <= '1';
						last_round <= '0';
						key_sel <= '0';
						encr <= '0';
						round_const <= "10000000000000000000000000000000";
						ena <= '1';
						encr <= '0';
						next_state <= round9;
						
					when round9 =>
						f <= "1111";
						mux_in <= '1';
						last_round <= '0';
						key_sel <= '0';
						round_const <= "00011011000000000000000000000000";
						ena <= '1';
						encr <= '0';
						next_state <= round10;
						
					when round10 =>	
						f <= "1111";
						mux_in <= '1';
						last_round <= '1';
						key_sel <= '0';
						round_const <= "00110110000000000000000000000000";
						ena <= '1';
						encr <= '0';
						next_state <= increment;
						
					when increment => 
						f <= "1111";
						mux_in <= '0';
						last_round <= 'X';
						key_sel <= '0';
						round_const <= (others => 'X');
						ena <= '0';
						encr <= '1';
						next_state <= init;
				end case;
		end process;
		
		
		process(slow_clk)
			begin 
				if(slow_clk'event and slow_clk = '1') then 
					case pr_state is 
						when init =>
							key <= (others => '0');
						when get_key_0 => 
							key(0 to 15) <= input;
						when get_key_1 =>
							key(16 to 31) <= input;
						when get_key_2 =>
							key(32 to 47) <= input;
						when get_key_3 =>
							key(48 to 63) <= input;
						when get_key_4 =>
							key(64 to 79) <= input;
						when get_key_5 =>
							key(80 to 95) <= input;
						when get_key_6 =>
							key(96 to 111) <= input;
						when get_key_7 =>
							key(112 to 127) <= input;
						when others => 
							key <= key;
					end case;
				end if;
		end process;
		
		
		
		process(slow_clk, reset)
			begin 
				if(reset = '1') then 
					counter <= (others => '0');
				elsif(slow_clk'event and slow_clk = '1') then
					if(encr = '1') then 
						if(counter = "11111111111111111111111111111111") then 
							counter <= (others => '0');
						else 
							counter <= counter + 1;
						end if;
					end if;
				end if;
		end process;
		
		
		
		---NON PIPELINED AES DATAPATH 
		din <= ((nonce & std_logic_vector(counter)) xor key) when (mux_in = '0') else reg_out;
		kin <= key when mux_in = '0' else key_reg_out;
				
		sch_0 : key_sch port map(kin, round_const, key_sel, tmp_round_key);
		reg_0 : datapath_reg port map(slow_clk, tmp_round_key, key_reg_out);
		
		r_0 : aes_round port map(din, tmp_round_key, last_round, ena, tmp_sig);
		reg_1 : datapath_reg port map(slow_clk, tmp_sig, reg_out);
						
						
						
		process(slow_clk, reset)
			begin 
				if(reset = '1') then 
					outp <= (others => 'Z');
				elsif(slow_clk'event and slow_clk = '1') then 
					if(last_round = '1') then
						outp <= reg_out(0 to 31);
					end if;
				end if;
		end process;
			
		--reg_2 : dataout_reg port map(clk, reg_out, data_out);

		ssd_0 : ssd port map(outp(12 to 15), hex_0);
		ssd_1 : ssd port map(outp(8 to 11), hex_1);
		ssd_2 : ssd port map(outp(4 to 7), hex_2);
		ssd_3 : ssd port map(outp(0 to 3), hex_3);
		ssd_4 : ssd port map(outp(16 to 19), hex_4);
		ssd_5 : ssd port map(outp(20 to 23), hex_5);
		ssd_6 : ssd port map(outp(24 to 27), hex_6);
		ssd_7 : ssd port map(outp(28 to 31), hex_7);

end;



--------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------




	