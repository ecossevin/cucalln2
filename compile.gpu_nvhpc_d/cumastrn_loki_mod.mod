V34 :0x24 cumastrn_loki_mod
22 cumastrn.scc_stack.F90 S624 0
03/19/2025  06:55:37
use yomsphyhist private
use yomsrftlad private
use yoe_cuconvca private
use yoecld private
use yoephy private
use spp_def_mod private
use yoe_aerodiag private
use spp_gen_mod private
use yompertpar private
use spp_mod private
use yomchem private
use yom_ygfl private
use model_physics_ecmwf_mod private
use model_physics_simplinear_mod private
use yomcst private
use yoethf private
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
D 58 20 26
D 60 26 668 200 667 7
D 66 23 10 1 11 37 0 0 0 0 0
 0 37 11 11 37 37
D 69 23 10 1 11 37 0 0 0 0 0
 0 37 11 11 37 37
D 72 23 6 1 11 38 0 0 0 0 0
 0 38 11 11 38 38
D 78 26 693 848 692 7
D 133 26 816 1248 815 7
D 165 26 992 212 991 3
D 193 26 693 848 692 7
D 199 20 26
D 201 20 26
D 203 26 992 212 991 3
D 209 26 1081 3776 1080 7
D 228 26 1115 304 1113 7
D 246 22 199
D 251 26 1172 12144 1171 7
D 279 22 7
D 281 22 7
D 286 20 129
D 288 23 286 1 11 41 0 0 0 0 0
 0 41 11 11 41 41
D 291 23 286 1 11 41 0 0 0 0 0
 0 41 11 11 41 41
D 306 20 18
D 308 23 306 1 11 244 0 0 0 0 0
 0 244 11 11 244 244
D 311 23 306 1 11 244 0 0 0 0 0
 0 244 11 11 244 244
D 318 20 129
D 332 20 18
D 340 26 1356 376 1355 7
D 348 20 2
D 355 22 340
D 360 26 1434 256 1433 7
D 369 26 1488 1378824 1487 7
D 690 22 340
D 692 22 340
D 694 22 340
D 696 22 340
D 698 22 340
D 700 22 340
D 702 22 340
D 704 22 340
D 706 22 340
D 708 22 340
D 710 22 340
D 712 22 340
D 714 22 340
D 716 22 340
D 718 22 340
D 720 22 340
D 722 22 340
D 724 22 340
D 726 22 340
D 728 22 340
D 730 22 340
D 732 22 340
D 734 22 340
D 736 22 340
D 738 22 340
D 740 22 340
D 742 22 340
D 744 22 340
D 746 22 340
D 748 22 340
D 750 22 340
D 752 22 340
D 754 22 340
D 756 22 340
D 758 22 340
D 760 22 340
D 762 22 340
D 764 22 340
D 766 22 340
D 768 22 340
D 770 22 340
D 772 22 340
D 774 22 340
D 776 22 340
D 778 22 340
D 780 22 340
D 782 22 340
D 784 22 340
D 786 22 340
D 788 22 340
D 790 22 340
D 792 22 340
D 794 22 340
D 796 22 340
D 798 22 340
D 800 22 340
D 802 22 340
D 804 22 340
D 806 22 340
D 808 22 340
D 810 22 340
D 812 22 340
D 814 22 340
D 816 22 340
D 818 22 340
D 820 22 340
D 835 26 1919 8 1918 7
D 844 26 1922 8 1921 7
D 865 26 1990 448 1989 7
D 884 26 2103 352 2102 7
D 896 22 7
D 937 26 2402 6264 2401 7
D 1095 22 7
D 1097 22 7
D 1099 22 7
D 1101 22 7
D 1103 22 7
D 1105 22 7
D 1107 22 7
D 1109 22 7
D 1111 22 7
D 1113 22 7
D 1115 22 7
D 1117 22 7
D 1119 22 7
D 1121 22 7
D 1123 22 7
D 1125 22 7
D 1127 22 7
D 1129 22 7
D 1131 22 7
D 1133 22 7
D 1135 22 7
D 1137 22 7
D 1199 26 1990 448 1989 7
D 1205 26 2103 352 2102 7
D 1211 22 7
D 1231 26 2402 6264 2401 7
D 1237 22 7
D 1239 22 7
D 1241 22 7
D 1243 22 7
D 1245 22 7
D 1247 22 7
D 1249 22 7
D 1251 22 7
D 1253 22 7
D 1255 22 7
D 1257 22 7
D 1259 22 7
D 1261 22 7
D 1263 22 7
D 1265 22 7
D 1267 22 7
D 1269 22 7
D 1271 22 7
D 1273 22 7
D 1275 22 7
D 1277 22 7
D 1279 22 7
D 1299 26 2701 10712 2700 7
D 1379 26 2851 504 2850 7
D 1397 22 7
D 1399 22 7
D 1404 26 2878 1800 2875 7
D 1464 22 10
D 1466 22 10
D 1468 22 10
D 1470 22 10
D 1472 22 10
D 1474 22 10
D 1476 22 10
D 1478 22 10
D 1480 22 10
D 1527 26 2851 504 2850 7
D 1533 22 7
D 1535 22 7
D 1537 26 2878 1800 2875 7
D 1561 26 2954 1224 2953 7
D 1573 22 1537
D 1587 20 18
D 1589 26 2975 592 2974 7
D 1595 26 2656 184 2655 7
D 1601 26 816 1248 815 7
D 1607 26 693 848 692 7
D 1613 26 1081 3776 1080 7
D 1619 26 1488 1378824 1487 7
D 1625 26 2701 10712 2700 7
D 1631 26 2954 1224 2953 7
D 1637 26 1172 12144 1171 7
D 1643 23 18 1 11 994 0 0 1 0 0
 0 993 11 11 994 994
D 1646 23 10 2 995 999 0 0 1 0 0
 0 993 11 11 994 994
 0 997 994 11 998 998
D 1649 23 10 2 995 999 0 0 1 0 0
 0 993 11 11 994 994
 0 997 994 11 998 998
D 1652 23 10 2 995 999 0 0 1 0 0
 0 993 11 11 994 994
 0 997 994 11 998 998
D 1655 23 10 2 995 999 0 0 1 0 0
 0 993 11 11 994 994
 0 997 994 11 998 998
D 1658 23 10 2 995 999 0 0 1 0 0
 0 993 11 11 994 994
 0 997 994 11 998 998
D 1661 23 10 2 995 999 0 0 1 0 0
 0 993 11 11 994 994
 0 997 994 11 998 998
D 1664 23 10 2 995 999 0 0 1 0 0
 0 993 11 11 994 994
 0 997 994 11 998 998
D 1667 23 10 2 995 999 0 0 1 0 0
 0 993 11 11 994 994
 0 997 994 11 998 998
D 1670 23 10 2 995 1003 0 0 1 0 0
 0 993 11 11 994 994
 0 1001 994 11 1002 1002
D 1673 23 10 2 995 1003 0 0 1 0 0
 0 993 11 11 994 994
 0 1001 994 11 1002 1002
D 1676 23 10 2 995 999 0 0 1 0 0
 0 993 11 11 994 994
 0 997 994 11 998 998
D 1679 23 10 2 995 1003 0 0 1 0 0
 0 993 11 11 994 994
 0 1001 994 11 1002 1002
D 1682 23 10 2 995 999 0 0 1 0 0
 0 993 11 11 994 994
 0 997 994 11 998 998
D 1685 23 10 2 995 1003 0 0 1 0 0
 0 993 11 11 994 994
 0 1001 994 11 1002 1002
D 1688 23 10 1 11 994 0 0 1 0 0
 0 993 11 11 994 994
D 1691 23 10 1 11 994 0 0 1 0 0
 0 993 11 11 994 994
D 1694 23 10 2 995 1011 0 0 1 0 0
 0 993 11 11 994 994
 0 1009 994 11 1010 1010
D 1697 23 10 3 1012 1016 0 0 1 0 0
 0 993 11 11 994 994
 0 997 994 11 998 998
 0 1014 999 11 1015 1015
D 1700 23 10 1 11 1015 0 0 1 0 0
 0 1014 11 11 1015 1015
D 1703 23 10 1 11 1015 0 0 1 0 0
 0 1014 11 11 1015 1015
D 1706 23 10 1 11 994 0 0 1 0 0
 0 993 11 11 994 994
D 1709 23 10 2 995 999 0 0 1 0 0
 0 993 11 11 994 994
 0 997 994 11 998 998
D 1712 23 10 2 995 999 0 0 1 0 0
 0 993 11 11 994 994
 0 997 994 11 998 998
D 1715 23 10 2 995 999 0 0 1 0 0
 0 993 11 11 994 994
 0 997 994 11 998 998
D 1718 23 10 2 995 999 0 0 1 0 0
 0 993 11 11 994 994
 0 997 994 11 998 998
D 1721 23 10 2 995 999 0 0 1 0 0
 0 993 11 11 994 994
 0 997 994 11 998 998
D 1724 23 10 2 995 999 0 0 1 0 0
 0 993 11 11 994 994
 0 997 994 11 998 998
D 1727 23 10 3 1012 1016 0 0 1 0 0
 0 993 11 11 994 994
 0 997 994 11 998 998
 0 1014 999 11 1015 1015
D 1730 23 18 1 11 994 0 0 1 0 0
 0 993 11 11 994 994
D 1733 23 6 1 11 994 0 0 1 0 0
 0 993 11 11 994 994
D 1736 23 6 1 11 994 0 0 1 0 0
 0 993 11 11 994 994
D 1739 23 6 1 11 994 0 0 1 0 0
 0 993 11 11 994 994
D 1742 23 18 1 11 994 0 0 1 0 0
 0 993 11 11 994 994
D 1745 23 6 1 11 994 0 0 1 0 0
 0 993 11 11 994 994
D 1748 23 6 1 11 994 0 0 1 0 0
 0 993 11 11 994 994
D 1751 23 6 1 11 994 0 0 1 0 0
 0 993 11 11 994 994
D 1754 23 18 1 11 994 0 0 1 0 0
 0 993 11 11 994 994
D 1757 23 18 1 11 994 0 0 1 0 0
 0 993 11 11 994 994
D 1760 23 10 2 995 999 0 0 1 0 0
 0 993 11 11 994 994
 0 997 994 11 998 998
D 1763 23 10 2 995 999 0 0 1 0 0
 0 993 11 11 994 994
 0 997 994 11 998 998
D 1766 23 10 2 995 999 0 0 1 0 0
 0 993 11 11 994 994
 0 997 994 11 998 998
D 1769 23 10 2 995 999 0 0 1 0 0
 0 993 11 11 994 994
 0 997 994 11 998 998
D 1772 23 10 3 1012 1017 0 0 1 0 0
 0 993 11 11 994 994
 0 997 994 11 998 998
 0 37 999 11 37 37
D 1775 23 10 3 1012 1018 0 0 1 0 0
 0 993 11 11 994 994
 0 997 994 11 998 998
 0 38 999 11 38 38
D 1778 23 10 2 995 999 0 0 1 0 0
 0 993 11 11 994 994
 0 997 994 11 998 998
D 1781 23 10 2 995 1003 0 0 1 0 0
 0 993 11 11 994 994
 0 1001 994 11 1002 1002
D 1784 23 10 2 995 1003 0 0 1 0 0
 0 993 11 11 994 994
 0 1001 994 11 1002 1002
D 1787 23 10 1 11 994 0 0 1 0 0
 0 993 11 11 994 994
D 1790 23 10 2 995 999 0 0 1 0 0
 0 993 11 11 994 994
 0 997 994 11 998 998
D 1793 23 10 3 1012 1018 0 0 1 0 0
 0 993 11 11 994 994
 0 997 994 11 998 998
 0 38 999 11 38 38
D 1796 23 10 2 995 999 0 0 1 0 0
 0 993 11 11 994 994
 0 997 994 11 998 998
D 1799 23 10 2 995 999 0 0 1 0 0
 0 993 11 11 994 994
 0 997 994 11 998 998
D 1802 23 10 2 995 999 0 0 1 0 0
 0 993 11 11 994 994
 0 997 994 11 998 998
D 1805 23 10 2 995 999 0 0 1 0 0
 0 993 11 11 994 994
 0 997 994 11 998 998
D 1808 23 10 2 995 999 0 0 1 0 0
 0 993 11 11 994 994
 0 997 994 11 998 998
D 1811 23 10 1 11 994 0 0 1 0 0
 0 993 11 11 994 994
D 1814 23 10 1 11 994 0 0 1 0 0
 0 993 11 11 994 994
D 1817 23 10 1 11 994 0 0 1 0 0
 0 993 11 11 994 994
D 1820 23 10 2 995 999 0 0 1 0 0
 0 993 11 11 994 994
 0 997 994 11 998 998
D 1823 23 10 2 995 999 0 0 1 0 0
 0 993 11 11 994 994
 0 997 994 11 998 998
S 624 24 0 0 0 9 1 0 5012 10005 0 A 0 0 0 0 B 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 cumastrn_loki_mod
S 628 3 0 0 0 6 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6
S 641 3 0 0 0 6 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6
S 644 3 0 0 0 201 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 5106 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 20 16 3f 3f 3f 3f 3f 3f 3f 3f 3f 3f 3f 3f 3f 3f 3f 3f
S 645 3 0 0 0 18 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 18
S 646 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
S 647 3 0 0 0 10 1 1 8856 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 2146435071 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10 huge(1.0_8)
S 648 3 0 0 0 10 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 -1048577 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10
S 649 3 0 0 0 18 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 -1 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 18
S 650 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
S 651 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
S 655 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 7 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
S 656 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
R 667 25 10 spp_gen_mod spp_pert
R 668 5 11 spp_gen_mod label spp_pert
R 669 5 12 spp_gen_mod on spp_pert
R 670 5 13 spp_gen_mod idistr spp_pert
R 671 5 14 spp_gen_mod xmag spp_pert
R 672 5 15 spp_gen_mod mu spp_pert
R 673 5 16 spp_gen_mod xclipmin spp_pert
R 674 5 17 spp_gen_mod xclipmax spp_pert
R 675 5 18 spp_gen_mod xuniform_offset spp_pert
R 676 5 19 spp_gen_mod nmag spp_pert
R 677 5 20 spp_gen_mod ln1 spp_pert
R 678 5 21 spp_gen_mod nseed_off spp_pert
R 679 5 22 spp_gen_mod noff spp_pert
R 680 5 23 spp_gen_mod nrf spp_pert
R 681 5 24 spp_gen_mod nrf_radgrid spp_pert
R 682 5 25 spp_gen_mod radgrid spp_pert
R 683 5 26 spp_gen_mod rf_pert_label spp_pert
R 684 5 27 spp_gen_mod ic spp_pert
R 685 5 28 spp_gen_mod mp spp_pert
R 686 5 29 spp_gen_mod mp_radgrid spp_pert
R 687 5 30 spp_gen_mod tau spp_pert
R 688 5 31 spp_gen_mod sdev spp_pert
R 689 5 32 spp_gen_mod xlcor spp_pert
R 692 25 35 spp_gen_mod spp_model
R 693 5 36 spp_gen_mod version spp_model
R 694 5 37 spp_gen_mod nmax spp_model
R 696 5 39 spp_gen_mod defined_perts spp_model
R 697 5 40 spp_gen_mod defined_perts$sd spp_model
R 698 5 41 spp_gen_mod defined_perts$p spp_model
R 699 5 42 spp_gen_mod defined_perts$o spp_model
R 702 5 45 spp_gen_mod active_perts spp_model
R 703 5 46 spp_gen_mod active_perts$sd spp_model
R 704 5 47 spp_gen_mod active_perts$p spp_model
R 705 5 48 spp_gen_mod active_perts$o spp_model
R 707 5 50 spp_gen_mod ndef spp_model
R 708 5 51 spp_gen_mod nact spp_model
R 709 5 52 spp_gen_mod nrftotal spp_model
R 710 5 53 spp_gen_mod nrftotal_radgrid spp_model
R 712 5 55 spp_gen_mod nseed_off spp_model
R 713 5 56 spp_gen_mod nseed_off$sd spp_model
R 714 5 57 spp_gen_mod nseed_off$p spp_model
R 715 5 58 spp_gen_mod nseed_off$o spp_model
R 718 5 61 spp_gen_mod pndef spp_model
R 719 5 62 spp_gen_mod pndef$sd spp_model
R 720 5 63 spp_gen_mod pndef$p spp_model
R 721 5 64 spp_gen_mod pndef$o spp_model
R 724 5 67 spp_gen_mod pn spp_model
R 725 5 68 spp_gen_mod pn$sd spp_model
R 726 5 69 spp_gen_mod pn$p spp_model
R 727 5 70 spp_gen_mod pn$o spp_model
R 729 5 72 spp_gen_mod tau spp_model
R 730 5 73 spp_gen_mod xlcor spp_model
R 731 5 74 spp_gen_mod sdev spp_model
R 732 5 75 spp_gen_mod kseed_off spp_model
R 815 25 3 yompertpar tpertpar
R 816 5 4 yompertpar lpertpar tpertpar
R 817 5 5 yompertpar nseed_mbr tpertpar
R 818 5 6 yompertpar lpert_rmfdeps tpertpar
R 819 5 7 yompertpar rmfdeps_max tpertpar
R 820 5 8 yompertpar rmfdeps_min tpertpar
R 821 5 9 yompertpar lpert_rprcon tpertpar
R 822 5 10 yompertpar rprcon_max tpertpar
R 823 5 11 yompertpar rprcon_min tpertpar
R 824 5 12 yompertpar lpert_entrorg tpertpar
R 825 5 13 yompertpar entrorg_max tpertpar
R 826 5 14 yompertpar entrorg_min tpertpar
R 827 5 15 yompertpar lpert_detrpen tpertpar
R 828 5 16 yompertpar detrpen_max tpertpar
R 829 5 17 yompertpar detrpen_min tpertpar
R 830 5 18 yompertpar lpert_rtaufac tpertpar
R 831 5 19 yompertpar rtaufac_max tpertpar
R 832 5 20 yompertpar rtaufac_min tpertpar
R 833 5 21 yompertpar lpert_cuduv tpertpar
R 834 5 22 yompertpar cudu_mod tpertpar
R 835 5 23 yompertpar cudv_mod tpertpar
R 836 5 24 yompertpar cuduv_max tpertpar
R 837 5 25 yompertpar cuduv_min tpertpar
R 838 5 26 yompertpar lpert_gcvre tpertpar
R 839 5 27 yompertpar gcvre_max tpertpar
R 840 5 28 yompertpar gcvre_min tpertpar
R 841 5 29 yompertpar lpert_gcvez tpertpar
R 842 5 30 yompertpar gcvez_max tpertpar
R 843 5 31 yompertpar gcvez_min tpertpar
R 844 5 32 yompertpar lpert_gcvuv tpertpar
R 845 5 33 yompertpar gcvuv_max tpertpar
R 846 5 34 yompertpar gcvuv_min tpertpar
R 847 5 35 yompertpar lpert_akn tpertpar
R 848 5 36 yompertpar akn_max tpertpar
R 849 5 37 yompertpar akn_min tpertpar
R 850 5 38 yompertpar lpert_ald tpertpar
R 851 5 39 yompertpar ald_max tpertpar
R 852 5 40 yompertpar ald_min tpertpar
R 853 5 41 yompertpar lpert_alphat tpertpar
R 854 5 42 yompertpar alphat_max tpertpar
R 855 5 43 yompertpar alphat_min tpertpar
R 856 5 44 yompertpar lpert_almave tpertpar
R 857 5 45 yompertpar almave_max tpertpar
R 858 5 46 yompertpar almave_min tpertpar
R 859 5 47 yompertpar lpert_tfvl tpertpar
R 860 5 48 yompertpar tfvl_min tpertpar
R 861 5 49 yompertpar tfvl_max tpertpar
R 862 5 50 yompertpar lpert_tfvr tpertpar
R 863 5 51 yompertpar tfvr_min tpertpar
R 864 5 52 yompertpar tfvr_max tpertpar
R 865 5 53 yompertpar lpert_tfvs tpertpar
R 866 5 54 yompertpar tfvs_min tpertpar
R 867 5 55 yompertpar tfvs_max tpertpar
R 868 5 56 yompertpar lpert_tfvi tpertpar
R 869 5 57 yompertpar tfvi_min tpertpar
R 870 5 58 yompertpar tfvi_max tpertpar
R 871 5 59 yompertpar lpert_rautefr tpertpar
R 872 5 60 yompertpar rautefr_min tpertpar
R 873 5 61 yompertpar rautefr_max tpertpar
R 874 5 62 yompertpar lpert_rautefs tpertpar
R 875 5 63 yompertpar rautefs_min tpertpar
R 876 5 64 yompertpar rautefs_max tpertpar
R 877 5 65 yompertpar lpert_rqicrmin tpertpar
R 878 5 66 yompertpar rqicrmin_min tpertpar
R 879 5 67 yompertpar rqicrmin_max tpertpar
R 880 5 68 yompertpar lpert_rqicrmax tpertpar
R 881 5 69 yompertpar rqicrmax_min tpertpar
R 882 5 70 yompertpar rqicrmax_max tpertpar
R 883 5 71 yompertpar lpert_rqlcr tpertpar
R 884 5 72 yompertpar rqlcr_min tpertpar
R 885 5 73 yompertpar rqlcr_max tpertpar
R 886 5 74 yompertpar lpert_raccef tpertpar
R 887 5 75 yompertpar raccef_min tpertpar
R 888 5 76 yompertpar raccef_max tpertpar
R 889 5 77 yompertpar lpert_rrimef tpertpar
R 890 5 78 yompertpar rrimef_min tpertpar
R 891 5 79 yompertpar rrimef_max tpertpar
R 892 5 80 yompertpar lpert_raggef tpertpar
R 893 5 81 yompertpar raggef_min tpertpar
R 894 5 82 yompertpar raggef_max tpertpar
R 895 5 83 yompertpar lpert_revasx tpertpar
R 896 5 84 yompertpar revasx_min tpertpar
R 897 5 85 yompertpar revasx_max tpertpar
R 898 5 86 yompertpar lpert_rdtfac tpertpar
R 899 5 87 yompertpar rdtfac_min tpertpar
R 900 5 88 yompertpar rdtfac_max tpertpar
R 901 5 89 yompertpar lpert_rhcrit1 tpertpar
R 902 5 90 yompertpar rhcrit1_min tpertpar
R 903 5 91 yompertpar rhcrit1_max tpertpar
R 904 5 92 yompertpar lpert_grhcmod tpertpar
R 905 5 93 yompertpar grhcmod_min tpertpar
R 906 5 94 yompertpar grhcmod_max tpertpar
R 907 5 95 yompertpar lpert_gwdcd tpertpar
R 908 5 96 yompertpar gwdcd_min tpertpar
R 909 5 97 yompertpar gwdcd_max tpertpar
R 910 5 98 yompertpar lpert_gwdse tpertpar
R 911 5 99 yompertpar gwdse_min tpertpar
R 912 5 100 yompertpar gwdse_max tpertpar
R 913 5 101 yompertpar lpert_hobst tpertpar
R 914 5 102 yompertpar hobst_min tpertpar
R 915 5 103 yompertpar hobst_max tpertpar
R 916 5 104 yompertpar lpert_rratsea tpertpar
R 917 5 105 yompertpar rratsea_min tpertpar
R 918 5 106 yompertpar rratsea_max tpertpar
R 919 5 107 yompertpar lpert_rratland tpertpar
R 920 5 108 yompertpar rratland_min tpertpar
R 921 5 109 yompertpar rratland_max tpertpar
R 922 5 110 yompertpar lpert_rratdri tpertpar
R 923 5 111 yompertpar rratdri_max tpertpar
R 924 5 112 yompertpar rratdri_min tpertpar
R 925 5 113 yompertpar lpert_rcadecor tpertpar
R 926 5 114 yompertpar rcadecor_max tpertpar
R 927 5 115 yompertpar rcadecor_min tpertpar
R 928 5 116 yompertpar lpert_rcbdecor tpertpar
R 929 5 117 yompertpar rcbdecor_max tpertpar
R 930 5 118 yompertpar rcbdecor_min tpertpar
R 931 5 119 yompertpar lpert_rsigma2 tpertpar
R 932 5 120 yompertpar rsigma2_max tpertpar
R 933 5 121 yompertpar rsigma2_min tpertpar
R 934 5 122 yompertpar lpert_rfacdice tpertpar
R 935 5 123 yompertpar rfacdice_max tpertpar
R 936 5 124 yompertpar rfacdice_min tpertpar
R 937 5 125 yompertpar lpert_xrimax tpertpar
R 938 5 126 yompertpar xrimax_min tpertpar
R 939 5 127 yompertpar xrimax_max tpertpar
R 940 5 128 yompertpar lpert_xfracz0 tpertpar
R 941 5 129 yompertpar xfracz0_min tpertpar
R 942 5 130 yompertpar xfracz0_max tpertpar
R 943 5 131 yompertpar lpert_otadjs tpertpar
R 944 5 132 yompertpar otadjs_min tpertpar
R 945 5 133 yompertpar otadjs_max tpertpar
R 946 5 134 yompertpar lpert_xentr tpertpar
R 947 5 135 yompertpar xentr_min tpertpar
R 948 5 136 yompertpar xentr_max tpertpar
R 949 5 137 yompertpar lpert_xatpert tpertpar
R 950 5 138 yompertpar xatpert_min tpertpar
R 951 5 139 yompertpar xatpert_max tpertpar
R 952 5 140 yompertpar lpert_xbtpert tpertpar
R 953 5 141 yompertpar xbtpert_min tpertpar
R 954 5 142 yompertpar xbtpert_max tpertpar
R 955 5 143 yompertpar lpert_xdtpert tpertpar
R 956 5 144 yompertpar xdtpert_min tpertpar
R 957 5 145 yompertpar xdtpert_max tpertpar
R 958 5 146 yompertpar lpert_xaw tpertpar
R 959 5 147 yompertpar xaw_min tpertpar
R 960 5 148 yompertpar xaw_max tpertpar
R 961 5 149 yompertpar lpert_xbw tpertpar
R 962 5 150 yompertpar xbw_min tpertpar
R 963 5 151 yompertpar xbw_max tpertpar
R 964 5 152 yompertpar lpert_rkfbtau tpertpar
R 965 5 153 yompertpar rkfbtau_min tpertpar
R 966 5 154 yompertpar rkfbtau_max tpertpar
R 967 5 155 yompertpar lpert_rkfbnbx tpertpar
R 968 5 156 yompertpar rkfbnbx_min tpertpar
R 969 5 157 yompertpar rkfbnbx_max tpertpar
R 970 5 158 yompertpar lpert_xpertflux tpertpar
R 971 5 159 yompertpar xpertflux_max tpertpar
R 972 5 160 yompertpar xpertflux_min tpertpar
S 988 3 0 0 0 6 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 -1 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6
R 991 25 3 spp_def_mod spp_pert_pointer
R 992 5 4 spp_def_mod cfm spp_pert_pointer
R 993 5 5 spp_def_mod cfm1 spp_pert_pointer
R 994 5 6 spp_def_mod cfm2 spp_pert_pointer
R 995 5 7 spp_def_mod cfm3 spp_pert_pointer
R 996 5 8 spp_def_mod rkap spp_pert_pointer
R 997 5 9 spp_def_mod rkap1 spp_pert_pointer
R 998 5 10 spp_def_mod rkap2 spp_pert_pointer
R 999 5 11 spp_def_mod rkap3 spp_pert_pointer
R 1000 5 12 spp_def_mod tofdc spp_pert_pointer
R 1001 5 13 spp_def_mod hsdt spp_pert_pointer
R 1002 5 14 spp_def_mod vdexc spp_pert_pointer
R 1003 5 15 spp_def_mod entrorg spp_pert_pointer
R 1004 5 16 spp_def_mod entshalp spp_pert_pointer
R 1005 5 17 spp_def_mod entstpc1 spp_pert_pointer
R 1006 5 18 spp_def_mod detrpen spp_pert_pointer
R 1007 5 19 spp_def_mod rprcon spp_pert_pointer
R 1008 5 20 spp_def_mod rtau spp_pert_pointer
R 1009 5 21 spp_def_mod cududv spp_pert_pointer
R 1010 5 22 spp_def_mod cududvs spp_pert_pointer
R 1011 5 23 spp_def_mod ramid spp_pert_pointer
R 1012 5 24 spp_def_mod rcldiff spp_pert_pointer
R 1013 5 25 spp_def_mod rclcrit spp_pert_pointer
R 1014 5 26 spp_def_mod rlcritsnow spp_pert_pointer
R 1015 5 27 spp_def_mod rainevap spp_pert_pointer
R 1016 5 28 spp_def_mod snowsublim spp_pert_pointer
R 1017 5 29 spp_def_mod cloudinhom spp_pert_pointer
R 1018 5 30 spp_def_mod qsatvervel spp_pert_pointer
R 1019 5 31 spp_def_mod zdecorr spp_pert_pointer
R 1020 5 32 spp_def_mod zsigqcw spp_pert_pointer
R 1021 5 33 spp_def_mod zradeffl spp_pert_pointer
R 1022 5 34 spp_def_mod zradeffi spp_pert_pointer
R 1023 5 35 spp_def_mod phr spp_pert_pointer
R 1024 5 36 spp_def_mod zhs_vdaero spp_pert_pointer
R 1025 5 37 spp_def_mod delta_aero spp_pert_pointer
R 1026 5 38 spp_def_mod psigqsat spp_pert_pointer
R 1027 5 39 spp_def_mod clddpth spp_pert_pointer
R 1028 5 40 spp_def_mod clddpthdp spp_pert_pointer
R 1029 5 41 spp_def_mod ice_cld_wgt spp_pert_pointer
R 1030 5 42 spp_def_mod icenu spp_pert_pointer
R 1031 5 43 spp_def_mod kgn_acon spp_pert_pointer
R 1032 5 44 spp_def_mod kgn_sbgr spp_pert_pointer
R 1033 5 45 spp_def_mod radgr spp_pert_pointer
R 1034 5 46 spp_def_mod radsn spp_pert_pointer
R 1035 5 47 spp_def_mod rfac_twoc spp_pert_pointer
R 1036 5 48 spp_def_mod rzc_h spp_pert_pointer
R 1037 5 49 spp_def_mod rzl_inf spp_pert_pointer
R 1038 5 50 spp_def_mod rswinhf spp_pert_pointer
R 1039 5 51 spp_def_mod rlwinhf spp_pert_pointer
R 1040 5 52 spp_def_mod alpha spp_pert_pointer
R 1041 5 53 spp_def_mod rznuc spp_pert_pointer
R 1042 5 54 spp_def_mod rzmfdry spp_pert_pointer
R 1043 5 55 spp_def_mod rzmbclosure spp_pert_pointer
R 1044 5 56 spp_def_mod slwind spp_pert_pointer
R 1045 5 57 spp_def_mod set$tbp$0 spp_pert_pointer
R 1080 25 10 spp_mod tspp_config
R 1081 5 11 spp_mod lspp tspp_config
R 1082 5 12 spp_mod cspp_model_name tspp_config
R 1083 5 13 spp_mod sm tspp_config
R 1084 5 14 spp_mod pptr tspp_config
R 1085 5 15 spp_mod lramidlimit1 tspp_config
R 1086 5 16 spp_mod luse_setran tspp_config
R 1087 5 17 spp_mod lnseed_offs0 tspp_config
R 1088 5 18 spp_mod lrdpatinit tspp_config
R 1089 5 19 spp_mod lwrpattrun tspp_config
R 1090 5 20 spp_mod nwrpattrun tspp_config
R 1091 5 21 spp_mod nhour_pattrun tspp_config
R 1092 5 22 spp_mod nstep_pattrun tspp_config
R 1093 5 23 spp_mod lresetseed tspp_config
R 1094 5 24 spp_mod labstimseed tspp_config
R 1095 5 25 spp_mod resetseedfrq tspp_config
R 1096 5 26 spp_mod shiftseed tspp_config
R 1097 5 27 spp_mod spp_rdpatinit tspp_config
R 1098 5 28 spp_mod spp_wrpattrun tspp_config
R 1099 5 29 spp_mod iseedfac tspp_config
R 1100 5 30 spp_mod iezdiag_pos tspp_config
R 1101 5 31 spp_mod npatfr tspp_config
R 1102 5 32 spp_mod xpress_phr_st tspp_config
R 1103 5 33 spp_mod lspg_spp tspp_config
R 1104 5 34 spp_mod spgmu tspp_config
R 1105 5 35 spp_mod spglambda tspp_config
R 1106 5 36 spp_mod spgsigma tspp_config
R 1107 5 37 spp_mod spgq tspp_config
R 1108 5 38 spp_mod spgadtmin tspp_config
R 1109 5 39 spp_mod spgadtmax tspp_config
R 1110 5 40 spp_mod spgtdt tspp_config
R 1113 25 43 spp_mod tspp_data
R 1115 5 45 spp_mod igribcode tspp_data
R 1116 5 46 spp_mod igribcode$sd tspp_data
R 1117 5 47 spp_mod igribcode$p tspp_data
R 1118 5 48 spp_mod igribcode$o tspp_data
R 1121 5 51 spp_mod lab_arp tspp_data
R 1122 5 52 spp_mod lab_arp$sd tspp_data
R 1123 5 53 spp_mod lab_arp$p tspp_data
R 1124 5 54 spp_mod lab_arp$o tspp_data
S 1132 3 0 0 0 6 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6
S 1147 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
S 1150 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 23 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
S 1151 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 18 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
R 1171 25 19 yomchem tchem
R 1172 5 20 yomchem chem_scheme tchem
R 1173 5 21 yomchem lchem_diac tchem
R 1174 5 22 yomchem lchem_bascoe_jon tchem
R 1175 5 23 yomchem lchem_bascoe_hetchem tchem
R 1176 5 24 yomchem lchem_extendjno2 tchem
R 1177 5 25 yomchem lmozart_rsf_dummy tchem
R 1178 5 26 yomchem lchem_jout tchem
R 1179 5 27 yomchem lchem_light tchem
R 1180 5 28 yomchem rchem_linox_scaling tchem
R 1181 5 29 yomchem lchem_acnox tchem
R 1182 5 30 yomchem kchem_noxadv tchem
R 1183 5 31 yomchem kchem_wetdep tchem
R 1184 5 32 yomchem kchem_drydep tchem
R 1185 5 33 yomchem lchem_revchem tchem
R 1186 5 34 yomchem lchem_stma tchem
R 1187 5 35 yomchem lchem_anao3 tchem
R 1188 5 36 yomchem smasscor tchem
R 1189 5 37 yomchem lchem_0nox tchem
R 1190 5 38 yomchem lchem_anach4 tchem
R 1191 5 39 yomchem lchem_weak_ch4_relaxation tchem
R 1192 5 40 yomchem lchem_convscav tchem
R 1193 5 41 yomchem lchem_cshape tchem
R 1194 5 42 yomchem lchem_cshape98 tchem
R 1195 5 43 yomchem lchem_wdfr tchem
R 1196 5 44 yomchem lchem_htap tchem
R 1197 5 45 yomchem kchem_yearpi tchem
R 1198 5 46 yomchem rch4const tchem
R 1199 5 47 yomchem kchem_solve tchem
R 1200 5 48 yomchem lchem_o3rad tchem
R 1201 5 49 yomchem lchem_tl tchem
R 1202 5 50 yomchem lchem_aeroi tchem
R 1203 5 51 yomchem iextr_free tchem
R 1204 5 52 yomchem nucoch1 tchem
R 1205 5 53 yomchem nucoch2 tchem
R 1206 5 54 yomchem nchem_lcocoef tchem
R 1207 5 55 yomchem chem_lcovers tchem
R 1208 5 56 yomchem lchem_lcomeso tchem
R 1209 5 57 yomchem lchem_lcocstclim tchem
R 1210 5 58 yomchem rchem_lcotautop tchem
R 1211 5 59 yomchem rchem_lcoclimtop tchem
R 1212 5 60 yomchem lchem_lcolimit tchem
R 1213 5 61 yomchem rchem_lcocoefa1 tchem
R 1214 5 62 yomchem csolmet_asis tchem
R 1215 5 63 yomchem m_soliter_asis tchem
R 1216 5 64 yomchem solcv_asis tchem
R 1217 5 65 yomchem rtol_asis tchem
R 1218 5 66 yomchem atol_asis tchem
R 1219 5 67 yomchem n_f_rtol_asis tchem
R 1220 5 68 yomchem n_f_atol_asis tchem
R 1221 5 69 yomchem tco2dg tchem
R 1224 5 72 yomchem tco2dg$sd tchem
R 1225 5 73 yomchem tco2dg$p tchem
R 1226 5 74 yomchem tco2dg$o tchem
R 1228 5 76 yomchem tcotop tchem
R 1230 5 78 yomchem tcotop$sd tchem
R 1231 5 79 yomchem tcotop$p tchem
R 1232 5 80 yomchem tcotop$o tchem
R 1234 5 82 yomchem lchem_arpclim tchem
R 1235 5 83 yomchem lchem_emich4 tchem
S 1242 3 0 0 0 318 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 10446 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 20 3 53 52 43
S 1243 3 0 0 0 318 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 10450 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 20 3 44 44 50
S 1244 3 0 0 0 318 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 10454 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 20 3 53 44 4d
S 1245 3 0 0 0 318 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 10458 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 20 3 57 44 4c
S 1246 3 0 0 0 318 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 10462 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 20 3 57 44 43
S 1247 3 0 0 0 318 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 10466 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 20 3 4e 47 54
S 1248 3 0 0 0 318 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 10470 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 20 3 4f 44 2e
S 1249 3 0 0 0 318 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 10474 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 20 3 54 43 2e
S 1250 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 5 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
S 1251 3 0 0 0 332 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 10478 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 20 8 4f 70 74 44 65 70 74 68
S 1252 3 0 0 0 332 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 10487 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 20 8 41 62 4f 70 74 44 65 70
S 1253 3 0 0 0 332 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 10496 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 20 8 46 4d 4f 70 74 44 65 70
S 1254 3 0 0 0 332 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 10505 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 20 8 53 53 63 61 74 41 6c 62
S 1255 3 0 0 0 332 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 10514 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 20 8 41 73 79 6d 6d 65 74 72
R 1272 7 17 yoe_aerodiag cpaerodiag_label$ac
R 1297 7 42 yoe_aerodiag cpaero_wvl_diag_label$ac
S 1332 3 0 0 0 1587 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 11390 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 20 8 0 74 79 70 65 5f 67 66
S 1333 3 0 0 0 6 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 -1 -999 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6
S 1334 3 0 0 0 6 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 -1 -99999999 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6
S 1337 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 2163 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
S 1338 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 220 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
S 1339 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 42 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
S 1340 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 14 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
S 1342 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 38 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
S 1343 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 1100 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
S 1344 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 50 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
S 1345 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 579 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
R 1355 25 9 yom_ygfl type_gfl_comp
R 1356 5 10 yom_ygfl cname type_gfl_comp
R 1357 5 11 yom_ygfl igrbcode type_gfl_comp
R 1358 5 12 yom_ygfl ladv type_gfl_comp
R 1359 5 13 yom_ygfl ladv5 type_gfl_comp
R 1360 5 14 yom_ygfl ltdiablin type_gfl_comp
R 1361 5 15 yom_ygfl lhorturb type_gfl_comp
R 1362 5 16 yom_ygfl nreqin type_gfl_comp
R 1363 5 17 yom_ygfl lreqout type_gfl_comp
R 1364 5 18 yom_ygfl lgpingp type_gfl_comp
R 1365 5 19 yom_ygfl lmgrid type_gfl_comp
R 1366 5 20 yom_ygfl lgp type_gfl_comp
R 1367 5 21 yom_ygfl lsp type_gfl_comp
R 1368 5 22 yom_ygfl lcders type_gfl_comp
R 1369 5 23 yom_ygfl lactive type_gfl_comp
R 1370 5 24 yom_ygfl lthermact type_gfl_comp
R 1371 5 25 yom_ygfl r type_gfl_comp
R 1372 5 26 yom_ygfl rcp type_gfl_comp
R 1373 5 27 yom_ygfl lt9 type_gfl_comp
R 1374 5 28 yom_ygfl lt1 type_gfl_comp
R 1375 5 29 yom_ygfl lt5 type_gfl_comp
R 1376 5 30 yom_ygfl lphy type_gfl_comp
R 1377 5 31 yom_ygfl lpt type_gfl_comp
R 1378 5 32 yom_ygfl ltrajio type_gfl_comp
R 1379 5 33 yom_ygfl ldiag type_gfl_comp
R 1380 5 34 yom_ygfl lpc type_gfl_comp
R 1381 5 35 yom_ygfl refvali type_gfl_comp
R 1382 5 36 yom_ygfl ladjust0 type_gfl_comp
R 1383 5 37 yom_ygfl ladjust1 type_gfl_comp
R 1384 5 38 yom_ygfl ncoupling type_gfl_comp
R 1385 5 39 yom_ygfl refvalc type_gfl_comp
R 1386 5 40 yom_ygfl lbiper type_gfl_comp
R 1387 5 41 yom_ygfl cslint type_gfl_comp
R 1388 5 42 yom_ygfl mgfl type_gfl_comp
R 1389 5 43 yom_ygfl mp type_gfl_comp
R 1390 5 44 yom_ygfl mpl type_gfl_comp
R 1391 5 45 yom_ygfl mpm type_gfl_comp
R 1392 5 46 yom_ygfl mp9 type_gfl_comp
R 1393 5 47 yom_ygfl mp9_ph type_gfl_comp
R 1394 5 48 yom_ygfl mp1 type_gfl_comp
R 1395 5 49 yom_ygfl mp5 type_gfl_comp
R 1396 5 50 yom_ygfl mp5l type_gfl_comp
R 1397 5 51 yom_ygfl mp5m type_gfl_comp
R 1398 5 52 yom_ygfl mpslp type_gfl_comp
R 1399 5 53 yom_ygfl mpsp type_gfl_comp
R 1400 5 54 yom_ygfl mp_spl type_gfl_comp
R 1401 5 55 yom_ygfl mp_sl1 type_gfl_comp
R 1402 5 56 yom_ygfl mp_slx type_gfl_comp
R 1403 5 57 yom_ygfl mppt type_gfl_comp
R 1404 5 58 yom_ygfl mppc type_gfl_comp
R 1405 5 59 yom_ygfl mppc_ph type_gfl_comp
R 1406 5 60 yom_ygfl lwater type_gfl_comp
R 1407 5 61 yom_ygfl lprecip type_gfl_comp
R 1408 5 62 yom_ygfl rlzer type_gfl_comp
R 1409 5 63 yom_ygfl ncouplo4 type_gfl_comp
R 1410 5 64 yom_ygfl lassim type_gfl_comp
R 1411 5 65 yom_ygfl igribdv type_gfl_comp
R 1412 5 66 yom_ygfl igribtc type_gfl_comp
R 1413 5 67 yom_ygfl igrbflxo type_gfl_comp
R 1414 5 68 yom_ygfl igrbwdflx type_gfl_comp
R 1415 5 69 yom_ygfl igrbddflx type_gfl_comp
R 1416 5 70 yom_ygfl ldiff type_gfl_comp
R 1417 5 71 yom_ygfl lconv type_gfl_comp
R 1418 5 72 yom_ygfl rmolmass type_gfl_comp
R 1419 5 73 yom_ygfl refold type_gfl_comp
R 1420 5 74 yom_ygfl henrya type_gfl_comp
R 1421 5 75 yom_ygfl henryb type_gfl_comp
R 1422 5 76 yom_ygfl lnegfix type_gfl_comp
R 1423 5 77 yom_ygfl lcomad type_gfl_comp
R 1424 5 78 yom_ygfl weno_alpha type_gfl_comp
R 1425 5 79 yom_ygfl lmassfix type_gfl_comp
R 1426 5 80 yom_ygfl betamfbc type_gfl_comp
R 1427 5 81 yom_ygfl ifid type_gfl_comp
R 1428 5 82 yom_ygfl previous type_gfl_comp
R 1430 5 84 yom_ygfl previous$p type_gfl_comp
R 1433 25 87 yom_ygfl type_gfl_naml
R 1434 5 88 yom_ygfl cname type_gfl_naml
R 1435 5 89 yom_ygfl igrbcode type_gfl_naml
R 1436 5 90 yom_ygfl nreqin type_gfl_naml
R 1437 5 91 yom_ygfl refvali type_gfl_naml
R 1438 5 92 yom_ygfl lreqout type_gfl_naml
R 1439 5 93 yom_ygfl lgpingp type_gfl_naml
R 1440 5 94 yom_ygfl lmgrid type_gfl_naml
R 1441 5 95 yom_ygfl lgp type_gfl_naml
R 1442 5 96 yom_ygfl lsp type_gfl_naml
R 1443 5 97 yom_ygfl lcders type_gfl_naml
R 1444 5 98 yom_ygfl lt9 type_gfl_naml
R 1445 5 99 yom_ygfl lt1 type_gfl_naml
R 1446 5 100 yom_ygfl lt5 type_gfl_naml
R 1447 5 101 yom_ygfl lphy type_gfl_naml
R 1448 5 102 yom_ygfl lpt type_gfl_naml
R 1449 5 103 yom_ygfl ltrajio type_gfl_naml
R 1450 5 104 yom_ygfl ldiag type_gfl_naml
R 1451 5 105 yom_ygfl lpc type_gfl_naml
R 1452 5 106 yom_ygfl ladv type_gfl_naml
R 1453 5 107 yom_ygfl ladv5 type_gfl_naml
R 1454 5 108 yom_ygfl lintlin type_gfl_naml
R 1455 5 109 yom_ygfl ltdiablin type_gfl_naml
R 1456 5 110 yom_ygfl lhorturb type_gfl_naml
R 1457 5 111 yom_ygfl lqm type_gfl_naml
R 1458 5 112 yom_ygfl lqmh type_gfl_naml
R 1459 5 113 yom_ygfl lqm3d type_gfl_naml
R 1460 5 114 yom_ygfl lqml3d type_gfl_naml
R 1461 5 115 yom_ygfl lvweno type_gfl_naml
R 1462 5 116 yom_ygfl weno_alpha type_gfl_naml
R 1463 5 117 yom_ygfl lslhd type_gfl_naml
R 1464 5 118 yom_ygfl lcomad type_gfl_naml
R 1465 5 119 yom_ygfl lhv type_gfl_naml
R 1466 5 120 yom_ygfl lvsplip type_gfl_naml
R 1467 5 121 yom_ygfl ncoupling type_gfl_naml
R 1468 5 122 yom_ygfl refvalc type_gfl_naml
R 1469 5 123 yom_ygfl ncouplo4 type_gfl_naml
R 1470 5 124 yom_ygfl lassim type_gfl_naml
R 1471 5 125 yom_ygfl igribdv type_gfl_naml
R 1472 5 126 yom_ygfl igribtc type_gfl_naml
R 1473 5 127 yom_ygfl igrbflxo type_gfl_naml
R 1474 5 128 yom_ygfl igrbwdflx type_gfl_naml
R 1475 5 129 yom_ygfl igrbddflx type_gfl_naml
R 1476 5 130 yom_ygfl ldiff type_gfl_naml
R 1477 5 131 yom_ygfl lconv type_gfl_naml
R 1478 5 132 yom_ygfl lnegfix type_gfl_naml
R 1479 5 133 yom_ygfl lmassfix type_gfl_naml
R 1480 5 134 yom_ygfl betamfbc type_gfl_naml
R 1481 5 135 yom_ygfl rmolmass type_gfl_naml
R 1482 5 136 yom_ygfl refold type_gfl_naml
R 1483 5 137 yom_ygfl henrya type_gfl_naml
R 1484 5 138 yom_ygfl henryb type_gfl_naml
R 1487 25 141 yom_ygfl type_gfld
R 1488 5 142 yom_ygfl numflds type_gfld
R 1489 5 143 yom_ygfl nders type_gfld
R 1490 5 144 yom_ygfl numspflds type_gfld
R 1491 5 145 yom_ygfl numgpflds type_gfld
R 1492 5 146 yom_ygfl numflds9 type_gfld
R 1493 5 147 yom_ygfl numflds1 type_gfld
R 1494 5 148 yom_ygfl numspflds1 type_gfld
R 1495 5 149 yom_ygfl numflds5 type_gfld
R 1496 5 150 yom_ygfl numfldsphy type_gfld
R 1497 5 151 yom_ygfl numflds_spl type_gfld
R 1498 5 152 yom_ygfl numflds_sl1 type_gfld
R 1499 5 153 yom_ygfl numfldspc type_gfld
R 1500 5 154 yom_ygfl ndim type_gfld
R 1501 5 155 yom_ygfl numfldspt type_gfld
R 1502 5 156 yom_ygfl ndim0 type_gfld
R 1503 5 157 yom_ygfl ndim9 type_gfld
R 1504 5 158 yom_ygfl ndim1 type_gfld
R 1505 5 159 yom_ygfl ndim5 type_gfld
R 1506 5 160 yom_ygfl ndimslp type_gfld
R 1507 5 161 yom_ygfl ndim_spl type_gfld
R 1508 5 162 yom_ygfl ndimpt type_gfld
R 1509 5 163 yom_ygfl ndimpc type_gfld
R 1510 5 164 yom_ygfl ngfl_ext type_gfld
R 1511 5 165 yom_ygfl ngfl_forc type_gfld
R 1512 5 166 yom_ygfl ngfl_ezdiag type_gfld
R 1513 5 167 yom_ygfl nghg type_gfld
R 1514 5 168 yom_ygfl nghg_assim type_gfld
R 1515 5 169 yom_ygfl naero type_gfld
R 1516 5 170 yom_ygfl nactaero type_gfld
R 1517 5 171 yom_ygfl nddhaero type_gfld
R 1518 5 172 yom_ygfl nera40 type_gfld
R 1519 5 173 yom_ygfl nnogw type_gfld
R 1520 5 174 yom_ygfl nedrp type_gfld
R 1521 5 175 yom_ygfl naerout type_gfld
R 1522 5 176 yom_ygfl naeroclim type_gfld
R 1523 5 177 yom_ygfl nuvp type_gfld
R 1524 5 178 yom_ygfl nsldia type_gfld
R 1525 5 179 yom_ygfl nsldiagp type_gfld
R 1526 5 180 yom_ygfl nfsd type_gfld
R 1527 5 181 yom_ygfl laerchem type_gfld
R 1528 5 182 yom_ygfl ltrcmfix type_gfld
R 1529 5 183 yom_ygfl ltrcmfix_ps type_gfld
R 1530 5 184 yom_ygfl ltrcmfqm type_gfld
R 1531 5 185 yom_ygfl laeraot type_gfld
R 1532 5 186 yom_ygfl laerlisi type_gfld
R 1533 5 187 yom_ygfl laerout type_gfld
R 1534 5 188 yom_ygfl laeroclim type_gfld
R 1535 5 189 yom_ygfl luvpout type_gfld
R 1536 5 190 yom_ygfl lspptgfl type_gfld
R 1537 5 191 yom_ygfl ngems type_gfld
R 1538 5 192 yom_ygfl nchem type_gfld
R 1539 5 193 yom_ygfl nchem_assim type_gfld
R 1540 5 194 yom_ygfl nchem_flxo type_gfld
R 1541 5 195 yom_ygfl nchem_wdflx type_gfld
R 1542 5 196 yom_ygfl nchem_ddflx type_gfld
R 1543 5 197 yom_ygfl nchem_dv type_gfld
R 1544 5 198 yom_ygfl nchem_tc type_gfld
R 1545 5 199 yom_ygfl nchem_scv type_gfld
R 1546 5 200 yom_ygfl nemis2d type_gfld
R 1547 5 201 yom_ygfl nemis2daux type_gfld
R 1548 5 202 yom_ygfl nemis3d type_gfld
R 1549 5 203 yom_ygfl nlima type_gfld
R 1550 5 204 yom_ygfl naero_wvl_diag type_gfld
R 1551 5 205 yom_ygfl naero_wvl_diag_types type_gfld
R 1552 5 206 yom_ygfl nchemsulf1 type_gfld
R 1553 5 207 yom_ygfl nchemhno3 type_gfld
R 1554 5 208 yom_ygfl nnegafix type_gfld
R 1555 5 209 yom_ygfl noptnegfix type_gfld
R 1556 5 210 yom_ygfl lqm3dcons type_gfld
R 1557 5 211 yom_ygfl ladvnegfix type_gfld
R 1558 5 212 yom_ygfl ltrcmfbc type_gfld
R 1559 5 213 yom_ygfl ltrcmfpr type_gfld
R 1560 5 214 yom_ygfl ltrcmfmg type_gfld
R 1561 5 215 yom_ygfl ltrcmfp type_gfld
R 1562 5 216 yom_ygfl ltrcmfa_dif type_gfld
R 1563 5 217 yom_ygfl ltrcmfa_lap type_gfld
R 1564 5 218 yom_ygfl ltrcmfa_ver type_gfld
R 1565 5 219 yom_ygfl lextradf type_gfld
R 1566 5 220 yom_ygfl nfldsfix type_gfld
R 1567 5 221 yom_ygfl noptmfbc type_gfld
R 1568 5 222 yom_ygfl noptmfpr type_gfld
R 1569 5 223 yom_ygfl noptvfe type_gfld
R 1570 5 224 yom_ygfl nmfdiaglev type_gfld
R 1571 5 225 yom_ygfl nmfixflds type_gfld
R 1572 5 226 yom_ygfl nnegflds type_gfld
R 1573 5 227 yom_ygfl zmfixeps type_gfld
R 1574 5 228 yom_ygfl nfmg type_gfld
R 1575 5 229 yom_ygfl nmgflds type_gfld
R 1576 5 230 yom_ygfl ycomp type_gfld
R 1577 5 231 yom_ygfl ylastcomp type_gfld
R 1579 5 233 yom_ygfl ylastcomp$p type_gfld
R 1580 5 234 yom_ygfl yq type_gfld
R 1582 5 236 yom_ygfl yq$p type_gfld
R 1583 5 237 yom_ygfl yi type_gfld
R 1585 5 239 yom_ygfl yi$p type_gfld
R 1586 5 240 yom_ygfl yl type_gfld
R 1588 5 242 yom_ygfl yl$p type_gfld
R 1589 5 243 yom_ygfl ylconv type_gfld
R 1591 5 245 yom_ygfl ylconv$p type_gfld
R 1592 5 246 yom_ygfl yiconv type_gfld
R 1594 5 248 yom_ygfl yiconv$p type_gfld
R 1595 5 249 yom_ygfl yrconv type_gfld
R 1597 5 251 yom_ygfl yrconv$p type_gfld
R 1598 5 252 yom_ygfl ysconv type_gfld
R 1600 5 254 yom_ygfl ysconv$p type_gfld
R 1601 5 255 yom_ygfl yirad type_gfld
R 1603 5 257 yom_ygfl yirad$p type_gfld
R 1604 5 258 yom_ygfl ylrad type_gfld
R 1606 5 260 yom_ygfl ylrad$p type_gfld
R 1607 5 261 yom_ygfl ys type_gfld
R 1609 5 263 yom_ygfl ys$p type_gfld
R 1610 5 264 yom_ygfl yr type_gfld
R 1612 5 266 yom_ygfl yr$p type_gfld
R 1613 5 267 yom_ygfl yg type_gfld
R 1615 5 269 yom_ygfl yg$p type_gfld
R 1616 5 270 yom_ygfl yh type_gfld
R 1618 5 272 yom_ygfl yh$p type_gfld
R 1619 5 273 yom_ygfl ytke type_gfld
R 1621 5 275 yom_ygfl ytke$p type_gfld
R 1622 5 276 yom_ygfl ytte type_gfld
R 1624 5 278 yom_ygfl ytte$p type_gfld
R 1625 5 279 yom_ygfl yefb1 type_gfld
R 1627 5 281 yom_ygfl yefb1$p type_gfld
R 1628 5 282 yom_ygfl yefb2 type_gfld
R 1630 5 284 yom_ygfl yefb2$p type_gfld
R 1631 5 285 yom_ygfl yefb3 type_gfld
R 1633 5 287 yom_ygfl yefb3$p type_gfld
R 1634 5 288 yom_ygfl ya type_gfld
R 1636 5 290 yom_ygfl ya$p type_gfld
R 1637 5 291 yom_ygfl yo3 type_gfld
R 1639 5 293 yom_ygfl yo3$p type_gfld
R 1640 5 294 yom_ygfl ysrc type_gfld
R 1642 5 296 yom_ygfl ysrc$p type_gfld
R 1643 5 297 yom_ygfl ylmf type_gfld
R 1645 5 299 yom_ygfl ylmf$p type_gfld
R 1646 5 300 yom_ygfl yimf type_gfld
R 1648 5 302 yom_ygfl yimf$p type_gfld
R 1649 5 303 yom_ygfl yamf type_gfld
R 1651 5 305 yom_ygfl yamf$p type_gfld
R 1652 5 306 yom_ygfl ymxl type_gfld
R 1654 5 308 yom_ygfl ymxl$p type_gfld
R 1655 5 309 yom_ygfl yshtur type_gfld
R 1657 5 311 yom_ygfl yshtur$p type_gfld
R 1658 5 312 yom_ygfl yfqtur type_gfld
R 1660 5 314 yom_ygfl yfqtur$p type_gfld
R 1661 5 315 yom_ygfl yfstur type_gfld
R 1663 5 317 yom_ygfl yfstur$p type_gfld
R 1664 5 318 yom_ygfl ycpf type_gfld
R 1666 5 320 yom_ygfl ycpf$p type_gfld
R 1667 5 321 yom_ygfl yspf type_gfld
R 1669 5 323 yom_ygfl yspf$p type_gfld
R 1670 5 324 yom_ygfl ycvgq type_gfld
R 1672 5 326 yom_ygfl ycvgq$p type_gfld
R 1673 5 327 yom_ygfl yqva type_gfld
R 1675 5 329 yom_ygfl yqva$p type_gfld
R 1676 5 330 yom_ygfl yghg type_gfld
R 1678 5 332 yom_ygfl yghg$sd type_gfld
R 1679 5 333 yom_ygfl yghg$p type_gfld
R 1680 5 334 yom_ygfl yghg$o type_gfld
R 1682 5 336 yom_ygfl ychem type_gfld
R 1684 5 338 yom_ygfl ychem$sd type_gfld
R 1685 5 339 yom_ygfl ychem$p type_gfld
R 1686 5 340 yom_ygfl ychem$o type_gfld
R 1688 5 342 yom_ygfl yaero type_gfld
R 1690 5 344 yom_ygfl yaero$sd type_gfld
R 1691 5 345 yom_ygfl yaero$p type_gfld
R 1692 5 346 yom_ygfl yaero$o type_gfld
R 1694 5 348 yom_ygfl ylrch4 type_gfld
R 1696 5 350 yom_ygfl ylrch4$p type_gfld
R 1697 5 351 yom_ygfl yemis3d type_gfld
R 1699 5 353 yom_ygfl yemis3d$sd type_gfld
R 1700 5 354 yom_ygfl yemis3d$p type_gfld
R 1701 5 355 yom_ygfl yemis3d$o type_gfld
R 1703 5 357 yom_ygfl yforc type_gfld
R 1705 5 359 yom_ygfl yforc$sd type_gfld
R 1706 5 360 yom_ygfl yforc$p type_gfld
R 1707 5 361 yom_ygfl yforc$o type_gfld
R 1709 5 363 yom_ygfl yezdiag type_gfld
R 1711 5 365 yom_ygfl yezdiag$sd type_gfld
R 1712 5 366 yom_ygfl yezdiag$p type_gfld
R 1713 5 367 yom_ygfl yezdiag$o type_gfld
R 1715 5 369 yom_ygfl yera40 type_gfld
R 1717 5 371 yom_ygfl yera40$sd type_gfld
R 1718 5 372 yom_ygfl yera40$p type_gfld
R 1719 5 373 yom_ygfl yera40$o type_gfld
R 1721 5 375 yom_ygfl ynogw type_gfld
R 1723 5 377 yom_ygfl ynogw$sd type_gfld
R 1724 5 378 yom_ygfl ynogw$p type_gfld
R 1725 5 379 yom_ygfl ynogw$o type_gfld
R 1727 5 381 yom_ygfl yedrp type_gfld
R 1729 5 383 yom_ygfl yedrp$sd type_gfld
R 1730 5 384 yom_ygfl yedrp$p type_gfld
R 1731 5 385 yom_ygfl yedrp$o type_gfld
R 1733 5 387 yom_ygfl ysldia type_gfld
R 1735 5 389 yom_ygfl ysldia$sd type_gfld
R 1736 5 390 yom_ygfl ysldia$p type_gfld
R 1737 5 391 yom_ygfl ysldia$o type_gfld
R 1739 5 393 yom_ygfl yaeraot type_gfld
R 1741 5 395 yom_ygfl yaeraot$sd type_gfld
R 1742 5 396 yom_ygfl yaeraot$p type_gfld
R 1743 5 397 yom_ygfl yaeraot$o type_gfld
R 1745 5 399 yom_ygfl yaerlisi type_gfld
R 1747 5 401 yom_ygfl yaerlisi$sd type_gfld
R 1748 5 402 yom_ygfl yaerlisi$p type_gfld
R 1749 5 403 yom_ygfl yaerlisi$o type_gfld
R 1751 5 405 yom_ygfl yaerout type_gfld
R 1753 5 407 yom_ygfl yaerout$sd type_gfld
R 1754 5 408 yom_ygfl yaerout$p type_gfld
R 1755 5 409 yom_ygfl yaerout$o type_gfld
R 1757 5 411 yom_ygfl yaeroclim type_gfld
R 1759 5 413 yom_ygfl yaeroclim$sd type_gfld
R 1760 5 414 yom_ygfl yaeroclim$p type_gfld
R 1761 5 415 yom_ygfl yaeroclim$o type_gfld
R 1763 5 417 yom_ygfl yuvp type_gfld
R 1765 5 419 yom_ygfl yuvp$sd type_gfld
R 1766 5 420 yom_ygfl yuvp$p type_gfld
R 1767 5 421 yom_ygfl yuvp$o type_gfld
R 1769 5 423 yom_ygfl yphys type_gfld
R 1771 5 425 yom_ygfl yphys$sd type_gfld
R 1772 5 426 yom_ygfl yphys$p type_gfld
R 1773 5 427 yom_ygfl yphys$o type_gfld
R 1775 5 429 yom_ygfl yphycty type_gfld
R 1777 5 431 yom_ygfl yphycty$p type_gfld
R 1778 5 432 yom_ygfl yrspec type_gfld
R 1780 5 434 yom_ygfl yrspec$p type_gfld
R 1781 5 435 yom_ygfl ysdsat type_gfld
R 1783 5 437 yom_ygfl ysdsat$p type_gfld
R 1784 5 438 yom_ygfl ycvv type_gfld
R 1786 5 440 yom_ygfl ycvv$p type_gfld
R 1787 5 441 yom_ygfl yrkth type_gfld
R 1789 5 443 yom_ygfl yrkth$p type_gfld
R 1790 5 444 yom_ygfl yrktqv type_gfld
R 1792 5 446 yom_ygfl yrktqv$p type_gfld
R 1793 5 447 yom_ygfl yrktqc type_gfld
R 1795 5 449 yom_ygfl yrktqc$p type_gfld
R 1796 5 450 yom_ygfl yuom type_gfld
R 1798 5 452 yom_ygfl yuom$p type_gfld
R 1799 5 453 yom_ygfl yual type_gfld
R 1801 5 455 yom_ygfl yual$p type_gfld
R 1802 5 456 yom_ygfl ydom type_gfld
R 1804 5 458 yom_ygfl ydom$p type_gfld
R 1805 5 459 yom_ygfl ydal type_gfld
R 1807 5 461 yom_ygfl ydal$p type_gfld
R 1808 5 462 yom_ygfl yuen type_gfld
R 1810 5 464 yom_ygfl yuen$p type_gfld
R 1811 5 465 yom_ygfl yunebh type_gfld
R 1813 5 467 yom_ygfl yunebh$p type_gfld
R 1814 5 468 yom_ygfl ylima type_gfld
R 1816 5 470 yom_ygfl ylima$sd type_gfld
R 1817 5 471 yom_ygfl ylima$p type_gfld
R 1818 5 472 yom_ygfl ylima$o type_gfld
R 1820 5 474 yom_ygfl yfsd type_gfld
R 1822 5 476 yom_ygfl yfsd$p type_gfld
R 1823 5 477 yom_ygfl yext type_gfld
R 1825 5 479 yom_ygfl yext$sd type_gfld
R 1826 5 480 yom_ygfl yext$p type_gfld
R 1827 5 481 yom_ygfl yext$o type_gfld
R 1829 5 483 yom_ygfl yq_nl type_gfld
R 1830 5 484 yom_ygfl yi_nl type_gfld
R 1831 5 485 yom_ygfl yl_nl type_gfld
R 1832 5 486 yom_ygfl ylconv_nl type_gfld
R 1833 5 487 yom_ygfl yiconv_nl type_gfld
R 1834 5 488 yom_ygfl yrconv_nl type_gfld
R 1835 5 489 yom_ygfl ysconv_nl type_gfld
R 1836 5 490 yom_ygfl yirad_nl type_gfld
R 1837 5 491 yom_ygfl ylrad_nl type_gfld
R 1838 5 492 yom_ygfl ys_nl type_gfld
R 1839 5 493 yom_ygfl yr_nl type_gfld
R 1840 5 494 yom_ygfl yg_nl type_gfld
R 1841 5 495 yom_ygfl yh_nl type_gfld
R 1842 5 496 yom_ygfl ytke_nl type_gfld
R 1843 5 497 yom_ygfl ytte_nl type_gfld
R 1844 5 498 yom_ygfl yefb1_nl type_gfld
R 1845 5 499 yom_ygfl yefb2_nl type_gfld
R 1846 5 500 yom_ygfl yefb3_nl type_gfld
R 1847 5 501 yom_ygfl ya_nl type_gfld
R 1848 5 502 yom_ygfl yo3_nl type_gfld
R 1849 5 503 yom_ygfl ysrc_nl type_gfld
R 1850 5 504 yom_ygfl yamf_nl type_gfld
R 1851 5 505 yom_ygfl ylmf_nl type_gfld
R 1852 5 506 yom_ygfl yimf_nl type_gfld
R 1853 5 507 yom_ygfl ymxl_nl type_gfld
R 1854 5 508 yom_ygfl yshtur_nl type_gfld
R 1855 5 509 yom_ygfl yfqtur_nl type_gfld
R 1856 5 510 yom_ygfl yfstur_nl type_gfld
R 1857 5 511 yom_ygfl ycpf_nl type_gfld
R 1858 5 512 yom_ygfl yspf_nl type_gfld
R 1859 5 513 yom_ygfl ycvgq_nl type_gfld
R 1860 5 514 yom_ygfl yqva_nl type_gfld
R 1861 5 515 yom_ygfl yghg_nl type_gfld
R 1862 5 516 yom_ygfl ychem_nl type_gfld
R 1863 5 517 yom_ygfl yaero_nl type_gfld
R 1864 5 518 yom_ygfl yera40_nl type_gfld
R 1865 5 519 yom_ygfl ynogw_nl type_gfld
R 1866 5 520 yom_ygfl yedrp_nl type_gfld
R 1867 5 521 yom_ygfl ysldia_nl type_gfld
R 1868 5 522 yom_ygfl ylrch4_nl type_gfld
R 1869 5 523 yom_ygfl yaeraot_nl type_gfld
R 1870 5 524 yom_ygfl yaerlisi_nl type_gfld
R 1871 5 525 yom_ygfl yaerout_nl type_gfld
R 1872 5 526 yom_ygfl yaeroclim_nl type_gfld
R 1873 5 527 yom_ygfl yuvp_nl type_gfld
R 1874 5 528 yom_ygfl yrkth_nl type_gfld
R 1875 5 529 yom_ygfl yrktqv_nl type_gfld
R 1876 5 530 yom_ygfl yrktqc_nl type_gfld
R 1877 5 531 yom_ygfl yphycty_nl type_gfld
R 1878 5 532 yom_ygfl yfsd_nl type_gfld
R 1879 5 533 yom_ygfl yrspec_nl type_gfld
R 1880 5 534 yom_ygfl ysdsat_nl type_gfld
R 1881 5 535 yom_ygfl ycvv_nl type_gfld
R 1882 5 536 yom_ygfl yforc_nl type_gfld
R 1883 5 537 yom_ygfl yezdiag_nl type_gfld
R 1884 5 538 yom_ygfl yext_nl type_gfld
R 1885 5 539 yom_ygfl yuom_nl type_gfld
R 1886 5 540 yom_ygfl yual_nl type_gfld
R 1887 5 541 yom_ygfl ydom_nl type_gfld
R 1888 5 542 yom_ygfl ydal_nl type_gfld
R 1889 5 543 yom_ygfl yuen_nl type_gfld
R 1890 5 544 yom_ygfl yunebh_nl type_gfld
R 1891 5 545 yom_ygfl yaero_wvl_diag_nl type_gfld
R 1892 5 546 yom_ygfl ylima_nl type_gfld
R 1918 25 7 iso_c_binding c_ptr
R 1919 5 8 iso_c_binding val c_ptr
R 1921 25 10 iso_c_binding c_funptr
R 1922 5 11 iso_c_binding val c_funptr
R 1956 6 45 iso_c_binding c_null_ptr$ac
R 1958 6 47 iso_c_binding c_null_funptr$ac
R 1959 26 48 iso_c_binding ==
R 1961 26 50 iso_c_binding !=
R 1989 25 3 yoephy tephy
R 1990 5 4 yoephy lephys tephy
R 1991 5 5 yoephy lecond tephy
R 1992 5 6 yoephy lecumf tephy
R 1993 5 7 yoephy ledcld tephy
R 1994 5 8 yoephy leevap tephy
R 1995 5 9 yoephy legwdg tephy
R 1996 5 10 yoephy legwwms tephy
R 1997 5 11 yoephy leozoc tephy
R 1998 5 12 yoephy leqngt tephy
R 1999 5 13 yoephy leradi tephy
R 2000 5 14 yoephy leradimpl tephy
R 2001 5 15 yoephy lerads tephy
R 2002 5 16 yoephy lesice tephy
R 2003 5 17 yoephy lesurf tephy
R 2004 5 18 yoephy levdif tephy
R 2005 5 19 yoephy levdifsl tephy
R 2006 5 20 yoephy lagphy tephy
R 2007 5 21 yoephy lepcld tephy
R 2008 5 22 yoephy leo3ch tephy
R 2009 5 23 yoephy lo3ch_safe tephy
R 2010 5 24 yoephy lo3ch_oldver tephy
R 2011 5 25 yoephy lo3ch_bms tephy
R 2012 5 26 yoephy lo3ch_hlo tephy
R 2013 5 27 yoephy co3chem tephy
R 2014 5 28 yoephy lneeonline tephy
R 2015 5 29 yoephy lwetonline tephy
R 2016 5 30 yoephy lbud23 tephy
R 2017 5 31 yoephy lpptiles tephy
R 2018 5 32 yoephy lbudcycle tephy
R 2019 5 33 yoephy lextratend tephy
R 2020 5 34 yoephy lemethox tephy
R 2021 5 35 yoephy lecurr tephy
R 2022 5 36 yoephy lesurftraj tephy
R 2023 5 37 yoephy lvdftrac tephy
R 2024 5 38 yoephy lvdfnewtrac tephy
R 2025 5 39 yoephy lmftrac tephy
R 2026 5 40 yoephy lmfscav tephy
R 2027 5 41 yoephy lerain tephy
R 2028 5 42 yoephy lemwave tephy
R 2029 5 43 yoephy legbrad tephy
R 2030 5 44 yoephy leraingg tephy
R 2031 5 45 yoephy lesmos tephy
R 2032 5 46 yoephy lesmap tephy
R 2033 5 47 yoephy leocwa tephy
R 2034 5 48 yoephy leocco tephy
R 2035 5 49 yoephy leocsa tephy
R 2036 5 50 yoephy leocla tephy
R 2037 5 51 yoephy levgen tephy
R 2038 5 52 yoephy lessro tephy
R 2039 5 53 yoephy leflake tephy
R 2040 5 54 yoephy leocml tephy
R 2041 5 55 yoephy leobc tephy
R 2042 5 56 yoephy leobcmax tephy
R 2043 5 57 yoephy reobcmax tephy
R 2044 5 58 yoephy leobcice tephy
R 2045 5 59 yoephy leoclake tephy
R 2046 5 60 yoephy leolakesst tephy
R 2047 5 61 yoephy locmltke tephy
R 2048 5 62 yoephy leclipqt0 tephy
R 2049 5 63 yoephy leclipcldt0 tephy
R 2050 5 64 yoephy lductdia tephy
R 2051 5 65 yoephy ldiagturb_ec tephy
R 2052 5 66 yoephy ldiagturbgrad_ec tephy
R 2053 5 67 yoephy lslphy tephy
R 2054 5 68 yoephy lesn09 tephy
R 2055 5 69 yoephy lelaiv tephy
R 2056 5 70 yoephy lectessel tephy
R 2057 5 71 yoephy leags tephy
R 2058 5 72 yoephy lefarquhar tephy
R 2059 5 73 yoephy leoptsurf tephy
R 2060 5 74 yoephy lec4map tephy
R 2061 5 75 yoephy leairco2coup tephy
R 2062 5 76 yoephy lelight tephy
R 2063 5 77 yoephy lvextrdynacc tephy
R 2064 5 78 yoephy rthrfrti tephy
R 2065 5 79 yoephy rcimin tephy
R 2066 5 80 yoephy rlaiint tephy
R 2067 5 81 yoephy npraccl tephy
R 2068 5 82 yoephy nlimode tephy
R 2069 5 83 yoephy leclim10d tephy
R 2070 5 84 yoephy lesnml tephy
R 2071 5 85 yoephy leurban tephy
R 2072 5 86 yoephy nsnmlws tephy
R 2073 5 87 yoephy lbfasco2 tephy
R 2074 5 88 yoephy nco2climyy1 tephy
R 2075 5 89 yoephy nco2climyy2 tephy
R 2076 5 90 yoephy nco2climn1 tephy
R 2077 5 91 yoephy nco2climn2 tephy
R 2078 5 92 yoephy nco2climfrq tephy
R 2079 5 93 yoephy nalbedoscheme tephy
R 2080 5 94 yoephy nemissscheme tephy
R 2081 5 95 yoephy ralfminpsn tephy
R 2082 5 96 yoephy rnorthml tephy
R 2083 5 97 yoephy rsouthml tephy
R 2084 5 98 yoephy rwestml tephy
R 2085 5 99 yoephy reastml tephy
R 2086 5 100 yoephy invml tephy
R 2087 5 101 yoephy lfpos_ec_phys tephy
R 2088 5 102 yoephy lfpos_acc_reset tephy
R 2089 5 103 yoephy lrad_cloud_inhomog tephy
R 2090 5 104 yoephy ysurf tephy
R 2102 25 2 yoecld tecld
R 2103 5 3 yoecld ceta tecld
R 2105 5 5 yoecld ceta$sd tecld
R 2106 5 6 yoecld ceta$p tecld
R 2107 5 7 yoecld ceta$o tecld
R 2109 5 9 yoecld ranva tecld
R 2110 5 10 yoecld ranvb tecld
R 2111 5 11 yoecld ranvh tecld
R 2112 5 12 yoecld rcca tecld
R 2113 5 13 yoecld rccb tecld
R 2114 5 14 yoecld rccc tecld
R 2115 5 15 yoecld rcfct tecld
R 2116 5 16 yoecld rclwmr tecld
R 2117 5 17 yoecld rcscal tecld
R 2118 5 18 yoecld rdecorr_cf tecld
R 2119 5 19 yoecld rdecorr_cw tecld
R 2120 5 20 yoecld retahb tecld
R 2121 5 21 yoecld retamb tecld
R 2122 5 22 yoecld rloia tecld
R 2123 5 23 yoecld rloib tecld
R 2124 5 24 yoecld rloic tecld
R 2125 5 25 yoecld rloid tecld
R 2126 5 26 yoecld rlonia tecld
R 2127 5 27 yoecld rlonib tecld
R 2128 5 28 yoecld rrhh tecld
R 2129 5 29 yoecld rrhl tecld
R 2130 5 30 yoecld rgammas tecld
R 2131 5 31 yoecld repscr tecld
R 2132 5 32 yoecld repsec tecld
R 2133 5 33 yoecld lomega tecld
S 2388 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 35 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
S 2390 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 29 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
R 2401 25 5 yoe_cuconvca tecuconvca
R 2402 5 6 yoe_cuconvca nlives tecuconvca
R 2403 5 7 yoe_cuconvca nfertyrs tecuconvca
R 2404 5 8 yoe_cuconvca nspinup tecuconvca
R 2405 5 9 yoe_cuconvca ncellcu tecuconvca
R 2408 5 12 yoe_cuconvca ncellcu$sd tecuconvca
R 2409 5 13 yoe_cuconvca ncellcu$p tecuconvca
R 2410 5 14 yoe_cuconvca ncellcu$o tecuconvca
R 2412 5 16 yoe_cuconvca nfertcu tecuconvca
R 2415 5 19 yoe_cuconvca nfertcu$sd tecuconvca
R 2416 5 20 yoe_cuconvca nfertcu$p tecuconvca
R 2417 5 21 yoe_cuconvca nfertcu$o tecuconvca
R 2419 5 23 yoe_cuconvca nbls tecuconvca
R 2422 5 26 yoe_cuconvca nbls$sd tecuconvca
R 2423 5 27 yoe_cuconvca nbls$p tecuconvca
R 2424 5 28 yoe_cuconvca nbls$o tecuconvca
R 2426 5 30 yoe_cuconvca nbss tecuconvca
R 2431 5 35 yoe_cuconvca nbss$sd tecuconvca
R 2432 5 36 yoe_cuconvca nbss$p tecuconvca
R 2433 5 37 yoe_cuconvca nbss$o tecuconvca
R 2435 5 39 yoe_cuconvca nrnbls tecuconvca
R 2437 5 41 yoe_cuconvca nrnbls$sd tecuconvca
R 2438 5 42 yoe_cuconvca nrnbls$p tecuconvca
R 2439 5 43 yoe_cuconvca nrnbls$o tecuconvca
R 2441 5 45 yoe_cuconvca nrnbss tecuconvca
R 2444 5 48 yoe_cuconvca nrnbss$sd tecuconvca
R 2445 5 49 yoe_cuconvca nrnbss$p tecuconvca
R 2446 5 50 yoe_cuconvca nrnbss$o tecuconvca
R 2448 5 52 yoe_cuconvca nbew tecuconvca
R 2452 5 56 yoe_cuconvca nbew$sd tecuconvca
R 2453 5 57 yoe_cuconvca nbew$p tecuconvca
R 2454 5 58 yoe_cuconvca nbew$o tecuconvca
R 2456 5 60 yoe_cuconvca nbns tecuconvca
R 2460 5 64 yoe_cuconvca nbns$sd tecuconvca
R 2461 5 65 yoe_cuconvca nbns$p tecuconvca
R 2462 5 66 yoe_cuconvca nbns$o tecuconvca
R 2464 5 68 yoe_cuconvca rcuconvca tecuconvca
R 2466 5 70 yoe_cuconvca rcuconvca$sd tecuconvca
R 2467 5 71 yoe_cuconvca rcuconvca$p tecuconvca
R 2468 5 72 yoe_cuconvca rcuconvca$o tecuconvca
R 2470 5 74 yoe_cuconvca rnlconvca tecuconvca
R 2472 5 76 yoe_cuconvca rnlconvca$sd tecuconvca
R 2473 5 77 yoe_cuconvca rnlconvca$p tecuconvca
R 2474 5 78 yoe_cuconvca rnlconvca$o tecuconvca
R 2476 5 80 yoe_cuconvca rcapeconvca tecuconvca
R 2478 5 82 yoe_cuconvca rcapeconvca$sd tecuconvca
R 2479 5 83 yoe_cuconvca rcapeconvca$p tecuconvca
R 2480 5 84 yoe_cuconvca rcapeconvca$o tecuconvca
R 2482 5 86 yoe_cuconvca rwasalive tecuconvca
R 2484 5 88 yoe_cuconvca rwasalive$sd tecuconvca
R 2485 5 89 yoe_cuconvca rwasalive$p tecuconvca
R 2486 5 90 yoe_cuconvca rwasalive$o tecuconvca
R 2488 5 92 yoe_cuconvca rwghtcu tecuconvca
R 2490 5 94 yoe_cuconvca rwghtcu$sd tecuconvca
R 2491 5 95 yoe_cuconvca rwghtcu$p tecuconvca
R 2492 5 96 yoe_cuconvca rwghtcu$o tecuconvca
R 2494 5 98 yoe_cuconvca rlatlonnbls tecuconvca
R 2498 5 102 yoe_cuconvca rlatlonnbls$sd tecuconvca
R 2499 5 103 yoe_cuconvca rlatlonnbls$p tecuconvca
R 2500 5 104 yoe_cuconvca rlatlonnbls$o tecuconvca
R 2502 5 106 yoe_cuconvca rlatlonnbss tecuconvca
R 2507 5 111 yoe_cuconvca rlatlonnbss$sd tecuconvca
R 2508 5 112 yoe_cuconvca rlatlonnbss$p tecuconvca
R 2509 5 113 yoe_cuconvca rlatlonnbss$o tecuconvca
R 2511 5 115 yoe_cuconvca rprob_survive tecuconvca
R 2512 5 116 yoe_cuconvca rprob_birth tecuconvca
R 2513 5 117 yoe_cuconvca rprob_fun_fert_s tecuconvca
R 2514 5 118 yoe_cuconvca rprob_fun_uw_dw_s tecuconvca
R 2515 5 119 yoe_cuconvca rprob_fun_fert_b tecuconvca
R 2516 5 120 yoe_cuconvca rprob_fun_uw_dw_b tecuconvca
R 2517 5 121 yoe_cuconvca rlondep tecuconvca
R 2521 5 125 yoe_cuconvca rlondep$sd tecuconvca
R 2522 5 126 yoe_cuconvca rlondep$p tecuconvca
R 2523 5 127 yoe_cuconvca rlondep$o tecuconvca
R 2525 5 129 yoe_cuconvca rlatdep tecuconvca
R 2529 5 133 yoe_cuconvca rlatdep$sd tecuconvca
R 2530 5 134 yoe_cuconvca rlatdep$p tecuconvca
R 2531 5 135 yoe_cuconvca rlatdep$o tecuconvca
R 2533 5 137 yoe_cuconvca rca_seedprob tecuconvca
R 2534 5 138 yoe_cuconvca rcadelx tecuconvca
R 2535 5 139 yoe_cuconvca lcuconv_ca tecuconvca
R 2536 5 140 yoe_cuconvca lca_advect tecuconvca
R 2537 5 141 yoe_cuconvca lca_global tecuconvca
R 2538 5 142 yoe_cuconvca lca_smooth tecuconvca
R 2539 5 143 yoe_cuconvca lca_test tecuconvca
R 2540 5 144 yoe_cuconvca lca_advtest tecuconvca
R 2541 5 145 yoe_cuconvca lca_rantrop tecuconvca
R 2542 5 146 yoe_cuconvca lca_nbdebug tecuconvca
R 2543 5 147 yoe_cuconvca lca_extract tecuconvca
R 2544 5 148 yoe_cuconvca ca_forc tecuconvca
R 2545 5 149 yoe_cuconvca ca_wind tecuconvca
R 2546 5 150 yoe_cuconvca ca_prob tecuconvca
R 2547 5 151 yoe_cuconvca nfrcaseed tecuconvca
R 2548 5 152 yoe_cuconvca ntestproc tecuconvca
R 2549 5 153 yoe_cuconvca ntestgp tecuconvca
R 2550 5 154 yoe_cuconvca ndxunreal tecuconvca
R 2551 5 155 yoe_cuconvca ndyunreal tecuconvca
R 2552 5 156 yoe_cuconvca sllong tecuconvca
R 2554 5 158 yoe_cuconvca sllong$sd tecuconvca
R 2555 5 159 yoe_cuconvca sllong$p tecuconvca
R 2556 5 160 yoe_cuconvca sllong$o tecuconvca
R 2558 5 162 yoe_cuconvca sllat tecuconvca
R 2560 5 164 yoe_cuconvca sllat$sd tecuconvca
R 2561 5 165 yoe_cuconvca sllat$p tecuconvca
R 2562 5 166 yoe_cuconvca sllat$o tecuconvca
R 2564 5 168 yoe_cuconvca sldlong tecuconvca
R 2566 5 170 yoe_cuconvca sldlong$sd tecuconvca
R 2567 5 171 yoe_cuconvca sldlong$p tecuconvca
R 2568 5 172 yoe_cuconvca sldlong$o tecuconvca
R 2570 5 174 yoe_cuconvca sldlat tecuconvca
R 2572 5 176 yoe_cuconvca sldlat$sd tecuconvca
R 2573 5 177 yoe_cuconvca sldlat$p tecuconvca
R 2574 5 178 yoe_cuconvca sldlat$o tecuconvca
R 2576 5 180 yoe_cuconvca slddlat tecuconvca
R 2578 5 182 yoe_cuconvca slddlat$sd tecuconvca
R 2579 5 183 yoe_cuconvca slddlat$p tecuconvca
R 2580 5 184 yoe_cuconvca slddlat$o tecuconvca
R 2655 25 26 yoethf tthf
R 2656 5 27 yoethf r2es tthf
R 2657 5 28 yoethf r3les tthf
R 2658 5 29 yoethf r3ies tthf
R 2659 5 30 yoethf r4les tthf
R 2660 5 31 yoethf r4ies tthf
R 2661 5 32 yoethf r5les tthf
R 2662 5 33 yoethf r5ies tthf
R 2663 5 34 yoethf rvtmp2 tthf
R 2664 5 35 yoethf rhoh2o tthf
R 2665 5 36 yoethf r5alvcp tthf
R 2666 5 37 yoethf r5alscp tthf
R 2667 5 38 yoethf ralvdcp tthf
R 2668 5 39 yoethf ralsdcp tthf
R 2669 5 40 yoethf ralfdcp tthf
R 2670 5 41 yoethf rtwat tthf
R 2671 5 42 yoethf rtber tthf
R 2672 5 43 yoethf rtbercu tthf
R 2673 5 44 yoethf rtice tthf
R 2674 5 45 yoethf rticecu tthf
R 2675 5 46 yoethf rtwat_rtice_r tthf
R 2676 5 47 yoethf rtwat_rticecu_r tthf
R 2677 5 48 yoethf rkoop1 tthf
R 2678 5 49 yoethf rkoop2 tthf
R 2700 25 10 model_physics_ecmwf_mod model_physics_ecmwf_type
R 2701 5 11 model_physics_ecmwf_mod yrephy model_physics_ecmwf_type
R 2702 5 12 model_physics_ecmwf_mod yrecld model_physics_ecmwf_type
R 2703 5 13 model_physics_ecmwf_mod yrecldp model_physics_ecmwf_type
R 2704 5 14 model_physics_ecmwf_mod yrecnd model_physics_ecmwf_type
R 2705 5 15 model_physics_ecmwf_mod yrecumf model_physics_ecmwf_type
R 2706 5 16 model_physics_ecmwf_mod yrecuconvca model_physics_ecmwf_type
R 2707 5 17 model_physics_ecmwf_mod yregwd model_physics_ecmwf_type
R 2708 5 18 model_physics_ecmwf_mod yregwwms model_physics_ecmwf_type
R 2709 5 19 model_physics_ecmwf_mod yrthf model_physics_ecmwf_type
R 2850 25 3 yomsrftlad tsrftlad
R 2851 5 4 yomsrftlad gptskin0 tsrftlad
R 2855 5 8 yomsrftlad gptskin0$sd tsrftlad
R 2856 5 9 yomsrftlad gptskin0$p tsrftlad
R 2857 5 10 yomsrftlad gptskin0$o tsrftlad
R 2859 5 12 yomsrftlad gptskin9 tsrftlad
R 2863 5 16 yomsrftlad gptskin9$sd tsrftlad
R 2864 5 17 yomsrftlad gptskin9$p tsrftlad
R 2865 5 18 yomsrftlad gptskin9$o tsrftlad
R 2867 5 20 yomsrftlad ngskin tsrftlad
R 2868 5 21 yomsrftlad lregsf tsrftlad
R 2875 25 2 yomsphyhist sphys_hist_type
R 2878 5 5 yomsphyhist ya5 sphys_hist_type
R 2879 5 6 yomsphyhist ya5$sd sphys_hist_type
R 2880 5 7 yomsphyhist ya5$p sphys_hist_type
R 2881 5 8 yomsphyhist ya5$o sphys_hist_type
R 2883 5 10 yomsphyhist yl5 sphys_hist_type
R 2886 5 13 yomsphyhist yl5$sd sphys_hist_type
R 2887 5 14 yomsphyhist yl5$p sphys_hist_type
R 2888 5 15 yomsphyhist yl5$o sphys_hist_type
R 2890 5 17 yomsphyhist yi5 sphys_hist_type
R 2893 5 20 yomsphyhist yi5$sd sphys_hist_type
R 2894 5 21 yomsphyhist yi5$p sphys_hist_type
R 2895 5 22 yomsphyhist yi5$o sphys_hist_type
R 2899 5 26 yomsphyhist radlwm sphys_hist_type
R 2900 5 27 yomsphyhist radlwm$sd sphys_hist_type
R 2901 5 28 yomsphyhist radlwm$p sphys_hist_type
R 2902 5 29 yomsphyhist radlwm$o sphys_hist_type
R 2904 5 31 yomsphyhist radlwm5 sphys_hist_type
R 2907 5 34 yomsphyhist radlwm5$sd sphys_hist_type
R 2908 5 35 yomsphyhist radlwm5$p sphys_hist_type
R 2909 5 36 yomsphyhist radlwm5$o sphys_hist_type
R 2913 5 40 yomsphyhist tgwdwmsu sphys_hist_type
R 2914 5 41 yomsphyhist tgwdwmsu$sd sphys_hist_type
R 2915 5 42 yomsphyhist tgwdwmsu$p sphys_hist_type
R 2916 5 43 yomsphyhist tgwdwmsu$o sphys_hist_type
R 2918 5 45 yomsphyhist tgwdwmsu5 sphys_hist_type
R 2921 5 48 yomsphyhist tgwdwmsu5$sd sphys_hist_type
R 2922 5 49 yomsphyhist tgwdwmsu5$p sphys_hist_type
R 2923 5 50 yomsphyhist tgwdwmsu5$o sphys_hist_type
R 2927 5 54 yomsphyhist tgwdwmsv sphys_hist_type
R 2928 5 55 yomsphyhist tgwdwmsv$sd sphys_hist_type
R 2929 5 56 yomsphyhist tgwdwmsv$p sphys_hist_type
R 2930 5 57 yomsphyhist tgwdwmsv$o sphys_hist_type
R 2932 5 59 yomsphyhist tgwdwmsv5 sphys_hist_type
R 2935 5 62 yomsphyhist tgwdwmsv5$sd sphys_hist_type
R 2936 5 63 yomsphyhist tgwdwmsv5$p sphys_hist_type
R 2937 5 64 yomsphyhist tgwdwmsv5$o sphys_hist_type
R 2953 25 10 model_physics_simplinear_mod model_physics_simplinear_type
R 2954 5 11 model_physics_simplinear_mod yrephli model_physics_simplinear_type
R 2955 5 12 model_physics_simplinear_mod yrcumfs model_physics_simplinear_type
R 2956 5 13 model_physics_simplinear_mod yregwdwms model_physics_simplinear_type
R 2957 5 14 model_physics_simplinear_mod yrecumf2 model_physics_simplinear_type
R 2958 5 15 model_physics_simplinear_mod yrphlc model_physics_simplinear_type
R 2959 5 16 model_physics_simplinear_mod yrphnc model_physics_simplinear_type
R 2960 5 17 model_physics_simplinear_mod yrncl model_physics_simplinear_type
R 2961 5 18 model_physics_simplinear_mod yrsrftlad model_physics_simplinear_type
R 2962 5 19 model_physics_simplinear_mod gphist model_physics_simplinear_type
R 2964 5 21 model_physics_simplinear_mod gphist$sd model_physics_simplinear_type
R 2965 5 22 model_physics_simplinear_mod gphist$p model_physics_simplinear_type
R 2966 5 23 model_physics_simplinear_mod gphist$o model_physics_simplinear_type
R 2974 25 2 yomcst tcst
R 2975 5 3 yomcst rpi tcst
R 2976 5 4 yomcst rclum tcst
R 2977 5 5 yomcst rhpla tcst
R 2978 5 6 yomcst rkbol tcst
R 2979 5 7 yomcst rnavo tcst
R 2980 5 8 yomcst rday tcst
R 2981 5 9 yomcst rdayi tcst
R 2982 5 10 yomcst rhour tcst
R 2983 5 11 yomcst rea tcst
R 2984 5 12 yomcst repsm tcst
R 2985 5 13 yomcst rsiyea tcst
R 2986 5 14 yomcst rsiday tcst
R 2987 5 15 yomcst romega tcst
R 2988 5 16 yomcst ra tcst
R 2989 5 17 yomcst rg tcst
R 2990 5 18 yomcst r1sa tcst
R 2991 5 19 yomcst deg2rad tcst
R 2992 5 20 yomcst rsigma tcst
R 2993 5 21 yomcst ri0 tcst
R 2994 5 22 yomcst r tcst
R 2995 5 23 yomcst rmd tcst
R 2996 5 24 yomcst rmv tcst
R 2997 5 25 yomcst rmo3 tcst
R 2998 5 26 yomcst rd tcst
R 2999 5 27 yomcst rv tcst
R 3000 5 28 yomcst rcpd tcst
R 3001 5 29 yomcst rcpv tcst
R 3002 5 30 yomcst rcvd tcst
R 3003 5 31 yomcst rcvv tcst
R 3004 5 32 yomcst rkappa tcst
R 3005 5 33 yomcst retv tcst
R 3006 5 34 yomcst rmco2 tcst
R 3007 5 35 yomcst rmch4 tcst
R 3008 5 36 yomcst rmn2o tcst
R 3009 5 37 yomcst rmco tcst
R 3010 5 38 yomcst rmhcho tcst
R 3011 5 39 yomcst rmno2 tcst
R 3012 5 40 yomcst rmso2 tcst
R 3013 5 41 yomcst rmso4 tcst
R 3014 5 42 yomcst rmcfc11 tcst
R 3015 5 43 yomcst rmcfc12 tcst
R 3016 5 44 yomcst rmhcfc22 tcst
R 3017 5 45 yomcst rmccl4 tcst
R 3018 5 46 yomcst rcw tcst
R 3019 5 47 yomcst rcs tcst
R 3020 5 48 yomcst ratm tcst
R 3021 5 49 yomcst rtt tcst
R 3022 5 50 yomcst rlvtt tcst
R 3023 5 51 yomcst rlstt tcst
R 3024 5 52 yomcst rlvzer tcst
R 3025 5 53 yomcst rlszer tcst
R 3026 5 54 yomcst rlmlt tcst
R 3027 5 55 yomcst rdt tcst
R 3028 5 56 yomcst restt tcst
R 3029 5 57 yomcst rgamw tcst
R 3030 5 58 yomcst rbetw tcst
R 3031 5 59 yomcst ralpw tcst
R 3032 5 60 yomcst rgams tcst
R 3033 5 61 yomcst rbets tcst
R 3034 5 62 yomcst ralps tcst
R 3035 5 63 yomcst ralpd tcst
R 3036 5 64 yomcst rbetd tcst
R 3037 5 65 yomcst rgamd tcst
R 3038 5 66 yomcst rk1 tcst
R 3039 5 67 yomcst rk2 tcst
R 3040 5 68 yomcst rk3 tcst
R 3041 5 69 yomcst rgnsssat tcst
R 3042 5 70 yomcst rgnssear tcst
R 3043 5 71 yomcst rawgs tcst
R 3044 5 72 yomcst rewgs tcst
R 3045 5 73 yomcst rfwgs tcst
R 3046 5 74 yomcst rgequ tcst
R 3047 5 75 yomcst rgrat tcst
R 3048 5 76 yomcst rkssom tcst
S 3132 23 5 0 0 0 3213 624 24917 0 0 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 cumastrn_loki
S 3133 1 3 1 0 10 1 3132 24931 4 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ppldare
S 3134 1 3 1 0 10 1 3132 24939 4 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 pplrg
S 3135 1 3 1 0 1595 1 3132 24945 4 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ydthf
S 3136 1 3 1 0 1589 1 3132 24951 4 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ydcst
S 3137 1 3 1 0 1631 1 3132 24957 4 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ydml_phy_slin
S 3138 1 3 1 0 1625 1 3132 24971 4 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ydml_phy_ec
S 3139 1 3 1 0 1619 1 3132 15447 4 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ygfl
S 3140 1 3 1 0 1637 1 3132 24983 4 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ydchem
S 3141 6 3 1 0 1613 1 3132 24990 800004 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ydspp_config
S 3142 1 3 1 0 1601 1 3132 25003 4 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ydpertpar
S 3143 1 3 1 0 6 1 3132 25013 4 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 kidia
S 3144 1 3 1 0 6 1 3132 25019 4 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 kfdia
S 3145 6 3 1 0 6 1 3132 25025 800004 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 klon
S 3146 6 3 1 0 6 1 3132 25030 800004 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 klev
S 3147 7 3 1 0 1706 1 3132 25035 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 pdx
S 3148 1 3 1 0 18 1 3132 25039 4 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ldtdkmf
S 3149 1 3 1 0 18 1 3132 25047 4 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ldmcapea
S 3150 7 3 1 0 1643 1 3132 25056 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ldland
S 3151 1 3 1 0 10 1 3132 25063 4 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ptsphy
S 3152 7 3 3 0 1649 1 3132 25070 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 pten
S 3153 7 3 3 0 1652 1 3132 25075 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 pqen
S 3154 7 3 1 0 1655 1 3132 25080 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 puen
S 3155 7 3 1 0 1658 1 3132 25085 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 pven
S 3156 7 3 1 0 1661 1 3132 25090 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 plitot
S 3157 7 3 1 0 1664 1 3132 25097 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 pvervel
S 3158 7 3 3 0 1667 1 3132 25105 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 pqsen
S 3159 7 3 1 0 1670 1 3132 25111 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 pqhfl
S 3160 7 3 1 0 1673 1 3132 25117 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 pahfs
S 3161 7 3 1 0 1676 1 3132 25123 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 pap
S 3162 7 3 1 0 1679 1 3132 25127 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 paph
S 3163 7 3 1 0 1682 1 3132 25132 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 pgeo
S 3164 7 3 1 0 1685 1 3132 25137 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 pgeoh
S 3165 7 3 1 0 1688 1 3132 25143 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 pgaw
S 3166 7 3 1 0 1691 1 3132 25148 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 pcuconvca
S 3167 7 3 1 0 1694 1 3132 25158 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 pgp2dspp
S 3168 7 3 3 0 1709 1 3132 25167 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ptent
S 3169 7 3 3 0 1712 1 3132 25173 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ptenq
S 3170 7 3 3 0 1715 1 3132 25179 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ptenu
S 3171 7 3 3 0 1718 1 3132 25185 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ptenv
S 3172 7 3 1 0 1721 1 3132 25191 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ptenta
S 3173 7 3 1 0 1724 1 3132 25198 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ptenqa
S 3174 7 3 2 0 1730 1 3132 25205 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ldcum
S 3175 7 3 2 0 1733 1 3132 25211 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ktype
S 3176 7 3 2 0 1736 1 3132 25217 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 kcbot
S 3177 7 3 2 0 1739 1 3132 25223 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 kctop
S 3178 7 3 2 0 1742 1 3132 25229 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ldcum_lig
S 3179 7 3 2 0 1745 1 3132 25239 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 kcbot_lig
S 3180 7 3 2 0 1748 1 3132 25249 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 kctop_lig
S 3181 7 3 2 0 1751 1 3132 25259 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 kbotsc
S 3182 7 3 2 0 1754 1 3132 25266 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ldsc
S 3183 7 3 1 0 1757 1 3132 25271 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ldshcv
S 3184 7 3 1 0 1646 1 3132 25278 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 plcrit_aer
S 3185 7 3 2 0 1760 1 3132 25289 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ptu
S 3186 7 3 2 0 1763 1 3132 25293 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 pqu
S 3187 7 3 2 0 1766 1 3132 25297 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 plu
S 3188 7 3 2 0 1769 1 3132 25301 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 plude
S 3189 7 3 2 0 1772 1 3132 25307 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 pludeli
S 3190 7 3 2 0 1775 1 3132 25315 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 psnde
S 3191 7 3 2 0 1778 1 3132 25321 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 penth
S 3192 7 3 2 0 1781 1 3132 25327 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 pmflxr
S 3193 7 3 2 0 1784 1 3132 25334 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 pmflxs
S 3194 7 3 2 0 1787 1 3132 25341 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 prain
S 3195 7 3 2 0 1790 1 3132 25347 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 plrain
S 3196 7 3 2 0 1793 1 3132 25354 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 prsud
S 3197 7 3 2 0 1796 1 3132 25360 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 pmfu
S 3198 7 3 2 0 1799 1 3132 25365 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 pmfd
S 3199 7 3 2 0 1802 1 3132 25370 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 plglac
S 3200 7 3 2 0 1805 1 3132 25377 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 pmfude_rate
S 3201 7 3 2 0 1808 1 3132 25389 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 pmfdde_rate
S 3202 7 3 2 0 1811 1 3132 25401 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 pcape
S 3203 7 3 2 0 1820 1 3132 25407 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 pwu
S 3204 7 3 2 0 1814 1 3132 25411 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 pwmean
S 3205 7 3 2 0 1817 1 3132 25418 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 pvdiscu
S 3206 7 3 2 0 1823 1 3132 25426 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 pdiss
S 3207 6 3 1 0 6 1 3132 25432 800004 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ktrac
S 3208 7 3 1 0 1697 1 3132 25438 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 pcen
S 3209 7 3 3 0 1727 1 3132 25443 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ptenc
S 3210 7 3 1 0 1700 1 3132 25449 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 pscav
S 3211 7 3 1 0 1703 1 3132 25455 800204 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 pscav0
S 3212 1 3 3 0 7 1 3132 25462 4 3000 A 0 0 0 0 B 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ydstack_l
S 3213 14 5 0 0 0 1 3132 24917 200 400000 A 0 0 0 0 B 0 3 0 0 0 0 0 87 80 0 0 0 0 0 0 0 11 0 0 0 0 3 0 624 0 0 0 0 cumastrn_loki cumastrn_loki 
F 3213 80 3133 3134 3135 3136 3137 3138 3139 3140 3141 3142 3143 3144 3145 3146 3147 3148 3149 3150 3151 3152 3153 3154 3155 3156 3157 3158 3159 3160 3161 3162 3163 3164 3165 3166 3167 3168 3169 3170 3171 3172 3173 3174 3175 3176 3177 3178 3179 3180 3181 3182 3183 3184 3185 3186 3187 3188 3189 3190 3191 3192 3193 3194 3195 3196 3197 3198 3199 3200 3201 3202 3203 3204 3205 3206 3207 3208 3209 3210 3211 3212
mr 3213 0 357 1 13:cumastrn_loki
mt 3213 1 64 0:
S 3214 6 1 0 0 7 1 3132 25472 40800006 3000 A 0 0 0 0 B 0 254 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_e_1206
S 3215 6 1 0 0 7 1 3132 25481 40800006 3000 A 0 0 0 0 B 0 256 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_e_1209
S 3216 6 1 0 0 7 1 3132 25490 40800006 3000 A 0 0 0 0 B 0 256 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_e_1211
S 3217 6 1 0 0 7 1 3132 25499 40800006 3000 A 0 0 0 0 B 0 256 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_e_1213
S 3218 6 1 0 0 7 1 3132 25508 40800006 3000 A 0 0 0 0 B 0 264 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_e_1216
S 3219 6 1 0 0 7 1 3132 25517 40800006 3000 A 0 0 0 0 B 0 264 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_e_1218
S 3220 6 1 0 0 7 1 3132 25526 40800006 3000 A 0 0 0 0 B 0 272 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_e_1223
S 3221 6 1 0 0 7 1 3132 25535 40800006 3000 A 0 0 0 0 B 0 272 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_e_1225
S 3222 6 1 0 0 7 1 3132 25544 40800006 3000 A 0 0 0 0 B 0 273 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_e_1228
S 3223 6 1 0 0 7 1 3132 25553 40800006 3000 A 0 0 0 0 B 0 273 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_e_1230
S 3224 6 1 0 0 7 1 3132 25562 40800006 3000 A 0 0 0 0 B 0 273 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_e_1232
S 3225 6 1 0 0 7 1 3132 25571 40800006 3000 A 0 0 0 0 B 0 299 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_e_1234
S 3226 6 1 0 0 7 1 3132 25580 40800006 3000 A 0 0 0 0 B 0 300 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_e_1236
A 18 2 0 0 0 6 628 0 0 0 18 0 0 0 0 0 0 0 0 0 0 0
A 26 2 0 0 0 6 641 0 0 0 26 0 0 0 0 0 0 0 0 0 0 0
A 36 2 0 0 0 58 644 0 0 0 36 0 0 0 0 0 0 0 0 0 0 0
A 37 2 0 0 0 7 646 0 0 0 37 0 0 0 0 0 0 0 0 0 0 0
A 38 2 0 0 0 7 650 0 0 0 38 0 0 0 0 0 0 0 0 0 0 0
A 39 2 0 0 0 7 651 0 0 0 39 0 0 0 0 0 0 0 0 0 0 0
A 41 2 0 0 0 7 656 0 0 0 41 0 0 0 0 0 0 0 0 0 0 0
A 51 2 0 0 0 7 655 0 0 0 51 0 0 0 0 0 0 0 0 0 0 0
A 94 2 0 0 0 18 645 0 0 0 94 0 0 0 0 0 0 0 0 0 0 0
A 95 2 0 0 0 10 617 0 0 0 95 0 0 0 0 0 0 0 0 0 0 0
A 96 2 0 0 0 10 647 0 0 0 96 0 0 0 0 0 0 0 0 0 0 0
A 97 2 0 0 0 10 648 0 0 0 97 0 0 0 0 0 0 0 0 0 0 0
A 98 2 0 0 0 18 649 0 0 0 98 0 0 0 0 0 0 0 0 0 0 0
A 101 2 0 0 0 6 988 0 0 0 101 0 0 0 0 0 0 0 0 0 0 0
A 129 2 0 0 0 6 1132 0 0 0 129 0 0 0 0 0 0 0 0 0 0 0
A 156 2 0 0 0 7 1147 0 0 0 156 0 0 0 0 0 0 0 0 0 0 0
A 159 2 0 0 0 7 1150 0 0 0 159 0 0 0 0 0 0 0 0 0 0 0
A 168 2 0 0 0 7 1151 0 0 0 168 0 0 0 0 0 0 0 0 0 0 0
A 197 2 0 0 0 286 1242 0 0 0 197 0 0 0 0 0 0 0 0 0 0 0
A 198 2 0 0 0 286 1243 0 0 0 198 0 0 0 0 0 0 0 0 0 0 0
A 199 2 0 0 0 286 1244 0 0 0 199 0 0 0 0 0 0 0 0 0 0 0
A 200 2 0 0 0 286 1245 0 0 0 200 0 0 0 0 0 0 0 0 0 0 0
A 201 2 0 0 0 286 1246 0 0 0 201 0 0 0 0 0 0 0 0 0 0 0
A 202 2 0 0 0 286 1247 0 0 0 202 0 0 0 0 0 0 0 0 0 0 0
A 203 2 0 0 0 286 1248 0 0 0 203 0 0 0 0 0 0 0 0 0 0 0
A 204 2 0 0 0 286 1249 0 0 0 204 0 0 0 0 0 0 0 0 0 0 0
A 233 2 0 0 0 306 1251 0 0 0 233 0 0 0 0 0 0 0 0 0 0 0
A 234 2 0 0 0 306 1252 0 0 0 234 0 0 0 0 0 0 0 0 0 0 0
A 235 2 0 0 0 306 1253 0 0 0 235 0 0 0 0 0 0 0 0 0 0 0
A 236 2 0 0 0 306 1254 0 0 0 236 0 0 0 0 0 0 0 0 0 0 0
A 237 2 0 0 0 306 1255 0 0 0 237 0 0 0 0 0 0 0 0 0 0 0
A 244 2 0 0 0 7 1250 0 0 0 244 0 0 0 0 0 0 0 0 0 0 0
A 254 1 0 5 0 288 1272 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 261 1 0 7 0 308 1297 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 294 2 0 0 0 7 1337 0 0 0 294 0 0 0 0 0 0 0 0 0 0 0
A 439 2 0 0 0 7 1338 0 0 0 439 0 0 0 0 0 0 0 0 0 0 0
A 440 2 0 0 0 7 1339 0 0 0 440 0 0 0 0 0 0 0 0 0 0 0
A 441 2 0 0 404 7 1340 0 0 0 441 0 0 0 0 0 0 0 0 0 0 0
A 443 2 0 0 0 7 1342 0 0 0 443 0 0 0 0 0 0 0 0 0 0 0
A 444 2 0 0 0 7 1343 0 0 0 444 0 0 0 0 0 0 0 0 0 0 0
A 445 2 0 0 0 7 1344 0 0 0 445 0 0 0 0 0 0 0 0 0 0 0
A 446 2 0 0 0 7 1345 0 0 0 446 0 0 0 0 0 0 0 0 0 0 0
A 461 2 0 0 0 348 1332 0 0 0 461 0 0 0 0 0 0 0 0 0 0 0
A 462 2 0 0 0 6 1333 0 0 0 462 0 0 0 0 0 0 0 0 0 0 0
A 463 2 0 0 0 6 1334 0 0 0 463 0 0 0 0 0 0 0 0 0 0 0
A 518 1 0 0 82 835 1956 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 521 1 0 0 0 844 1958 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 580 2 0 0 395 7 2388 0 0 0 580 0 0 0 0 0 0 0 0 0 0 0
A 600 2 0 0 0 7 2390 0 0 0 600 0 0 0 0 0 0 0 0 0 0 0
A 992 1 0 0 0 6 3145 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 993 7 0 0 0 7 992 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 994 1 0 0 0 7 3214 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 995 1 0 0 0 7 3217 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 996 1 0 0 0 6 3146 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 997 7 0 0 0 7 996 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 998 1 0 0 0 7 3215 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 999 1 0 0 0 7 3216 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 1000 4 0 0 0 6 996 0 3 0 0 0 0 1 0 0 0 0 0 0 0 0
A 1001 7 0 0 0 7 1000 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 1002 1 0 0 0 7 3218 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 1003 1 0 0 0 7 3219 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 1004 1 0 0 0 1613 3141 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 1005 1 0 0 0 193 1083 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 1006 9 0 0 0 1607 1004 1005 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 1007 1 0 0 0 6 709 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 1008 9 0 0 0 6 1006 1007 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 1009 7 0 0 0 7 1008 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 1010 1 0 0 0 7 3220 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 1011 1 0 0 0 7 3221 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 1012 1 0 0 0 7 3224 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 1013 1 0 0 0 6 3207 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 1014 7 0 0 0 7 1013 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 1015 1 0 0 0 7 3222 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 1016 1 0 0 0 7 3223 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 1017 1 0 0 0 7 3225 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 1018 1 0 0 0 7 3226 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
Z
J 32 1 1
V 254 288 7 0
R 0 291 0 0
A 0 286 0 0 1 197 1
A 0 286 0 0 1 198 1
A 0 286 0 0 1 199 1
A 0 286 0 0 1 200 1
A 0 286 0 0 1 201 1
A 0 286 0 0 1 202 1
A 0 286 0 0 1 203 1
A 0 286 0 0 1 204 0
J 75 1 1
V 261 308 7 0
R 0 311 0 0
A 0 306 0 0 1 233 1
A 0 306 0 0 1 234 1
A 0 306 0 0 1 235 1
A 0 306 0 0 1 236 1
A 0 306 0 0 1 237 0
J 133 1 1
V 518 835 7 0
S 0 835 0 0 0
A 0 6 0 0 1 2 0
J 134 1 1
V 521 844 7 0
S 0 844 0 0 0
A 0 6 0 0 1 2 0
T 667 60 0 3 0 0
A 668 58 0 0 1 36 1
A 669 18 0 0 1 94 1
R 671 66 0 1
A 0 10 0 37 1 95 0
R 672 69 0 1
A 0 10 0 37 1 95 0
A 673 10 0 0 1 97 1
A 674 10 0 0 1 96 1
A 676 6 0 0 1 3 1
A 677 18 0 0 1 98 1
R 678 72 0 1
A 0 6 0 38 1 2 0
A 679 6 0 0 1 3 1
A 680 6 0 0 1 3 1
A 681 6 0 0 1 2 1
A 682 18 0 0 1 94 1
A 683 58 0 0 1 36 1
A 684 6 0 0 1 3 0
T 692 78 0 3 0 0
A 707 6 0 0 1 2 1
A 709 6 0 0 1 2 1
A 710 6 0 0 1 2 0
T 815 133 0 3 0 0
A 816 18 0 0 1 94 1
A 818 18 0 0 1 94 1
A 821 18 0 0 1 94 1
A 824 18 0 0 1 94 1
A 827 18 0 0 1 94 1
A 830 18 0 0 1 94 1
A 833 18 0 0 1 94 1
A 838 18 0 0 1 94 1
A 841 18 0 0 1 94 1
A 844 18 0 0 1 94 1
A 847 18 0 0 1 94 1
A 850 18 0 0 1 94 1
A 853 18 0 0 1 94 1
A 856 18 0 0 1 94 1
A 859 18 0 0 1 94 1
A 862 18 0 0 1 94 1
A 865 18 0 0 1 94 1
A 868 18 0 0 1 94 1
A 871 18 0 0 1 94 1
A 874 18 0 0 1 94 1
A 877 18 0 0 1 94 1
A 880 18 0 0 1 94 1
A 883 18 0 0 1 94 1
A 886 18 0 0 1 94 1
A 889 18 0 0 1 94 1
A 892 18 0 0 1 94 1
A 895 18 0 0 1 94 1
A 898 18 0 0 1 94 1
A 901 18 0 0 1 94 1
A 904 18 0 0 1 94 1
A 907 18 0 0 1 94 1
A 910 18 0 0 1 94 1
A 913 18 0 0 1 94 1
A 916 18 0 0 1 94 1
A 919 18 0 0 1 94 1
A 922 18 0 0 1 94 1
A 925 18 0 0 1 94 1
A 928 18 0 0 1 94 1
A 931 18 0 0 1 94 1
A 934 18 0 0 1 94 1
A 937 18 0 0 1 94 1
A 940 18 0 0 1 94 1
A 943 18 0 0 1 94 1
A 946 18 0 0 1 94 1
A 949 18 0 0 1 94 1
A 952 18 0 0 1 94 1
A 955 18 0 0 1 94 1
A 958 18 0 0 1 94 1
A 961 18 0 0 1 94 1
A 964 18 0 0 1 94 1
A 967 18 0 0 1 94 1
A 970 18 0 0 1 94 0
T 991 165 0 3 0 0
A 992 6 0 0 1 101 1
A 993 6 0 0 1 101 1
A 994 6 0 0 1 101 1
A 995 6 0 0 1 101 1
A 996 6 0 0 1 101 1
A 997 6 0 0 1 101 1
A 998 6 0 0 1 101 1
A 999 6 0 0 1 101 1
A 1000 6 0 0 1 101 1
A 1001 6 0 0 1 101 1
A 1002 6 0 0 1 101 1
A 1003 6 0 0 1 101 1
A 1004 6 0 0 1 101 1
A 1005 6 0 0 1 101 1
A 1006 6 0 0 1 101 1
A 1007 6 0 0 1 101 1
A 1008 6 0 0 1 101 1
A 1009 6 0 0 1 101 1
A 1010 6 0 0 1 101 1
A 1011 6 0 0 1 101 1
A 1012 6 0 0 1 101 1
A 1013 6 0 0 1 101 1
A 1014 6 0 0 1 101 1
A 1015 6 0 0 1 101 1
A 1016 6 0 0 1 101 1
A 1017 6 0 0 1 101 1
A 1018 6 0 0 1 101 1
A 1019 6 0 0 1 101 1
A 1020 6 0 0 1 101 1
A 1021 6 0 0 1 101 1
A 1022 6 0 0 1 101 1
A 1023 6 0 0 1 101 1
A 1024 6 0 0 1 101 1
A 1025 6 0 0 1 101 1
A 1026 6 0 0 1 101 1
A 1027 6 0 0 1 101 1
A 1028 6 0 0 1 101 1
A 1029 6 0 0 1 101 1
A 1030 6 0 0 1 101 1
A 1031 6 0 0 1 101 1
A 1032 6 0 0 1 101 1
A 1033 6 0 0 1 101 1
A 1034 6 0 0 1 101 1
A 1035 6 0 0 1 101 1
A 1036 6 0 0 1 101 1
A 1037 6 0 0 1 101 1
A 1038 6 0 0 1 101 1
A 1039 6 0 0 1 101 1
A 1040 6 0 0 1 101 1
A 1041 6 0 0 1 101 1
A 1042 6 0 0 1 101 1
A 1043 6 0 0 1 101 1
A 1044 6 0 0 1 101 0
T 1080 209 0 3 0 0
A 1081 18 0 0 1 94 1
T 1083 193 0 3 0 1
A 707 6 0 0 1 2 1
A 709 6 0 0 1 2 1
A 710 6 0 0 1 2 0
T 1084 203 0 3 0 1
A 992 6 0 0 1 101 1
A 993 6 0 0 1 101 1
A 994 6 0 0 1 101 1
A 995 6 0 0 1 101 1
A 996 6 0 0 1 101 1
A 997 6 0 0 1 101 1
A 998 6 0 0 1 101 1
A 999 6 0 0 1 101 1
A 1000 6 0 0 1 101 1
A 1001 6 0 0 1 101 1
A 1002 6 0 0 1 101 1
A 1003 6 0 0 1 101 1
A 1004 6 0 0 1 101 1
A 1005 6 0 0 1 101 1
A 1006 6 0 0 1 101 1
A 1007 6 0 0 1 101 1
A 1008 6 0 0 1 101 1
A 1009 6 0 0 1 101 1
A 1010 6 0 0 1 101 1
A 1011 6 0 0 1 101 1
A 1012 6 0 0 1 101 1
A 1013 6 0 0 1 101 1
A 1014 6 0 0 1 101 1
A 1015 6 0 0 1 101 1
A 1016 6 0 0 1 101 1
A 1017 6 0 0 1 101 1
A 1018 6 0 0 1 101 1
A 1019 6 0 0 1 101 1
A 1020 6 0 0 1 101 1
A 1021 6 0 0 1 101 1
A 1022 6 0 0 1 101 1
A 1023 6 0 0 1 101 1
A 1024 6 0 0 1 101 1
A 1025 6 0 0 1 101 1
A 1026 6 0 0 1 101 1
A 1027 6 0 0 1 101 1
A 1028 6 0 0 1 101 1
A 1029 6 0 0 1 101 1
A 1030 6 0 0 1 101 1
A 1031 6 0 0 1 101 1
A 1032 6 0 0 1 101 1
A 1033 6 0 0 1 101 1
A 1034 6 0 0 1 101 1
A 1035 6 0 0 1 101 1
A 1036 6 0 0 1 101 1
A 1037 6 0 0 1 101 1
A 1038 6 0 0 1 101 1
A 1039 6 0 0 1 101 1
A 1040 6 0 0 1 101 1
A 1041 6 0 0 1 101 1
A 1042 6 0 0 1 101 1
A 1043 6 0 0 1 101 1
A 1044 6 0 0 1 101 0
A 1086 18 0 0 1 98 1
A 1101 6 0 0 1 3 1
A 1103 18 0 0 1 94 0
T 1113 228 0 3 0 0
A 1123 7 246 0 1 2 1
A 1124 7 0 0 1 10 1
A 1122 7 0 39 1 10 0
T 1171 251 0 0 0 0
A 1225 7 279 0 1 2 1
A 1224 7 0 159 1 10 1
A 1231 7 281 0 1 2 1
A 1230 7 0 39 1 10 0
T 1355 340 0 3 0 0
A 1356 348 0 0 1 461 1
A 1357 6 0 0 1 462 1
A 1358 18 0 0 1 94 1
A 1359 18 0 0 1 94 1
A 1360 18 0 0 1 94 1
A 1361 18 0 0 1 94 1
A 1362 6 0 0 1 2 1
A 1363 18 0 0 1 94 1
A 1364 18 0 0 1 98 1
A 1365 18 0 0 1 94 1
A 1366 18 0 0 1 94 1
A 1367 18 0 0 1 94 1
A 1368 18 0 0 1 94 1
A 1369 18 0 0 1 94 1
A 1370 18 0 0 1 94 1
A 1371 10 0 0 1 95 1
A 1372 10 0 0 1 95 1
A 1373 18 0 0 1 94 1
A 1374 18 0 0 1 94 1
A 1375 18 0 0 1 94 1
A 1376 18 0 0 1 94 1
A 1377 18 0 0 1 94 1
A 1378 18 0 0 1 94 1
A 1379 18 0 0 1 94 1
A 1380 18 0 0 1 94 1
A 1381 10 0 0 1 95 1
A 1382 18 0 0 1 94 1
A 1383 18 0 0 1 94 1
A 1384 6 0 0 1 2 1
A 1385 10 0 0 1 95 1
A 1386 18 0 0 1 94 1
A 1387 348 0 0 1 461 1
A 1388 6 0 0 1 463 1
A 1389 6 0 0 1 463 1
A 1390 6 0 0 1 463 1
A 1391 6 0 0 1 463 1
A 1392 6 0 0 1 463 1
A 1393 6 0 0 1 463 1
A 1394 6 0 0 1 463 1
A 1395 6 0 0 1 463 1
A 1396 6 0 0 1 463 1
A 1397 6 0 0 1 463 1
A 1398 6 0 0 1 463 1
A 1399 6 0 0 1 463 1
A 1400 6 0 0 1 463 1
A 1401 6 0 0 1 463 1
A 1402 6 0 0 1 463 1
A 1403 6 0 0 1 463 1
A 1404 6 0 0 1 463 1
A 1405 6 0 0 1 463 1
A 1427 6 0 0 1 101 1
A 1430 7 355 0 1 2 0
T 1433 360 0 3 0 0
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1487 369 0 3 0 0
A 1488 6 0 0 1 2 1
A 1489 6 0 0 1 2 1
A 1490 6 0 0 1 2 1
A 1491 6 0 0 1 2 1
A 1492 6 0 0 1 2 1
A 1493 6 0 0 1 2 1
A 1494 6 0 0 1 2 1
A 1495 6 0 0 1 2 1
A 1496 6 0 0 1 2 1
A 1497 6 0 0 1 2 1
A 1498 6 0 0 1 2 1
A 1499 6 0 0 1 2 1
A 1500 6 0 0 1 2 1
A 1501 6 0 0 1 2 1
A 1502 6 0 0 1 2 1
A 1503 6 0 0 1 2 1
A 1504 6 0 0 1 2 1
A 1505 6 0 0 1 2 1
A 1506 6 0 0 1 2 1
A 1507 6 0 0 1 2 1
A 1508 6 0 0 1 2 1
A 1509 6 0 0 1 2 1
A 1527 18 0 0 1 94 1
A 1528 18 0 0 1 94 1
A 1529 18 0 0 1 94 1
A 1530 18 0 0 1 94 1
A 1531 18 0 0 1 94 1
A 1532 18 0 0 1 94 1
A 1533 18 0 0 1 94 1
A 1534 18 0 0 1 94 1
A 1535 18 0 0 1 94 1
A 1536 18 0 0 1 94 1
A 1556 18 0 0 1 94 1
A 1557 18 0 0 1 94 1
A 1558 18 0 0 1 94 1
A 1559 18 0 0 1 94 1
A 1560 18 0 0 1 94 1
A 1561 18 0 0 1 94 1
A 1562 18 0 0 1 94 1
A 1563 18 0 0 1 94 1
A 1564 18 0 0 1 94 1
A 1565 18 0 0 1 94 1
T 1576 340 0 294 0 1
A 1356 348 0 0 1 461 1
A 1357 6 0 0 1 462 1
A 1358 18 0 0 1 94 1
A 1359 18 0 0 1 94 1
A 1360 18 0 0 1 94 1
A 1361 18 0 0 1 94 1
A 1362 6 0 0 1 2 1
A 1363 18 0 0 1 94 1
A 1364 18 0 0 1 98 1
A 1365 18 0 0 1 94 1
A 1366 18 0 0 1 94 1
A 1367 18 0 0 1 94 1
A 1368 18 0 0 1 94 1
A 1369 18 0 0 1 94 1
A 1370 18 0 0 1 94 1
A 1371 10 0 0 1 95 1
A 1372 10 0 0 1 95 1
A 1373 18 0 0 1 94 1
A 1374 18 0 0 1 94 1
A 1375 18 0 0 1 94 1
A 1376 18 0 0 1 94 1
A 1377 18 0 0 1 94 1
A 1378 18 0 0 1 94 1
A 1379 18 0 0 1 94 1
A 1380 18 0 0 1 94 1
A 1381 10 0 0 1 95 1
A 1382 18 0 0 1 94 1
A 1383 18 0 0 1 94 1
A 1384 6 0 0 1 2 1
A 1385 10 0 0 1 95 1
A 1386 18 0 0 1 94 1
A 1387 348 0 0 1 461 1
A 1388 6 0 0 1 463 1
A 1389 6 0 0 1 463 1
A 1390 6 0 0 1 463 1
A 1391 6 0 0 1 463 1
A 1392 6 0 0 1 463 1
A 1393 6 0 0 1 463 1
A 1394 6 0 0 1 463 1
A 1395 6 0 0 1 463 1
A 1396 6 0 0 1 463 1
A 1397 6 0 0 1 463 1
A 1398 6 0 0 1 463 1
A 1399 6 0 0 1 463 1
A 1400 6 0 0 1 463 1
A 1401 6 0 0 1 463 1
A 1402 6 0 0 1 463 1
A 1403 6 0 0 1 463 1
A 1404 6 0 0 1 463 1
A 1405 6 0 0 1 463 1
A 1427 6 0 0 1 101 1
A 1430 7 355 0 1 2 0
A 1579 7 690 0 1 2 1
A 1582 7 692 0 1 2 1
A 1585 7 694 0 1 2 1
A 1588 7 696 0 1 2 1
A 1591 7 698 0 1 2 1
A 1594 7 700 0 1 2 1
A 1597 7 702 0 1 2 1
A 1600 7 704 0 1 2 1
A 1603 7 706 0 1 2 1
A 1606 7 708 0 1 2 1
A 1609 7 710 0 1 2 1
A 1612 7 712 0 1 2 1
A 1615 7 714 0 1 2 1
A 1618 7 716 0 1 2 1
A 1621 7 718 0 1 2 1
A 1624 7 720 0 1 2 1
A 1627 7 722 0 1 2 1
A 1630 7 724 0 1 2 1
A 1633 7 726 0 1 2 1
A 1636 7 728 0 1 2 1
A 1639 7 730 0 1 2 1
A 1642 7 732 0 1 2 1
A 1645 7 734 0 1 2 1
A 1648 7 736 0 1 2 1
A 1651 7 738 0 1 2 1
A 1654 7 740 0 1 2 1
A 1657 7 742 0 1 2 1
A 1660 7 744 0 1 2 1
A 1663 7 746 0 1 2 1
A 1666 7 748 0 1 2 1
A 1669 7 750 0 1 2 1
A 1672 7 752 0 1 2 1
A 1675 7 754 0 1 2 1
A 1679 7 756 0 1 2 1
A 1680 7 0 0 1 10 1
A 1678 7 0 39 1 10 1
A 1685 7 758 0 1 2 1
A 1686 7 0 0 1 10 1
A 1684 7 0 39 1 10 1
A 1691 7 760 0 1 2 1
A 1692 7 0 0 1 10 1
A 1690 7 0 39 1 10 1
A 1696 7 762 0 1 2 1
A 1700 7 764 0 1 2 1
A 1701 7 0 0 1 10 1
A 1699 7 0 39 1 10 1
A 1706 7 766 0 1 2 1
A 1707 7 0 0 1 10 1
A 1705 7 0 39 1 10 1
A 1712 7 768 0 1 2 1
A 1713 7 0 0 1 10 1
A 1711 7 0 39 1 10 1
A 1718 7 770 0 1 2 1
A 1719 7 0 0 1 10 1
A 1717 7 0 39 1 10 1
A 1724 7 772 0 1 2 1
A 1725 7 0 0 1 10 1
A 1723 7 0 39 1 10 1
A 1730 7 774 0 1 2 1
A 1731 7 0 0 1 10 1
A 1729 7 0 39 1 10 1
A 1736 7 776 0 1 2 1
A 1737 7 0 0 1 10 1
A 1735 7 0 39 1 10 1
A 1742 7 778 0 1 2 1
A 1743 7 0 0 1 10 1
A 1741 7 0 39 1 10 1
A 1748 7 780 0 1 2 1
A 1749 7 0 0 1 10 1
A 1747 7 0 39 1 10 1
A 1754 7 782 0 1 2 1
A 1755 7 0 0 1 10 1
A 1753 7 0 39 1 10 1
A 1760 7 784 0 1 2 1
A 1761 7 0 0 1 10 1
A 1759 7 0 39 1 10 1
A 1766 7 786 0 1 2 1
A 1767 7 0 0 1 10 1
A 1765 7 0 39 1 10 1
A 1772 7 788 0 1 2 1
A 1773 7 0 0 1 10 1
A 1771 7 0 39 1 10 1
A 1777 7 790 0 1 2 1
A 1780 7 792 0 1 2 1
A 1783 7 794 0 1 2 1
A 1786 7 796 0 1 2 1
A 1789 7 798 0 1 2 1
A 1792 7 800 0 1 2 1
A 1795 7 802 0 1 2 1
A 1798 7 804 0 1 2 1
A 1801 7 806 0 1 2 1
A 1804 7 808 0 1 2 1
A 1807 7 810 0 1 2 1
A 1810 7 812 0 1 2 1
A 1813 7 814 0 1 2 1
A 1817 7 816 0 1 2 1
A 1818 7 0 0 1 10 1
A 1816 7 0 39 1 10 1
A 1822 7 818 0 1 2 1
A 1826 7 820 0 1 2 1
A 1827 7 0 0 1 10 1
A 1825 7 0 39 1 10 1
T 1829 360 0 3 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1830 360 0 3 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1831 360 0 3 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1832 360 0 3 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1833 360 0 3 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1834 360 0 3 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1835 360 0 3 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1836 360 0 3 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1837 360 0 3 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1838 360 0 3 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1839 360 0 3 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1840 360 0 3 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1841 360 0 3 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1842 360 0 3 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1843 360 0 3 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1844 360 0 3 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1845 360 0 3 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1846 360 0 3 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1847 360 0 3 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1848 360 0 3 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1849 360 0 3 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1850 360 0 3 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1851 360 0 3 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1852 360 0 3 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1853 360 0 3 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1854 360 0 3 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1855 360 0 3 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1856 360 0 3 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1857 360 0 3 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1858 360 0 3 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1859 360 0 3 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1860 360 0 3 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1861 360 0 156 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1862 360 0 439 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1863 360 0 440 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1864 360 0 441 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1865 360 0 38 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1866 360 0 38 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1867 360 0 51 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1868 360 0 3 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1869 360 0 156 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1870 360 0 168 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1871 360 0 443 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1872 360 0 156 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1873 360 0 38 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1874 360 0 3 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1875 360 0 3 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1876 360 0 3 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1877 360 0 3 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1878 360 0 3 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1879 360 0 3 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1880 360 0 3 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1881 360 0 3 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1882 360 0 444 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1883 360 0 445 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1884 360 0 446 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1885 360 0 3 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1886 360 0 3 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1887 360 0 3 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1888 360 0 3 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1889 360 0 3 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1890 360 0 3 0 1
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1892 360 0 445 0 0
A 1438 18 0 0 1 94 1
A 1439 18 0 0 1 94 1
A 1440 18 0 0 1 94 1
A 1441 18 0 0 1 94 1
A 1442 18 0 0 1 94 1
A 1443 18 0 0 1 94 1
A 1444 18 0 0 1 94 1
A 1445 18 0 0 1 94 1
A 1446 18 0 0 1 94 1
A 1447 18 0 0 1 94 1
A 1448 18 0 0 1 94 1
A 1449 18 0 0 1 94 1
A 1450 18 0 0 1 94 1
A 1451 18 0 0 1 94 1
A 1452 18 0 0 1 94 1
A 1453 18 0 0 1 94 1
A 1454 18 0 0 1 94 1
A 1455 18 0 0 1 94 1
A 1456 18 0 0 1 94 1
A 1457 18 0 0 1 94 1
A 1458 18 0 0 1 94 1
A 1459 18 0 0 1 94 1
A 1460 18 0 0 1 94 1
A 1461 18 0 0 1 94 1
A 1462 10 0 0 1 95 1
A 1463 18 0 0 1 94 1
A 1464 18 0 0 1 94 1
A 1465 18 0 0 1 94 1
A 1466 18 0 0 1 94 1
A 1470 18 0 0 1 94 1
A 1476 18 0 0 1 94 1
A 1477 18 0 0 1 94 1
A 1478 18 0 0 1 94 1
A 1479 18 0 0 1 94 0
T 1989 865 0 3 0 0
A 2087 18 0 0 1 94 0
T 2102 884 0 0 0 0
A 2106 7 896 0 1 2 1
A 2105 7 0 39 1 10 0
T 2401 937 0 0 0 0
A 2409 7 1095 0 1 2 1
A 2408 7 0 159 1 10 1
A 2416 7 1097 0 1 2 1
A 2415 7 0 159 1 10 1
A 2423 7 1099 0 1 2 1
A 2422 7 0 159 1 10 1
A 2432 7 1101 0 1 2 1
A 2431 7 0 580 1 10 1
A 2438 7 1103 0 1 2 1
A 2437 7 0 39 1 10 1
A 2445 7 1105 0 1 2 1
A 2444 7 0 159 1 10 1
A 2453 7 1107 0 1 2 1
A 2452 7 0 600 1 10 1
A 2461 7 1109 0 1 2 1
A 2460 7 0 600 1 10 1
A 2467 7 1111 0 1 2 1
A 2466 7 0 39 1 10 1
A 2473 7 1113 0 1 2 1
A 2472 7 0 39 1 10 1
A 2479 7 1115 0 1 2 1
A 2478 7 0 39 1 10 1
A 2485 7 1117 0 1 2 1
A 2484 7 0 39 1 10 1
A 2491 7 1119 0 1 2 1
A 2490 7 0 39 1 10 1
A 2499 7 1121 0 1 2 1
A 2498 7 0 600 1 10 1
A 2508 7 1123 0 1 2 1
A 2507 7 0 580 1 10 1
A 2522 7 1125 0 1 2 1
A 2521 7 0 600 1 10 1
A 2530 7 1127 0 1 2 1
A 2529 7 0 600 1 10 1
A 2555 7 1129 0 1 2 1
A 2554 7 0 39 1 10 1
A 2561 7 1131 0 1 2 1
A 2560 7 0 39 1 10 1
A 2567 7 1133 0 1 2 1
A 2566 7 0 39 1 10 1
A 2573 7 1135 0 1 2 1
A 2572 7 0 39 1 10 1
A 2579 7 1137 0 1 2 1
A 2578 7 0 39 1 10 0
T 2700 1299 0 3 0 0
T 2701 1199 0 3 0 1
A 2087 18 0 0 1 94 0
T 2702 1205 0 3 0 1
A 2106 7 1211 0 1 2 1
A 2105 7 0 39 1 10 0
T 2706 1231 0 3 0 0
A 2409 7 1237 0 1 2 1
A 2408 7 0 159 1 10 1
A 2416 7 1239 0 1 2 1
A 2415 7 0 159 1 10 1
A 2423 7 1241 0 1 2 1
A 2422 7 0 159 1 10 1
A 2432 7 1243 0 1 2 1
A 2431 7 0 580 1 10 1
A 2438 7 1245 0 1 2 1
A 2437 7 0 39 1 10 1
A 2445 7 1247 0 1 2 1
A 2444 7 0 159 1 10 1
A 2453 7 1249 0 1 2 1
A 2452 7 0 600 1 10 1
A 2461 7 1251 0 1 2 1
A 2460 7 0 600 1 10 1
A 2467 7 1253 0 1 2 1
A 2466 7 0 39 1 10 1
A 2473 7 1255 0 1 2 1
A 2472 7 0 39 1 10 1
A 2479 7 1257 0 1 2 1
A 2478 7 0 39 1 10 1
A 2485 7 1259 0 1 2 1
A 2484 7 0 39 1 10 1
A 2491 7 1261 0 1 2 1
A 2490 7 0 39 1 10 1
A 2499 7 1263 0 1 2 1
A 2498 7 0 600 1 10 1
A 2508 7 1265 0 1 2 1
A 2507 7 0 580 1 10 1
A 2522 7 1267 0 1 2 1
A 2521 7 0 600 1 10 1
A 2530 7 1269 0 1 2 1
A 2529 7 0 600 1 10 1
A 2555 7 1271 0 1 2 1
A 2554 7 0 39 1 10 1
A 2561 7 1273 0 1 2 1
A 2560 7 0 39 1 10 1
A 2567 7 1275 0 1 2 1
A 2566 7 0 39 1 10 1
A 2573 7 1277 0 1 2 1
A 2572 7 0 39 1 10 1
A 2579 7 1279 0 1 2 1
A 2578 7 0 39 1 10 0
T 2850 1379 0 0 0 0
A 2856 7 1397 0 1 2 1
A 2855 7 0 600 1 10 1
A 2864 7 1399 0 1 2 1
A 2863 7 0 600 1 10 0
T 2875 1404 0 3 0 0
A 2880 7 1464 0 1 2 1
A 2881 7 0 0 1 10 1
A 2879 7 0 159 1 10 1
A 2887 7 1466 0 1 2 1
A 2888 7 0 0 1 10 1
A 2886 7 0 159 1 10 1
A 2894 7 1468 0 1 2 1
A 2895 7 0 0 1 10 1
A 2893 7 0 159 1 10 1
A 2901 7 1470 0 1 2 1
A 2902 7 0 0 1 10 1
A 2900 7 0 159 1 10 1
A 2908 7 1472 0 1 2 1
A 2909 7 0 0 1 10 1
A 2907 7 0 159 1 10 1
A 2915 7 1474 0 1 2 1
A 2916 7 0 0 1 10 1
A 2914 7 0 159 1 10 1
A 2922 7 1476 0 1 2 1
A 2923 7 0 0 1 10 1
A 2921 7 0 159 1 10 1
A 2929 7 1478 0 1 2 1
A 2930 7 0 0 1 10 1
A 2928 7 0 159 1 10 1
A 2936 7 1480 0 1 2 1
A 2937 7 0 0 1 10 1
A 2935 7 0 159 1 10 0
T 2953 1561 0 3 0 0
T 2961 1527 0 3 0 1
A 2856 7 1533 0 1 2 1
A 2855 7 0 600 1 10 1
A 2864 7 1535 0 1 2 1
A 2863 7 0 600 1 10 0
A 2965 7 1573 0 1 2 1
A 2966 7 0 0 1 10 1
A 2964 7 0 39 1 10 0
Z
