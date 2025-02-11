EESchema Schematic File Version 4
LIBS:RC-two-wheeler-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Module:Arduino_Nano_v3.x A1
U 1 1 5E380AF9
P 4950 3950
F 0 "A1" H 4750 2700 50  0000 C CNN
F 1 "Arduino_Nano_v3.x" H 4900 2600 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 5100 3000 50  0001 L CNN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 4950 2950 50  0001 C CNN
	1    4950 3950
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J2
U 1 1 5E381F46
P 8100 3200
F 0 "J2" H 7750 3250 50  0000 L CNN
F 1 "Conn_01x03_Male" H 7400 3150 50  0000 L CNN
F 2 "Connector_JST:JST_XH_B3B-XH-A_1x03_P2.50mm_Vertical" H 8100 3200 50  0001 C CNN
F 3 "~" H 8100 3200 50  0001 C CNN
	1    8100 3200
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x05_Male J4
U 1 1 5E3830E3
P 8900 4450
F 0 "J4" V 8962 4694 50  0000 L CNN
F 1 "Conn_01x05_Male" V 9053 4694 50  0000 L CNN
F 2 "Connector_JST:JST_XH_B5B-XH-A_1x05_P2.50mm_Vertical" H 8900 4450 50  0001 C CNN
F 3 "~" H 8900 4450 50  0001 C CNN
	1    8900 4450
	-1   0    0    1   
$EndComp
Text Notes 7600 2800 0    50   ~ 0
VESC PWM / Power
Text Notes 9100 4200 3    50   ~ 0
Joystick
$Comp
L Connector:Conn_01x03_Male J1
U 1 1 5E3839E0
P 3600 1300
F 0 "J1" V 3662 1444 50  0000 L CNN
F 1 "Conn_01x03_Male" V 3550 1000 50  0000 L CNN
F 2 "Connector_JST:JST_XH_B3B-XH-A_1x03_P2.50mm_Vertical" H 3600 1300 50  0001 C CNN
F 3 "~" H 3600 1300 50  0001 C CNN
	1    3600 1300
	0    1    1    0   
$EndComp
Text Notes 3450 1200 0    50   ~ 0
2S Battery\nwith XH contact
Text Notes 7550 950  0    50   ~ 0
nRF
$Comp
L RF:NRF24L01_Breakout U1
U 1 1 5E387CF6
P 7950 1550
F 0 "U1" H 8330 1596 50  0000 L CNN
F 1 "NRF24L01_Breakout" H 8330 1505 50  0000 L CNN
F 2 "RF_Module:nRF24L01_Breakout" H 8100 2150 50  0001 L CIN
F 3 "http://www.nordicsemi.com/eng/content/download/2730/34105/file/nRF24L01_Product_Specification_v2_0.pdf" H 7950 1450 50  0001 C CNN
	1    7950 1550
	1    0    0    -1  
$EndComp
Text Label 7450 1250 2    50   ~ 0
MOSI
Text Label 7450 1350 2    50   ~ 0
MISO
Text Label 7450 1450 2    50   ~ 0
SCK
Text Label 7450 1550 2    50   ~ 0
CSN
Text Label 7450 1750 2    50   ~ 0
CE
Text Label 7450 1850 2    50   ~ 0
IRQ
$Comp
L power:+3V3 #PWR0101
U 1 1 5E38AAA4
P 7950 950
F 0 "#PWR0101" H 7950 800 50  0001 C CNN
F 1 "+3V3" H 7965 1123 50  0000 C CNN
F 2 "" H 7950 950 50  0001 C CNN
F 3 "" H 7950 950 50  0001 C CNN
	1    7950 950 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5E38ACFD
P 7950 2150
F 0 "#PWR0102" H 7950 1900 50  0001 C CNN
F 1 "GND" H 7955 1977 50  0000 C CNN
F 2 "" H 7950 2150 50  0001 C CNN
F 3 "" H 7950 2150 50  0001 C CNN
	1    7950 2150
	1    0    0    -1  
$EndComp
Text Label 4450 4250 2    50   ~ 0
CE
Text Label 4450 4350 2    50   ~ 0
CSN
Text Label 4450 4650 2    50   ~ 0
SCK
Text Label 4450 4550 2    50   ~ 0
MISO
Text Label 4450 4450 2    50   ~ 0
MOSI
$Comp
L Device:C C2
U 1 1 5E38BA5B
P 5900 4300
F 0 "C2" H 6015 4346 50  0000 L CNN
F 1 "C" H 6015 4255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5938 4150 50  0001 C CNN
F 3 "~" H 5900 4300 50  0001 C CNN
	1    5900 4300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5E38C452
P 5900 4450
F 0 "#PWR0103" H 5900 4200 50  0001 C CNN
F 1 "GND" H 5905 4277 50  0000 C CNN
F 2 "" H 5900 4450 50  0001 C CNN
F 3 "" H 5900 4450 50  0001 C CNN
	1    5900 4450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 5E38FE90
P 6900 4200
F 0 "C3" H 7015 4246 50  0000 L CNN
F 1 "C" H 7015 4155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 6938 4050 50  0001 C CNN
F 3 "~" H 6900 4200 50  0001 C CNN
	1    6900 4200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5E38FE9C
P 6900 4350
F 0 "#PWR0104" H 6900 4100 50  0001 C CNN
F 1 "GND" H 6905 4177 50  0000 C CNN
F 2 "" H 6900 4350 50  0001 C CNN
F 3 "" H 6900 4350 50  0001 C CNN
	1    6900 4350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5E391B53
P 3050 3700
F 0 "C1" H 3165 3746 50  0000 L CNN
F 1 "C" H 3165 3655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 3088 3550 50  0001 C CNN
F 3 "~" H 3050 3700 50  0001 C CNN
	1    3050 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5E391B59
P 2900 3550
F 0 "R1" V 3000 3550 50  0000 C CNN
F 1 "R" V 2900 3550 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 2830 3550 50  0001 C CNN
F 3 "~" H 2900 3550 50  0001 C CNN
	1    2900 3550
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 5E391B5F
P 3050 3850
F 0 "#PWR0105" H 3050 3600 50  0001 C CNN
F 1 "GND" H 3055 3677 50  0000 C CNN
F 2 "" H 3050 3850 50  0001 C CNN
F 3 "" H 3050 3850 50  0001 C CNN
	1    3050 3850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5E3926D3
P 7050 4050
F 0 "R3" V 7100 4200 50  0000 C CNN
F 1 "R" V 7050 4050 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 6980 4050 50  0001 C CNN
F 3 "~" H 7050 4050 50  0001 C CNN
	1    7050 4050
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 5E392F04
P 6050 4150
F 0 "R2" V 6100 4300 50  0000 C CNN
F 1 "R" V 6050 4150 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 5980 4150 50  0001 C CNN
F 3 "~" H 6050 4150 50  0001 C CNN
	1    6050 4150
	0    1    1    0   
$EndComp
Wire Wire Line
	5900 4150 5450 4150
Connection ~ 5900 4150
Wire Wire Line
	5450 4050 6900 4050
Connection ~ 6900 4050
Text Label 7200 4050 0    50   ~ 0
throttlePin
Text Label 6200 4150 0    50   ~ 0
turnPin
Connection ~ 3050 3550
$Comp
L power:GND #PWR0106
U 1 1 5E39F51F
P 8700 4250
F 0 "#PWR0106" H 8700 4000 50  0001 C CNN
F 1 "GND" V 8705 4122 50  0000 R CNN
F 2 "" H 8700 4250 50  0001 C CNN
F 3 "" H 8700 4250 50  0001 C CNN
	1    8700 4250
	0    1    1    0   
$EndComp
$Comp
L power:+3V3 #PWR0107
U 1 1 5E39FB08
P 8700 4350
F 0 "#PWR0107" H 8700 4200 50  0001 C CNN
F 1 "+3V3" V 8715 4478 50  0000 L CNN
F 2 "" H 8700 4350 50  0001 C CNN
F 3 "" H 8700 4350 50  0001 C CNN
	1    8700 4350
	0    -1   -1   0   
$EndComp
Text Label 8700 4450 2    50   ~ 0
turnPin
Text Label 8700 4550 2    50   ~ 0
throttlePin
Text Label 8700 4650 2    50   ~ 0
buttonPin
$Comp
L power:GND #PWR0108
U 1 1 5E3A3941
P 3500 1500
F 0 "#PWR0108" H 3500 1250 50  0001 C CNN
F 1 "GND" H 3505 1327 50  0000 C CNN
F 2 "" H 3500 1500 50  0001 C CNN
F 3 "" H 3500 1500 50  0001 C CNN
	1    3500 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 1850 3700 1850
Wire Wire Line
	3700 1850 3700 1500
$Comp
L power:+BATT #PWR0109
U 1 1 5E3A4A43
P 3100 1650
F 0 "#PWR0109" H 3100 1500 50  0001 C CNN
F 1 "+BATT" H 3115 1823 50  0000 C CNN
F 2 "" H 3100 1650 50  0001 C CNN
F 3 "" H 3100 1650 50  0001 C CNN
	1    3100 1650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0110
U 1 1 5E3A807D
P 5150 2950
F 0 "#PWR0110" H 5150 2800 50  0001 C CNN
F 1 "+5V" H 5165 3123 50  0000 C CNN
F 2 "" H 5150 2950 50  0001 C CNN
F 3 "" H 5150 2950 50  0001 C CNN
	1    5150 2950
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0111
U 1 1 5E3A83F4
P 5050 2850
F 0 "#PWR0111" H 5050 2700 50  0001 C CNN
F 1 "+3V3" H 5065 3023 50  0000 C CNN
F 2 "" H 5050 2850 50  0001 C CNN
F 3 "" H 5050 2850 50  0001 C CNN
	1    5050 2850
	1    0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR0112
U 1 1 5E3A8771
P 4850 2950
F 0 "#PWR0112" H 4850 2800 50  0001 C CNN
F 1 "+BATT" H 4865 3123 50  0000 C CNN
F 2 "" H 4850 2950 50  0001 C CNN
F 3 "" H 4850 2950 50  0001 C CNN
	1    4850 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 2950 5050 2850
$Comp
L power:GND #PWR0113
U 1 1 5E3A9148
P 5050 4950
F 0 "#PWR0113" H 5050 4700 50  0001 C CNN
F 1 "GND" H 5055 4777 50  0000 C CNN
F 2 "" H 5050 4950 50  0001 C CNN
F 3 "" H 5050 4950 50  0001 C CNN
	1    5050 4950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0114
U 1 1 5E3A96CD
P 4950 4950
F 0 "#PWR0114" H 4950 4700 50  0001 C CNN
F 1 "GND" H 4955 4777 50  0000 C CNN
F 2 "" H 4950 4950 50  0001 C CNN
F 3 "" H 4950 4950 50  0001 C CNN
	1    4950 4950
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0115
U 1 1 5E3B1F31
P 7250 3200
F 0 "#PWR0115" H 7250 3050 50  0001 C CNN
F 1 "+5V" H 7265 3373 50  0000 C CNN
F 2 "" H 7250 3200 50  0001 C CNN
F 3 "" H 7250 3200 50  0001 C CNN
	1    7250 3200
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0116
U 1 1 5E3B38F6
P 7900 3100
F 0 "#PWR0116" H 7900 2850 50  0001 C CNN
F 1 "GND" H 7905 2927 50  0000 C CNN
F 2 "" H 7900 3100 50  0001 C CNN
F 3 "" H 7900 3100 50  0001 C CNN
	1    7900 3100
	0    1    1    0   
$EndComp
Text Label 7900 3300 2    50   ~ 0
lWheel
$Comp
L Connector:Conn_01x03_Male J3
U 1 1 5E3B58FD
P 8100 3550
F 0 "J3" H 7750 3600 50  0000 L CNN
F 1 "Conn_01x03_Male" H 7400 3500 50  0000 L CNN
F 2 "Connector_JST:JST_XH_B3B-XH-A_1x03_P2.50mm_Vertical" H 8100 3550 50  0001 C CNN
F 3 "~" H 8100 3550 50  0001 C CNN
	1    8100 3550
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR0117
U 1 1 5E3B5903
P 7250 3550
F 0 "#PWR0117" H 7250 3400 50  0001 C CNN
F 1 "+5V" H 7265 3723 50  0000 C CNN
F 2 "" H 7250 3550 50  0001 C CNN
F 3 "" H 7250 3550 50  0001 C CNN
	1    7250 3550
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0118
U 1 1 5E3B5909
P 7900 3450
F 0 "#PWR0118" H 7900 3200 50  0001 C CNN
F 1 "GND" H 7905 3277 50  0000 C CNN
F 2 "" H 7900 3450 50  0001 C CNN
F 3 "" H 7900 3450 50  0001 C CNN
	1    7900 3450
	0    1    1    0   
$EndComp
Text Label 7900 3650 2    50   ~ 0
rWheel
$Comp
L Switch:SW_DPDT_x2 SW1
U 1 1 5E3B6C9B
P 3300 1950
F 0 "SW1" H 3300 2235 50  0000 C CNN
F 1 "SW_DPDT_x2" H 3300 2144 50  0000 C CNN
F 2 "PrivateLib:JS202011SCQN" H 3300 1950 50  0001 C CNN
F 3 "~" H 3300 1950 50  0001 C CNN
	1    3300 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 1650 3100 1950
$Comp
L Device:R R5
U 1 1 5E3BE105
P 7400 3550
F 0 "R5" V 7500 3550 50  0000 C CNN
F 1 "Dummy" V 7300 3550 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7330 3550 50  0001 C CNN
F 3 "~" H 7400 3550 50  0001 C CNN
	1    7400 3550
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 5E3BE98E
P 7400 3200
F 0 "R4" V 7500 3200 50  0000 C CNN
F 1 "Dummy" V 7300 3200 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7330 3200 50  0001 C CNN
F 3 "~" H 7400 3200 50  0001 C CNN
	1    7400 3200
	0    1    1    0   
$EndComp
Wire Wire Line
	7550 3200 7900 3200
Wire Wire Line
	7550 3550 7900 3550
Text Label 2750 3550 2    50   ~ 0
buttonPin
Text Label 4450 3950 2    50   ~ 0
rWheel
Text Label 4450 3850 2    50   ~ 0
lWheel
$Comp
L Device:R R6
U 1 1 5E3BE718
P 3700 2000
F 0 "R6" V 3800 2000 50  0000 C CNN
F 1 "R" V 3700 2000 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 3630 2000 50  0001 C CNN
F 3 "~" H 3700 2000 50  0001 C CNN
	1    3700 2000
	1    0    0    -1  
$EndComp
Connection ~ 3700 1850
$Comp
L Device:R R7
U 1 1 5E3BF09C
P 3700 2300
F 0 "R7" V 3800 2300 50  0000 C CNN
F 1 "R" V 3700 2300 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 3630 2300 50  0001 C CNN
F 3 "~" H 3700 2300 50  0001 C CNN
	1    3700 2300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0119
U 1 1 5E3BF681
P 3700 2450
F 0 "#PWR0119" H 3700 2200 50  0001 C CNN
F 1 "GND" H 3705 2277 50  0000 C CNN
F 2 "" H 3700 2450 50  0001 C CNN
F 3 "" H 3700 2450 50  0001 C CNN
	1    3700 2450
	1    0    0    -1  
$EndComp
Text Label 3700 2150 0    50   ~ 0
batVoltage
Text Label 5450 4250 0    50   ~ 0
batVoltage
Wire Wire Line
	3050 3550 4450 3550
$Comp
L Device:LED D1
U 1 1 5E405FD6
P 3450 3800
F 0 "D1" V 3489 3683 50  0000 R CNN
F 1 "LED" V 3398 3683 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 3450 3800 50  0001 C CNN
F 3 "~" H 3450 3800 50  0001 C CNN
	1    3450 3800
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D2
U 1 1 5E406E4E
P 3750 3900
F 0 "D2" V 3789 3783 50  0000 R CNN
F 1 "LED" V 3698 3783 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 3750 3900 50  0001 C CNN
F 3 "~" H 3750 3900 50  0001 C CNN
	1    3750 3900
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R9
U 1 1 5E407285
P 3750 4200
F 0 "R9" V 3850 4200 50  0000 C CNN
F 1 "R" V 3750 4200 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 3680 4200 50  0001 C CNN
F 3 "~" H 3750 4200 50  0001 C CNN
	1    3750 4200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R8
U 1 1 5E407D07
P 3450 4100
F 0 "R8" V 3550 4100 50  0000 C CNN
F 1 "R" V 3450 4100 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 3380 4100 50  0001 C CNN
F 3 "~" H 3450 4100 50  0001 C CNN
	1    3450 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 3750 4450 3750
Wire Wire Line
	4450 3650 3450 3650
$Comp
L power:GND #PWR0120
U 1 1 5E408857
P 3450 4250
F 0 "#PWR0120" H 3450 4000 50  0001 C CNN
F 1 "GND" H 3455 4077 50  0000 C CNN
F 2 "" H 3450 4250 50  0001 C CNN
F 3 "" H 3450 4250 50  0001 C CNN
	1    3450 4250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0121
U 1 1 5E408A3B
P 3750 4350
F 0 "#PWR0121" H 3750 4100 50  0001 C CNN
F 1 "GND" H 3755 4177 50  0000 C CNN
F 2 "" H 3750 4350 50  0001 C CNN
F 3 "" H 3750 4350 50  0001 C CNN
	1    3750 4350
	1    0    0    -1  
$EndComp
$EndSCHEMATC
