# CommonEmitterAnalysis
This function performs an electrical analysis of a BJT common emitter amplifier. 
function[VB, VE, ICEQ, VC, VCEQ, re, rc, Zbase, Zin, Zout, Vin, Av, Vout, REop, MPP, Ibias, IS, PD, PL, PS, Efficiency, VCEcutoff, ICsaturation, ACcutoff, ACsaturation] = CommonEmitterAnalysis(VCC, Beta, RS, R1, R2, RE1, RE2, RC, RL, Zg, Vs, VA, Frequency, Duration)
This function performs an analysis of a common emitter amplifier. 
The code takes in the inputs which are the amplitude of the DC source (VCC). 
The amplitude, impedance, frequency, and duration of the AC voltage source.
The transistor characteristics including Beta gain and Early Voltage.
The voltage divider resistances that bias the base. The swamped and
unswamped emitter resistances. The resistance of the collector and the load.

Inputs 
 * VCC          = Voltage at the Common Collector;
 * RS           = Series Resistance;
 * R1           = Voltage Divider Resistance connected to VCC;
 * R2           = Voltage Divider Resistance connected to Ground;
 * RE1          = Swamped Emitter Resistance;
 * RE2          = Emitter Resistance;
 * RC           = Collector Resistance;
 * RL           = Load Resistance;
 * Zg           = Impedance of the signal source;
 * Vs           = Amplitude of the signal source;
 * Frequency    = Frequency of the signal source;
 * Beta         = Ampification Factor;
 * VA           = Early Voltage of the Transistor;

Outputs 
 * VB           = Voltage at the Base
 * VE           = Voltage at the Emitter
 * ICEQ         = Current at the Emitter/Collecture. Assumes IC = IE
 * VC           = Voltage at the Collector
 * VCEQ         = Voltage between the Collector and Emitter
 * ro           = Output Resistance due to the Early Effect
 * re           = Resistance of the Base-Emitter Junction
 * rc           = Resistance of Collector in parallel with Load
 * Zbase        = Input Impedance at the Base 
 * Zin          = Total Input Impedance
 * Zout         = Output Impedance
 * vin          = Input Signal 
 * Av           = Total Gain 
 * Vout         = Output Signal 
 * REop         = Optimum Emitter Resistance
 * MPP          = Maximum Output Swing/Max Peak-to-peak
 * Ibias        = Current through the Voltage Divider
 * Is           = Total Current from the Source
 * PD           = DC Input Power
 * PL           = AC Power at the Load
 * PS           = Total Power from the Source
 * Efficiency   = Efficiency of Circuit (%)
 * VCEcutoff    = Voltage at Cutoff 
 * ICsaturation = Saturation Current
 * ACcutoff     = AC Cutoff 
 * ACsaturation = AC Saturation