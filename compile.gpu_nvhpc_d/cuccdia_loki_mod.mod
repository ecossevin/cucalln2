V34 :0x24 cuccdia_loki_mod
21 cuccdia.scc_stack.F90 S624 0
03/19/2025  06:55:44
use yoe_spectral_planck private
use yoephy private
use yoephli private
use yoerad private
use iso_c_binding private
enduse
B 525 iso_c_binding c_loc
B 526 iso_c_binding c_funloc
B 527 iso_c_binding c_associated
B 528 iso_c_binding c_f_pointer
B 529 iso_c_binding c_f_procpointer
B 608 iso_c_binding c_sizeof
B 606 iso_c_binding compiler_options
B 607 iso_c_binding compiler_version
D 58 26 656 8 655 7
D 67 26 659 8 658 7
D 88 26 729 448 728 7
D 124 26 895 528 894 7
D 148 22 7
D 150 22 7
D 152 22 7
D 157 26 895 528 894 7
D 163 22 7
D 165 22 7
D 167 22 7
D 169 26 943 2864 942 7
D 229 26 729 448 728 7
D 235 26 943 2864 942 7
D 241 26 842 120 841 7
D 247 23 6 1 11 185 0 0 1 0 0
 0 184 11 11 185 185
D 250 23 6 1 11 185 0 0 1 0 0
 0 184 11 11 185 185
D 253 23 18 1 11 185 0 0 1 0 0
 0 184 11 11 185 185
D 256 23 10 2 186 190 0 0 1 0 0
 0 184 11 11 185 185
 0 188 185 11 189 189
D 259 23 10 2 186 190 0 0 1 0 0
 0 184 11 11 185 185
 0 188 185 11 189 189
D 262 23 10 2 186 190 0 0 1 0 0
 0 184 11 11 185 185
 0 188 185 11 189 189
D 265 23 10 1 11 185 0 0 1 0 0
 0 184 11 11 185 185
D 268 23 10 1 11 185 0 0 1 0 0
 0 184 11 11 185 185
D 271 23 6 1 11 185 0 0 1 0 0
 0 184 11 11 185 185
D 274 23 6 1 11 185 0 0 1 0 0
 0 184 11 11 185 185
S 624 24 0 0 0 9 1 0 5012 10005 0 A 0 0 0 0 B 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 cuccdia_loki_mod
S 626 3 0 0 0 6 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6
S 627 3 0 0 0 6 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6
R 655 25 7 iso_c_binding c_ptr
R 656 5 8 iso_c_binding val c_ptr
R 658 25 10 iso_c_binding c_funptr
R 659 5 11 iso_c_binding val c_funptr
R 693 6 45 iso_c_binding c_null_ptr$ac
R 695 6 47 iso_c_binding c_null_funptr$ac
R 696 26 48 iso_c_binding ==
R 698 26 50 iso_c_binding !=
S 724 3 0 0 0 18 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 18
R 728 25 3 yoephy tephy
R 729 5 4 yoephy lephys tephy
R 730 5 5 yoephy lecond tephy
R 731 5 6 yoephy lecumf tephy
R 732 5 7 yoephy ledcld tephy
R 733 5 8 yoephy leevap tephy
R 734 5 9 yoephy legwdg tephy
R 735 5 10 yoephy legwwms tephy
R 736 5 11 yoephy leozoc tephy
R 737 5 12 yoephy leqngt tephy
R 738 5 13 yoephy leradi tephy
R 739 5 14 yoephy leradimpl tephy
R 740 5 15 yoephy lerads tephy
R 741 5 16 yoephy lesice tephy
R 742 5 17 yoephy lesurf tephy
R 743 5 18 yoephy levdif tephy
R 744 5 19 yoephy levdifsl tephy
R 745 5 20 yoephy lagphy tephy
R 746 5 21 yoephy lepcld tephy
R 747 5 22 yoephy leo3ch tephy
R 748 5 23 yoephy lo3ch_safe tephy
R 749 5 24 yoephy lo3ch_oldver tephy
R 750 5 25 yoephy lo3ch_bms tephy
R 751 5 26 yoephy lo3ch_hlo tephy
R 752 5 27 yoephy co3chem tephy
R 753 5 28 yoephy lneeonline tephy
R 754 5 29 yoephy lwetonline tephy
R 755 5 30 yoephy lbud23 tephy
R 756 5 31 yoephy lpptiles tephy
R 757 5 32 yoephy lbudcycle tephy
R 758 5 33 yoephy lextratend tephy
R 759 5 34 yoephy lemethox tephy
R 760 5 35 yoephy lecurr tephy
R 761 5 36 yoephy lesurftraj tephy
R 762 5 37 yoephy lvdftrac tephy
R 763 5 38 yoephy lvdfnewtrac tephy
R 764 5 39 yoephy lmftrac tephy
R 765 5 40 yoephy lmfscav tephy
R 766 5 41 yoephy lerain tephy
R 767 5 42 yoephy lemwave tephy
R 768 5 43 yoephy legbrad tephy
R 769 5 44 yoephy leraingg tephy
R 770 5 45 yoephy lesmos tephy
R 771 5 46 yoephy lesmap tephy
R 772 5 47 yoephy leocwa tephy
R 773 5 48 yoephy leocco tephy
R 774 5 49 yoephy leocsa tephy
R 775 5 50 yoephy leocla tephy
R 776 5 51 yoephy levgen tephy
R 777 5 52 yoephy lessro tephy
R 778 5 53 yoephy leflake tephy
R 779 5 54 yoephy leocml tephy
R 780 5 55 yoephy leobc tephy
R 781 5 56 yoephy leobcmax tephy
R 782 5 57 yoephy reobcmax tephy
R 783 5 58 yoephy leobcice tephy
R 784 5 59 yoephy leoclake tephy
R 785 5 60 yoephy leolakesst tephy
R 786 5 61 yoephy locmltke tephy
R 787 5 62 yoephy leclipqt0 tephy
R 788 5 63 yoephy leclipcldt0 tephy
R 789 5 64 yoephy lductdia tephy
R 790 5 65 yoephy ldiagturb_ec tephy
R 791 5 66 yoephy ldiagturbgrad_ec tephy
R 792 5 67 yoephy lslphy tephy
R 793 5 68 yoephy lesn09 tephy
R 794 5 69 yoephy lelaiv tephy
R 795 5 70 yoephy lectessel tephy
R 796 5 71 yoephy leags tephy
R 797 5 72 yoephy lefarquhar tephy
R 798 5 73 yoephy leoptsurf tephy
R 799 5 74 yoephy lec4map tephy
R 800 5 75 yoephy leairco2coup tephy
R 801 5 76 yoephy lelight tephy
R 802 5 77 yoephy lvextrdynacc tephy
R 803 5 78 yoephy rthrfrti tephy
R 804 5 79 yoephy rcimin tephy
R 805 5 80 yoephy rlaiint tephy
R 806 5 81 yoephy npraccl tephy
R 807 5 82 yoephy nlimode tephy
R 808 5 83 yoephy leclim10d tephy
R 809 5 84 yoephy lesnml tephy
R 810 5 85 yoephy leurban tephy
R 811 5 86 yoephy nsnmlws tephy
R 812 5 87 yoephy lbfasco2 tephy
R 813 5 88 yoephy nco2climyy1 tephy
R 814 5 89 yoephy nco2climyy2 tephy
R 815 5 90 yoephy nco2climn1 tephy
R 816 5 91 yoephy nco2climn2 tephy
R 817 5 92 yoephy nco2climfrq tephy
R 818 5 93 yoephy nalbedoscheme tephy
R 819 5 94 yoephy nemissscheme tephy
R 820 5 95 yoephy ralfminpsn tephy
R 821 5 96 yoephy rnorthml tephy
R 822 5 97 yoephy rsouthml tephy
R 823 5 98 yoephy rwestml tephy
R 824 5 99 yoephy reastml tephy
R 825 5 100 yoephy invml tephy
R 826 5 101 yoephy lfpos_ec_phys tephy
R 827 5 102 yoephy lfpos_acc_reset tephy
R 828 5 103 yoephy lrad_cloud_inhomog tephy
R 829 5 104 yoephy ysurf tephy
R 841 25 2 yoephli tephli
R 842 5 3 yoephli ltlevol tephli
R 843 5 4 yoephli lphylin tephli
R 844 5 5 yoephli lphysfclin tephli
R 845 5 6 yoephli lenopert tephli
R 846 5 7 yoephli leppcfls tephli
R 847 5 8 yoephli lraisanen tephli
R 848 5 9 yoephli lopptwins tephli
R 849 5 10 yoephli rlptrc tephli
R 850 5 11 yoephli rlpal1 tephli
R 851 5 12 yoephli rlpal2 tephli
R 852 5 13 yoephli rlpbb tephli
R 853 5 14 yoephli rlpcc tephli
R 854 5 15 yoephli rlpdd tephli
R 855 5 16 yoephli rlpmixl tephli
R 856 5 17 yoephli rlpbeta tephli
R 857 5 18 yoephli rlpdrag tephli
R 858 5 19 yoephli rlpevap tephli
R 859 5 20 yoephli rlpp00 tephli
S 879 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 23 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
S 882 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
R 894 25 7 yoe_spectral_planck tspectralplanck
R 895 5 8 yoe_spectral_planck nintervals tspectralplanck
R 896 5 9 yoe_spectral_planck ntemps tspectralplanck
R 897 5 10 yoe_spectral_planck temp1 tspectralplanck
R 898 5 11 yoe_spectral_planck dtemp tspectralplanck
R 899 5 12 yoe_spectral_planck planck_lut tspectralplanck
R 902 5 15 yoe_spectral_planck planck_lut$sd tspectralplanck
R 903 5 16 yoe_spectral_planck planck_lut$p tspectralplanck
R 904 5 17 yoe_spectral_planck planck_lut$o tspectralplanck
R 906 5 19 yoe_spectral_planck wavlen_bound tspectralplanck
R 908 5 21 yoe_spectral_planck wavlen_bound$sd tspectralplanck
R 909 5 22 yoe_spectral_planck wavlen_bound$p tspectralplanck
R 910 5 23 yoe_spectral_planck wavlen_bound$o tspectralplanck
R 912 5 25 yoe_spectral_planck interval_map tspectralplanck
R 914 5 27 yoe_spectral_planck interval_map$sd tspectralplanck
R 915 5 28 yoe_spectral_planck interval_map$p tspectralplanck
R 916 5 29 yoe_spectral_planck interval_map$o tspectralplanck
S 926 3 0 0 0 6 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 6 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6
S 927 3 0 0 0 6 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6
S 928 3 0 0 0 6 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 12 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6
S 929 3 0 0 0 10 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 1087068160 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10
S 930 3 0 0 0 10 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 1084459008 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10
S 931 3 0 0 0 18 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 -1 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 18
S 932 3 0 0 0 10 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 1082925056 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10
S 933 3 0 0 0 10 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 1078525952 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10
S 934 3 0 0 0 10 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 1071958238 717431337 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10
S 935 3 0 0 0 10 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 1078853632 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10
S 938 3 0 0 0 22 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 7560 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 20 1 20
R 942 25 4 yoerad terad
R 943 5 5 yoerad naer terad
R 944 5 6 yoerad nmode terad
R 945 5 7 yoerad nozocl terad
R 946 5 8 yoerad nradfr terad
R 947 5 9 yoerad nradpfr terad
R 948 5 10 yoerad nradpla terad
R 949 5 11 yoerad nradint terad
R 950 5 12 yoerad nradres terad
R 951 5 13 yoerad nradnfr terad
R 952 5 14 yoerad nradsfr terad
R 953 5 15 yoerad nrade1h terad
R 954 5 16 yoerad nrade3h terad
R 955 5 17 yoerad nradelg terad
R 956 5 18 yoerad novlp terad
R 957 5 19 yoerad nrproma terad
R 958 5 20 yoerad nlw terad
R 959 5 21 yoerad nswnl terad
R 960 5 22 yoerad nswtl terad
R 961 5 23 yoerad ntlw terad
R 962 5 24 yoerad ntsw terad
R 963 5 25 yoerad nuv terad
R 964 5 26 yoerad ncsradf terad
R 965 5 27 yoerad ninhom terad
R 966 5 28 yoerad nlayinh terad
R 967 5 29 yoerad nlngr1h terad
R 968 5 30 yoerad npertaer terad
R 969 5 31 yoerad npertoz terad
R 970 5 32 yoerad nscen terad
R 971 5 33 yoerad nhincsol terad
R 972 5 34 yoerad nmcica terad
R 973 5 35 yoerad nghgrad terad
R 974 5 36 yoerad nvolcvert terad
R 975 5 37 yoerad nredglw terad
R 976 5 38 yoerad nredgsw terad
R 977 5 39 yoerad nspmapl terad
R 978 5 40 yoerad nspmaps terad
R 979 5 41 yoerad nsw terad
R 980 5 42 yoerad nlwemiss terad
R 981 5 43 yoerad niceopt terad
R 982 5 44 yoerad nliqopt terad
R 983 5 45 yoerad nradip terad
R 984 5 46 yoerad nradlp terad
R 985 5 47 yoerad nlwout terad
R 986 5 48 yoerad ndecolat terad
R 987 5 49 yoerad nminice terad
R 988 5 50 yoerad naermacc terad
R 989 5 51 yoerad nmcvar terad
R 990 5 52 yoerad nlwscattering terad
R 991 5 53 yoerad nswsolver terad
R 992 5 54 yoerad nlwsolver terad
R 993 5 55 yoerad nsolarspectrum terad
R 994 5 56 yoerad ndumpbadinputs terad
R 995 5 57 yoerad ndumpinputs terad
R 996 5 58 yoerad ncloudoverlap terad
R 997 5 59 yoerad rcloud_frac_std terad
R 998 5 60 yoerad rcloud_separation_scale_toa terad
R 999 5 61 yoerad rcloud_separation_scale_surf terad
R 1000 5 62 yoerad lfu_lw_ice_optics_bug terad
R 1001 5 63 yoerad ldiagforcing terad
R 1002 5 64 yoerad lapproxlwupdate terad
R 1003 5 65 yoerad lapproxswupdate terad
R 1004 5 66 yoerad nswiceopt terad
R 1005 5 67 yoerad nswliqopt terad
R 1006 5 68 yoerad nlwiceopt terad
R 1007 5 69 yoerad nlwliqopt terad
R 1008 5 70 yoerad lccnl terad
R 1009 5 71 yoerad lccno terad
R 1010 5 72 yoerad rccnlnd terad
R 1011 5 73 yoerad rccnsea terad
R 1012 5 74 yoerad rre2de terad
R 1013 5 75 yoerad rminice terad
R 1014 5 76 yoerad nmclat terad
R 1015 5 77 yoerad nmclon terad
R 1016 5 78 yoerad nmclev terad
R 1017 5 79 yoerad nswgasoptics terad
R 1018 5 80 yoerad nlwgasoptics terad
R 1019 5 81 yoerad ngasopticsscheme terad
R 1020 5 82 yoerad kmodts terad
R 1021 5 83 yoerad nswwvcontinuum terad
R 1022 5 84 yoerad nrtcall terad
R 1023 5 85 yoerad irtcallref terad
R 1024 5 86 yoerad irtcallcln terad
R 1025 5 87 yoerad linterpincloudmean terad
R 1026 5 88 yoerad lerad1h terad
R 1027 5 89 yoerad lepo3ra terad
R 1028 5 90 yoerad lonewsw terad
R 1029 5 91 yoerad lecsrad terad
R 1030 5 92 yoerad lrrtm terad
R 1031 5 93 yoerad lsrtm terad
R 1032 5 94 yoerad ldiffc terad
R 1033 5 95 yoerad lhvolca terad
R 1034 5 96 yoerad lnewaer terad
R 1035 5 97 yoerad lnotroaer terad
R 1036 5 98 yoerad lrayl terad
R 1037 5 99 yoerad loptrproma terad
R 1038 5 100 yoerad leco2var terad
R 1039 5 101 yoerad lhghg terad
R 1040 5 102 yoerad leso4his terad
R 1041 5 103 yoerad letracgms terad
R 1042 5 104 yoerad laerclim terad
R 1043 5 105 yoerad laervisi terad
R 1044 5 106 yoerad laer3d terad
R 1045 5 107 yoerad lvolcspec terad
R 1046 5 108 yoerad lvolcdamp terad
R 1047 5 109 yoerad laeradcli terad
R 1048 5 110 yoerad laeradjdu terad
R 1049 5 111 yoerad lmannersswupdate terad
R 1050 5 112 yoerad lcentredtimesza terad
R 1051 5 113 yoerad laveragesza terad
R 1052 5 114 yoerad lecompgrid terad
R 1053 5 115 yoerad lusepre2017rad terad
R 1054 5 116 yoerad lduseason terad
R 1055 5 117 yoerad lperpet terad
R 1056 5 118 yoerad lclean terad
R 1057 5 119 yoerad raovlp terad
R 1058 5 120 yoerad rbovlp terad
R 1059 5 121 yoerad ledbug terad
R 1060 5 122 yoerad rpertoz terad
R 1061 5 123 yoerad rlwinhf terad
R 1062 5 124 yoerad rswinhf terad
R 1063 5 125 yoerad rvolcspec terad
R 1064 5 126 yoerad rns terad
R 1065 5 127 yoerad rsigair terad
R 1066 5 128 yoerad raeshss terad
R 1067 5 129 yoerad raeshdu terad
R 1068 5 130 yoerad raeshom terad
R 1069 5 131 yoerad raeshbc terad
R 1070 5 132 yoerad raeshsu terad
R 1071 5 133 yoerad trbkg terad
R 1072 5 134 yoerad stbkg terad
R 1073 5 135 yoerad cghgclimfile terad
R 1074 5 136 yoerad cghgtimeseriesfile terad
R 1075 5 137 yoerad csolarirradiancefile terad
R 1076 5 138 yoerad rratsea terad
R 1077 5 139 yoerad rratland terad
R 1078 5 140 yoerad rratdri terad
R 1079 5 141 yoerad rcadecor terad
R 1080 5 142 yoerad rcbdecor terad
R 1081 5 143 yoerad rfacdice terad
R 1082 5 144 yoerad cvdaess terad
R 1084 5 146 yoerad cvdaess$sd terad
R 1085 5 147 yoerad cvdaess$p terad
R 1086 5 148 yoerad cvdaess$o terad
R 1088 5 150 yoerad cvdaedu terad
R 1090 5 152 yoerad cvdaedu$sd terad
R 1091 5 153 yoerad cvdaedu$p terad
R 1092 5 154 yoerad cvdaedu$o terad
R 1094 5 156 yoerad cvdaeom terad
R 1096 5 158 yoerad cvdaeom$sd terad
R 1097 5 159 yoerad cvdaeom$p terad
R 1098 5 160 yoerad cvdaeom$o terad
R 1100 5 162 yoerad cvdaebc terad
R 1102 5 164 yoerad cvdaebc$sd terad
R 1103 5 165 yoerad cvdaebc$p terad
R 1104 5 166 yoerad cvdaebc$o terad
R 1106 5 168 yoerad cvdaesu terad
R 1108 5 170 yoerad cvdaesu$sd terad
R 1109 5 171 yoerad cvdaesu$p terad
R 1110 5 172 yoerad cvdaesu$o terad
R 1112 5 174 yoerad cecradarch terad
R 1113 5 175 yoerad lecradacc terad
R 1114 5 176 yoerad necradlen terad
R 1115 5 177 yoerad yspectplanck terad
S 1126 23 5 0 0 0 1146 624 9330 0 0 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 cuccdia_loki
S 1127 1 3 1 0 235 1 1126 9343 4 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 yderad
S 1128 1 3 1 0 241 1 1126 9350 4 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ydephli
S 1129 1 3 1 0 229 1 1126 9358 4 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ydephy
S 1130 1 3 1 0 6 1 1126 9365 4 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 kidia
S 1131 1 3 1 0 6 1 1126 9371 4 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 kfdia
S 1132 6 3 1 0 6 1 1126 9377 800004 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 klon
S 1133 6 3 1 0 6 1 1126 9382 800004 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 klev
S 1134 1 3 1 0 6 1 1126 9387 4 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 kstep
S 1135 7 3 1 0 247 1 1126 9393 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 kcbot
S 1136 7 3 1 0 250 1 1126 9399 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 kctop
S 1137 7 3 1 0 253 1 1126 9405 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ldcum
S 1138 7 3 1 0 256 1 1126 9411 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 pqu
S 1139 7 3 1 0 259 1 1126 9415 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 plu
S 1140 7 3 1 0 262 1 1126 9419 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 pmfu
S 1141 7 3 1 0 265 1 1126 9424 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 prain
S 1142 7 3 3 0 268 1 1126 9430 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 parprc
S 1143 7 3 3 0 271 1 1126 9437 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ktopc
S 1144 7 3 3 0 274 1 1126 9443 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 kbasec
S 1145 1 3 3 0 7 1 1126 9450 4 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ydstack_l
S 1146 14 5 0 0 0 1 1126 9330 200 400000 A 0 0 0 0 B 0 3 0 0 0 0 0 18 19 0 0 0 0 0 0 0 2 0 0 0 0 3 0 624 0 0 0 0 cuccdia_loki cuccdia_loki 
F 1146 19 1127 1128 1129 1130 1131 1132 1133 1134 1135 1136 1137 1138 1139 1140 1141 1142 1143 1144 1145
mr 1146 0 82 1 12:cuccdia_loki
mt 1146 1 64 0:
S 1147 6 1 0 0 7 1 1126 9460 40800006 3000 A 0 0 0 0 B 0 66 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_e_246
S 1148 6 1 0 0 7 1 1126 9468 40800006 3000 A 0 0 0 0 B 0 69 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_e_249
S 1149 6 1 0 0 7 1 1126 9476 40800006 3000 A 0 0 0 0 B 0 69 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_e_251
S 1150 6 1 0 0 7 1 1126 9484 40800006 3000 A 0 0 0 0 B 0 69 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_e_253
A 14 2 0 0 0 6 626 0 0 0 14 0 0 0 0 0 0 0 0 0 0 0
A 16 2 0 0 0 6 627 0 0 0 16 0 0 0 0 0 0 0 0 0 0 0
A 79 1 0 0 0 58 693 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 82 1 0 0 0 67 695 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 84 2 0 0 0 18 724 0 0 0 84 0 0 0 0 0 0 0 0 0 0 0
A 88 2 0 0 0 7 879 0 0 0 88 0 0 0 0 0 0 0 0 0 0 0
A 100 2 0 0 0 7 882 0 0 0 100 0 0 0 0 0 0 0 0 0 0 0
A 170 2 0 0 0 6 926 0 0 0 170 0 0 0 0 0 0 0 0 0 0 0
A 171 2 0 0 0 6 927 0 0 0 171 0 0 0 0 0 0 0 0 0 0 0
A 172 2 0 0 0 6 928 0 0 0 172 0 0 0 0 0 0 0 0 0 0 0
A 173 2 0 0 0 10 618 0 0 0 173 0 0 0 0 0 0 0 0 0 0 0
A 174 2 0 0 0 10 929 0 0 0 174 0 0 0 0 0 0 0 0 0 0 0
A 175 2 0 0 0 10 930 0 0 0 175 0 0 0 0 0 0 0 0 0 0 0
A 176 2 0 0 0 18 931 0 0 0 176 0 0 0 0 0 0 0 0 0 0 0
A 177 2 0 0 0 10 932 0 0 0 177 0 0 0 0 0 0 0 0 0 0 0
A 178 2 0 0 0 10 933 0 0 0 178 0 0 0 0 0 0 0 0 0 0 0
A 179 2 0 0 0 10 934 0 0 0 179 0 0 0 0 0 0 0 0 0 0 0
A 180 2 0 0 0 10 935 0 0 0 180 0 0 0 0 0 0 0 0 0 0 0
A 181 2 0 0 0 22 938 0 0 0 181 0 0 0 0 0 0 0 0 0 0 0
A 183 1 0 0 0 6 1132 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 184 7 0 0 0 7 183 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 185 1 0 0 0 7 1147 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 186 1 0 0 0 7 1150 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 187 1 0 0 0 6 1133 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 188 7 0 0 0 7 187 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 189 1 0 0 0 7 1148 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 190 1 0 0 0 7 1149 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
Z
J 133 1 1
V 79 58 7 0
S 0 58 0 0 0
A 0 6 0 0 1 2 0
J 134 1 1
V 82 67 7 0
S 0 67 0 0 0
A 0 6 0 0 1 2 0
T 728 88 0 3 0 0
A 826 18 0 0 1 84 0
T 894 124 0 0 0 0
A 903 7 148 0 1 2 1
A 902 7 0 88 1 10 1
A 909 7 150 0 1 2 1
A 908 7 0 100 1 10 1
A 915 7 152 0 1 2 1
A 914 7 0 100 1 10 0
T 942 169 0 3 0 0
A 979 6 0 0 1 170 1
A 980 6 0 0 1 14 1
A 981 6 0 0 1 171 1
A 982 6 0 0 1 16 1
A 983 6 0 0 1 171 1
A 984 6 0 0 1 14 1
A 985 6 0 0 1 3 1
A 986 6 0 0 1 14 1
A 987 6 0 0 1 3 1
A 988 6 0 0 1 3 1
A 989 6 0 0 1 172 1
A 990 6 0 0 1 3 1
A 991 6 0 0 1 171 1
A 992 6 0 0 1 171 1
A 993 6 0 0 1 2 1
A 994 6 0 0 1 2 1
A 995 6 0 0 1 2 1
A 996 6 0 0 1 171 1
A 997 10 0 0 1 173 1
A 998 10 0 0 1 174 1
A 999 10 0 0 1 175 1
A 1000 18 0 0 1 84 1
A 1001 18 0 0 1 84 1
A 1002 18 0 0 1 176 1
A 1003 18 0 0 1 84 1
A 1008 18 0 0 1 176 1
A 1009 18 0 0 1 176 1
A 1010 10 0 0 1 177 1
A 1011 10 0 0 1 178 1
A 1012 10 0 0 1 179 1
A 1013 10 0 0 1 180 1
A 1073 22 0 0 1 181 1
A 1074 22 0 0 1 181 1
A 1075 22 0 0 1 181 1
T 1115 157 0 3 0 0
A 903 7 163 0 1 2 1
A 902 7 0 88 1 10 1
A 909 7 165 0 1 2 1
A 908 7 0 100 1 10 1
A 915 7 167 0 1 2 1
A 914 7 0 100 1 10 0
Z
