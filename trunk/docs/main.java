class main {
	public static void main(String args[]) {
		PhaseGenerator p = new PhaseGenerator();
		
		p.setFrequency(1023, 4, 1);
		
		System.out.print(p);
	}	
}

class PhaseGenerator {
    double phase, phaseIncrement;
    
    PhaseGenerator() {
        phase = phaseIncrement = 0;
    }
    
    void setFrequency(int f_number, int block, int mult) {
        // This frequency formula is derived from the following equation:
        // f_number = baseFrequency * pow(2,19) / sampleRate / pow(2,block-1);        
        double baseFrequency = 
            f_number * Math.pow(2, block-1) * 49.7e3 / Math.pow(2,19);
        double operatorFrequency = baseFrequency*1;
        
        // phase goes from 0 to 1 at 
        // period = (1/frequency) seconds ->
        // Samples in each period is (1/frequency)*sampleRate =
        // = sampleRate/frequency ->
        // So the increment in each sample, to go from 0 to 1, is:
        // increment = (1-0) / samples in the period -> 
        // increment = 1 / (OPL3Data.sampleRate/operatorFrequency) ->
        phaseIncrement = operatorFrequency/49.7e3;
    }
    
    double getPhase(int vib) {
        if(vib==1) 
            // phaseIncrement = (operatorFrequency * vibrato) / sampleRate
        //    phase += phaseIncrement*OPL3Data.vibratoTable[OPL3.dvb][OPL3.vibratoIndex];
        //else 
            // phaseIncrement = operatorFrequency / sampleRate
            phase += phaseIncrement;
        phase %= 1;
        return phase;
    }
    
    void keyOn() {
        phase = 0;
    }
    
    @Override    
    public String toString() {
         return String.format("Operator frequency: %f Hz.\n", 49.7e3*phaseIncrement);
    }
    
}