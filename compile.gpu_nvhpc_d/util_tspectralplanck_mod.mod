V34 :0x24 util_tspectralplanck_mod
28 util_tspectralplanck_mod.F90 S624 0
03/19/2025  06:54:40
use yoe_spectral_planck private
enduse
D 58 26 669 528 668 7
D 82 22 7
D 84 22 7
D 86 22 7
S 624 24 0 0 0 9 1 0 5012 10005 0 A 0 0 0 0 B 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 util_tspectralplanck_mod
S 626 23 0 0 0 9 668 624 5057 4 0 A 0 0 0 0 B 400000 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 624 0 0 0 0 tspectralplanck
S 653 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 23 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
S 656 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
R 668 25 7 yoe_spectral_planck tspectralplanck
R 669 5 8 yoe_spectral_planck nintervals tspectralplanck
R 670 5 9 yoe_spectral_planck ntemps tspectralplanck
R 671 5 10 yoe_spectral_planck temp1 tspectralplanck
R 672 5 11 yoe_spectral_planck dtemp tspectralplanck
R 673 5 12 yoe_spectral_planck planck_lut tspectralplanck
R 676 5 15 yoe_spectral_planck planck_lut$sd tspectralplanck
R 677 5 16 yoe_spectral_planck planck_lut$p tspectralplanck
R 678 5 17 yoe_spectral_planck planck_lut$o tspectralplanck
R 680 5 19 yoe_spectral_planck wavlen_bound tspectralplanck
R 682 5 21 yoe_spectral_planck wavlen_bound$sd tspectralplanck
R 683 5 22 yoe_spectral_planck wavlen_bound$p tspectralplanck
R 684 5 23 yoe_spectral_planck wavlen_bound$o tspectralplanck
R 686 5 25 yoe_spectral_planck interval_map tspectralplanck
R 688 5 27 yoe_spectral_planck interval_map$sd tspectralplanck
R 689 5 28 yoe_spectral_planck interval_map$p tspectralplanck
R 690 5 29 yoe_spectral_planck interval_map$o tspectralplanck
S 697 19 0 0 0 9 1 624 5584 4000 0 A 0 0 0 0 B 0 5 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3 1 0 0 0 0 0 624 0 0 0 0 save
O 697 1 698
S 698 27 0 0 0 9 711 624 5589 0 400000 A 0 0 0 0 B 0 6 0 0 0 0 16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 624 0 0 0 0 save_tspectralplanck
Q 698 697 0
S 699 19 0 0 0 6 1 624 5610 4000 0 A 0 0 0 0 B 0 9 0 0 0 0 0 0 0 0 0 0 0 0 0 0 5 1 0 0 0 0 0 624 0 0 0 0 load
O 699 1 700
S 700 27 0 0 0 6 715 624 5615 0 400000 A 0 0 0 0 B 0 10 0 0 0 0 17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 624 0 0 0 0 load_tspectralplanck
Q 700 699 0
S 701 19 0 0 0 9 1 624 5636 4000 0 A 0 0 0 0 B 0 13 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7 1 0 0 0 0 0 624 0 0 0 0 copy
O 701 1 702
S 702 27 0 0 0 9 719 624 5641 0 400000 A 0 0 0 0 B 0 14 0 0 0 0 18 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 624 0 0 0 0 copy_tspectralplanck
Q 702 701 0
S 703 19 0 0 0 9 1 624 5662 4000 0 A 0 0 0 0 B 0 17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 9 1 0 0 0 0 0 624 0 0 0 0 host
O 703 1 704
S 704 27 0 0 0 9 724 624 5667 0 400000 A 0 0 0 0 B 0 18 0 0 0 0 19 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 624 0 0 0 0 host_tspectralplanck
Q 704 703 0
S 705 19 0 0 0 9 1 624 5688 4000 0 A 0 0 0 0 B 0 22 0 0 0 0 0 0 0 0 0 0 0 0 0 0 11 1 0 0 0 0 0 624 0 0 0 0 crc64
O 705 1 706
S 706 27 0 0 0 9 727 624 5694 0 400000 A 0 0 0 0 B 0 23 0 0 0 0 20 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 624 0 0 0 0 crc64_tspectralplanck
Q 706 705 0
S 707 19 0 0 0 9 1 624 5716 4000 0 A 0 0 0 0 B 0 26 0 0 0 0 0 0 0 0 0 0 0 0 0 0 13 1 0 0 0 0 0 624 0 0 0 0 wipe
O 707 1 708
S 708 27 0 0 0 9 732 624 5721 0 400000 A 0 0 0 0 B 0 27 0 0 0 0 21 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 624 0 0 0 0 wipe_tspectralplanck
Q 708 707 0
S 709 19 0 0 0 9 1 624 2875 4000 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 15 1 0 0 0 0 0 624 0 0 0 0 size
O 709 1 710
S 710 27 0 0 0 9 737 624 5742 0 400000 A 0 0 0 0 B 0 31 0 0 0 0 22 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 624 0 0 0 0 size_tspectralplanck
Q 710 709 0
S 711 23 5 0 0 0 714 624 5589 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 save_tspectralplanck
S 712 1 3 1 0 6 1 711 5763 4 3000 A 0 0 0 0 B 0 37 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 klun
S 713 1 3 1 0 58 1 711 5768 4 3008 A 0 0 0 0 B 0 37 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 yd
S 714 14 5 0 0 0 1 711 5589 0 400000 A 0 0 0 0 B 0 0 0 0 0 0 0 6 2 0 0 0 0 0 0 0 0 0 0 0 0 37 0 624 0 0 0 0 save_tspectralplanck save_tspectralplanck 
F 714 2 712 713
S 715 23 5 0 0 0 718 624 5615 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 load_tspectralplanck
S 716 1 3 1 0 6 1 715 5763 4 3000 A 0 0 0 0 B 0 70 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 klun
S 717 1 3 2 0 58 1 715 5768 4 3008 A 0 0 0 0 B 0 70 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 yd
S 718 14 5 0 0 0 1 715 5615 0 400000 A 0 0 0 0 B 0 0 0 0 0 0 0 9 2 0 0 0 0 0 0 0 0 0 0 0 0 70 0 624 0 0 0 0 load_tspectralplanck load_tspectralplanck 
F 718 2 716 717
S 719 23 5 0 0 0 723 624 5641 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 copy_tspectralplanck
S 720 1 3 1 0 58 1 719 5768 4 3008 A 0 0 0 0 B 0 117 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 yd
S 721 1 3 1 0 18 1 719 5771 80000004 3000 A 0 0 0 0 B 0 117 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ldcreated
S 722 1 3 1 0 18 1 719 5781 80000004 3000 A 0 0 0 0 B 0 117 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ldfieldapi
S 723 14 5 0 0 0 1 719 5641 0 400000 A 0 0 0 0 B 0 0 0 0 0 0 0 12 3 0 0 0 0 0 0 0 0 0 0 0 0 117 0 624 0 0 0 0 copy_tspectralplanck copy_tspectralplanck 
F 723 3 720 721 722
S 724 23 5 0 0 0 726 624 5667 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 host_tspectralplanck
S 725 1 3 0 0 58 1 724 5768 4 3008 A 0 0 0 0 B 0 165 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 yd
S 726 14 5 0 0 0 1 724 5667 0 400000 A 0 0 0 0 B 0 0 0 0 0 0 0 16 1 0 0 0 0 0 0 0 0 0 0 0 0 165 0 624 0 0 0 0 host_tspectralplanck host_tspectralplanck 
F 726 1 725
S 727 23 5 0 0 0 731 624 5694 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 crc64_tspectralplanck
S 728 1 3 0 0 58 1 727 5768 4 3008 A 0 0 0 0 B 0 181 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 yd
S 729 1 3 1 0 6 1 727 5763 4 3000 A 0 0 0 0 B 0 181 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 klun
S 730 1 3 1 0 30 1 727 5792 4 43000 A 0 0 0 0 B 0 181 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 cdpath
S 731 14 5 0 0 0 1 727 5694 0 400000 A 0 0 0 0 B 0 0 0 0 0 0 0 18 3 0 0 0 0 0 0 0 0 0 0 0 0 181 0 624 0 0 0 0 crc64_tspectralplanck crc64_tspectralplanck 
F 731 3 728 729 730
S 732 23 5 0 0 0 736 624 5721 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 wipe_tspectralplanck
S 733 1 3 1 0 58 1 732 5768 4 3008 A 0 0 0 0 B 0 206 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 yd
S 734 1 3 1 0 18 1 732 5799 80000004 3000 A 0 0 0 0 B 0 206 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 lddeleted
S 735 1 3 1 0 18 1 732 5781 80000004 3000 A 0 0 0 0 B 0 206 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ldfieldapi
S 736 14 5 0 0 0 1 732 5721 0 400000 A 0 0 0 0 B 0 0 0 0 0 0 0 22 3 0 0 0 0 0 0 0 0 0 0 0 0 206 0 624 0 0 0 0 wipe_tspectralplanck wipe_tspectralplanck 
F 736 3 733 734 735
S 737 23 5 0 0 7 742 624 5742 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 size_tspectralplanck
S 738 1 3 1 0 58 1 737 5768 4 3008 A 0 0 0 0 B 0 250 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 yd
S 739 1 3 1 0 30 1 737 5792 80000004 43000 A 0 0 0 0 B 0 250 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 cdpath
S 740 1 3 1 0 18 1 737 5809 80000004 3000 A 0 0 0 0 B 0 250 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ldprint
S 741 1 3 0 0 7 1 737 5817 4 1003000 A 0 0 0 0 B 0 250 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ksize
S 742 14 5 0 0 7 1 737 5742 4 1400000 A 0 0 0 0 B 0 0 0 0 0 0 0 26 3 0 0 741 0 0 0 0 0 0 0 0 0 250 0 624 0 0 0 0 size_tspectralplanck size_tspectralplanck ksize
F 742 3 738 739 740
A 27 2 0 0 0 7 653 0 0 0 27 0 0 0 0 0 0 0 0 0 0 0
A 39 2 0 0 0 7 656 0 0 0 39 0 0 0 0 0 0 0 0 0 0 0
Z
T 668 58 0 0 0 0
A 677 7 82 0 1 2 1
A 676 7 0 27 1 10 1
A 683 7 84 0 1 2 1
A 682 7 0 39 1 10 1
A 689 7 86 0 1 2 1
A 688 7 0 39 1 10 0
Z
