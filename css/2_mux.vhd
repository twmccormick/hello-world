-- ECE 4120 - 2-to-1 Discrete Multiplexer
-- Tyler McCormick 
--
-- 2-to-1 Mux 

library IEEE;
use IEEE.STD_Logic_1164.ALL;

-- Inputs and outputs
entity dis_2_mux is 

port(

-- 1-bit control input (good for 2^1 inputs)
    CON : in STD_LOGIC;
	
-- 2 32-bit inputs 
    ID00, ID01: in STD_LOGIC_VECTOR(11 DOWNTO 0);

-- 1 32-bit output    
    RD_DATA : out STD_LOGIC_VECTOR(11 DOWNTO 0)
	
);

end dis_2_mux;

architecture mux of dis_2_mux is

-- Temp signal to hold the control vector, which will be used later
	signal inputs : STD_LOGIC;

begin

-- Assign the control vector to the temp signal 'inputs'
       inputs <= CON;
	   
-- This code: checks the temp signal 'inputs' and sends a different input to the output depending on the value of the 
-- control vector input 	
		with inputs SELECT
              
			RD_DATA <=  ID00 when '0', 
						ID01 when '1', 
-- If the input doesn't match one of the two possibilities, it's probably an error, so this prevents 
-- weird signals from passing through the circuit
						"000000000000"  when OTHERS;
              
end architecture mux; 
