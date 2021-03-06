EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:kicad-library-by-simlun
LIBS:i2c-led-bar-graph-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "I2C LED Bar Graph"
Date ""
Rev "0.1.0"
Comp "Simon Lundmark"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L I2C_RJ14 J1
U 1 1 55435B19
P 1600 2150
F 0 "J1" H 2100 2950 60  0000 C CNN
F 1 "I2C_RJ14" H 1750 2950 60  0000 C CNN
F 2 "" H 3000 2550 60  0000 C CNN
F 3 "" H 3000 2550 60  0000 C CNN
	1    1600 2150
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR01
U 1 1 55435EFD
P 2200 2400
F 0 "#PWR01" H 2200 2250 50  0001 C CNN
F 1 "VDD" H 2200 2550 50  0000 C CNN
F 2 "" H 2200 2400 60  0000 C CNN
F 3 "" H 2200 2400 60  0000 C CNN
	1    2200 2400
	0    1    1    0   
$EndComp
$Comp
L VSS #PWR02
U 1 1 55435F18
P 2000 2450
F 0 "#PWR02" H 2000 2300 50  0001 C CNN
F 1 "VSS" H 2000 2600 50  0000 C CNN
F 2 "" H 2000 2450 60  0000 C CNN
F 3 "" H 2000 2450 60  0000 C CNN
	1    2000 2450
	-1   0    0    1   
$EndComp
Wire Wire Line
	2150 2300 2150 2400
Wire Wire Line
	2150 2400 2200 2400
Wire Wire Line
	2000 2300 2000 2450
$Comp
L MCP23017 IC1
U 1 1 55436A35
P 3650 2450
F 0 "IC1" H 3650 2450 60  0000 C CNN
F 1 "MCP23017" H 3650 2600 60  0000 C CNN
F 2 "" H 3650 2450 60  0000 C CNN
F 3 "" H 3650 2450 60  0000 C CNN
	1    3650 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 2300 1850 2900
Wire Wire Line
	1850 2900 2900 2900
Wire Wire Line
	2900 2800 1700 2800
Wire Wire Line
	1700 2800 1700 2300
$Comp
L VDD #PWR03
U 1 1 55436B64
P 2700 3100
F 0 "#PWR03" H 2700 2950 50  0001 C CNN
F 1 "VDD" H 2700 3250 50  0000 C CNN
F 2 "" H 2700 3100 60  0000 C CNN
F 3 "" H 2700 3100 60  0000 C CNN
	1    2700 3100
	0    -1   -1   0   
$EndComp
$Comp
L VDD #PWR04
U 1 1 55436B7A
P 3550 3650
F 0 "#PWR04" H 3550 3500 50  0001 C CNN
F 1 "VDD" H 3550 3800 50  0000 C CNN
F 2 "" H 3550 3650 60  0000 C CNN
F 3 "" H 3550 3650 60  0000 C CNN
	1    3550 3650
	-1   0    0    1   
$EndComp
$Comp
L VSS #PWR05
U 1 1 55436B90
P 3750 3650
F 0 "#PWR05" H 3750 3500 50  0001 C CNN
F 1 "VSS" H 3750 3800 50  0000 C CNN
F 2 "" H 3750 3650 60  0000 C CNN
F 3 "" H 3750 3650 60  0000 C CNN
	1    3750 3650
	-1   0    0    1   
$EndComp
Wire Wire Line
	3750 3500 3750 3650
Wire Wire Line
	3550 3500 3550 3650
Wire Wire Line
	2900 3100 2700 3100
NoConn ~ 4400 2850
NoConn ~ 4400 2750
$Comp
L Led_Small D3
U 1 1 55436EA2
P 5900 2700
F 0 "D3" H 5850 2825 50  0000 L CNN
F 1 "Led_Small" H 5725 2600 50  0001 L CNN
F 2 "" V 5900 2700 60  0000 C CNN
F 3 "" V 5900 2700 60  0000 C CNN
	1    5900 2700
	-1   0    0    1   
$EndComp
$Comp
L Led_Small D4
U 1 1 55436F17
P 5900 2500
F 0 "D4" H 5850 2625 50  0000 L CNN
F 1 "Led_Small" H 5725 2400 50  0001 L CNN
F 2 "" V 5900 2500 60  0000 C CNN
F 3 "" V 5900 2500 60  0000 C CNN
	1    5900 2500
	-1   0    0    1   
$EndComp
$Comp
L Led_Small D5
U 1 1 55437029
P 5900 2300
F 0 "D5" H 5850 2425 50  0000 L CNN
F 1 "Led_Small" H 5725 2200 50  0001 L CNN
F 2 "" V 5900 2300 60  0000 C CNN
F 3 "" V 5900 2300 60  0000 C CNN
	1    5900 2300
	-1   0    0    1   
$EndComp
$Comp
L Led_Small D2
U 1 1 5543709E
P 5900 2900
F 0 "D2" H 5850 3025 50  0000 L CNN
F 1 "Led_Small" H 5725 2800 50  0001 L CNN
F 2 "" V 5900 2900 60  0000 C CNN
F 3 "" V 5900 2900 60  0000 C CNN
	1    5900 2900
	-1   0    0    1   
$EndComp
$Comp
L Led_Small D1
U 1 1 55437105
P 5900 3100
F 0 "D1" H 5850 3225 50  0000 L CNN
F 1 "Led_Small" H 5725 3000 50  0001 L CNN
F 2 "" V 5900 3100 60  0000 C CNN
F 3 "" V 5900 3100 60  0000 C CNN
	1    5900 3100
	-1   0    0    1   
$EndComp
$Comp
L Led_Small D6
U 1 1 55437123
P 5900 2100
F 0 "D6" H 5850 2225 50  0000 L CNN
F 1 "Led_Small" H 5725 2000 50  0001 L CNN
F 2 "" V 5900 2100 60  0000 C CNN
F 3 "" V 5900 2100 60  0000 C CNN
	1    5900 2100
	-1   0    0    1   
$EndComp
$Comp
L Led_Small D7
U 1 1 55437140
P 5900 1900
F 0 "D7" H 5850 2025 50  0000 L CNN
F 1 "Led_Small" H 5725 1800 50  0001 L CNN
F 2 "" V 5900 1900 60  0000 C CNN
F 3 "" V 5900 1900 60  0000 C CNN
	1    5900 1900
	-1   0    0    1   
$EndComp
$Comp
L Led_Small D9
U 1 1 5543715C
P 5900 1500
F 0 "D9" H 5850 1625 50  0000 L CNN
F 1 "Led_Small" H 5725 1400 50  0001 L CNN
F 2 "" V 5900 1500 60  0000 C CNN
F 3 "" V 5900 1500 60  0000 C CNN
	1    5900 1500
	-1   0    0    1   
$EndComp
$Comp
L Led_Small D8
U 1 1 55437179
P 5900 1700
F 0 "D8" H 5850 1825 50  0000 L CNN
F 1 "Led_Small" H 5725 1600 50  0001 L CNN
F 2 "" V 5900 1700 60  0000 C CNN
F 3 "" V 5900 1700 60  0000 C CNN
	1    5900 1700
	-1   0    0    1   
$EndComp
$Comp
L Led_Small D0
U 1 1 55437197
P 5900 3300
F 0 "D0" H 5850 3425 50  0000 L CNN
F 1 "Led_Small" H 5725 3200 50  0001 L CNN
F 2 "" V 5900 3300 60  0000 C CNN
F 3 "" V 5900 3300 60  0000 C CNN
	1    5900 3300
	-1   0    0    1   
$EndComp
$Comp
L VSS #PWR06
U 1 1 554385DE
P 6150 3450
F 0 "#PWR06" H 6150 3300 50  0001 C CNN
F 1 "VSS" H 6150 3600 50  0000 C CNN
F 2 "" H 6150 3450 60  0000 C CNN
F 3 "" H 6150 3450 60  0000 C CNN
	1    6150 3450
	-1   0    0    1   
$EndComp
Wire Wire Line
	6150 1500 6150 3450
Wire Wire Line
	6150 3300 6000 3300
Wire Wire Line
	6000 3100 6150 3100
Connection ~ 6150 3300
Wire Wire Line
	6000 2900 6150 2900
Connection ~ 6150 3100
Wire Wire Line
	6000 2700 6150 2700
Connection ~ 6150 2900
Wire Wire Line
	6000 2500 6150 2500
Connection ~ 6150 2700
Wire Wire Line
	6000 2300 6150 2300
Connection ~ 6150 2500
Wire Wire Line
	6000 2100 6150 2100
Connection ~ 6150 2300
Wire Wire Line
	6000 1900 6150 1900
Connection ~ 6150 2100
Wire Wire Line
	6000 1700 6150 1700
Connection ~ 6150 1900
Wire Wire Line
	6000 1500 6150 1500
Connection ~ 6150 1700
$Comp
L R R0
U 1 1 5543875D
P 5550 3300
F 0 "R0" V 5630 3300 50  0000 C CNN
F 1 "R" V 5550 3300 50  0001 C CNN
F 2 "" V 5480 3300 30  0000 C CNN
F 3 "" H 5550 3300 30  0000 C CNN
	1    5550 3300
	0    1    1    0   
$EndComp
$Comp
L R R1
U 1 1 5543886C
P 5550 3100
F 0 "R1" V 5630 3100 50  0000 C CNN
F 1 "R" V 5550 3100 50  0001 C CNN
F 2 "" V 5480 3100 30  0000 C CNN
F 3 "" H 5550 3100 30  0000 C CNN
	1    5550 3100
	0    1    1    0   
$EndComp
$Comp
L R R2
U 1 1 5543889D
P 5550 2900
F 0 "R2" V 5630 2900 50  0000 C CNN
F 1 "R" V 5550 2900 50  0001 C CNN
F 2 "" V 5480 2900 30  0000 C CNN
F 3 "" H 5550 2900 30  0000 C CNN
	1    5550 2900
	0    1    1    0   
$EndComp
$Comp
L R R3
U 1 1 554388C1
P 5550 2700
F 0 "R3" V 5630 2700 50  0000 C CNN
F 1 "R" V 5550 2700 50  0001 C CNN
F 2 "" V 5480 2700 30  0000 C CNN
F 3 "" H 5550 2700 30  0000 C CNN
	1    5550 2700
	0    1    1    0   
$EndComp
$Comp
L R R4
U 1 1 554388E4
P 5550 2500
F 0 "R4" V 5630 2500 50  0000 C CNN
F 1 "R" V 5550 2500 50  0001 C CNN
F 2 "" V 5480 2500 30  0000 C CNN
F 3 "" H 5550 2500 30  0000 C CNN
	1    5550 2500
	0    1    1    0   
$EndComp
$Comp
L R R5
U 1 1 55438908
P 5550 2300
F 0 "R5" V 5630 2300 50  0000 C CNN
F 1 "R" V 5550 2300 50  0001 C CNN
F 2 "" V 5480 2300 30  0000 C CNN
F 3 "" H 5550 2300 30  0000 C CNN
	1    5550 2300
	0    1    1    0   
$EndComp
$Comp
L R R6
U 1 1 5543892D
P 5550 2100
F 0 "R6" V 5630 2100 50  0000 C CNN
F 1 "R" V 5550 2100 50  0001 C CNN
F 2 "" V 5480 2100 30  0000 C CNN
F 3 "" H 5550 2100 30  0000 C CNN
	1    5550 2100
	0    1    1    0   
$EndComp
$Comp
L R R7
U 1 1 55438953
P 5550 1900
F 0 "R7" V 5630 1900 50  0000 C CNN
F 1 "R" V 5550 1900 50  0001 C CNN
F 2 "" V 5480 1900 30  0000 C CNN
F 3 "" H 5550 1900 30  0000 C CNN
	1    5550 1900
	0    1    1    0   
$EndComp
$Comp
L R R8
U 1 1 55438990
P 5550 1700
F 0 "R8" V 5630 1700 50  0000 C CNN
F 1 "R" V 5550 1700 50  0001 C CNN
F 2 "" V 5480 1700 30  0000 C CNN
F 3 "" H 5550 1700 30  0000 C CNN
	1    5550 1700
	0    1    1    0   
$EndComp
$Comp
L R R9
U 1 1 554392AD
P 5550 1500
F 0 "R9" V 5630 1500 50  0000 C CNN
F 1 "R" V 5550 1500 50  0001 C CNN
F 2 "" V 5480 1500 30  0000 C CNN
F 3 "" H 5550 1500 30  0000 C CNN
	1    5550 1500
	0    1    1    0   
$EndComp
Wire Wire Line
	5700 1500 5800 1500
Wire Wire Line
	5700 1700 5800 1700
Wire Wire Line
	5700 1900 5800 1900
Wire Wire Line
	5700 2100 5800 2100
Wire Wire Line
	5700 2300 5800 2300
Wire Wire Line
	5700 2500 5800 2500
Wire Wire Line
	5700 2700 5800 2700
Wire Wire Line
	5700 2900 5800 2900
Wire Wire Line
	5700 3100 5800 3100
Wire Wire Line
	4400 2600 4600 2600
Wire Wire Line
	4600 2600 4600 3300
Wire Wire Line
	4600 3300 5400 3300
Wire Wire Line
	5400 3100 4650 3100
Wire Wire Line
	4650 3100 4650 2500
Wire Wire Line
	4650 2500 4400 2500
Wire Wire Line
	4400 2400 4700 2400
Wire Wire Line
	4700 2400 4700 2900
Wire Wire Line
	4700 2900 5400 2900
Wire Wire Line
	5400 2700 4750 2700
Wire Wire Line
	4750 2700 4750 2300
Wire Wire Line
	4750 2300 4400 2300
Wire Wire Line
	4400 2200 4800 2200
Wire Wire Line
	4800 2200 4800 2500
Wire Wire Line
	4800 2500 5400 2500
Wire Wire Line
	5400 2300 4900 2300
Wire Wire Line
	4900 2300 4900 2100
Wire Wire Line
	4900 2100 4400 2100
Wire Wire Line
	4400 2000 4950 2000
Wire Wire Line
	4950 2000 4950 2100
Wire Wire Line
	4950 2100 5400 2100
Wire Wire Line
	5400 1900 4400 1900
Wire Wire Line
	5400 1700 2850 1700
Wire Wire Line
	2850 1700 2850 1900
Wire Wire Line
	2850 1900 2900 1900
Wire Wire Line
	2900 2000 2800 2000
Wire Wire Line
	2800 2000 2800 1500
Wire Wire Line
	2800 1500 5400 1500
NoConn ~ 2900 2100
NoConn ~ 2900 2200
NoConn ~ 2900 2300
NoConn ~ 2900 2400
NoConn ~ 2900 2500
NoConn ~ 2900 2600
$Comp
L VSS #PWR07
U 1 1 5543BA62
P 4500 3450
F 0 "#PWR07" H 4500 3300 50  0001 C CNN
F 1 "VSS" H 4500 3600 50  0000 C CNN
F 2 "" H 4500 3450 60  0000 C CNN
F 3 "" H 4500 3450 60  0000 C CNN
	1    4500 3450
	-1   0    0    1   
$EndComp
Wire Wire Line
	4500 3000 4500 3450
Wire Wire Line
	4500 3200 4400 3200
Wire Wire Line
	4400 3100 4500 3100
Connection ~ 4500 3200
Wire Wire Line
	4400 3000 4500 3000
Connection ~ 4500 3100
Wire Wire Line
	5700 3300 5800 3300
$EndSCHEMATC
