%
%	Fisierul de date ST13.M
%
% USD-ROL currency, starting with October 15, 2001. 
%
%   !!! Non uniform sampling !!!
%
% Day index: ntime. Currency value: y. 
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


	y = [30.153 30.930 30.930 30.891 30.956 30.434 31.070 31.070 ... 
	     31.053 31.090 30.835 31.148 31.229 31.229 31.256 31.535 ... 
	     31.537 31.095 31.387 31.552 31.321 31.188 31.675 32.040 ... 
	     32.200 31.738 31.850 32.070 31.558 31.558 32.355 32.355 ... 
	     32.355 32.230 31.950 31.755 31.810 31.810 31.770 32.000 ... 
	     32.000 32.183 32.085 32.110 32.185 32.075 32.105 32.105 ...
	     32.105 32.100 32.139 32.140 32.140 32.127 32.120 32.175 ...
	     32.160 32.380 32.550 32.550 32.550 32.400 32.400 32.490 ...
	     32.566 32.585 32.585 32.585 32.590 32.009 32.665 32.680 ...
	     32.680 32.680 32.685 32.705 32.720 32.700 32.725 32.725 ... 
	     32.031 32.685 32.790 32.900 32.990 32.990 32.985 32.935 ... 
	     32.950 32.935 32.860 32.810 32.850 32.850 32.850 32.890 ... 
	     32.900 32.930 32.950 33.050 33.110 33.122 33.100 33.150 ... 
	     33.150 33.350 33.300 33.129 33.370 33.370 33.218 33.360 ... 
	     33.320 33.198 33.390 33.390 33.390 33.430 33.480 33.505 ... 
	     33.500 33.470 33.480 33.545 33.391 33.400 33.460 33.460 ... 
	     33.460 33.318 33.280 33.445 33.400 33.480 33.440 33.315 ...
	     33.230 33.196 33.218 33.218 33.182 33.002 33.002 33.042 ... 
	     32.910 32.712 32.712 32.708 32.762 32.696 32.701 32.701 ... 
	     32.806 32.881 32.888 32.972 32.977 33.168 33.074 33.074 ...
	     33.074 33.141 33.215 33.102 33.058 33.041 33.055 33.014 ...
	     33.148 33.130 33.200 33.227 33.274 33.274 33.413 33.463 ...
	     33.500 33.546 33.470 33.471 33.558 33.531 33.473 33.476 ...
	     33.569 33.602 33.830 33.409 33.443 33.673 33.693 33.465] ;
	y = [y ... 
	     33.196 33.130 33.191 32.977 32.926 32.650 32.680 32.728 ...
	     33.121 32.562 33.780 33.712 33.189 33.918 34.356 34.012 ... 
	     33.314 32.799 31.802 32.234 32.627 32.631 33.014 32.904 ... 
	     33.618 33.869 34.237 34.055 33.312 32.721 33.290 33.439 ... 
	     34.788 33.829 33.571 33.355 34.221 33.896 33.841 33.372 ...
	     33.123 33.429 33.871 33.910 33.640 33.489 33.508 33.384 ...
	     33.164 33.035 32.875 33.169 33.207 34.204 34.104 32.136 ...
	     32.057 29.504 29.006 28.759 29.686 27.385 28.301 29.064 ...
	     27.830 27.453 27.749 27.818 26.771 26.885 28.303 29.903 ... 
             28.158 27.983 28.322 28.785 28.856 30.012 29.793 29.935 ...
             29.939 29.409 29.162 28.095 27.988 28.205 28.109 30.288 ...
             30.102 30.967 31.150 30.520 30.831 30.454 30.111 29.718 ...
             29.649 29.570 29.539 29.332 28.759 28.674 28.288 28.249 ...
             27.555 27.766] ; 

	Ts = NaN ; % Non uniform sampling.
	unit = 'day' ;
	ntime = [15     24     25     26     29     32     33     36     ... 
	     	 38     39     44     46     57     59     60     62     ... 
	     	 65     70     71     74     79     85     102    103    ... 
	     	104    106    107    108    109    110    111    113    ... 
	     	114    115    116    117    119    120    121    122    ... 
	     	123    124    127    128    129    130    134    135    ... 
	     	136    137    138    139    140    141    142    143    ... 
	     	144    145    146    147    148    149    150    151    ... 
	     	152    153    155    156    157    158    159    160    ...
	     	161    162    163    164    165    166    167    169    ... 
	     	170    171    172    173    174    176    177    178    ...
	     	179    180    184    185    186    187    190    191    ... 
	     	192    193    197    198    199    200    201    202    ... 
	     	204    205    206    208    209    211    212    220    ... 
	     	221    222    223    224    225    226    227    228    ... 
	     	229    231    233    234    236    257    260    261    ... 
	     	262    267    268    269    270    271    274    276    ... 
	     	277    278    279    281    282    288    289    290    ... 
	     	291    292    295    296    297    298    299    302    ... 
	     	303    304    305    306    310    311    312    313    ... 
	     	314    319    336    338    340    362    365    374    ... 
	     	376    379    381    383    386    387    394    396    ...
	     	400    402    407    408    409    414    417    421    ...
	     	426    431    438    460    464    466    471    479] ; 
	ntime = [ntime ...
	     	485    488    491    493    497    499    502    505    ... 
	     	518    528    536    540    547    550    554    560    ...
	     	574    595    603    609    618    630    637    654    ... 
	     	689    694    705    716    725    738    744    747    ... 
	     	769    787    920    950    985    992    993   1011    ...
	       1013   1015   1016   1026   1027   1034   1035   1040    ...
	       1041   1047   1048   1051   1054   1065   1068   1156    ...
	       1159   1229   1231   1236   1240   1264   1266   1267    ...
	       1275   1276   1283   1286   1293   1294   1316   1324    ...
               1325   1345   1352   1367   1370   1385   1386   1392    ...
               1395   1399   1400   1406   1407   1443   1445   1477    ...
               1482   1505   1512   1540   1547   1563   1572   1582    ...
               1595   1598   1603   1608   1731   1733   1760   1761    ...
               1797   1834];
   y = y/10 ;
	label = 'USD-ROL currency, starting with October 15, 2001.' ; 
    yunit = 'Currency: 1 NROL / 1 USD' ;

%
% Autor:        Dan Stefanoiu
% Data:         30.10.1992 
% Reactualizat: 08.04.2005
%
