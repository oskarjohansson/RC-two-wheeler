EESchema Schematic File Version 4
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
L MCU_Module:Arduino_Nano_v3.x A?
U 1 1 5E380AF9
P 4950 3950
F 0 "A?" H 4950 2861 50  0000 C CNN
F 1 "Arduino_Nano_v3.x" H 4950 2770 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 5100 3000 50  0001 L CNN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 4950 2950 50  0001 C CNN
	1    4950 3950
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J?
U 1 1 5E381F46
P 7850 2950
F 0 "J?" V 7912 3094 50  0000 L CNN
F 1 "Conn_01x03_Male" V 8003 3094 50  0000 L CNN
F 2 "" H 7850 2950 50  0001 C CNN
F 3 "~" H 7850 2950 50  0001 C CNN
	1    7850 2950
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x03_Male J?
U 1 1 5E38234D
P 7850 3300
F 0 "J?" V 7912 3444 50  0000 L CNN
F 1 "Conn_01x03_Male" V 8003 3444 50  0000 L CNN
F 2 "" H 7850 3300 50  0001 C CNN
F 3 "~" H 7850 3300 50  0001 C CNN
	1    7850 3300
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x05_Male J?
U 1 1 5E3830E3
P 7950 4850
F 0 "J?" V 8012 5094 50  0000 L CNN
F 1 "Conn_01x05_Male" V 8103 5094 50  0000 L CNN
F 2 "" H 7950 4850 50  0001 C CNN
F 3 "~" H 7950 4850 50  0001 C CNN
	1    7950 4850
	0    1    1    0   
$EndComp
Text Notes 7600 2800 0    50   ~ 0
VESC PWM / Power
Text Notes 7700 4700 0    50   ~ 0
Joystick
$Comp
L Connector:Conn_01x03_Male J?
U 1 1 5E3839E0
P 6600 3150
F 0 "J?" V 6662 3294 50  0000 L CNN
F 1 "Conn_01x03_Male" V 6753 3294 50  0000 L CNN
F 2 "" H 6600 3150 50  0001 C CNN
F 3 "~" H 6600 3150 50  0001 C CNN
	1    6600 3150
	0    1    1    0   
$EndComp
Text Notes 6500 3100 0    50   ~ 0
Battery
$Comp
L Connector_Generic:Conn_02x05_Top_Bottom J?
U 1 1 5E384165
P 10050 3100
F 0 "J?" V 10054 3380 50  0000 L CNN
F 1 "Conn_02x05_Top_Bottom" V 10145 3380 50  0000 L CNN
F 2 "" H 10050 3100 50  0001 C CNN
F 3 "~" H 10050 3100 50  0001 C CNN
	1    10050 3100
	0    1    1    0   
$EndComp
Text Notes 9950 2800 0    50   ~ 0
nRF
$Comp
L Switch:SW_DIP_x01 SW?
U 1 1 5E385ACB
P 10100 4850
F 0 "SW?" H 10100 5117 50  0000 C CNN
F 1 "SW_DIP_x01" H 10100 5026 50  0000 C CNN
F 2 "" H 10100 4850 50  0001 C CNN
F 3 "~" H 10100 4850 50  0001 C CNN
	1    10100 4850
	1    0    0    -1  
$EndComp
$EndSCHEMATC
