library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity loop_unrolled_ctr is 
	port(in_block : in std_logic_vector(0 to 127);
		 clk, key_on : in std_logic;
		 data_out : out std_logic_vector(0 to 127));
end loop_unrolled_ctr;


architecture arc of loop_unrolled_ctr is 
	constant nonce : std_logic_vector(0 to 95) := (others => '1');
	signal counter : unsigned(0 to 31);
	
	type state is (init, round1, round2, round3, round4, round5, round6, round7, round8, round9, round10, increment);
	signal pr_state, next_state : state;

	signal din, kin, tmp_sig, reg_out, tmp_round_key, key_reg_out, key : std_logic_vector(0 to 127);
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
		process(clk)
			begin 
				if(clk'event and clk = '1') then 
					pr_state <= next_state;
				end if;
		end process;
		
		
		
		process(pr_state)
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
						next_state <= increment;
					when increment => 
						mux_in <= '0';
						last_round <= 'X';
						key_sel <= '0';
						round_const <= (others => 'X');
						ena <= '0';
						encr <= '1';
						next_state <= init;
				end case;
		end process;
		
		
		process(clk)
			begin 
				if(clk'event and clk = '1') then 
					if(key_on = '1') then 
						key <= in_block;
					end if;
				end if;
		end process;
		
						
		
		process(clk)
			begin 
				if(clk'event and clk = '1') then
					if(encr = '1') then 
						if(counter = x"FFFFFFFF") then 
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
		reg_0 : datapath_reg port map(clk, tmp_round_key, key_reg_out);
		
		
		r_0 : aes_round port map(din, tmp_round_key, last_round, ena, tmp_sig);
		reg_1 : datapath_reg port map(clk, tmp_sig, reg_out);
		
		
		data_out <= (reg_out xor in_block) when(mux_in = '0' and key_on = '0') else (others => 'Z');
		reg_2 : dataout_reg port map(clk, reg_out, data_out);


end;