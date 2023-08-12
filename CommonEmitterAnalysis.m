function[VB, VE, ICEQ, VC, VCEQ, re, rc, Zbase, Zin, Zout, Vin, Av, Vout, REop, MPP, Ibias, IS, PD, PL, PS, Efficiency, VCEcutoff, ICsaturation, ACcutoff, ACsaturation] = CommonEmitterAnalysis(VCC, Beta, RS, R1, R2, RE1, RE2, RC, RL, Zg, Vs, VA, Frequency, Duration)
% This function performs an analysis of a common emitter amplifier. 
% The code takes in the inputs which are the amplitude of the DC source (VCC). 
% The amplitude, impedance, frequency, and duration of the AC voltage source.
% The transistor characteristics including Beta gain and Early Voltage.
% The voltage divider resistances that bias the base. The swamped and
% unswamped emitter resistances. The resistance of the collector and the load.
%
% Inputs 
% * VCC          = Voltage at the Common Collector;
% * RS           = Series Resistance;
% * R1           = Voltage Divider Resistance connected to VCC;
% * R2           = Voltage Divider Resistance connected to Ground;
% * RE1          = Swamped Emitter Resistance;
% * RE2          = Emitter Resistance;
% * RC           = Collector Resistance;
% * RL           = Load Resistance;
% * Zg           = Impedance of the signal source;
% * Vs           = Amplitude of the signal source;
% * Frequency    = Frequency of the signal source;
% * Beta         = Ampification Factor;
% * VA           = Early Voltage of the Transistor;
%
% Outputs 
% * VB           = Voltage at the Base
% * VE           = Voltage at the Emitter
% * ICEQ         = Current at the Emitter/Collecture. Assumes IC = IE
% * VC           = Voltage at the Collector
% * VCEQ         = Voltage between the Collector and Emitter
% * ro           = Output Resistance due to the Early Effect
% * re           = Resistance of the Base-Emitter Junction
% * rc           = Resistance of Collector in parallel with Load
% * Zbase        = Input Impedance at the Base 
% * Zin          = Total Input Impedance
% * Zout         = Output Impedance
% * vin          = Input Signal 
% * Av           = Total Gain 
% * Vout         = Output Signal 
% * REop         = Optimum Emitter Resistance
% * MPP          = Maximum Output Swing/Max Peak-to-peak
% * Ibias        = Current through the Voltage Divider
% * Is           = Total Current from the Source
% * PD           = DC Input Power
% * PL           = AC Power at the Load
% * PS           = Total Power from the Source
% * Efficiency   = Efficiency of Circuit (%)
% * VCEcutoff    = Voltage at Cutoff 
% * ICsaturation = Saturation Current
% * ACcutoff     = AC Cutoff 
% * ACsaturation = AC Saturation

%% Common Emitter DC and AC Analysis
%

% DC Analysis
%A = Beta.*(RE1+RE2);
%B = 10.*(1/((1/R1)+(1/R2)));
%StiffDivider = A >= B;          %iDoes the circuit have a stiff voltage divider?

VB = VCC*(R2/(R2+R1));
VE = VB - 0.7;
ICEQ = VE/(RE1+RE2);
VC = VCC-(ICEQ*RC);
VCEQ = VC - VE;

% AC Analysis
ro = VA/ICEQ;
re = .025/(ICEQ);
rc = 1/((1/RC)+(1/RL));
Zbase = (RE1+re)*Beta;
Zin = RS + (1/((1/R1)+(1/R2)+(1/(Beta.*(RE1+re)))));
Zout = 1/((1/RC)+(1/RL)+(1/ro));
Vin = Vs*(Zin/(Zin+Zg+RS));
Av = rc/(RE1+re);
Vout=Av*(Vin);

% Optimizing Q-Point
%
REop = VE*(RC+rc)/(VCC-VE);

% Maximum Peak to Peak 
MPP = min(2*(ICEQ * rc), 2*(VCEQ)); % Take the minimum of MPP1 and MPP2

% Current Drain
Ibias = VCC/(R1+R2);
IS = Ibias + ICEQ;

% Power and Efficiency
PD = VCEQ  * ICEQ;
PL = (MPP^2)/(8 * RL);
PS = VCC * IS;
Efficiency = PL/PS * 100; 

% Plotting Q-Point
% DC Loadline
VCEcutoff = VCC - VE;
ICsaturation = (VCC-VE)/RC;


% AC Loadline
ACcutoff = VCEQ + (ICEQ * rc);
ACsaturation = ICEQ + (VCEQ/rc);

end
