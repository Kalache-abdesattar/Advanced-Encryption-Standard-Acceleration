library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



entity fully_pipelined_ctr is 
	port(clk, key_select, nonce_select, pipe_halt : in std_logic;
		  in_block : in std_logic_vector(0 to 127);
		  data_out : out std_logic_vector(0 to 127));
end fully_pipelined_ctr;




architecture arc of fully_pipelined_ctr is 
	---- CTR MODE SUTIES
	signal nonce : std_logic_vector(0 to 95) := (others => '1');
	signal counter : unsigned(0 to 31);
	
	---- KEY REGIRSTER (128bits)
	signal key : std_logic_vector(0 to 127) := (others => '0');
	
	------ ROUND PIPELINE'S REGISTERS
	signal din, reg_out_1, reg_out_2, reg_out_3, reg_out_4, reg_out_5, reg_out_6, reg_out_7, reg_out_8, reg_out_9, reg_out_10 : std_logic_vector(0 to 127);
	------ ROUNDS' OUTPUTS
	signal round_1_out, round_2_out, round_3_out, round_4_out, round_5_out, round_6_out, round_7_out, round_8_out, round_9_out, round_10_out : std_logic_vector(0 to 127);
	
	----- KEY-SCHEDULE'S OUTPUTS
	signal round_key_1, round_key_2, round_key_3, round_key_4, round_key_5, round_key_6, round_key_7, round_key_8, round_key_9, round_key_10 : std_logic_vector(0 to 127);
	------ KEY-SCHEDULE PIPELINE'S REGISTERS
	signal round_key_1_reg, round_key_2_reg, round_key_3_reg, round_key_4_reg, round_key_5_reg, round_key_6_reg, round_key_7_reg, round_key_8_reg, round_key_9_reg, round_key_10_reg : std_logic_vector(0 to 127);
	
	------ REGISTER COMPONENT (WITHOUT ASYNCHRONOUS RESET)
	component datapath_reg is port(clk : in std_logic; 
				data : in std_logic_vector(0 to 127); 
				dout : out std_logic_vector(0 to 127));
	end component;
	
	component dataout_reg is port(clk, ena : in std_logic; 
				data : in std_logic_vector(0 to 127); 
				dout : out std_logic_vector(0 to 127));
	end component;
	
	
										--=======AES'S TOP LEVEL COMPONENTS=========--
	--------------------------
	component aes_round is port(in_block : in std_logic_vector(0 to 127); 
				round_key : in std_logic_vector(0 to 127); 
				last_round : in std_logic; 
				out_block : out std_logic_vector(0 to 127));
	end component;
	
	
	component key_sch is port(key_in : in std_logic_vector(0 to 127); 
				round_const : in std_logic_vector(0 to 31); 
				key_out : out std_logic_vector(0 to 127));
	end component;
	----------------------------
	

	begin
		------- AES-CTR INPUT CONTROLLER 
		
		process(clk)
			begin 
				if(clk'event and clk = '1') then
					if(key_select = '0') then
						if(counter = "11111111111111111111111111111111") then 
							counter <= (others => '0');
						else 
							counter <= counter + 1;
						end if;
					end if;
				end if;
		end process;
		
		
		process(clk)
			begin 
				if(clk'event and clk = '1') then
					if(nonce_select = '1') then
						nonce <= in_block(0 to 95);
					end if;
				end if;
		end process;

		
		
		-------- KEY REGISTER CONTROLLER
		process(clk)
			begin 
				if(clk'event and clk = '1') then 
					if(key_select = '1') then
						key <= in_block; 
					end if;
				end if;
		end process;
		
		
		
								--==========KEY-SCHEDULE'S PIPELINE============--
		sch_1 : key_sch port map(key, "00000001000000000000000000000000", round_key_1);
		reg_1 : datapath_reg port map(clk, round_key_1, round_key_1_reg);
		
		sch_2 : key_sch port map(round_key_1_reg, "00000010000000000000000000000000", round_key_2);
		reg_2 : datapath_reg port map(clk, round_key_2, round_key_2_reg);
		
		sch_3 : key_sch port map(round_key_2_reg, "00000010000000000000000000000000", round_key_3);
		reg_3 : datapath_reg port map(clk, round_key_3, round_key_3_reg);
		
		sch_4 : key_sch port map(round_key_3_reg, "00001000000000000000000000000000", round_key_4);
		reg_4 : datapath_reg port map(clk, round_key_4, round_key_4_reg);
		
		sch_5 : key_sch port map(round_key_4_reg, "00010000000000000000000000000000", round_key_5);
		reg_5 : datapath_reg port map(clk, round_key_5, round_key_5_reg);
		
		sch_6 : key_sch port map(round_key_5_reg, "00100000000000000000000000000000", round_key_6);
		reg_6 : datapath_reg port map(clk, round_key_6, round_key_6_reg);
		
		sch_7 : key_sch port map(round_key_6_reg, "01000000000000000000000000000000", round_key_7);
		reg_7 : datapath_reg port map(clk, round_key_7, round_key_7_reg);
		
		sch_8 : key_sch port map(round_key_7_reg, "10000000000000000000000000000000", round_key_8);
		reg_8 : datapath_reg port map(clk, round_key_8, round_key_8_reg);
		
		sch_9 : key_sch port map(round_key_8_reg, "00011011000000000000000000000000", round_key_9);
		reg_9 : datapath_reg port map(clk, round_key_9, round_key_9_reg);
		
		sch_10 : key_sch port map(round_key_9_reg, "00110110000000000000000000000000", round_key_10);
		reg_10 : datapath_reg port map(clk, round_key_10, round_key_10_reg);
		
		
		
		
								--==========THE 10 ROUNDS' PIPELINE============--
		din <= (nonce & std_logic_vector(counter)) xor key;
		
		
		round_1 : aes_round port map(din, round_key_1_reg, '0', round_1_out);
		reg1 : dataout_reg port map(clk, pipe_halt, round_1_out, reg_out_1);
		
		round_2 : aes_round port map(reg_out_1, round_key_2_reg, '0', round_2_out);
		reg2 : dataout_reg port map(clk, pipe_halt, round_2_out, reg_out_2);
		
		round_3 : aes_round port map(reg_out_2, round_key_3_reg, '0', round_3_out);
		reg3 : dataout_reg port map(clk, pipe_halt, round_3_out, reg_out_3);
	
		round_4 : aes_round port map(reg_out_3, round_key_4_reg, '0', round_4_out);
		reg4 : dataout_reg port map(clk, pipe_halt, round_4_out, reg_out_4);
		
		round_5 : aes_round port map(reg_out_4, round_key_5_reg, '0', round_5_out);
		reg5 : dataout_reg port map(clk, pipe_halt, round_5_out, reg_out_5);
		
		round_6 : aes_round port map(reg_out_5, round_key_6_reg, '0', round_6_out);
		reg6 : dataout_reg port map(clk, pipe_halt, round_6_out, reg_out_6);
		
		round_7 : aes_round port map(reg_out_6, round_key_7_reg, '0', round_7_out);
		reg7 : dataout_reg port map(clk, pipe_halt, round_7_out, reg_out_7);
		
		round_8 : aes_round port map(reg_out_7, round_key_8_reg, '0', round_8_out);
		reg8 : dataout_reg port map(clk, pipe_halt, round_8_out, reg_out_8);
		
		round_9 : aes_round port map(reg_out_8, round_key_9_reg, '0', round_9_out);
		reg9 : dataout_reg port map(clk, pipe_halt, round_9_out, reg_out_9);
		
		round_10 : aes_round port map(reg_out_9, round_key_10_reg, '1', round_10_out);
		reg10 : dataout_reg port map(clk, pipe_halt, round_10_out, reg_out_10);
		
		
		------- OUTPUT PORT
		data_out <= (reg_out_10 xor in_block) when(pipe_halt = '0') else (others => 'Z');
		

end arc;
