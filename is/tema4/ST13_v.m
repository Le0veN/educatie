P = 0 ;
v = [ -0.073298  -0.007075  -0.008333  -0.013489  -0.010734  -0.066650  -0.004282  -0.007958  -0.012092  -0.009604  -0.041116  -0.012197  -0.016964  -0.019261  -0.017704  0.007918  0.004725  -0.045065  -0.016973  -0.003779  -0.032326  -0.052057  -0.020964  0.014529  0.029524  -0.018676  -0.008471  0.012537  -0.039652  -0.040638  0.038079  0.036122  0.035149  0.021678  -0.007290  -0.027754  -0.024174  -0.025129  -0.030082  -0.008031  -0.008977  0.008380  -0.004232  -0.002663  0.003909  -0.008016  -0.008685  -0.009595  -0.010502  -0.011906  -0.008907  -0.009705  -0.010600  -0.012792  -0.014381  -0.009767  -0.012150  0.008970  0.025093  0.024219  0.023348  0.007480  0.006615  0.014753  0.021494  0.022537  0.020834  0.019986  0.019642  -0.039300  0.025462  0.026126  0.025293  0.024464  0.024137  0.025313  0.025992  0.023174  0.024858  0.023237  -0.046970  0.017627  0.027326  0.037528  0.045733  0.044152  0.042866  0.037083  0.037802  0.035525  0.024943  0.019180  0.022419  0.021662  0.019406  0.022660  0.022917  0.025176  0.024243  0.033516  0.038793  0.039272  0.036354  0.040639  0.039218  0.058511  0.052807  0.034308  0.057712  0.056330  0.040443  0.049245  0.044583  0.031724  0.050267  0.049613  0.048962  0.052313  0.056668  0.058525  0.057384  0.053112  0.052850  0.058724  0.042078  0.030553  0.034874  0.034320  0.033768  0.016848  0.012512  0.028479  0.023448  0.030919  0.025350  0.011817  0.002805  -0.001105  0.000587  -0.000420  -0.004520  -0.025464  -0.025946  -0.022426  -0.036102  -0.056376  -0.057784  -0.058648  -0.053709  -0.060768  -0.060725  -0.062079  -0.052025  -0.044969  -0.044710  -0.036749  -0.037979  -0.019306  -0.029130  -0.029551  -0.029970  -0.025327  -0.024464  -0.036487  -0.041600  -0.050518  -0.050014  -0.056676  -0.043820  -0.046419  -0.039940  -0.037752  -0.033803  -0.034049  -0.021806  -0.017259  -0.014439  -0.010266  -0.018893  -0.018992  -0.010489  -0.014139  -0.020483  -0.020878  -0.012399  -0.009865  0.011951  -0.032571  -0.029504  -0.006658  -0.005008  -0.028264  -0.055422  -0.062125  -0.056109  -0.077556  -0.082726  -0.110349  -0.107370  -0.102573  -0.063089  -0.118631  0.003588  -0.002958  -0.054745  0.018402  0.062556  0.028740  -0.039452  -0.087915  -0.186265  -0.141984  -0.100954  -0.098049  -0.058185  -0.065076  0.016109  0.042747  0.083050  0.068512  -0.002674  -0.057096  0.002033  0.018064  0.161583  0.073146  0.112230  0.107203  0.213818  0.185399  0.180484  0.144190  0.120477  0.152266  0.197061  0.206934  0.180533  0.169639  0.172142  0.162758  0.141363  0.132096  0.116703  0.147925  0.153549  0.259962  0.251798  0.109551  0.103521  -0.108336  -0.156905  -0.178534  -0.083381  -0.298855  -0.206044  -0.129139  -0.247711  -0.284809  -0.251006  -0.242310  -0.342834  -0.330838  -0.176057  -0.011392  -0.185312  -0.191303  -0.153427  -0.098704  -0.089937  0.033916  0.012561  0.030015  0.032033  -0.018820  -0.042985  -0.146490  -0.156660  -0.116404  -0.125004  0.108412  0.092151  0.189093  0.210464  0.159222  0.193125  0.161616  0.130664  0.094968  0.092563  0.085669  0.084220  0.065138  0.036205  0.027968  -0.007750  -0.011568  -0.079227  -0.058897 ];
Ts = NaN; 
unit = 'day'; 
ntime = [ 15  24  25  26  29  32  33  36  38  39  44  46  57  59  60  62  65  70  71  74  79  85  102  103  104  106  107  108  109  110  111  113  114  115  116  117  119  120  121  122  123  124  127  128  129  130  134  135  136  137  138  139  140  141  142  143  144  145  146  147  148  149  150  151  152  153  155  156  157  158  159  160  161  162  163  164  165  166  167  169  170  171  172  173  174  176  177  178  179  180  184  185  186  187  190  191  192  193  197  198  199  200  201  202  204  205  206  208  209  211  212  220  221  222  223  224  225  226  227  228  229  231  233  234  236  257  260  261  262  267  268  269  270  271  274  276  277  278  279  281  282  288  289  290  291  292  295  296  297  298  299  302  303  304  305  306  310  311  312  313  314  319  336  338  340  362  365  374  376  379  381  383  386  387  394  396  400  402  407  408  409  414  417  421  426  431  438  460  464  466  471  479  485  488  491  493  497  499  502  505  518  528  536  540  547  550  554  560  574  595  603  609  618  630  637  654  689  694  705  716  725  738  744  747  769  787  920  950  985  992  993  1011  1013  1015  1016  1026  1027  1034  1035  1040  1041  1047  1048  1051  1054  1065  1068  1156  1159  1229  1231  1236  1240  1264  1266  1267  1275  1276  1283  1286  1293  1294  1316  1324  1325  1345  1352  1367  1370  1385  1386  1392  1395  1399  1400  1406  1407  1443  1445  1477  1482  1505  1512  1540  1547  1563  1572  1582  1595  1598  1603  1608  1731  1733  1760  1761  1797  1834 ];
label = 'USD-ROL currency, starting with October 15, 2001.(Serie stationarizata.)'; 
yunit = 'Currency: 1 NROL / 1 USD'; 
ys = zeros(1,length(ntime)) ;
