V34 :0x24 util_terad_mod
18 util_terad_mod.F90 S624 0
03/19/2025  06:54:40
use yoe_spectral_planck private
use yoerad private
enduse
D 58 26 670 528 669 7
D 82 22 7
D 84 22 7
D 86 22 7
D 91 26 670 528 669 7
D 97 22 7
D 99 22 7
D 101 22 7
D 103 26 719 2864 718 7
S 624 24 0 0 0 9 1 0 5012 10005 0 A 0 0 0 0 B 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 util_terad_mod
S 626 23 0 0 0 9 718 624 5034 4 0 A 0 0 0 0 B 400000 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 624 0 0 0 0 terad
S 628 3 0 0 0 6 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6
S 629 3 0 0 0 6 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6
S 654 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 23 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
S 657 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
R 669 25 7 yoe_spectral_planck tspectralplanck
R 670 5 8 yoe_spectral_planck nintervals tspectralplanck
R 671 5 9 yoe_spectral_planck ntemps tspectralplanck
R 672 5 10 yoe_spectral_planck temp1 tspectralplanck
R 673 5 11 yoe_spectral_planck dtemp tspectralplanck
R 674 5 12 yoe_spectral_planck planck_lut tspectralplanck
R 677 5 15 yoe_spectral_planck planck_lut$sd tspectralplanck
R 678 5 16 yoe_spectral_planck planck_lut$p tspectralplanck
R 679 5 17 yoe_spectral_planck planck_lut$o tspectralplanck
R 681 5 19 yoe_spectral_planck wavlen_bound tspectralplanck
R 683 5 21 yoe_spectral_planck wavlen_bound$sd tspectralplanck
R 684 5 22 yoe_spectral_planck wavlen_bound$p tspectralplanck
R 685 5 23 yoe_spectral_planck wavlen_bound$o tspectralplanck
R 687 5 25 yoe_spectral_planck interval_map tspectralplanck
R 689 5 27 yoe_spectral_planck interval_map$sd tspectralplanck
R 690 5 28 yoe_spectral_planck interval_map$p tspectralplanck
R 691 5 29 yoe_spectral_planck interval_map$o tspectralplanck
S 700 3 0 0 0 6 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 6 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6
S 701 3 0 0 0 6 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6
S 702 3 0 0 0 6 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 12 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6
S 703 3 0 0 0 10 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 1087068160 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10
S 704 3 0 0 0 10 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 1084459008 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10
S 705 3 0 0 0 18 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 18
S 706 3 0 0 0 18 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 -1 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 18
S 707 3 0 0 0 10 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 1082925056 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10
S 708 3 0 0 0 10 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 1078525952 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10
S 709 3 0 0 0 10 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 1071958238 717431337 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10
S 710 3 0 0 0 10 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 1078853632 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10
S 713 3 0 0 0 22 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 5587 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 20 1 20
R 718 25 4 yoerad terad
R 719 5 5 yoerad naer terad
R 720 5 6 yoerad nmode terad
R 721 5 7 yoerad nozocl terad
R 722 5 8 yoerad nradfr terad
R 723 5 9 yoerad nradpfr terad
R 724 5 10 yoerad nradpla terad
R 725 5 11 yoerad nradint terad
R 726 5 12 yoerad nradres terad
R 727 5 13 yoerad nradnfr terad
R 728 5 14 yoerad nradsfr terad
R 729 5 15 yoerad nrade1h terad
R 730 5 16 yoerad nrade3h terad
R 731 5 17 yoerad nradelg terad
R 732 5 18 yoerad novlp terad
R 733 5 19 yoerad nrproma terad
R 734 5 20 yoerad nlw terad
R 735 5 21 yoerad nswnl terad
R 736 5 22 yoerad nswtl terad
R 737 5 23 yoerad ntlw terad
R 738 5 24 yoerad ntsw terad
R 739 5 25 yoerad nuv terad
R 740 5 26 yoerad ncsradf terad
R 741 5 27 yoerad ninhom terad
R 742 5 28 yoerad nlayinh terad
R 743 5 29 yoerad nlngr1h terad
R 744 5 30 yoerad npertaer terad
R 745 5 31 yoerad npertoz terad
R 746 5 32 yoerad nscen terad
R 747 5 33 yoerad nhincsol terad
R 748 5 34 yoerad nmcica terad
R 749 5 35 yoerad nghgrad terad
R 750 5 36 yoerad nvolcvert terad
R 751 5 37 yoerad nredglw terad
R 752 5 38 yoerad nredgsw terad
R 753 5 39 yoerad nspmapl terad
R 754 5 40 yoerad nspmaps terad
R 755 5 41 yoerad nsw terad
R 756 5 42 yoerad nlwemiss terad
R 757 5 43 yoerad niceopt terad
R 758 5 44 yoerad nliqopt terad
R 759 5 45 yoerad nradip terad
R 760 5 46 yoerad nradlp terad
R 761 5 47 yoerad nlwout terad
R 762 5 48 yoerad ndecolat terad
R 763 5 49 yoerad nminice terad
R 764 5 50 yoerad naermacc terad
R 765 5 51 yoerad nmcvar terad
R 766 5 52 yoerad nlwscattering terad
R 767 5 53 yoerad nswsolver terad
R 768 5 54 yoerad nlwsolver terad
R 769 5 55 yoerad nsolarspectrum terad
R 770 5 56 yoerad ndumpbadinputs terad
R 771 5 57 yoerad ndumpinputs terad
R 772 5 58 yoerad ncloudoverlap terad
R 773 5 59 yoerad rcloud_frac_std terad
R 774 5 60 yoerad rcloud_separation_scale_toa terad
R 775 5 61 yoerad rcloud_separation_scale_surf terad
R 776 5 62 yoerad lfu_lw_ice_optics_bug terad
R 777 5 63 yoerad ldiagforcing terad
R 778 5 64 yoerad lapproxlwupdate terad
R 779 5 65 yoerad lapproxswupdate terad
R 780 5 66 yoerad nswiceopt terad
R 781 5 67 yoerad nswliqopt terad
R 782 5 68 yoerad nlwiceopt terad
R 783 5 69 yoerad nlwliqopt terad
R 784 5 70 yoerad lccnl terad
R 785 5 71 yoerad lccno terad
R 786 5 72 yoerad rccnlnd terad
R 787 5 73 yoerad rccnsea terad
R 788 5 74 yoerad rre2de terad
R 789 5 75 yoerad rminice terad
R 790 5 76 yoerad nmclat terad
R 791 5 77 yoerad nmclon terad
R 792 5 78 yoerad nmclev terad
R 793 5 79 yoerad nswgasoptics terad
R 794 5 80 yoerad nlwgasoptics terad
R 795 5 81 yoerad ngasopticsscheme terad
R 796 5 82 yoerad kmodts terad
R 797 5 83 yoerad nswwvcontinuum terad
R 798 5 84 yoerad nrtcall terad
R 799 5 85 yoerad irtcallref terad
R 800 5 86 yoerad irtcallcln terad
R 801 5 87 yoerad linterpincloudmean terad
R 802 5 88 yoerad lerad1h terad
R 803 5 89 yoerad lepo3ra terad
R 804 5 90 yoerad lonewsw terad
R 805 5 91 yoerad lecsrad terad
R 806 5 92 yoerad lrrtm terad
R 807 5 93 yoerad lsrtm terad
R 808 5 94 yoerad ldiffc terad
R 809 5 95 yoerad lhvolca terad
R 810 5 96 yoerad lnewaer terad
R 811 5 97 yoerad lnotroaer terad
R 812 5 98 yoerad lrayl terad
R 813 5 99 yoerad loptrproma terad
R 814 5 100 yoerad leco2var terad
R 815 5 101 yoerad lhghg terad
R 816 5 102 yoerad leso4his terad
R 817 5 103 yoerad letracgms terad
R 818 5 104 yoerad laerclim terad
R 819 5 105 yoerad laervisi terad
R 820 5 106 yoerad laer3d terad
R 821 5 107 yoerad lvolcspec terad
R 822 5 108 yoerad lvolcdamp terad
R 823 5 109 yoerad laeradcli terad
R 824 5 110 yoerad laeradjdu terad
R 825 5 111 yoerad lmannersswupdate terad
R 826 5 112 yoerad lcentredtimesza terad
R 827 5 113 yoerad laveragesza terad
R 828 5 114 yoerad lecompgrid terad
R 829 5 115 yoerad lusepre2017rad terad
R 830 5 116 yoerad lduseason terad
R 831 5 117 yoerad lperpet terad
R 832 5 118 yoerad lclean terad
R 833 5 119 yoerad raovlp terad
R 834 5 120 yoerad rbovlp terad
R 835 5 121 yoerad ledbug terad
R 836 5 122 yoerad rpertoz terad
R 837 5 123 yoerad rlwinhf terad
R 838 5 124 yoerad rswinhf terad
R 839 5 125 yoerad rvolcspec terad
R 840 5 126 yoerad rns terad
R 841 5 127 yoerad rsigair terad
R 842 5 128 yoerad raeshss terad
R 843 5 129 yoerad raeshdu terad
R 844 5 130 yoerad raeshom terad
R 845 5 131 yoerad raeshbc terad
R 846 5 132 yoerad raeshsu terad
R 847 5 133 yoerad trbkg terad
R 848 5 134 yoerad stbkg terad
R 849 5 135 yoerad cghgclimfile terad
R 850 5 136 yoerad cghgtimeseriesfile terad
R 851 5 137 yoerad csolarirradiancefile terad
R 852 5 138 yoerad rratsea terad
R 853 5 139 yoerad rratland terad
R 854 5 140 yoerad rratdri terad
R 855 5 141 yoerad rcadecor terad
R 856 5 142 yoerad rcbdecor terad
R 857 5 143 yoerad rfacdice terad
R 858 5 144 yoerad cvdaess terad
R 860 5 146 yoerad cvdaess$sd terad
R 861 5 147 yoerad cvdaess$p terad
R 862 5 148 yoerad cvdaess$o terad
R 864 5 150 yoerad cvdaedu terad
R 866 5 152 yoerad cvdaedu$sd terad
R 867 5 153 yoerad cvdaedu$p terad
R 868 5 154 yoerad cvdaedu$o terad
R 870 5 156 yoerad cvdaeom terad
R 872 5 158 yoerad cvdaeom$sd terad
R 873 5 159 yoerad cvdaeom$p terad
R 874 5 160 yoerad cvdaeom$o terad
R 876 5 162 yoerad cvdaebc terad
R 878 5 164 yoerad cvdaebc$sd terad
R 879 5 165 yoerad cvdaebc$p terad
R 880 5 166 yoerad cvdaebc$o terad
R 882 5 168 yoerad cvdaesu terad
R 884 5 170 yoerad cvdaesu$sd terad
R 885 5 171 yoerad cvdaesu$p terad
R 886 5 172 yoerad cvdaesu$o terad
R 888 5 174 yoerad cecradarch terad
R 889 5 175 yoerad lecradacc terad
R 890 5 176 yoerad necradlen terad
R 891 5 177 yoerad yspectplanck terad
S 902 19 0 0 0 9 1 624 7351 4000 0 A 0 0 0 0 B 0 5 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3 1 0 0 0 0 0 624 0 0 0 0 save
O 902 1 903
S 903 27 0 0 0 9 916 624 7356 0 400000 A 0 0 0 0 B 0 6 0 0 0 0 16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 624 0 0 0 0 save_terad
Q 903 902 0
S 904 19 0 0 0 6 1 624 7367 4000 0 A 0 0 0 0 B 0 9 0 0 0 0 0 0 0 0 0 0 0 0 0 0 5 1 0 0 0 0 0 624 0 0 0 0 load
O 904 1 905
S 905 27 0 0 0 6 920 624 7372 0 400000 A 0 0 0 0 B 0 10 0 0 0 0 17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 624 0 0 0 0 load_terad
Q 905 904 0
S 906 19 0 0 0 9 1 624 7383 4000 0 A 0 0 0 0 B 0 13 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7 1 0 0 0 0 0 624 0 0 0 0 copy
O 906 1 907
S 907 27 0 0 0 9 924 624 7388 0 400000 A 0 0 0 0 B 0 14 0 0 0 0 18 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 624 0 0 0 0 copy_terad
Q 907 906 0
S 908 19 0 0 0 9 1 624 7399 4000 0 A 0 0 0 0 B 0 17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 9 1 0 0 0 0 0 624 0 0 0 0 host
O 908 1 909
S 909 27 0 0 0 9 929 624 7404 0 400000 A 0 0 0 0 B 0 18 0 0 0 0 19 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 624 0 0 0 0 host_terad
Q 909 908 0
S 910 19 0 0 0 9 1 624 7415 4000 0 A 0 0 0 0 B 0 22 0 0 0 0 0 0 0 0 0 0 0 0 0 0 11 1 0 0 0 0 0 624 0 0 0 0 crc64
O 910 1 911
S 911 27 0 0 0 9 932 624 7421 0 400000 A 0 0 0 0 B 0 23 0 0 0 0 20 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 624 0 0 0 0 crc64_terad
Q 911 910 0
S 912 19 0 0 0 9 1 624 7433 4000 0 A 0 0 0 0 B 0 26 0 0 0 0 0 0 0 0 0 0 0 0 0 0 13 1 0 0 0 0 0 624 0 0 0 0 wipe
O 912 1 913
S 913 27 0 0 0 9 937 624 7438 0 400000 A 0 0 0 0 B 0 27 0 0 0 0 21 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 624 0 0 0 0 wipe_terad
Q 913 912 0
S 914 19 0 0 0 9 1 624 2875 4000 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 15 1 0 0 0 0 0 624 0 0 0 0 size
O 914 1 915
S 915 27 0 0 0 9 942 624 7449 0 400000 A 0 0 0 0 B 0 31 0 0 0 0 22 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 624 0 0 0 0 size_terad
Q 915 914 0
S 916 23 5 0 0 0 919 624 7356 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 save_terad
S 917 1 3 1 0 6 1 916 7460 4 3000 A 0 0 0 0 B 0 37 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 klun
S 918 1 3 1 0 103 1 916 7465 4 3008 A 0 0 0 0 B 0 37 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 yd
S 919 14 5 0 0 0 1 916 7356 0 400000 A 0 0 0 0 B 0 0 0 0 0 0 0 6 2 0 0 0 0 0 0 0 0 0 0 0 0 37 0 624 0 0 0 0 save_terad save_terad 
F 919 2 917 918
S 920 23 5 0 0 0 923 624 7372 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 load_terad
S 921 1 3 1 0 6 1 920 7460 4 3000 A 0 0 0 0 B 0 223 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 klun
S 922 1 3 2 0 103 1 920 7465 4 3008 A 0 0 0 0 B 0 223 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 yd
S 923 14 5 0 0 0 1 920 7372 0 400000 A 0 0 0 0 B 0 0 0 0 0 0 0 9 2 0 0 0 0 0 0 0 0 0 0 0 0 223 0 624 0 0 0 0 load_terad load_terad 
F 923 2 921 922
S 924 23 5 0 0 0 928 624 7388 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 copy_terad
S 925 1 3 1 0 103 1 924 7465 4 3008 A 0 0 0 0 B 0 460 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 yd
S 926 1 3 1 0 18 1 924 7468 80000004 3000 A 0 0 0 0 B 0 460 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ldcreated
S 927 1 3 1 0 18 1 924 7478 80000004 3000 A 0 0 0 0 B 0 460 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ldfieldapi
S 928 14 5 0 0 0 1 924 7388 0 400000 A 0 0 0 0 B 0 0 0 0 0 0 0 12 3 0 0 0 0 0 0 0 0 0 0 0 0 460 0 624 0 0 0 0 copy_terad copy_terad 
F 928 3 925 926 927
S 929 23 5 0 0 0 931 624 7404 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 host_terad
S 930 1 3 0 0 103 1 929 7465 4 3008 A 0 0 0 0 B 0 662 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 yd
S 931 14 5 0 0 0 1 929 7404 0 400000 A 0 0 0 0 B 0 0 0 0 0 0 0 16 1 0 0 0 0 0 0 0 0 0 0 0 0 662 0 624 0 0 0 0 host_terad host_terad 
F 931 1 930
S 932 23 5 0 0 0 936 624 7421 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 crc64_terad
S 933 1 3 0 0 103 1 932 7465 4 3008 A 0 0 0 0 B 0 821 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 yd
S 934 1 3 1 0 6 1 932 7460 4 3000 A 0 0 0 0 B 0 821 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 klun
S 935 1 3 1 0 30 1 932 7489 4 43000 A 0 0 0 0 B 0 821 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 cdpath
S 936 14 5 0 0 0 1 932 7421 0 400000 A 0 0 0 0 B 0 0 0 0 0 0 0 18 3 0 0 0 0 0 0 0 0 0 0 0 0 821 0 624 0 0 0 0 crc64_terad crc64_terad 
F 936 3 933 934 935
S 937 23 5 0 0 0 941 624 7438 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 wipe_terad
S 938 1 3 1 0 103 1 937 7465 4 3008 A 0 0 0 0 B 0 1130 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 yd
S 939 1 3 1 0 18 1 937 7496 80000004 3000 A 0 0 0 0 B 0 1130 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 lddeleted
S 940 1 3 1 0 18 1 937 7478 80000004 3000 A 0 0 0 0 B 0 1130 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ldfieldapi
S 941 14 5 0 0 0 1 937 7438 0 400000 A 0 0 0 0 B 0 0 0 0 0 0 0 22 3 0 0 0 0 0 0 0 0 0 0 0 0 1130 0 624 0 0 0 0 wipe_terad wipe_terad 
F 941 3 938 939 940
S 942 23 5 0 0 7 947 624 7449 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 size_terad
S 943 1 3 1 0 103 1 942 7465 4 3008 A 0 0 0 0 B 0 1326 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 yd
S 944 1 3 1 0 30 1 942 7489 80000004 43000 A 0 0 0 0 B 0 1326 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 cdpath
S 945 1 3 1 0 18 1 942 7506 80000004 3000 A 0 0 0 0 B 0 1326 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ldprint
S 946 1 3 0 0 7 1 942 7514 4 1003000 A 0 0 0 0 B 0 1326 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ksize
S 947 14 5 0 0 7 1 942 7449 4 1400000 A 0 0 0 0 B 0 0 0 0 0 0 0 26 3 0 0 946 0 0 0 0 0 0 0 0 0 1326 0 624 0 0 0 0 size_terad size_terad ksize
F 947 3 943 944 945
A 14 2 0 0 0 6 628 0 0 0 14 0 0 0 0 0 0 0 0 0 0 0
A 16 2 0 0 0 6 629 0 0 0 16 0 0 0 0 0 0 0 0 0 0 0
A 27 2 0 0 0 7 654 0 0 0 27 0 0 0 0 0 0 0 0 0 0 0
A 39 2 0 0 0 7 657 0 0 0 39 0 0 0 0 0 0 0 0 0 0 0
A 110 2 0 0 0 6 700 0 0 0 110 0 0 0 0 0 0 0 0 0 0 0
A 111 2 0 0 0 6 701 0 0 0 111 0 0 0 0 0 0 0 0 0 0 0
A 112 2 0 0 0 6 702 0 0 0 112 0 0 0 0 0 0 0 0 0 0 0
A 113 2 0 0 0 10 618 0 0 0 113 0 0 0 0 0 0 0 0 0 0 0
A 114 2 0 0 0 10 703 0 0 0 114 0 0 0 0 0 0 0 0 0 0 0
A 115 2 0 0 0 10 704 0 0 0 115 0 0 0 0 0 0 0 0 0 0 0
A 116 2 0 0 0 18 705 0 0 0 116 0 0 0 0 0 0 0 0 0 0 0
A 117 2 0 0 0 18 706 0 0 0 117 0 0 0 0 0 0 0 0 0 0 0
A 118 2 0 0 0 10 707 0 0 0 118 0 0 0 0 0 0 0 0 0 0 0
A 119 2 0 0 0 10 708 0 0 0 119 0 0 0 0 0 0 0 0 0 0 0
A 120 2 0 0 0 10 709 0 0 0 120 0 0 0 0 0 0 0 0 0 0 0
A 121 2 0 0 0 10 710 0 0 0 121 0 0 0 0 0 0 0 0 0 0 0
A 122 2 0 0 0 22 713 0 0 0 122 0 0 0 0 0 0 0 0 0 0 0
Z
T 669 58 0 0 0 0
A 678 7 82 0 1 2 1
A 677 7 0 27 1 10 1
A 684 7 84 0 1 2 1
A 683 7 0 39 1 10 1
A 690 7 86 0 1 2 1
A 689 7 0 39 1 10 0
T 718 103 0 3 0 0
A 755 6 0 0 1 110 1
A 756 6 0 0 1 14 1
A 757 6 0 0 1 111 1
A 758 6 0 0 1 16 1
A 759 6 0 0 1 111 1
A 760 6 0 0 1 14 1
A 761 6 0 0 1 3 1
A 762 6 0 0 1 14 1
A 763 6 0 0 1 3 1
A 764 6 0 0 1 3 1
A 765 6 0 0 1 112 1
A 766 6 0 0 1 3 1
A 767 6 0 0 1 111 1
A 768 6 0 0 1 111 1
A 769 6 0 0 1 2 1
A 770 6 0 0 1 2 1
A 771 6 0 0 1 2 1
A 772 6 0 0 1 111 1
A 773 10 0 0 1 113 1
A 774 10 0 0 1 114 1
A 775 10 0 0 1 115 1
A 776 18 0 0 1 116 1
A 777 18 0 0 1 116 1
A 778 18 0 0 1 117 1
A 779 18 0 0 1 116 1
A 784 18 0 0 1 117 1
A 785 18 0 0 1 117 1
A 786 10 0 0 1 118 1
A 787 10 0 0 1 119 1
A 788 10 0 0 1 120 1
A 789 10 0 0 1 121 1
A 849 22 0 0 1 122 1
A 850 22 0 0 1 122 1
A 851 22 0 0 1 122 1
T 891 91 0 3 0 0
A 678 7 97 0 1 2 1
A 677 7 0 27 1 10 1
A 684 7 99 0 1 2 1
A 683 7 0 39 1 10 1
A 690 7 101 0 1 2 1
A 689 7 0 39 1 10 0
Z
