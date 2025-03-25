V34 :0x24 spp_mod
11 spp_mod.F90 S624 0
03/19/2025  06:54:28
use spp_def_mod private
use spp_gen_mod private
use yomhook private
use parkind1 private
enduse
D 58 20 27
D 60 26 687 200 686 7
D 66 23 10 1 11 38 0 0 0 0 0
 0 38 11 11 38 38
D 69 23 10 1 11 38 0 0 0 0 0
 0 38 11 11 38 38
D 72 23 6 1 11 39 0 0 0 0 0
 0 39 11 11 39 39
D 78 26 712 848 711 7
D 131 20 27
D 133 20 27
D 156 26 835 212 834 3
D 167 26 914 3776 913 7
D 173 20 30
D 175 23 6 1 11 105 0 0 0 0 0
 0 105 11 11 105 105
D 178 23 6 1 11 105 0 0 0 0 0
 0 105 11 11 105 105
D 181 20 106
D 183 23 7 1 0 11 0 0 0 0 0
 0 11 0 11 11 0
D 186 26 950 304 948 7
D 192 23 6 1 115 114 0 1 0 0 1
 109 112 113 109 112 110
D 195 23 7 1 0 40 0 0 0 0 0
 0 40 0 11 40 0
D 198 23 131 1 126 125 0 1 0 0 1
 120 123 124 120 123 121
D 201 23 7 1 0 40 0 0 0 0 0
 0 40 0 11 40 0
D 206 22 131
D 208 23 7 1 0 11 0 0 0 0 0
 0 11 0 11 11 0
S 624 24 0 0 0 9 1 0 5012 10005 0 A 0 0 0 0 B 0 1 0 0 0 0 0 0 0 0 0 0 101 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 spp_mod
S 626 23 0 0 0 6 641 624 5029 4 0 A 0 0 0 0 B 400000 34 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 624 0 0 0 0 jpim
S 627 23 0 0 0 6 647 624 5034 4 0 A 0 0 0 0 B 400000 34 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 624 0 0 0 0 jprb
S 629 23 0 0 0 6 652 624 5047 4 0 A 0 0 0 0 B 400000 35 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 624 0 0 0 0 lhook
S 630 23 0 0 0 9 659 624 5053 4 0 A 0 0 0 0 B 400000 35 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 624 0 0 0 0 dr_hook
S 631 23 0 0 0 6 653 624 5061 4 0 A 0 0 0 0 B 400000 35 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 624 0 0 0 0 jphook
S 633 23 0 0 0 9 711 624 5080 4 0 A 0 0 0 0 B 400000 36 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 624 0 0 0 0 spp_model
S 635 23 0 0 0 9 834 624 5102 4 0 A 0 0 0 0 B 400000 37 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 624 0 0 0 0 spp_pert_pointer
R 641 16 3 parkind1 jpim
R 647 16 9 parkind1 jprb
R 652 6 3 yomhook lhook
R 653 16 4 yomhook jphook
R 659 14 10 yomhook dr_hook
S 660 3 0 0 0 6 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6
S 661 3 0 0 0 6 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 32 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6
S 663 3 0 0 0 133 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 5201 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 20 16 3f 3f 3f 3f 3f 3f 3f 3f 3f 3f 3f 3f 3f 3f 3f 3f
S 664 3 0 0 0 18 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 18
S 665 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
S 666 3 0 0 0 10 1 1 6340 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 2146435071 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10 huge(1.0_8)
S 667 3 0 0 0 10 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 -1048577 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10
S 668 3 0 0 0 18 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 -1 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 18
S 669 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
S 670 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
S 671 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 11 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
S 672 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 12 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
S 673 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
S 674 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 7 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
S 675 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
R 686 25 10 spp_gen_mod spp_pert
R 687 5 11 spp_gen_mod label spp_pert
R 688 5 12 spp_gen_mod on spp_pert
R 689 5 13 spp_gen_mod idistr spp_pert
R 690 5 14 spp_gen_mod xmag spp_pert
R 691 5 15 spp_gen_mod mu spp_pert
R 692 5 16 spp_gen_mod xclipmin spp_pert
R 693 5 17 spp_gen_mod xclipmax spp_pert
R 694 5 18 spp_gen_mod xuniform_offset spp_pert
R 695 5 19 spp_gen_mod nmag spp_pert
R 696 5 20 spp_gen_mod ln1 spp_pert
R 697 5 21 spp_gen_mod nseed_off spp_pert
R 698 5 22 spp_gen_mod noff spp_pert
R 699 5 23 spp_gen_mod nrf spp_pert
R 700 5 24 spp_gen_mod nrf_radgrid spp_pert
R 701 5 25 spp_gen_mod radgrid spp_pert
R 702 5 26 spp_gen_mod rf_pert_label spp_pert
R 703 5 27 spp_gen_mod ic spp_pert
R 704 5 28 spp_gen_mod mp spp_pert
R 705 5 29 spp_gen_mod mp_radgrid spp_pert
R 706 5 30 spp_gen_mod tau spp_pert
R 707 5 31 spp_gen_mod sdev spp_pert
R 708 5 32 spp_gen_mod xlcor spp_pert
R 711 25 35 spp_gen_mod spp_model
R 712 5 36 spp_gen_mod version spp_model
R 713 5 37 spp_gen_mod nmax spp_model
R 715 5 39 spp_gen_mod defined_perts spp_model
R 716 5 40 spp_gen_mod defined_perts$sd spp_model
R 717 5 41 spp_gen_mod defined_perts$p spp_model
R 718 5 42 spp_gen_mod defined_perts$o spp_model
R 721 5 45 spp_gen_mod active_perts spp_model
R 722 5 46 spp_gen_mod active_perts$sd spp_model
R 723 5 47 spp_gen_mod active_perts$p spp_model
R 724 5 48 spp_gen_mod active_perts$o spp_model
R 726 5 50 spp_gen_mod ndef spp_model
R 727 5 51 spp_gen_mod nact spp_model
R 728 5 52 spp_gen_mod nrftotal spp_model
R 729 5 53 spp_gen_mod nrftotal_radgrid spp_model
R 731 5 55 spp_gen_mod nseed_off spp_model
R 732 5 56 spp_gen_mod nseed_off$sd spp_model
R 733 5 57 spp_gen_mod nseed_off$p spp_model
R 734 5 58 spp_gen_mod nseed_off$o spp_model
R 737 5 61 spp_gen_mod pndef spp_model
R 738 5 62 spp_gen_mod pndef$sd spp_model
R 739 5 63 spp_gen_mod pndef$p spp_model
R 740 5 64 spp_gen_mod pndef$o spp_model
R 743 5 67 spp_gen_mod pn spp_model
R 744 5 68 spp_gen_mod pn$sd spp_model
R 745 5 69 spp_gen_mod pn$p spp_model
R 746 5 70 spp_gen_mod pn$o spp_model
R 748 5 72 spp_gen_mod tau spp_model
R 749 5 73 spp_gen_mod xlcor spp_model
R 750 5 74 spp_gen_mod sdev spp_model
R 751 5 75 spp_gen_mod kseed_off spp_model
S 831 3 0 0 0 6 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 -1 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6
R 834 25 3 spp_def_mod spp_pert_pointer
R 835 5 4 spp_def_mod cfm spp_pert_pointer
R 836 5 5 spp_def_mod cfm1 spp_pert_pointer
R 837 5 6 spp_def_mod cfm2 spp_pert_pointer
R 838 5 7 spp_def_mod cfm3 spp_pert_pointer
R 839 5 8 spp_def_mod rkap spp_pert_pointer
R 840 5 9 spp_def_mod rkap1 spp_pert_pointer
R 841 5 10 spp_def_mod rkap2 spp_pert_pointer
R 842 5 11 spp_def_mod rkap3 spp_pert_pointer
R 843 5 12 spp_def_mod tofdc spp_pert_pointer
R 844 5 13 spp_def_mod hsdt spp_pert_pointer
R 845 5 14 spp_def_mod vdexc spp_pert_pointer
R 846 5 15 spp_def_mod entrorg spp_pert_pointer
R 847 5 16 spp_def_mod entshalp spp_pert_pointer
R 848 5 17 spp_def_mod entstpc1 spp_pert_pointer
R 849 5 18 spp_def_mod detrpen spp_pert_pointer
R 850 5 19 spp_def_mod rprcon spp_pert_pointer
R 851 5 20 spp_def_mod rtau spp_pert_pointer
R 852 5 21 spp_def_mod cududv spp_pert_pointer
R 853 5 22 spp_def_mod cududvs spp_pert_pointer
R 854 5 23 spp_def_mod ramid spp_pert_pointer
R 855 5 24 spp_def_mod rcldiff spp_pert_pointer
R 856 5 25 spp_def_mod rclcrit spp_pert_pointer
R 857 5 26 spp_def_mod rlcritsnow spp_pert_pointer
R 858 5 27 spp_def_mod rainevap spp_pert_pointer
R 859 5 28 spp_def_mod snowsublim spp_pert_pointer
R 860 5 29 spp_def_mod cloudinhom spp_pert_pointer
R 861 5 30 spp_def_mod qsatvervel spp_pert_pointer
R 862 5 31 spp_def_mod zdecorr spp_pert_pointer
R 863 5 32 spp_def_mod zsigqcw spp_pert_pointer
R 864 5 33 spp_def_mod zradeffl spp_pert_pointer
R 865 5 34 spp_def_mod zradeffi spp_pert_pointer
R 866 5 35 spp_def_mod phr spp_pert_pointer
R 867 5 36 spp_def_mod zhs_vdaero spp_pert_pointer
R 868 5 37 spp_def_mod delta_aero spp_pert_pointer
R 869 5 38 spp_def_mod psigqsat spp_pert_pointer
R 870 5 39 spp_def_mod clddpth spp_pert_pointer
R 871 5 40 spp_def_mod clddpthdp spp_pert_pointer
R 872 5 41 spp_def_mod ice_cld_wgt spp_pert_pointer
R 873 5 42 spp_def_mod icenu spp_pert_pointer
R 874 5 43 spp_def_mod kgn_acon spp_pert_pointer
R 875 5 44 spp_def_mod kgn_sbgr spp_pert_pointer
R 876 5 45 spp_def_mod radgr spp_pert_pointer
R 877 5 46 spp_def_mod radsn spp_pert_pointer
R 878 5 47 spp_def_mod rfac_twoc spp_pert_pointer
R 879 5 48 spp_def_mod rzc_h spp_pert_pointer
R 880 5 49 spp_def_mod rzl_inf spp_pert_pointer
R 881 5 50 spp_def_mod rswinhf spp_pert_pointer
R 882 5 51 spp_def_mod rlwinhf spp_pert_pointer
R 883 5 52 spp_def_mod alpha spp_pert_pointer
R 884 5 53 spp_def_mod rznuc spp_pert_pointer
R 885 5 54 spp_def_mod rzmfdry spp_pert_pointer
R 886 5 55 spp_def_mod rzmbclosure spp_pert_pointer
R 887 5 56 spp_def_mod slwind spp_pert_pointer
R 888 5 57 spp_def_mod set$tbp$0 spp_pert_pointer
S 910 16 1 0 0 6 911 624 6937 4 400000 A 0 0 0 0 B 0 42 0 0 0 0 0 0 16 27 0 0 0 0 0 0 0 0 0 0 0 0 0 624 0 0 0 0 jpspplablen
S 911 16 1 0 0 6 0 624 6949 800004 400000 A 0 0 0 -1 B 0 42 0 0 0 0 0 0 255 103 0 0 0 0 0 0 0 0 0 0 0 0 0 624 0 0 0 0 nwrmax
S 912 3 0 0 0 6 0 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 255 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6
S 913 25 0 0 0 167 1 624 6956 1000000c 800010 A 0 0 0 0 B 0 48 0 0 0 0 0 0 0 0 0 947 0 0 0 0 0 0 0 946 0 0 0 624 0 0 0 0 tspp_config
S 914 5 0 0 0 18 915 624 6968 800004 0 A 0 0 0 0 B 0 49 0 0 0 0 0 0 167 0 0 0 0 0 0 0 0 0 0 0 1 914 0 624 0 0 0 0 lspp
S 915 5 0 0 0 173 916 624 6973 800004 0 A 0 0 0 0 B 0 50 0 0 0 4 0 0 167 0 0 0 0 0 0 0 0 0 0 0 914 915 0 624 0 0 0 0 cspp_model_name
S 916 5 0 0 0 78 917 624 5967 800004 0 A 0 0 0 0 B 0 51 0 0 0 40 0 0 167 0 0 0 0 0 0 0 0 0 0 0 915 916 0 624 0 0 0 0 sm
S 917 5 0 0 0 156 918 624 6989 800004 0 A 0 0 0 0 B 0 52 0 0 0 888 0 0 167 0 0 0 0 0 0 0 0 0 0 0 916 917 0 624 0 0 0 0 pptr
S 918 5 0 0 0 18 919 624 6994 800004 0 A 0 0 0 0 B 0 54 0 0 0 1100 0 0 167 0 0 0 0 0 0 0 0 0 0 0 917 918 0 624 0 0 0 0 lramidlimit1
S 919 5 0 0 0 18 920 624 7007 800004 0 A 0 0 0 0 B 0 56 0 0 0 1104 0 0 167 0 0 0 0 0 0 0 0 0 0 0 918 919 0 624 0 0 0 0 luse_setran
S 920 5 0 0 0 18 921 624 7019 800004 0 A 0 0 0 0 B 0 57 0 0 0 1108 0 0 167 0 0 0 0 0 0 0 0 0 0 0 919 920 0 624 0 0 0 0 lnseed_offs0
S 921 5 0 0 0 18 922 624 7032 800004 0 A 0 0 0 0 B 0 60 0 0 0 1112 0 0 167 0 0 0 0 0 0 0 0 0 0 0 920 921 0 624 0 0 0 0 lrdpatinit
S 922 5 0 0 0 18 923 624 7043 800004 0 A 0 0 0 0 B 0 61 0 0 0 1116 0 0 167 0 0 0 0 0 0 0 0 0 0 0 921 922 0 624 0 0 0 0 lwrpattrun
S 923 5 0 0 0 6 925 624 7054 800004 0 A 0 0 0 0 B 0 62 0 0 0 1120 0 0 167 0 0 0 0 0 0 0 0 0 0 0 922 923 0 624 0 0 0 0 nwrpattrun
S 924 3 0 0 0 7 0 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 255 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
S 925 5 0 0 0 175 926 624 7065 800004 0 A 0 0 0 0 B 0 63 0 0 0 1124 0 0 167 0 0 0 0 0 0 0 0 0 0 0 923 925 0 624 0 0 0 0 nhour_pattrun
S 926 5 0 0 0 178 927 624 7079 800004 0 A 0 0 0 0 B 0 64 0 0 0 2144 0 0 167 0 0 0 0 0 0 0 0 0 0 0 925 926 0 624 0 0 0 0 nstep_pattrun
S 927 5 0 0 0 18 928 624 7093 800004 0 A 0 0 0 0 B 0 65 0 0 0 3164 0 0 167 0 0 0 0 0 0 0 0 0 0 0 926 927 0 624 0 0 0 0 lresetseed
S 928 5 0 0 0 18 929 624 7104 800004 0 A 0 0 0 0 B 0 66 0 0 0 3168 0 0 167 0 0 0 0 0 0 0 0 0 0 0 927 928 0 624 0 0 0 0 labstimseed
S 929 5 0 0 0 6 930 624 7116 800004 0 A 0 0 0 0 B 0 67 0 0 0 3172 0 0 167 0 0 0 0 0 0 0 0 0 0 0 928 929 0 624 0 0 0 0 resetseedfrq
S 930 5 0 0 0 6 932 624 7129 800004 0 A 0 0 0 0 B 0 68 0 0 0 3176 0 0 167 0 0 0 0 0 0 0 0 0 0 0 929 930 0 624 0 0 0 0 shiftseed
S 931 3 0 0 0 6 0 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 256 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6
S 932 5 0 0 0 181 933 624 7139 800004 0 A 0 0 0 0 B 0 69 0 0 0 3180 0 0 167 0 0 0 0 0 0 0 0 0 0 0 930 932 0 624 0 0 0 0 spp_rdpatinit
S 933 5 0 0 0 181 934 624 7153 800004 0 A 0 0 0 0 B 0 70 0 0 0 3436 0 0 167 0 0 0 0 0 0 0 0 0 0 0 932 933 0 624 0 0 0 0 spp_wrpattrun
S 934 5 0 0 0 6 935 624 7167 800004 0 A 0 0 0 0 B 0 72 0 0 0 3692 0 0 167 0 0 0 0 0 0 0 0 0 0 0 933 934 0 624 0 0 0 0 iseedfac
S 935 5 0 0 0 6 936 624 7176 800004 0 A 0 0 0 0 B 0 73 0 0 0 3696 0 0 167 0 0 0 0 0 0 0 0 0 0 0 934 935 0 624 0 0 0 0 iezdiag_pos
S 936 5 0 0 0 6 937 624 7188 800004 0 A 0 0 0 0 B 0 75 0 0 0 3700 0 0 167 0 0 0 0 0 0 0 0 0 0 0 935 936 0 624 0 0 0 0 npatfr
S 937 5 0 0 0 10 938 624 7195 800004 0 A 0 0 0 0 B 0 78 0 0 0 3704 0 0 167 0 0 0 0 0 0 0 0 0 0 0 936 937 0 624 0 0 0 0 xpress_phr_st
S 938 5 0 0 0 18 939 624 7209 800004 0 A 0 0 0 0 B 0 81 0 0 0 3712 0 0 167 0 0 0 0 0 0 0 0 0 0 0 937 938 0 624 0 0 0 0 lspg_spp
S 939 5 0 0 0 10 940 624 7218 800004 0 A 0 0 0 0 B 0 83 0 0 0 3720 0 0 167 0 0 0 0 0 0 0 0 0 0 0 938 939 0 624 0 0 0 0 spgmu
S 940 5 0 0 0 10 941 624 7224 800004 0 A 0 0 0 0 B 0 84 0 0 0 3728 0 0 167 0 0 0 0 0 0 0 0 0 0 0 939 940 0 624 0 0 0 0 spglambda
S 941 5 0 0 0 10 942 624 7234 800004 0 A 0 0 0 0 B 0 85 0 0 0 3736 0 0 167 0 0 0 0 0 0 0 0 0 0 0 940 941 0 624 0 0 0 0 spgsigma
S 942 5 0 0 0 10 943 624 7243 800004 0 A 0 0 0 0 B 0 86 0 0 0 3744 0 0 167 0 0 0 0 0 0 0 0 0 0 0 941 942 0 624 0 0 0 0 spgq
S 943 5 0 0 0 10 944 624 7248 800004 0 A 0 0 0 0 B 0 87 0 0 0 3752 0 0 167 0 0 0 0 0 0 0 0 0 0 0 942 943 0 624 0 0 0 0 spgadtmin
S 944 5 0 0 0 10 945 624 7258 800004 0 A 0 0 0 0 B 0 88 0 0 0 3760 0 0 167 0 0 0 0 0 0 0 0 0 0 0 943 944 0 624 0 0 0 0 spgadtmax
S 945 5 0 0 0 10 1 624 7268 800004 0 A 0 0 0 0 B 0 89 0 0 0 3768 0 0 167 0 0 0 0 0 0 0 0 0 0 0 944 945 0 624 0 0 0 0 spgtdt
S 946 8 5 0 0 183 1 624 7275 40822004 1220 A 0 0 0 0 B 0 92 0 0 0 0 0 167 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 624 0 0 0 0 spp_mod$$tspp_config$$td
S 947 6 4 0 0 167 962 624 7300 80004e 0 A 0 0 0 0 B 800 92 0 0 0 0 0 0 0 0 0 0 963 0 0 0 0 0 0 0 0 0 0 624 0 0 0 0 ._dtInit0167
S 948 25 0 0 0 186 1 624 7313 1000000c 800054 A 0 0 0 0 B 0 95 0 0 0 0 0 0 0 0 0 962 0 0 0 0 0 0 0 961 0 0 0 624 0 0 0 0 tspp_data
S 949 6 4 0 0 7 955 624 7323 40800006 0 A 0 0 0 0 B 0 96 0 0 0 0 0 0 0 0 0 0 964 0 0 0 0 0 0 0 0 0 0 624 0 0 0 0 z_b_0_1
S 950 5 6 0 0 192 952 624 7331 10a00004 51 A 0 0 0 0 B 0 96 0 0 0 0 952 0 186 0 954 0 0 0 0 0 0 0 0 951 1 950 953 624 0 0 0 0 igribcode
S 951 5 1 0 0 195 956 624 7341 40822004 1020 A 0 0 0 0 B 0 96 0 0 0 16 0 0 186 0 0 0 0 0 0 0 0 0 0 0 953 951 0 624 0 0 0 0 igribcode$sd
S 952 5 0 0 0 7 953 624 7354 40802001 1020 A 0 0 0 0 B 0 96 0 0 0 0 0 0 186 0 0 0 0 0 0 0 0 0 0 0 950 952 0 624 0 0 0 0 igribcode$p
S 953 5 0 0 0 7 951 624 7366 40802000 1020 A 0 0 0 0 B 0 96 0 0 0 8 0 0 186 0 0 0 0 0 0 0 0 0 0 0 952 953 0 624 0 0 0 0 igribcode$o
S 954 22 1 0 0 6 1 624 7378 40000000 1000 A 0 0 0 0 B 0 96 0 0 0 0 0 950 0 0 0 0 951 0 0 0 0 0 0 0 0 0 0 624 0 0 0 0 igribcode$arrdsc
S 955 6 4 0 0 7 1 624 6092 40800006 0 A 0 0 0 0 B 0 98 0 0 0 8 0 0 0 0 0 0 964 0 0 0 0 0 0 0 0 0 0 624 0 0 0 0 z_b_1_1
S 956 5 6 0 0 198 958 624 7395 10a00004 14 A 0 0 0 0 B 0 98 0 0 0 152 958 0 186 0 960 0 0 0 0 0 0 0 0 957 950 956 959 624 0 0 0 0 lab_arp
S 957 5 1 0 0 201 1 624 7403 40822004 1020 A 0 0 0 0 B 0 98 0 0 0 168 0 0 186 0 0 0 0 0 0 0 0 0 0 0 959 957 0 624 0 0 0 0 lab_arp$sd
S 958 5 0 0 0 7 959 624 7414 40802001 1020 A 0 0 0 0 B 0 98 0 0 0 152 0 0 186 0 0 0 0 0 0 0 0 0 0 0 956 958 0 624 0 0 0 0 lab_arp$p
S 959 5 0 0 0 7 957 624 7424 40802000 1020 A 0 0 0 0 B 0 98 0 0 0 160 0 0 186 0 0 0 0 0 0 0 0 0 0 0 958 959 0 624 0 0 0 0 lab_arp$o
S 960 22 1 0 0 6 1 624 7434 40000000 1000 A 0 0 0 0 B 0 98 0 0 0 0 0 956 0 0 0 0 957 0 0 0 0 0 0 0 0 0 0 624 0 0 0 0 lab_arp$arrdsc
S 961 8 5 0 0 208 1 624 7449 40822004 1220 A 0 0 0 0 B 0 99 0 0 0 0 0 186 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 624 0 0 0 0 spp_mod$$tspp_data$$td
S 962 6 4 0 0 186 1 624 7472 80004e 0 A 0 0 0 0 B 800 99 0 0 0 3776 0 0 0 0 0 0 963 0 0 0 0 0 0 0 0 0 0 624 0 0 0 0 ._dtInit0186
S 963 11 0 0 0 9 892 624 7485 40800008 805000 A 0 0 0 0 B 0 101 0 0 0 4080 0 0 947 962 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 _spp_mod$8
S 964 11 0 0 0 9 963 624 7496 40800000 805000 A 0 0 0 0 B 0 101 0 0 0 16 0 0 949 955 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 _spp_mod$2
A 27 2 0 0 0 6 660 0 0 0 27 0 0 0 0 0 0 0 0 0 0 0
A 30 2 0 0 0 6 661 0 0 0 30 0 0 0 0 0 0 0 0 0 0 0
A 37 2 0 0 0 58 663 0 0 0 37 0 0 0 0 0 0 0 0 0 0 0
A 38 2 0 0 0 7 665 0 0 0 38 0 0 0 0 0 0 0 0 0 0 0
A 39 2 0 0 0 7 669 0 0 0 39 0 0 0 0 0 0 0 0 0 0 0
A 40 2 0 0 0 7 670 0 0 0 40 0 0 0 0 0 0 0 0 0 0 0
A 42 2 0 0 0 7 675 0 0 0 42 0 0 0 0 0 0 0 0 0 0 0
A 44 2 0 0 0 7 671 0 0 0 44 0 0 0 0 0 0 0 0 0 0 0
A 46 2 0 0 0 7 672 0 0 0 46 0 0 0 0 0 0 0 0 0 0 0
A 50 2 0 0 0 7 673 0 0 0 50 0 0 0 0 0 0 0 0 0 0 0
A 52 2 0 0 0 7 674 0 0 0 52 0 0 0 0 0 0 0 0 0 0 0
A 95 2 0 0 0 18 664 0 0 0 95 0 0 0 0 0 0 0 0 0 0 0
A 96 2 0 0 0 10 617 0 0 0 96 0 0 0 0 0 0 0 0 0 0 0
A 97 2 0 0 0 10 666 0 0 0 97 0 0 0 0 0 0 0 0 0 0 0
A 98 2 0 0 0 10 667 0 0 0 98 0 0 0 0 0 0 0 0 0 0 0
A 99 2 0 0 0 18 668 0 0 0 99 0 0 0 0 0 0 0 0 0 0 0
A 101 2 0 0 0 6 831 0 0 0 101 0 0 0 0 0 0 0 0 0 0 0
A 103 2 0 0 0 6 912 0 0 0 103 0 0 0 0 0 0 0 0 0 0 0
A 105 2 0 0 0 7 924 0 0 0 105 0 0 0 0 0 0 0 0 0 0 0
A 106 2 0 0 0 6 931 0 0 0 106 0 0 0 0 0 0 0 0 0 0 0
A 108 1 0 1 0 195 951 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 109 10 0 0 0 7 108 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0
X 1 44
A 110 10 0 0 109 7 108 7 0 0 0 0 0 0 0 0 0 0 0 0 0 0
X 1 46
A 111 4 0 0 0 7 110 0 11 0 0 0 0 2 0 0 0 0 0 0 0 0
A 112 4 0 0 0 7 109 0 111 0 0 0 0 1 0 0 0 0 0 0 0 0
A 113 10 0 0 110 7 108 10 0 0 0 0 0 0 0 0 0 0 0 0 0 0
X 1 50
A 114 10 0 0 113 7 108 13 0 0 0 0 0 0 0 0 0 0 0 0 0 0
X 1 52
A 115 10 0 0 114 7 108 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0
X 1 42
A 119 1 0 1 0 201 957 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 120 10 0 0 0 7 119 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0
X 1 44
A 121 10 0 0 120 7 119 7 0 0 0 0 0 0 0 0 0 0 0 0 0 0
X 1 46
A 122 4 0 0 0 7 121 0 11 0 0 0 0 2 0 0 0 0 0 0 0 0
A 123 4 0 0 0 7 120 0 122 0 0 0 0 1 0 0 0 0 0 0 0 0
A 124 10 0 0 121 7 119 10 0 0 0 0 0 0 0 0 0 0 0 0 0 0
X 1 50
A 125 10 0 0 124 7 119 13 0 0 0 0 0 0 0 0 0 0 0 0 0 0
X 1 52
A 126 10 0 0 125 7 119 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0
X 1 42
Z
T 686 60 0 3 0 0
A 687 58 0 0 1 37 1
A 688 18 0 0 1 95 1
R 690 66 0 1
A 0 10 0 38 1 96 0
R 691 69 0 1
A 0 10 0 38 1 96 0
A 692 10 0 0 1 98 1
A 693 10 0 0 1 97 1
A 695 6 0 0 1 3 1
A 696 18 0 0 1 99 1
R 697 72 0 1
A 0 6 0 39 1 2 0
A 698 6 0 0 1 3 1
A 699 6 0 0 1 3 1
A 700 6 0 0 1 2 1
A 701 18 0 0 1 95 1
A 702 58 0 0 1 37 1
A 703 6 0 0 1 3 0
T 711 78 0 3 0 0
A 726 6 0 0 1 2 1
A 728 6 0 0 1 2 1
A 729 6 0 0 1 2 0
T 834 156 0 3 0 0
A 835 6 0 0 1 101 1
A 836 6 0 0 1 101 1
A 837 6 0 0 1 101 1
A 838 6 0 0 1 101 1
A 839 6 0 0 1 101 1
A 840 6 0 0 1 101 1
A 841 6 0 0 1 101 1
A 842 6 0 0 1 101 1
A 843 6 0 0 1 101 1
A 844 6 0 0 1 101 1
A 845 6 0 0 1 101 1
A 846 6 0 0 1 101 1
A 847 6 0 0 1 101 1
A 848 6 0 0 1 101 1
A 849 6 0 0 1 101 1
A 850 6 0 0 1 101 1
A 851 6 0 0 1 101 1
A 852 6 0 0 1 101 1
A 853 6 0 0 1 101 1
A 854 6 0 0 1 101 1
A 855 6 0 0 1 101 1
A 856 6 0 0 1 101 1
A 857 6 0 0 1 101 1
A 858 6 0 0 1 101 1
A 859 6 0 0 1 101 1
A 860 6 0 0 1 101 1
A 861 6 0 0 1 101 1
A 862 6 0 0 1 101 1
A 863 6 0 0 1 101 1
A 864 6 0 0 1 101 1
A 865 6 0 0 1 101 1
A 866 6 0 0 1 101 1
A 867 6 0 0 1 101 1
A 868 6 0 0 1 101 1
A 869 6 0 0 1 101 1
A 870 6 0 0 1 101 1
A 871 6 0 0 1 101 1
A 872 6 0 0 1 101 1
A 873 6 0 0 1 101 1
A 874 6 0 0 1 101 1
A 875 6 0 0 1 101 1
A 876 6 0 0 1 101 1
A 877 6 0 0 1 101 1
A 878 6 0 0 1 101 1
A 879 6 0 0 1 101 1
A 880 6 0 0 1 101 1
A 881 6 0 0 1 101 1
A 882 6 0 0 1 101 1
A 883 6 0 0 1 101 1
A 884 6 0 0 1 101 1
A 885 6 0 0 1 101 1
A 886 6 0 0 1 101 1
A 887 6 0 0 1 101 0
T 913 167 0 3 0 0
A 914 18 0 0 1 95 1
T 916 78 0 3 0 1
A 726 6 0 0 1 2 1
A 728 6 0 0 1 2 1
A 729 6 0 0 1 2 0
T 917 156 0 3 0 1
A 835 6 0 0 1 101 1
A 836 6 0 0 1 101 1
A 837 6 0 0 1 101 1
A 838 6 0 0 1 101 1
A 839 6 0 0 1 101 1
A 840 6 0 0 1 101 1
A 841 6 0 0 1 101 1
A 842 6 0 0 1 101 1
A 843 6 0 0 1 101 1
A 844 6 0 0 1 101 1
A 845 6 0 0 1 101 1
A 846 6 0 0 1 101 1
A 847 6 0 0 1 101 1
A 848 6 0 0 1 101 1
A 849 6 0 0 1 101 1
A 850 6 0 0 1 101 1
A 851 6 0 0 1 101 1
A 852 6 0 0 1 101 1
A 853 6 0 0 1 101 1
A 854 6 0 0 1 101 1
A 855 6 0 0 1 101 1
A 856 6 0 0 1 101 1
A 857 6 0 0 1 101 1
A 858 6 0 0 1 101 1
A 859 6 0 0 1 101 1
A 860 6 0 0 1 101 1
A 861 6 0 0 1 101 1
A 862 6 0 0 1 101 1
A 863 6 0 0 1 101 1
A 864 6 0 0 1 101 1
A 865 6 0 0 1 101 1
A 866 6 0 0 1 101 1
A 867 6 0 0 1 101 1
A 868 6 0 0 1 101 1
A 869 6 0 0 1 101 1
A 870 6 0 0 1 101 1
A 871 6 0 0 1 101 1
A 872 6 0 0 1 101 1
A 873 6 0 0 1 101 1
A 874 6 0 0 1 101 1
A 875 6 0 0 1 101 1
A 876 6 0 0 1 101 1
A 877 6 0 0 1 101 1
A 878 6 0 0 1 101 1
A 879 6 0 0 1 101 1
A 880 6 0 0 1 101 1
A 881 6 0 0 1 101 1
A 882 6 0 0 1 101 1
A 883 6 0 0 1 101 1
A 884 6 0 0 1 101 1
A 885 6 0 0 1 101 1
A 886 6 0 0 1 101 1
A 887 6 0 0 1 101 0
A 919 18 0 0 1 99 1
A 936 6 0 0 1 3 1
A 938 18 0 0 1 95 0
T 948 186 0 3 0 0
A 958 7 206 0 1 2 1
A 959 7 0 0 1 10 1
A 957 7 0 40 1 10 0
Z
