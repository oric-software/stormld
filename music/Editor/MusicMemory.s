;Music is arranged in similar format to Sonix and Wave but in a much more compact form

;Event memory organised as 256(Events)x4(Channels)x1(Entry)
;Byte 0
; Bits 0-6 Pattern
;	0     Pattern Rest
;	1-127 Pattern ID
; Bits 7   Loop Position
;	0 Not Marked
;	1 Loop to this point
EventMemory
 .dsb 1024,0
 
;Pattern memory organised as 128(Patterns)x64(Notes)x2(Entry)
;Byte 0
; Bits 0-1 Volume(B0-1 of Volume)
; Bits 2-7 Note
;	0     Bar
;	1-61  Note
;	62    Rest
;	63    Volume Rest
;Byte 1
; Bits 0-5 Effect
;	0     No Effect
;	1-63  Effect ID(Points to Effect Router)
; Bits 6-7 Volume(B2-3 of Volume)
	0-15  Volume

;For 4th channel (EG)
;Byte 0
; Bits 0-7 EG Period
;	0     Bar
;	1-253 Period
;	254   Rest
;	255   Volume Rest (Env Off)
;Byte 1
; Bits 0-4 Parameter
;	0-31  Parameter
; Bits 5-7 Command
;	0     No Command
;	1     Parameter is Cycle
;	2     Parameter is Tempo
;	3     Parameter is Channel A Pitchbend
;	4     Parameter is Channel B Pitchbend
;	5     Parameter is Channel C Pitchbend
;	6     Parameter is Buzzer SID(Always on C) Cycle
;	7     Parameter is Channel SID(Always on C) Offset?
PatternMemory
 .dsb 16384,254
;EffectRouting
;Rather than holding a direct pointer to the effect in the pattern entry
;the pointer can point to a configurable list of up to 4 types of concurrent
;effects
; Bits 0-7 Note Sequence Address Low
;	0    No Sequence
;	1-1-63 Sequence ID
;Byte 1 Volume Offset Sequence ID
; Bits 0-5 Sequence ID
;	0    No Sequence
;	1-63 Sequence ID
;Byte 2 Pitch offset Sequence ID
; Bits 0-5 Sequence ID
;	0    No Sequence
;	1-63 Sequence ID
;Byte 3 Noise offset Sequence ID
; Bits 0-5 Sequence ID
;	0    No Sequence
;	1-63 Sequence ID

EffectRouterLo_Note
 .dsb 64,0
EffectRouterLo_Volume
 .dsb 64,0
EffectRouterLo_Pitch
 .dsb 64,0
EffectRouterLo_Noise
 .dsb 64,0
EffectRouterLo_Other
 .dsb 64,0
EffectRouterHi_Note
 .dsb 64,0
EffectRouterHi_Volume
 .dsb 64,0
EffectRouterHi_Pitch
 .dsb 64,0
EffectRouterHi_Noise
 .dsb 64,0
EffectRouterHi_Other
 .dsb 64,0

;Header(Note, Volume, Pitch, Noise)
;+0 Length
;	1-128
;+1 Loop Position
;	1-128
;Effect
;+2 Offset list
;	-129 to +128

;Header(Other)
;+0 Length
;	1-128
;+1 Loop Position
;	1-128
;
;Effect
; B0   Tone Bit
; B1   Noise Bit
; B2-5 Cycle
; B6   Write Cycle
; B7   Env Bit

EffectMemory
 .dsb 1024,0


