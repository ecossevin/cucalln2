#ifndef _STACK_N
#define _STACK_N

#define USE_STACK

#ifdef __GFORTRAN__
#undef USE_STACK
#endif

USE PARKIND1, ONLY : JPRB

#ifdef USE_STACK
#define malign(p,k) ((((p)+(k)-1)/(k)) * (k))

#define stack_l4(ydstack,ibl,nbl) malign(LOC (ydstack%ZDATA4 (1,1,1,1)) + ((INT (ibl, 8) - 1) * SIZE (ydstack%ZDATA4) * KIND (ydstack%ZDATA4)) / INT (nbl, 8), ydstack%IALIGN) 
#define stack_u4(ydstack,ibl,nbl)        LOC (ydstack%ZDATA4 (1,1,1,1)) + ((INT (ibl, 8)    ) * SIZE (ydstack%ZDATA4) * KIND (ydstack%ZDATA4)) / INT (nbl, 8)
  
#define stack_l8(ydstack,ibl,nbl) malign(LOC (ydstack%ZDATA8 (1,1,1,1)) + ((INT (ibl, 8) - 1) * SIZE (ydstack%ZDATA8) * KIND (ydstack%ZDATA8)) / INT (nbl, 8), ydstack%IALIGN) 
#define stack_u8(ydstack,ibl,nbl)        LOC (ydstack%ZDATA8 (1,1,1,1)) + ((INT (ibl, 8)    ) * SIZE (ydstack%ZDATA8) * KIND (ydstack%ZDATA8)) / INT (nbl, 8)
  
#else

#define malign(p,k) ((((p)+(k)-1)/(k)) * (k))

#define stack_l4(ydstack,ibl,nbl) 0
#define stack_u4(ydstack,ibl,nbl) 0
  
#define stack_l8(ydstack,ibl,nbl) 0
#define stack_u8(ydstack,ibl,nbl) 0

#endif
  
#endif
