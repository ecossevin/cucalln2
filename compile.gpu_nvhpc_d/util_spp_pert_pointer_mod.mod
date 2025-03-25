V34 :0x24 util_spp_pert_pointer_mod
29 util_spp_pert_pointer_mod.F90 S624 0
03/19/2025  06:54:49
use spp_gen_mod private
use spp_def_mod private
enduse
D 58 20 26
D 60 26 670 200 669 7
D 66 23 10 1 11 37 0 0 0 0 0
 0 37 11 11 37 37
D 69 23 10 1 11 37 0 0 0 0 0
 0 37 11 11 37 37
D 72 23 6 1 11 38 0 0 0 0 0
 0 38 11 11 38 38
D 78 26 695 848 694 7
D 133 20 26
D 156 26 818 212 817 3
S 624 24 0 0 0 9 1 0 5012 10005 0 A 0 0 0 0 B 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 util_spp_pert_pointer_mod
S 626 23 0 0 0 9 817 624 5050 4 0 A 0 0 0 0 B 400000 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 624 0 0 0 0 spp_pert_pointer
S 643 3 0 0 0 6 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6
S 646 3 0 0 0 133 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 5143 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 20 16 3f 3f 3f 3f 3f 3f 3f 3f 3f 3f 3f 3f 3f 3f 3f 3f
S 647 3 0 0 0 18 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 18
S 648 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
S 649 3 0 0 0 10 1 1 6292 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 2146435071 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10 huge(1.0_8)
S 650 3 0 0 0 10 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 -1048577 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10
S 651 3 0 0 0 18 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 -1 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 18
S 652 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
R 669 25 10 spp_gen_mod spp_pert
R 670 5 11 spp_gen_mod label spp_pert
R 671 5 12 spp_gen_mod on spp_pert
R 672 5 13 spp_gen_mod idistr spp_pert
R 673 5 14 spp_gen_mod xmag spp_pert
R 674 5 15 spp_gen_mod mu spp_pert
R 675 5 16 spp_gen_mod xclipmin spp_pert
R 676 5 17 spp_gen_mod xclipmax spp_pert
R 677 5 18 spp_gen_mod xuniform_offset spp_pert
R 678 5 19 spp_gen_mod nmag spp_pert
R 679 5 20 spp_gen_mod ln1 spp_pert
R 680 5 21 spp_gen_mod nseed_off spp_pert
R 681 5 22 spp_gen_mod noff spp_pert
R 682 5 23 spp_gen_mod nrf spp_pert
R 683 5 24 spp_gen_mod nrf_radgrid spp_pert
R 684 5 25 spp_gen_mod radgrid spp_pert
R 685 5 26 spp_gen_mod rf_pert_label spp_pert
R 686 5 27 spp_gen_mod ic spp_pert
R 687 5 28 spp_gen_mod mp spp_pert
R 688 5 29 spp_gen_mod mp_radgrid spp_pert
R 689 5 30 spp_gen_mod tau spp_pert
R 690 5 31 spp_gen_mod sdev spp_pert
R 691 5 32 spp_gen_mod xlcor spp_pert
R 694 25 35 spp_gen_mod spp_model
R 695 5 36 spp_gen_mod version spp_model
R 696 5 37 spp_gen_mod nmax spp_model
R 698 5 39 spp_gen_mod defined_perts spp_model
R 699 5 40 spp_gen_mod defined_perts$sd spp_model
R 700 5 41 spp_gen_mod defined_perts$p spp_model
R 701 5 42 spp_gen_mod defined_perts$o spp_model
R 704 5 45 spp_gen_mod active_perts spp_model
R 705 5 46 spp_gen_mod active_perts$sd spp_model
R 706 5 47 spp_gen_mod active_perts$p spp_model
R 707 5 48 spp_gen_mod active_perts$o spp_model
R 709 5 50 spp_gen_mod ndef spp_model
R 710 5 51 spp_gen_mod nact spp_model
R 711 5 52 spp_gen_mod nrftotal spp_model
R 712 5 53 spp_gen_mod nrftotal_radgrid spp_model
R 714 5 55 spp_gen_mod nseed_off spp_model
R 715 5 56 spp_gen_mod nseed_off$sd spp_model
R 716 5 57 spp_gen_mod nseed_off$p spp_model
R 717 5 58 spp_gen_mod nseed_off$o spp_model
R 720 5 61 spp_gen_mod pndef spp_model
R 721 5 62 spp_gen_mod pndef$sd spp_model
R 722 5 63 spp_gen_mod pndef$p spp_model
R 723 5 64 spp_gen_mod pndef$o spp_model
R 726 5 67 spp_gen_mod pn spp_model
R 727 5 68 spp_gen_mod pn$sd spp_model
R 728 5 69 spp_gen_mod pn$p spp_model
R 729 5 70 spp_gen_mod pn$o spp_model
R 731 5 72 spp_gen_mod tau spp_model
R 732 5 73 spp_gen_mod xlcor spp_model
R 733 5 74 spp_gen_mod sdev spp_model
R 734 5 75 spp_gen_mod kseed_off spp_model
S 814 3 0 0 0 6 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 -1 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6
R 817 25 3 spp_def_mod spp_pert_pointer
R 818 5 4 spp_def_mod cfm spp_pert_pointer
R 819 5 5 spp_def_mod cfm1 spp_pert_pointer
R 820 5 6 spp_def_mod cfm2 spp_pert_pointer
R 821 5 7 spp_def_mod cfm3 spp_pert_pointer
R 822 5 8 spp_def_mod rkap spp_pert_pointer
R 823 5 9 spp_def_mod rkap1 spp_pert_pointer
R 824 5 10 spp_def_mod rkap2 spp_pert_pointer
R 825 5 11 spp_def_mod rkap3 spp_pert_pointer
R 826 5 12 spp_def_mod tofdc spp_pert_pointer
R 827 5 13 spp_def_mod hsdt spp_pert_pointer
R 828 5 14 spp_def_mod vdexc spp_pert_pointer
R 829 5 15 spp_def_mod entrorg spp_pert_pointer
R 830 5 16 spp_def_mod entshalp spp_pert_pointer
R 831 5 17 spp_def_mod entstpc1 spp_pert_pointer
R 832 5 18 spp_def_mod detrpen spp_pert_pointer
R 833 5 19 spp_def_mod rprcon spp_pert_pointer
R 834 5 20 spp_def_mod rtau spp_pert_pointer
R 835 5 21 spp_def_mod cududv spp_pert_pointer
R 836 5 22 spp_def_mod cududvs spp_pert_pointer
R 837 5 23 spp_def_mod ramid spp_pert_pointer
R 838 5 24 spp_def_mod rcldiff spp_pert_pointer
R 839 5 25 spp_def_mod rclcrit spp_pert_pointer
R 840 5 26 spp_def_mod rlcritsnow spp_pert_pointer
R 841 5 27 spp_def_mod rainevap spp_pert_pointer
R 842 5 28 spp_def_mod snowsublim spp_pert_pointer
R 843 5 29 spp_def_mod cloudinhom spp_pert_pointer
R 844 5 30 spp_def_mod qsatvervel spp_pert_pointer
R 845 5 31 spp_def_mod zdecorr spp_pert_pointer
R 846 5 32 spp_def_mod zsigqcw spp_pert_pointer
R 847 5 33 spp_def_mod zradeffl spp_pert_pointer
R 848 5 34 spp_def_mod zradeffi spp_pert_pointer
R 849 5 35 spp_def_mod phr spp_pert_pointer
R 850 5 36 spp_def_mod zhs_vdaero spp_pert_pointer
R 851 5 37 spp_def_mod delta_aero spp_pert_pointer
R 852 5 38 spp_def_mod psigqsat spp_pert_pointer
R 853 5 39 spp_def_mod clddpth spp_pert_pointer
R 854 5 40 spp_def_mod clddpthdp spp_pert_pointer
R 855 5 41 spp_def_mod ice_cld_wgt spp_pert_pointer
R 856 5 42 spp_def_mod icenu spp_pert_pointer
R 857 5 43 spp_def_mod kgn_acon spp_pert_pointer
R 858 5 44 spp_def_mod kgn_sbgr spp_pert_pointer
R 859 5 45 spp_def_mod radgr spp_pert_pointer
R 860 5 46 spp_def_mod radsn spp_pert_pointer
R 861 5 47 spp_def_mod rfac_twoc spp_pert_pointer
R 862 5 48 spp_def_mod rzc_h spp_pert_pointer
R 863 5 49 spp_def_mod rzl_inf spp_pert_pointer
R 864 5 50 spp_def_mod rswinhf spp_pert_pointer
R 865 5 51 spp_def_mod rlwinhf spp_pert_pointer
R 866 5 52 spp_def_mod alpha spp_pert_pointer
R 867 5 53 spp_def_mod rznuc spp_pert_pointer
R 868 5 54 spp_def_mod rzmfdry spp_pert_pointer
R 869 5 55 spp_def_mod rzmbclosure spp_pert_pointer
R 870 5 56 spp_def_mod slwind spp_pert_pointer
R 871 5 57 spp_def_mod set$tbp$0 spp_pert_pointer
S 893 19 0 0 0 9 1 624 6889 4000 0 A 0 0 0 0 B 0 5 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3 1 0 0 0 0 0 624 0 0 0 0 save
O 893 1 894
S 894 27 0 0 0 9 907 624 6894 0 400000 A 0 0 0 0 B 0 6 0 0 0 0 16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 624 0 0 0 0 save_spp_pert_pointer
Q 894 893 0
S 895 19 0 0 0 6 1 624 6916 4000 0 A 0 0 0 0 B 0 9 0 0 0 0 0 0 0 0 0 0 0 0 0 0 5 1 0 0 0 0 0 624 0 0 0 0 load
O 895 1 896
S 896 27 0 0 0 6 911 624 6921 0 400000 A 0 0 0 0 B 0 10 0 0 0 0 17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 624 0 0 0 0 load_spp_pert_pointer
Q 896 895 0
S 897 19 0 0 0 9 1 624 6943 4000 0 A 0 0 0 0 B 0 13 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7 1 0 0 0 0 0 624 0 0 0 0 copy
O 897 1 898
S 898 27 0 0 0 9 915 624 6948 0 400000 A 0 0 0 0 B 0 14 0 0 0 0 18 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 624 0 0 0 0 copy_spp_pert_pointer
Q 898 897 0
S 899 19 0 0 0 9 1 624 6970 4000 0 A 0 0 0 0 B 0 17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 9 1 0 0 0 0 0 624 0 0 0 0 host
O 899 1 900
S 900 27 0 0 0 9 920 624 6975 0 400000 A 0 0 0 0 B 0 18 0 0 0 0 19 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 624 0 0 0 0 host_spp_pert_pointer
Q 900 899 0
S 901 19 0 0 0 9 1 624 6997 4000 0 A 0 0 0 0 B 0 22 0 0 0 0 0 0 0 0 0 0 0 0 0 0 11 1 0 0 0 0 0 624 0 0 0 0 crc64
O 901 1 902
S 902 27 0 0 0 9 923 624 7003 0 400000 A 0 0 0 0 B 0 23 0 0 0 0 20 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 624 0 0 0 0 crc64_spp_pert_pointer
Q 902 901 0
S 903 19 0 0 0 9 1 624 7026 4000 0 A 0 0 0 0 B 0 26 0 0 0 0 0 0 0 0 0 0 0 0 0 0 13 1 0 0 0 0 0 624 0 0 0 0 wipe
O 903 1 904
S 904 27 0 0 0 9 928 624 7031 0 400000 A 0 0 0 0 B 0 27 0 0 0 0 21 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 624 0 0 0 0 wipe_spp_pert_pointer
Q 904 903 0
S 905 19 0 0 0 9 1 624 2875 4000 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 15 1 0 0 0 0 0 624 0 0 0 0 size
O 905 1 906
S 906 27 0 0 0 9 933 624 7053 0 400000 A 0 0 0 0 B 0 31 0 0 0 0 22 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 624 0 0 0 0 size_spp_pert_pointer
Q 906 905 0
S 907 23 5 0 0 0 910 624 6894 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 save_spp_pert_pointer
S 908 1 3 1 0 6 1 907 7075 4 3000 A 0 0 0 0 B 0 37 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 klun
S 909 1 3 1 0 156 1 907 7080 4 3008 A 0 0 0 0 B 0 37 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 yd
S 910 14 5 0 0 0 1 907 6894 0 400000 A 0 0 0 0 B 0 0 0 0 0 0 0 66 2 0 0 0 0 0 0 0 0 0 0 0 0 37 0 624 0 0 0 0 save_spp_pert_pointer save_spp_pert_pointer 
F 910 2 908 909
S 911 23 5 0 0 0 914 624 6921 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 load_spp_pert_pointer
S 912 1 3 1 0 6 1 911 7075 4 3000 A 0 0 0 0 B 0 98 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 klun
S 913 1 3 2 0 156 1 911 7080 4 3008 A 0 0 0 0 B 0 98 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 yd
S 914 14 5 0 0 0 1 911 6921 0 400000 A 0 0 0 0 B 0 0 0 0 0 0 0 69 2 0 0 0 0 0 0 0 0 0 0 0 0 98 0 624 0 0 0 0 load_spp_pert_pointer load_spp_pert_pointer 
F 914 2 912 913
S 915 23 5 0 0 0 919 624 6948 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 copy_spp_pert_pointer
S 916 1 3 1 0 156 1 915 7080 4 3008 A 0 0 0 0 B 0 160 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 yd
S 917 1 3 1 0 18 1 915 7083 80000004 3000 A 0 0 0 0 B 0 160 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ldcreated
S 918 1 3 1 0 18 1 915 7093 80000004 3000 A 0 0 0 0 B 0 160 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ldfieldapi
S 919 14 5 0 0 0 1 915 6948 0 400000 A 0 0 0 0 B 0 0 0 0 0 0 0 72 3 0 0 0 0 0 0 0 0 0 0 0 0 160 0 624 0 0 0 0 copy_spp_pert_pointer copy_spp_pert_pointer 
F 919 3 916 917 918
S 920 23 5 0 0 0 922 624 6975 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 host_spp_pert_pointer
S 921 1 3 0 0 156 1 920 7080 4 3008 A 0 0 0 0 B 0 235 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 yd
S 922 14 5 0 0 0 1 920 6975 0 400000 A 0 0 0 0 B 0 0 0 0 0 0 0 76 1 0 0 0 0 0 0 0 0 0 0 0 0 235 0 624 0 0 0 0 host_spp_pert_pointer host_spp_pert_pointer 
F 922 1 921
S 923 23 5 0 0 0 927 624 7003 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 crc64_spp_pert_pointer
S 924 1 3 0 0 156 1 923 7080 4 3008 A 0 0 0 0 B 0 297 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 yd
S 925 1 3 1 0 6 1 923 7075 4 3000 A 0 0 0 0 B 0 297 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 klun
S 926 1 3 1 0 30 1 923 7104 4 43000 A 0 0 0 0 B 0 297 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 cdpath
S 927 14 5 0 0 0 1 923 7003 0 400000 A 0 0 0 0 B 0 0 0 0 0 0 0 78 3 0 0 0 0 0 0 0 0 0 0 0 0 297 0 624 0 0 0 0 crc64_spp_pert_pointer crc64_spp_pert_pointer 
F 927 3 924 925 926
S 928 23 5 0 0 0 932 624 7031 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 wipe_spp_pert_pointer
S 929 1 3 1 0 156 1 928 7080 4 3008 A 0 0 0 0 B 0 414 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 yd
S 930 1 3 1 0 18 1 928 7111 80000004 3000 A 0 0 0 0 B 0 414 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 lddeleted
S 931 1 3 1 0 18 1 928 7093 80000004 3000 A 0 0 0 0 B 0 414 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ldfieldapi
S 932 14 5 0 0 0 1 928 7031 0 400000 A 0 0 0 0 B 0 0 0 0 0 0 0 82 3 0 0 0 0 0 0 0 0 0 0 0 0 414 0 624 0 0 0 0 wipe_spp_pert_pointer wipe_spp_pert_pointer 
F 932 3 929 930 931
S 933 23 5 0 0 7 938 624 7053 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 size_spp_pert_pointer
S 934 1 3 1 0 156 1 933 7080 4 3008 A 0 0 0 0 B 0 488 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 yd
S 935 1 3 1 0 30 1 933 7104 80000004 43000 A 0 0 0 0 B 0 488 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 cdpath
S 936 1 3 1 0 18 1 933 7121 80000004 3000 A 0 0 0 0 B 0 488 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ldprint
S 937 1 3 0 0 7 1 933 7129 4 1003000 A 0 0 0 0 B 0 488 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ksize
S 938 14 5 0 0 7 1 933 7053 4 1400000 A 0 0 0 0 B 0 0 0 0 0 0 0 86 3 0 0 937 0 0 0 0 0 0 0 0 0 488 0 624 0 0 0 0 size_spp_pert_pointer size_spp_pert_pointer ksize
F 938 3 934 935 936
A 26 2 0 0 0 6 643 0 0 0 26 0 0 0 0 0 0 0 0 0 0 0
A 36 2 0 0 0 58 646 0 0 0 36 0 0 0 0 0 0 0 0 0 0 0
A 37 2 0 0 0 7 648 0 0 0 37 0 0 0 0 0 0 0 0 0 0 0
A 38 2 0 0 0 7 652 0 0 0 38 0 0 0 0 0 0 0 0 0 0 0
A 94 2 0 0 0 18 647 0 0 0 94 0 0 0 0 0 0 0 0 0 0 0
A 95 2 0 0 0 10 617 0 0 0 95 0 0 0 0 0 0 0 0 0 0 0
A 96 2 0 0 0 10 649 0 0 0 96 0 0 0 0 0 0 0 0 0 0 0
A 97 2 0 0 0 10 650 0 0 0 97 0 0 0 0 0 0 0 0 0 0 0
A 98 2 0 0 0 18 651 0 0 0 98 0 0 0 0 0 0 0 0 0 0 0
A 100 2 0 0 0 6 814 0 0 0 100 0 0 0 0 0 0 0 0 0 0 0
Z
T 669 60 0 3 0 0
A 670 58 0 0 1 36 1
A 671 18 0 0 1 94 1
R 673 66 0 1
A 0 10 0 37 1 95 0
R 674 69 0 1
A 0 10 0 37 1 95 0
A 675 10 0 0 1 97 1
A 676 10 0 0 1 96 1
A 678 6 0 0 1 3 1
A 679 18 0 0 1 98 1
R 680 72 0 1
A 0 6 0 38 1 2 0
A 681 6 0 0 1 3 1
A 682 6 0 0 1 3 1
A 683 6 0 0 1 2 1
A 684 18 0 0 1 94 1
A 685 58 0 0 1 36 1
A 686 6 0 0 1 3 0
T 694 78 0 3 0 0
A 709 6 0 0 1 2 1
A 711 6 0 0 1 2 1
A 712 6 0 0 1 2 0
T 817 156 0 3 0 0
A 818 6 0 0 1 100 1
A 819 6 0 0 1 100 1
A 820 6 0 0 1 100 1
A 821 6 0 0 1 100 1
A 822 6 0 0 1 100 1
A 823 6 0 0 1 100 1
A 824 6 0 0 1 100 1
A 825 6 0 0 1 100 1
A 826 6 0 0 1 100 1
A 827 6 0 0 1 100 1
A 828 6 0 0 1 100 1
A 829 6 0 0 1 100 1
A 830 6 0 0 1 100 1
A 831 6 0 0 1 100 1
A 832 6 0 0 1 100 1
A 833 6 0 0 1 100 1
A 834 6 0 0 1 100 1
A 835 6 0 0 1 100 1
A 836 6 0 0 1 100 1
A 837 6 0 0 1 100 1
A 838 6 0 0 1 100 1
A 839 6 0 0 1 100 1
A 840 6 0 0 1 100 1
A 841 6 0 0 1 100 1
A 842 6 0 0 1 100 1
A 843 6 0 0 1 100 1
A 844 6 0 0 1 100 1
A 845 6 0 0 1 100 1
A 846 6 0 0 1 100 1
A 847 6 0 0 1 100 1
A 848 6 0 0 1 100 1
A 849 6 0 0 1 100 1
A 850 6 0 0 1 100 1
A 851 6 0 0 1 100 1
A 852 6 0 0 1 100 1
A 853 6 0 0 1 100 1
A 854 6 0 0 1 100 1
A 855 6 0 0 1 100 1
A 856 6 0 0 1 100 1
A 857 6 0 0 1 100 1
A 858 6 0 0 1 100 1
A 859 6 0 0 1 100 1
A 860 6 0 0 1 100 1
A 861 6 0 0 1 100 1
A 862 6 0 0 1 100 1
A 863 6 0 0 1 100 1
A 864 6 0 0 1 100 1
A 865 6 0 0 1 100 1
A 866 6 0 0 1 100 1
A 867 6 0 0 1 100 1
A 868 6 0 0 1 100 1
A 869 6 0 0 1 100 1
A 870 6 0 0 1 100 0
Z
