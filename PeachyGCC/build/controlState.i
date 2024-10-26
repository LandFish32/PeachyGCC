# 0 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/source/controlState.c"
# 1 "C:\\Users\\Landon\\Desktop\\my_projects\\PeachyGCC\\PeachyGCC\\build//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/source/controlState.c"
# 1 "C:/devkitPro/libtonc/include/tonc.h" 1
# 18 "C:/devkitPro/libtonc/include/tonc.h"
# 1 "C:/devkitPro/libtonc/include/tonc_types.h" 1
# 118 "C:/devkitPro/libtonc/include/tonc_types.h"
typedef unsigned char u8, byte, uchar, echar;
typedef unsigned short u16, hword, ushort, eshort;
typedef unsigned int u32, word, uint, eint;
typedef unsigned long long u64;

typedef signed char s8;
typedef signed short s16;
typedef signed int s32;
typedef signed long long s64;






typedef volatile u8 vu8;
typedef volatile u16 vu16;
typedef volatile u32 vu32;
typedef volatile u64 vu64;

typedef volatile s8 vs8;
typedef volatile s16 vs16;
typedef volatile s32 vs32;
typedef volatile s64 vs64;






typedef const u8 cu8;
typedef const u16 cu16;
typedef const u32 cu32;
typedef const u64 cu64;

typedef const s8 cs8;
typedef const s16 cs16;
typedef const s32 cs32;
typedef const s64 cs64;



typedef struct { u32 data[8]; } BLOCK;


typedef const char * const CSTR;
# 175 "C:/devkitPro/libtonc/include/tonc_types.h"
typedef s32 FIXED;
typedef u16 COLOR;
typedef u16 SCR_ENTRY, SE;
typedef u8 SCR_AFF_ENTRY, SAE;


typedef struct { u32 data[8]; } TILE, TILE4;


typedef struct { u32 data[16]; } TILE8;




typedef enum { false, true } bool;



typedef u8 BOOL;







typedef void (*fnptr)(void);
typedef void (*fn_v_i)(int);
typedef int (*fn_i_i)(int);
# 212 "C:/devkitPro/libtonc/include/tonc_types.h"
typedef struct AFF_SRC
{
 s16 sx;
 s16 sy;
 u16 alpha;
} __attribute__((aligned(4))) AFF_SRC, ObjAffineSource;






typedef struct AFF_SRC_EX
{
 s32 tex_x;
 s32 tex_y;
 s16 scr_x;
 s16 scr_y;
 s16 sx;
 s16 sy;
 u16 alpha;
} __attribute__((aligned(4))) AFF_SRC_EX, BgAffineSource;





typedef struct AFF_DST
{
 s16 pa, pb;
 s16 pc, pd;
} __attribute__((aligned(4))) AFF_DST, ObjAffineDest;







typedef struct AFF_DST_EX
{
 s16 pa, pb;
 s16 pc, pd;
 s32 dx, dy;
} __attribute__((aligned(4))) AFF_DST_EX, BgAffineDest;
# 277 "C:/devkitPro/libtonc/include/tonc_types.h"
typedef struct POINT16 { s16 x, y; } __attribute__((aligned(4))) POINT16, BG_POINT;


typedef struct AFF_DST_EX BG_AFFINE;


typedef struct DMA_REC
{
 const void *src;
 void *dst;
 u32 cnt;
} DMA_REC;




typedef struct TMR_REC
{
 union { u16 start, count; } __attribute__((packed));
 u16 cnt;
} __attribute__((aligned(4))) TMR_REC;
# 306 "C:/devkitPro/libtonc/include/tonc_types.h"
typedef COLOR PALBANK[16];
# 316 "C:/devkitPro/libtonc/include/tonc_types.h"
typedef SCR_ENTRY SCREENLINE[32];
typedef SCR_ENTRY SCREENMAT[32][32];
typedef SCR_ENTRY SCREENBLOCK[1024];

typedef COLOR M3LINE[240];
typedef u8 M4LINE[240];
typedef COLOR M5LINE[160];

typedef TILE CHARBLOCK[512];
typedef TILE8 CHARBLOCK8[256];
# 340 "C:/devkitPro/libtonc/include/tonc_types.h"
typedef struct OBJ_ATTR
{
 u16 attr0;
 u16 attr1;
 u16 attr2;
 s16 fill;
} __attribute__((aligned(4))) OBJ_ATTR;





typedef struct OBJ_AFFINE
{
 u16 fill0[3]; s16 pa;
 u16 fill1[3]; s16 pb;
 u16 fill2[3]; s16 pc;
 u16 fill3[3]; s16 pd;
} __attribute__((aligned(4))) OBJ_AFFINE;
# 19 "C:/devkitPro/libtonc/include/tonc.h" 2
# 1 "C:/devkitPro/libtonc/include/tonc_memmap.h" 1
# 20 "C:/devkitPro/libtonc/include/tonc.h" 2
# 1 "C:/devkitPro/libtonc/include/tonc_memdef.h" 1
# 21 "C:/devkitPro/libtonc/include/tonc.h" 2

# 1 "C:/devkitPro/libtonc/include/tonc_bios.h" 1
# 202 "C:/devkitPro/libtonc/include/tonc_bios.h"
typedef struct BUP
{
    u16 src_len;
    u8 src_bpp;
    u8 dst_bpp;
    u32 dst_ofs;
} BUP;


typedef struct
{
 u32 reserved1[5];
 u8 handshake_data;
 u8 padding;
 u16 handshake_timeout;
 u8 probe_count;
 u8 client_data[3];
 u8 palette_data;
 u8 response_bit;
 u8 client_bit;
 u8 reserved2;
 u8 *boot_srcp;
 u8 *boot_endp;
 u8 *masterp;
 u8 *reserved3[3];
 u32 system_work2[4];
 u8 sendflag;
 u8 probe_target_bit;
 u8 check_wait;
 u8 server_type;
} MultiBootParam;
# 252 "C:/devkitPro/libtonc/include/tonc_bios.h"
void SoftReset(void);
void RegisterRamReset(u32 flags);




void Halt(void);
void Stop(void);
void IntrWait(u32 flagClear, u32 irq);
void VBlankIntrWait(void);





s32 Div(s32 num, s32 den);
s32 DivArm(s32 den, s32 num);
u32 Sqrt(u32 num);
s16 ArcTan(s16 dydx);
s16 ArcTan2(s16 x, s16 y);
# 280 "C:/devkitPro/libtonc/include/tonc_bios.h"
void CpuSet(const void *src, void *dst, u32 mode);
void CpuFastSet(const void *src, void *dst, u32 mode);


u32 BiosCheckSum(void);







void ObjAffineSet(const ObjAffineSource *src, void *dst, s32 num, s32 offset);
void BgAffineSet(const BgAffineSource *src, BgAffineDest *dst, s32 num);




void BitUnPack(const void *src, void *dst, const BUP *bup);
void LZ77UnCompWram(const void *src, void *dst);
void LZ77UnCompVram(const void *src, void *dst);
void HuffUnComp(const void *src, void *dst);
void RLUnCompWram(const void *src, void *dst);
void RLUnCompVram(const void *src, void *dst);
void Diff8bitUnFilterWram(const void *src, void *dst);
void Diff8bitUnFilterVram(const void *src, void *dst);
void Diff16bitUnFilter(const void *src, void *dst);





void SoundBias(u32 bias);
void SoundDriverInit(void *src);
void SoundDriverMode(u32 mode);
void SoundDriverMain(void);
void SoundDriverVSync(void);
void SoundChannelClear(void);
u32 MidiKey2Freq(void *wa, u8 mk, u8 fp);
void SoundDriverVSyncOff(void);
void SoundDriverVSyncOn(void);




int MultiBoot(MultiBootParam* mb, u32 mode);
# 340 "C:/devkitPro/libtonc/include/tonc_bios.h"
void VBlankIntrDelay(u32 count);
int DivSafe(int num, int den);
int Mod(int num, int den);
u32 DivAbs(int num, int den);
int DivArmMod(int den, int num);
u32 DivArmAbs(int den, int num);
void CpuFastFill(u32 wd, void *dst, u32 count);
# 359 "C:/devkitPro/libtonc/include/tonc_bios.h"
void SoftReset(void);
void RegisterRamReset(u32 flags);



void Halt(void);
void Stop(void);
void IntrWait(u32 flagClear, u32 irq);





void VBlankIntrWait(void);
# 383 "C:/devkitPro/libtonc/include/tonc_bios.h"
s32 Div(s32 num, s32 den);







s32 DivArm(s32 den, s32 num);


u32 Sqrt(u32 num);
# 403 "C:/devkitPro/libtonc/include/tonc_bios.h"
s16 ArcTan(s16 dydx);




s16 ArcTan2(s16 x, s16 y);
# 429 "C:/devkitPro/libtonc/include/tonc_bios.h"
void CpuSet(const void *src, void *dst, u32 mode);
# 446 "C:/devkitPro/libtonc/include/tonc_bios.h"
void CpuFastSet(const void *src, void *dst, u32 mode);

u32 BiosCheckSum(void);
# 480 "C:/devkitPro/libtonc/include/tonc_bios.h"
void ObjAffineSet(const ObjAffineSource *src, void *dst, s32 num, s32 offset);
void BgAffineSet(const BgAffineSource *src, BgAffineDest *dst, s32 num);



void BitUnPack(const void *src, void *dst, const BUP *bup);
void LZ77UnCompWram(const void *src, void *dst);
void LZ77UnCompVram(const void *src, void *dst);
void HuffUnComp(const void *src, void *dst);
void RLUnCompWram(const void *src, void *dst);
void RLUnCompVram(const void *src, void *dst);
void Diff8bitUnFilterWram(const void *src, void *dst);
void Diff8bitUnFilterVram(const void *src, void *dst);
void Diff16bitUnFilter(const void *src, void *dst);





void SoundBias(u32 bias);
void SoundDriverInit(void *src);
void SoundDriverMode(u32 mode);
void SoundDriverMain(void);
void SoundDriverVSync(void);
void SoundChannelClear(void);
u32 MidiKey2Freq(void *wa, u8 mk, u8 fp);
void SoundDriverVSyncOff(void);
void SoundDriverVSyncOn(void);


int MultiBoot(MultiBootParam* mb, u32 mode);
# 519 "C:/devkitPro/libtonc/include/tonc_bios.h"
void VBlankIntrDelay(u32 count);
# 528 "C:/devkitPro/libtonc/include/tonc_bios.h"
int DivSafe(int num, int den);


int Mod(int num, int den);


u32 DivAbs(int num, int den);



int DivArmMod(int den, int num);


u32 DivArmAbs(int den, int num);
# 552 "C:/devkitPro/libtonc/include/tonc_bios.h"
void CpuFastFill(u32 wd, void *dst, u32 mode);
# 23 "C:/devkitPro/libtonc/include/tonc.h" 2
# 1 "C:/devkitPro/libtonc/include/tonc_core.h" 1
# 107 "C:/devkitPro/libtonc/include/tonc_core.h"
static inline u32 bf_get(u32 y, uint shift, uint len);
static inline u32 bf_merge(u32 y, u32 x, uint shift, uint len);
static inline u32 bf_clamp(int x, uint len);

static inline int bit_tribool(u32 x, uint plus, uint minus);
static inline u32 ROR(u32 x, uint ror);
# 132 "C:/devkitPro/libtonc/include/tonc_core.h"
static inline uint align(uint x, uint width);
# 142 "C:/devkitPro/libtonc/include/tonc_core.h"
void *tonccpy(void *dst, const void *src, uint size);

void *__toncset(void *dst, u32 fill, uint size);
static inline void *toncset(void *dst, u8 src, uint count);
static inline void *toncset16(void *dst, u16 src, uint count);
static inline void *toncset32(void *dst, u32 src, uint count);



void memset16(void *dst, u16 hw, uint hwcount);
void memcpy16(void *dst, const void* src, uint hwcount);

__attribute__((section(".iwram"), long_call)) void memset32(void *dst, u32 wd, uint wcount);
__attribute__((section(".iwram"), long_call)) void memcpy32(void *dst, const void* src, uint wcount);
# 166 "C:/devkitPro/libtonc/include/tonc_core.h"
void memset16(void *dst, u16 hw, uint hwcount);
# 178 "C:/devkitPro/libtonc/include/tonc_core.h"
void memcpy16(void *dst, const void* src, uint hwcount);
# 190 "C:/devkitPro/libtonc/include/tonc_core.h"
__attribute__((section(".iwram"), long_call)) void memset32(void *dst, u32 wd, uint wdcount);
# 202 "C:/devkitPro/libtonc/include/tonc_core.h"
__attribute__((section(".iwram"), long_call)) void memcpy32(void *dst, const void* src, uint wdcount);
# 212 "C:/devkitPro/libtonc/include/tonc_core.h"
static inline u16 dup8(u8 x);
static inline u32 dup16(u16 x);
static inline u32 quad8(u8 x);
static inline u32 octup(u8 x);




static inline u16 bytes2hword(u8 b0, u8 b1);
static inline u32 bytes2word(u8 b0, u8 b1, u8 b2, u8 b3);
static inline u32 hword2word(u16 h0, u16 h1);
# 252 "C:/devkitPro/libtonc/include/tonc_core.h"
static inline void dma_cpy(void *dst, const void *src, uint count, uint ch, u32 mode);
static inline void dma_fill(void *dst, volatile u32 src, uint count, uint ch, u32 mode);

static inline void dma3_cpy(void *dst, const void *src, uint size);
static inline void dma3_fill(void *dst, volatile u32 src, uint size);
# 266 "C:/devkitPro/libtonc/include/tonc_core.h"
static inline void profile_start(void);
static inline uint profile_stop(void);







typedef enum
{
 NOTE_C=0, NOTE_CIS, NOTE_D, NOTE_DIS,
 NOTE_E, NOTE_F, NOTE_FIS, NOTE_G,
 NOTE_GIS, NOTE_A, NOTE_BES, NOTE_B
} eSndNoteId;

extern const uint __snd_rates[12];
# 326 "C:/devkitPro/libtonc/include/tonc_core.h"
u32 octant(int x, int y);
u32 octant_rot(int x0, int y0);
# 338 "C:/devkitPro/libtonc/include/tonc_core.h"
int sqran(int seed);
static inline int qran(void);
static inline int qran_range(int min, int max);
# 352 "C:/devkitPro/libtonc/include/tonc_core.h"
extern const u8 oam_sizes[3][4][2];
extern const BG_AFFINE bg_aff_default;
extern COLOR *vid_page;

extern int __qran_seed;
# 373 "C:/devkitPro/libtonc/include/tonc_core.h"
static inline u32 bf_get(u32 y, uint shift, uint len)
{ return (y>>shift) & ( (1<<len)-1 ); }
# 385 "C:/devkitPro/libtonc/include/tonc_core.h"
static inline u32 bf_merge(u32 y, u32 x, uint shift, uint len)
{
 u32 mask= ((u32)(1<<len)-1);
 return (y &~ (mask<<shift)) | (x & mask)<<shift;
}


static inline u32 bf_clamp(int x, uint len)
{
 u32 y=x>>len;
 if(y)
  x= (~y)>>(32-len);
 return x;
}
# 411 "C:/devkitPro/libtonc/include/tonc_core.h"
static inline int bit_tribool(u32 flags, uint plus, uint minus)
{ return ((flags>>plus)&1) - ((flags>>minus)&1); }



static inline u32 ROR(u32 x, uint ror)
{ return (x<<(32-ror)) | (x>>ror); }




static inline uint align(uint x, uint width)
{ return (x+width-1)/width*width; }



static inline void *toncset(void *dst, u8 src, uint count)
{ return __toncset(dst, quad8(src), count); }


static inline void *toncset16(void *dst, u16 src, uint count)
{ return __toncset(dst, src|src<<16, count*2); }


static inline void *toncset32(void *dst, u32 src, uint count)
{ return __toncset(dst, src, count*4); }




static inline u16 dup8(u8 x) { return x|(x<<8); }


static inline u32 dup16(u16 x) { return x|(x<<16); }


static inline u32 quad8(u8 x) { return x*0x01010101; }


static inline u32 octup(u8 x) { return x*0x11111111; }



static inline u16 bytes2hword(u8 b0, u8 b1)
{ return b0 | b1<<8; }


static inline u32 bytes2word(u8 b0, u8 b1, u8 b2, u8 b3)
{ return b0 | b1<<8 | b2<<16 | b3<<24; }

static inline u32 hword2word(u16 h0, u16 h1)
{ return h0 | h1<<16; }
# 478 "C:/devkitPro/libtonc/include/tonc_core.h"
static inline void dma_cpy(void *dst, const void *src, uint count, uint ch, u32 mode)
{
 ((volatile DMA_REC*)(0x04000000 +0x00B0))[ch].cnt= 0;
 ((volatile DMA_REC*)(0x04000000 +0x00B0))[ch].src= src;
 ((volatile DMA_REC*)(0x04000000 +0x00B0))[ch].dst= dst;
 ((volatile DMA_REC*)(0x04000000 +0x00B0))[ch].cnt= mode | count;
}
# 494 "C:/devkitPro/libtonc/include/tonc_core.h"
static inline void dma_fill(void *dst, volatile u32 src, uint count, uint ch, u32 mode)
{
 ((volatile DMA_REC*)(0x04000000 +0x00B0))[ch].cnt= 0;
 ((volatile DMA_REC*)(0x04000000 +0x00B0))[ch].src= (const void*)&src;
 ((volatile DMA_REC*)(0x04000000 +0x00B0))[ch].dst= dst;
 ((volatile DMA_REC*)(0x04000000 +0x00B0))[ch].cnt= count | mode | 0x01000000;
}







static inline void dma3_cpy(void *dst, const void *src, uint size)
{ dma_cpy(dst, src, size/4, 3, ((0x80000000 | 0) | 0x04000000)); }







static inline void dma3_fill(void *dst, volatile u32 src, uint size)
{ dma_fill(dst, src, size/4, 3, ((0x80000000 | 0) | 0x01000000 | 0x04000000)); }
# 528 "C:/devkitPro/libtonc/include/tonc_core.h"
static inline int qran(void)
{
 __qran_seed= 1664525*__qran_seed+1013904223;
 return (__qran_seed>>16) & ((1<<15)-1);
}






static inline int qran_range(int min, int max)
{ return (qran()*(max-min)>>15)+min; }
# 552 "C:/devkitPro/libtonc/include/tonc_core.h"
static inline void profile_start(void)
{
 *(vu16*)(0x04000000 +0x0108)= 0; *(vu16*)(0x04000000 +0x010C)= 0;
    *(vu16*)(0x04000000 +0x010A)= 0; *(vu16*)(0x04000000 +0x010E)= 0;
    *(vu16*)(0x04000000 +0x010E)= 0x0080 | 0x0004;
    *(vu16*)(0x04000000 +0x010A)= 0x0080;
}




static inline uint profile_stop(void)
{
   *(vu16*)(0x04000000 +0x010A)= 0;
   return (*(vu16*)(0x04000000 +0x010C)<<16)|*(vu16*)(0x04000000 +0x0108);
}
# 24 "C:/devkitPro/libtonc/include/tonc.h" 2
# 1 "C:/devkitPro/libtonc/include/tonc_input.h" 1
# 36 "C:/devkitPro/libtonc/include/tonc_input.h"
typedef enum eKeyIndex
{
 KI_A=0, KI_B, KI_SELECT, KI_START,
 KI_RIGHT, KI_LEFT, KI_UP, KI_DOWN,
 KI_R, KI_L, KI_MAX
} eKeyIndex;
# 71 "C:/devkitPro/libtonc/include/tonc_input.h"
extern u16 __key_curr, __key_prev;







void key_wait_for_clear(u32 key);



void key_poll();
static inline u32 key_curr_state(void);
static inline u32 key_prev_state(void);

static inline u32 key_is_down(u32 key);
static inline u32 key_is_up(u32 key);

static inline u32 key_was_down(u32 key);
static inline u32 key_was_up(u32 key);




static inline u32 key_transit(u32 key);
static inline u32 key_held(u32 key);
static inline u32 key_hit(u32 key);
static inline u32 key_released(u32 key);




static inline int key_tri_horz(void);
static inline int key_tri_vert(void);
static inline int key_tri_shoulder(void);
static inline int key_tri_fire(void);




u32 key_repeat(u32 keys);

void key_repeat_mask(u32 mask);
void key_repeat_limits(uint delay, uint repeat);


void key_wait_till_hit(u16 key);
# 127 "C:/devkitPro/libtonc/include/tonc_input.h"
static inline u32 key_curr_state(void) { return __key_curr; }


static inline u32 key_prev_state(void) { return __key_prev; }


static inline u32 key_is_down(u32 key) { return __key_curr & key; }


static inline u32 key_is_up(u32 key) { return ~__key_curr & key; }


static inline u32 key_was_down(u32 key) { return __key_prev & key; }


static inline u32 key_was_up(u32 key) { return ~__key_prev & key; }




static inline u32 key_transit(u32 key)
{ return ( __key_curr ^ __key_prev) & key; }


static inline u32 key_held(u32 key)
{ return ( __key_curr & __key_prev) & key; }


static inline u32 key_hit(u32 key)
{ return ( __key_curr &~ __key_prev) & key; }


static inline u32 key_released(u32 key)
{ return (~__key_curr & __key_prev) & key; }




static inline int key_tri_horz(void)
{ return bit_tribool(__key_curr, KI_RIGHT, KI_LEFT); }


static inline int key_tri_vert(void)
{ return bit_tribool(__key_curr, KI_DOWN, KI_UP); }


static inline int key_tri_shoulder(void)
{ return bit_tribool(__key_curr, KI_R, KI_L); }


static inline int key_tri_fire(void)
{ return bit_tribool(__key_curr, KI_A, KI_B); }
# 25 "C:/devkitPro/libtonc/include/tonc.h" 2
# 1 "C:/devkitPro/libtonc/include/tonc_irq.h" 1
# 33 "C:/devkitPro/libtonc/include/tonc_irq.h"
typedef enum eIrqIndex
{
 II_VBLANK=0,II_HBLANK, II_VCOUNT, II_TIMER0,
 II_TIMER1, II_TIMER2, II_TIMER3, II_SERIAL,
 II_DMA0, II_DMA1, II_DMA2, II_DMA3,
 II_KEYPAD, II_GAMEPAK, II_MAX
} eIrqIndex;
# 78 "C:/devkitPro/libtonc/include/tonc_irq.h"
typedef struct IRQ_REC
{
 u32 flag;
 fnptr isr;
} IRQ_REC;







extern IRQ_REC __isr_table[II_MAX+1];







__attribute__((section(".iwram"), long_call)) void isr_master(void);
__attribute__((section(".iwram"), long_call)) void isr_master_nest(void);

void irq_init(fnptr isr);
fnptr irq_set_master(fnptr isr);

fnptr irq_add(enum eIrqIndex irq_id, fnptr isr);
fnptr irq_delete(enum eIrqIndex irq_id);

fnptr irq_set(enum eIrqIndex irq_id, fnptr isr, u32 opts);

void irq_enable(enum eIrqIndex irq_id);
void irq_disable(enum eIrqIndex irq_id);
# 26 "C:/devkitPro/libtonc/include/tonc.h" 2
# 1 "C:/devkitPro/libtonc/include/tonc_math.h" 1
# 97 "C:/devkitPro/libtonc/include/tonc_math.h"
static inline int sgn(int x);
static inline int sgn3(int x);
static inline int max(int a, int b);
static inline int min(int a, int b);
# 135 "C:/devkitPro/libtonc/include/tonc_math.h"
static inline BOOL in_range(int x, int min, int max);
static inline int clamp(int x, int min, int max);
static inline int reflect(int x, int min, int max);
static inline int wrap(int x, int min, int max);
# 189 "C:/devkitPro/libtonc/include/tonc_math.h"
static inline FIXED int2fx(int d);
static inline FIXED float2fx(float f);
static inline u32 fx2uint(FIXED fx);
static inline u32 fx2ufrac(FIXED fx);
static inline int fx2int(FIXED fx);
static inline float fx2float(FIXED fx);
static inline FIXED fxadd(FIXED fa, FIXED fb);
static inline FIXED fxsub(FIXED fa, FIXED fb);
static inline FIXED fxmul(FIXED fa, FIXED fb);
static inline FIXED fxdiv(FIXED fa, FIXED fb);

static inline FIXED fxmul64(FIXED fa, FIXED fb);
static inline FIXED fxdiv64(FIXED fa, FIXED fb);
# 214 "C:/devkitPro/libtonc/include/tonc_math.h"
extern s32 div_lut[257];
extern s16 sin_lut[514];

static inline s32 lu_sin(uint theta);
static inline s32 lu_cos(uint theta);
static inline uint lu_div(uint x);

static inline int lu_lerp32(const s32 lut[], uint x, const uint shift);
static inline int lu_lerp16(const s16 lut[], uint x, const uint shift);





struct RECT;





typedef struct POINT { int x, y; } POINT, POINT32;



static inline POINT *pt_set(POINT *pd, int x, int y);
static inline POINT *pt_add(POINT *pd, const POINT *pa, const POINT *pb);
static inline POINT *pt_sub(POINT *pd, const POINT *pa, const POINT *pb);
static inline POINT *pt_scale(POINT *pd, const POINT *pa, int c);

static inline POINT *pt_add_eq(POINT *pd, const POINT *pb);
static inline POINT *pt_sub_eq(POINT *pd, const POINT *pb);
static inline POINT *pt_scale_eq(POINT *pd, int c);

static inline int pt_cross(const POINT *pa, const POINT *pb);
static inline int pt_dot(const POINT *pa, const POINT *pb);

int pt_in_rect(const POINT *pt, const struct RECT *rc);
# 261 "C:/devkitPro/libtonc/include/tonc_math.h"
typedef struct RECT
{
 int left, top;
 int right, bottom;
} RECT, RECT32;

static inline RECT *rc_set(RECT *rc, int l, int t, int r, int b);
static inline RECT *rc_set2(RECT *rc, int x, int y, int w, int h);
static inline int rc_width(const RECT *rc);
static inline int rc_height(const RECT *rc);
static inline RECT *rc_set_pos(RECT *rc, int x, int y);
static inline RECT *rc_set_size(RECT *rc, int w, int h);
static inline RECT *rc_move(RECT *rc, int dx, int dy);
static inline RECT *rc_inflate(RECT *rc, int dw, int dh);
static inline RECT *rc_inflate2(RECT *rc, const RECT *dr);

RECT *rc_normalize(RECT *rc);
# 288 "C:/devkitPro/libtonc/include/tonc_math.h"
typedef struct VECTOR { FIXED x, y, z; } VECTOR;


static inline VECTOR *vec_set(VECTOR *vd, FIXED x, FIXED y, FIXED z);
static inline VECTOR *vec_add(VECTOR *vd, const VECTOR *va, const VECTOR *vb);
static inline VECTOR *vec_sub(VECTOR *vd, const VECTOR *va, const VECTOR *vb);
static inline VECTOR *vec_mul(VECTOR *vd, const VECTOR *va, const VECTOR *vb);
static inline VECTOR *vec_scale(VECTOR *vd, const VECTOR *va, FIXED c);
static inline FIXED vec_dot(const VECTOR *va, const VECTOR *vb);

static inline VECTOR *vec_add_eq(VECTOR *vd, const VECTOR *vb);
static inline VECTOR *vec_sub_eq(VECTOR *vd, const VECTOR *vb);
static inline VECTOR *vec_mul_eq(VECTOR *vd, const VECTOR *vb);
static inline VECTOR *vec_scale_eq(VECTOR *vd, FIXED c);

VECTOR *vec_cross(VECTOR *vd, const VECTOR *va, const VECTOR *vb);
# 314 "C:/devkitPro/libtonc/include/tonc_math.h"
static inline int sgn(int x)
{ return (x>=0) ? +1 : -1; }


static inline int sgn3(int x)
{ return (x>>31) - (-x>>31); }


static inline int max(int a, int b)
{ return (a > b) ? (a) : (b); }


static inline int min(int a, int b)
{ return (a < b) ? (a) : (b); }



static inline BOOL in_range(int x, int min, int max)
{ return (u32)(x-min) < (u32)(max-min); }






static inline int clamp(int x, int min, int max)
{ return (x>=max) ? (max-1) : ( (x<min) ? min : x ); }
# 350 "C:/devkitPro/libtonc/include/tonc_math.h"
static inline int reflect(int x, int min, int max)
{ return (x>=max) ? (2*(max-1)-x) : ( (x<min) ? (2*min-x) : x ); }


static inline int wrap(int x, int min, int max)
{ return (x>=max) ? (x+min-max) : ( (x<min) ? (x+max-min) : x ); }






static inline FIXED int2fx(int d)
{ return d<<8; }


static inline FIXED float2fx(float f)
{ return (FIXED)(f*( (float)( 1<<8 ) )); }



static inline u32 fx2uint(FIXED fx)
{ return fx>>8; }


static inline u32 fx2ufrac(FIXED fx)
{ return fx&( ( 1<<8 )-1 ); }


static inline int fx2int(FIXED fx)
{ return fx/( 1<<8 ); }


static inline float fx2float(FIXED fx)
{ return fx/( (float)( 1<<8 ) ); }


static inline FIXED fxadd(FIXED fa, FIXED fb)
{ return fa + fb; }


static inline FIXED fxsub(FIXED fa, FIXED fb)
{ return fa - fb; }



static inline FIXED fxmul(FIXED fa, FIXED fb)
{ return (fa*fb)>>8; }


static inline FIXED fxdiv(FIXED fa, FIXED fb)
{ return ((fa)*( 1<<8 ))/(fb); }



static inline FIXED fxmul64(FIXED fa, FIXED fb)
{ return (((s64)fa)*fb)>>8; }



static inline FIXED fxdiv64(FIXED fa, FIXED fb)
{ return ( ((s64)fa)<<8)/(fb); }
# 420 "C:/devkitPro/libtonc/include/tonc_math.h"
static inline s32 lu_sin(uint theta)
{ return sin_lut[(theta>>7)&0x1FF]; }





static inline s32 lu_cos(uint theta)
{ return sin_lut[((theta>>7)+128)&0x1FF]; }





static inline uint lu_div(uint x)
{ return div_lut[x]; }
# 446 "C:/devkitPro/libtonc/include/tonc_math.h"
static inline int lu_lerp32(const s32 lut[], uint x, const uint shift)
{
 int xa, ya, yb;
 xa=x>>shift;
 ya= lut[xa]; yb= lut[xa+1];
 return ya + ( (yb-ya)*(x-(xa<<shift))>>shift );
}


static inline int lu_lerp16(const s16 lut[], uint x, const uint shift)
{
 int xa, ya, yb;
 xa=x>>shift;
 ya= lut[xa]; yb= lut[xa+1];
 return ya + ( (yb-ya)*(x-(xa<<shift))>>shift );
}





static inline POINT *pt_set(POINT *pd, int x, int y)
{
 pd->x= x; pd->y= y;
 return pd;
}


static inline POINT *pt_add(POINT *pd, const POINT *pa, const POINT *pb)
{
 pd->x= pa->x + pb->x;
 pd->y= pa->x + pb->y;
 return pd;
}


static inline POINT *pt_sub(POINT *pd, const POINT *pa, const POINT *pb)
{
 pd->x= pa->x - pb->x;
 pd->y= pa->x - pb->y;
 return pd;
}


static inline POINT *pt_scale(POINT *pd, const POINT *pa, int c)
{
 pd->x= pa->x*c;
 pd->y= pa->y*c;
 return pd;
}


static inline POINT *pt_add_eq(POINT *pd, const POINT *pb)
{
 pd->x += pb->y;
 pd->y += pb->y;
 return pd;
}


static inline POINT *pt_sub_eq(POINT *pd, const POINT *pb)
{
 pd->x -= pb->y;
 pd->y -= pb->y;
 return pd;
}


static inline POINT *pt_scale_eq(POINT *pd, int c)
{
 pd->x *= c;
 pd->y *= c;
 return pd;
}






static inline int pt_cross(const POINT *pa, const POINT *pb)
{ return pa->x * pb->y - pa->y * pb->x; }



static inline int pt_dot(const POINT *pa, const POINT *pb)
{ return pa->x * pb->x + pa->y * pb->y; }
# 544 "C:/devkitPro/libtonc/include/tonc_math.h"
static inline RECT *rc_set(RECT *rc, int l, int t, int r, int b)
{
 rc->left= l; rc->top= t; rc->right= r; rc->bottom= b;
 return rc;
}







static inline RECT *rc_set2(RECT *rc, int x, int y, int w, int h)
{
 rc->left= x; rc->top= y; rc->right= x+w; rc->bottom= y+h;
 return rc;
}


static inline int rc_width(const RECT *rc)
{ return rc->right - rc->left; }


static inline int rc_height(const RECT *rc)
{ return rc->bottom - rc->top; }


static inline RECT *rc_set_pos(RECT *rc, int x, int y)
{
 rc->right += x-rc->left; rc->left= x;
 rc->bottom += y-rc->top; rc->top= y;
 return rc;
}


static inline RECT *rc_set_size(RECT *rc, int w, int h)
{
 rc->right= rc->left+w; rc->bottom= rc->top+h;
 return rc;
}


static inline RECT *rc_move(RECT *rc, int dx, int dy)
{
 rc->left += dx; rc->top += dy;
 rc->right += dx; rc->bottom += dy;
 return rc;
}


static inline RECT *rc_inflate(RECT *rc, int dw, int dh)
{
 rc->left -= dw; rc->top -= dh;
 rc->right += dw; rc->bottom += dh;
 return rc;
}


static inline RECT *rc_inflate2(RECT *rc, const RECT *dr)
{
 rc->left += dr->left; rc->top += dr->top;
 rc->right += dr->right; rc->bottom += dr->bottom;
 return rc;
}





static inline VECTOR *vec_set(VECTOR *vd, FIXED x, FIXED y, FIXED z)
{
 vd->x= x; vd->y= y; vd->z= z;
 return vd;
}


static inline VECTOR *vec_add(VECTOR *vd, const VECTOR *va, const VECTOR *vb)
{
 vd->x= va->x + vb->x;
 vd->y= va->y + vb->y;
 vd->z= va->z + vb->z;
 return vd;
}


static inline VECTOR *vec_sub(VECTOR *vd, const VECTOR *va, const VECTOR *vb)
{
 vd->x= va->x - vb->x;
 vd->y= va->y - vb->y;
 vd->z= va->z - vb->z;
 return vd;
}


static inline VECTOR *vec_mul(VECTOR *vd, const VECTOR *va, const VECTOR *vb)
{
 vd->x= fxmul(va->x, vb->x);
 vd->y= fxmul(va->y, vb->y);
 vd->z= fxmul(va->z, vb->z);
 return vd;
}


static inline VECTOR *vec_scale(VECTOR *vd, const VECTOR *va, FIXED c)
{
 vd->x= fxmul(va->x, c);
 vd->y= fxmul(va->y, c);
 vd->z= fxmul(va->z, c);
 return vd;
}


static inline FIXED vec_dot(const VECTOR *va, const VECTOR *vb)
{
 FIXED dot;
 dot = fxmul(va->x, vb->x);
 dot += fxmul(va->y, vb->y);
 dot += fxmul(va->z, vb->z);
 return dot;
}


static inline VECTOR *vec_add_eq(VECTOR *vd, const VECTOR *vb)
{ vd->x += vb->x; vd->y += vb->y; vd->z += vb->z; return vd; }


static inline VECTOR *vec_sub_eq(VECTOR *vd, const VECTOR *vb)
{ vd->x -= vb->x; vd->y -= vb->y; vd->z -= vb->z; return vd; }


static inline VECTOR *vec_mul_eq(VECTOR *vd, const VECTOR *vb)
{
 vd->x= fxmul(vd->x, vb->x);
 vd->y= fxmul(vd->y, vb->y);
 vd->z= fxmul(vd->z, vb->z);
 return vd;
}


static inline VECTOR *vec_scale_eq(VECTOR *vd, FIXED c)
{
 vd->x= fxmul(vd->x, c);
 vd->y= fxmul(vd->y, c);
 vd->z= fxmul(vd->z, c);
 return vd;
}
# 27 "C:/devkitPro/libtonc/include/tonc.h" 2
# 1 "C:/devkitPro/libtonc/include/tonc_oam.h" 1
# 32 "C:/devkitPro/libtonc/include/tonc_oam.h"
void oam_init(OBJ_ATTR *obj, uint count);
static inline void oam_copy(OBJ_ATTR *dst, const OBJ_ATTR *src, uint count);


static inline OBJ_ATTR *obj_set_attr(OBJ_ATTR *obj, u16 a0, u16 a1, u16 a2);
static inline void obj_set_pos(OBJ_ATTR *obj, int x, int y);
static inline void obj_hide(OBJ_ATTR *oatr);
static inline void obj_unhide(OBJ_ATTR *obj, u16 mode);

static inline const u8 *obj_get_size(const OBJ_ATTR *obj);
static inline int obj_get_width(const OBJ_ATTR *obj);
static inline int obj_get_height(const OBJ_ATTR *obj);

void obj_copy(OBJ_ATTR *dst, const OBJ_ATTR *src, uint count);
void obj_hide_multi(OBJ_ATTR *obj, u32 count);
void obj_unhide_multi(OBJ_ATTR *obj, u16 mode, uint count);


void obj_aff_copy(OBJ_AFFINE *dst, const OBJ_AFFINE *src, uint count);

static inline void obj_aff_set(OBJ_AFFINE *oaff,
 FIXED pa, FIXED pb, FIXED pc, FIXED pd);
static inline void obj_aff_identity(OBJ_AFFINE *oaff);
static inline void obj_aff_scale(OBJ_AFFINE *oaff, FIXED sx, FIXED sy);
static inline void obj_aff_shearx(OBJ_AFFINE *oaff, FIXED hx);
static inline void obj_aff_sheary(OBJ_AFFINE *oaff, FIXED hy);

void obj_aff_rotate(OBJ_AFFINE *oaff, u16 alpha);
void obj_aff_rotscale(OBJ_AFFINE *oaff, FIXED sx, FIXED sy, u16 alpha);
void obj_aff_premul(OBJ_AFFINE *dst, const OBJ_AFFINE *src);
void obj_aff_postmul(OBJ_AFFINE *dst, const OBJ_AFFINE *src);

void obj_aff_rotscale2(OBJ_AFFINE *oaff, const AFF_SRC *as);
void obj_rotscale_ex(OBJ_ATTR *obj, OBJ_AFFINE *oaff, const AFF_SRC_EX *asx);




static inline void obj_aff_scale_inv(OBJ_AFFINE *oa, FIXED wx, FIXED wy);
static inline void obj_aff_rotate_inv(OBJ_AFFINE *oa, u16 theta);
static inline void obj_aff_shearx_inv(OBJ_AFFINE *oa, FIXED hx);
static inline void obj_aff_sheary_inv(OBJ_AFFINE *oa, FIXED hy);
# 87 "C:/devkitPro/libtonc/include/tonc_oam.h"
static inline OBJ_ATTR *obj_set_attr(OBJ_ATTR *obj, u16 a0, u16 a1, u16 a2)
{
 obj->attr0= a0; obj->attr1= a1; obj->attr2= a2;
 return obj;
}


static inline void obj_set_pos(OBJ_ATTR *obj, int x, int y)
{
 (obj->attr0 = ((obj->attr0)&~0x00FF) | ( ((y)<<0) & 0x00FF ) );
 (obj->attr1 = ((obj->attr1)&~0x01FF) | ( ((x)<<0) & 0x01FF ) );
}


static inline void oam_copy(OBJ_ATTR *dst, const OBJ_ATTR *src, uint count)
{ memcpy32(dst, src, count*2); }


static inline void obj_hide(OBJ_ATTR *obj)
{ ( obj->attr0 = ((obj->attr0)&~0x0300) | ( (0x0200) & 0x0300 ) ); }






static inline void obj_unhide(OBJ_ATTR *obj, u16 mode)
{ ( obj->attr0 = ((obj->attr0)&~0x0300) | ( (mode) & 0x0300 ) ); }



static inline const u8 *obj_get_size(const OBJ_ATTR *obj)
{ return oam_sizes[obj->attr0>>14][obj->attr1>>14]; }


static inline int obj_get_width(const OBJ_ATTR *obj)
{ return obj_get_size(obj)[0]; }


static inline int obj_get_height(const OBJ_ATTR *obj)
{ return obj_get_size(obj)[1]; }






static inline void obj_aff_set(OBJ_AFFINE *oaff,
 FIXED pa, FIXED pb, FIXED pc, FIXED pd)
{
 oaff->pa= pa; oaff->pb= pb;
 oaff->pc= pc; oaff->pd= pd;
}


static inline void obj_aff_identity(OBJ_AFFINE *oaff)
{
 oaff->pa= 0x0100l; oaff->pb= 0;
 oaff->pc= 0; oaff->pd= 0x0100;
}


static inline void obj_aff_scale(OBJ_AFFINE *oaff, FIXED sx, FIXED sy)
{
 oaff->pa= sx; oaff->pb= 0;
 oaff->pb= 0; oaff->pd= sy;
}

static inline void obj_aff_shearx(OBJ_AFFINE *oaff, FIXED hx)
{
 oaff->pa= 0x0100; oaff->pb= hx;
 oaff->pc= 0; oaff->pd= 0x0100;
}

static inline void obj_aff_sheary(OBJ_AFFINE *oaff, FIXED hy)
{
 oaff->pa= 0x0100; oaff->pb= 0;
 oaff->pc= hy; oaff->pd= 0x0100;
}




static inline void obj_aff_scale_inv(OBJ_AFFINE *oaff, FIXED wx, FIXED wy)
{ obj_aff_scale(oaff, ((1<<24)/wx)>>8, ((1<<24)/wy)>>8); }

static inline void obj_aff_rotate_inv(OBJ_AFFINE *oaff, u16 theta)
{ obj_aff_rotate(oaff, -theta); }

static inline void obj_aff_shearx_inv(OBJ_AFFINE *oaff, FIXED hx)
{ obj_aff_shearx(oaff, -hx); }

static inline void obj_aff_sheary_inv(OBJ_AFFINE *oaff, FIXED hy)
{ obj_aff_sheary(oaff, -hy); }
# 28 "C:/devkitPro/libtonc/include/tonc.h" 2
# 1 "C:/devkitPro/libtonc/include/tonc_tte.h" 1
# 19 "C:/devkitPro/libtonc/include/tonc_tte.h"
# 1 "C:/devkitPro/devkitARM/arm-none-eabi/include/stdio.h" 1 3
# 29 "C:/devkitPro/devkitARM/arm-none-eabi/include/stdio.h" 3
# 1 "C:/devkitPro/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 10 "C:/devkitPro/devkitARM/arm-none-eabi/include/_ansi.h" 3
# 1 "C:/devkitPro/devkitARM/arm-none-eabi/include/newlib.h" 1 3
# 10 "C:/devkitPro/devkitARM/arm-none-eabi/include/newlib.h" 3
# 1 "C:/devkitPro/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3
# 11 "C:/devkitPro/devkitARM/arm-none-eabi/include/newlib.h" 2 3
# 11 "C:/devkitPro/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 1 "C:/devkitPro/devkitARM/arm-none-eabi/include/sys/config.h" 1 3



# 1 "C:/devkitPro/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 5 "C:/devkitPro/devkitARM/arm-none-eabi/include/sys/config.h" 2 3
# 1 "C:/devkitPro/devkitARM/arm-none-eabi/include/sys/features.h" 1 3
# 6 "C:/devkitPro/devkitARM/arm-none-eabi/include/sys/config.h" 2 3
# 12 "C:/devkitPro/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 30 "C:/devkitPro/devkitARM/arm-none-eabi/include/stdio.h" 2 3





# 1 "C:/devkitPro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 1 3
# 45 "C:/devkitPro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 3
# 1 "C:/devkitPro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3
# 41 "C:/devkitPro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3

# 41 "C:/devkitPro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "C:/devkitPro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "C:/devkitPro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "C:/devkitPro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "C:/devkitPro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "C:/devkitPro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "C:/devkitPro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "C:/devkitPro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "C:/devkitPro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 46 "C:/devkitPro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 2 3

# 1 "C:/devkitPro/devkitARM/lib/gcc/arm-none-eabi/14.1.0/include/stddef.h" 1 3 4
# 214 "C:/devkitPro/devkitARM/lib/gcc/arm-none-eabi/14.1.0/include/stddef.h" 3 4
typedef unsigned int size_t;
# 48 "C:/devkitPro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 2 3
# 36 "C:/devkitPro/devkitARM/arm-none-eabi/include/stdio.h" 2 3
# 1 "C:/devkitPro/devkitARM/lib/gcc/arm-none-eabi/14.1.0/include/stddef.h" 1 3 4
# 145 "C:/devkitPro/devkitARM/lib/gcc/arm-none-eabi/14.1.0/include/stddef.h" 3 4
typedef int ptrdiff_t;
# 329 "C:/devkitPro/devkitARM/lib/gcc/arm-none-eabi/14.1.0/include/stddef.h" 3 4
typedef unsigned int wchar_t;
# 425 "C:/devkitPro/devkitARM/lib/gcc/arm-none-eabi/14.1.0/include/stddef.h" 3 4
typedef struct {
  long long __max_align_ll __attribute__((__aligned__(__alignof__(long long))));
  long double __max_align_ld __attribute__((__aligned__(__alignof__(long double))));
# 436 "C:/devkitPro/devkitARM/lib/gcc/arm-none-eabi/14.1.0/include/stddef.h" 3 4
} max_align_t;
# 37 "C:/devkitPro/devkitARM/arm-none-eabi/include/stdio.h" 2 3



# 1 "C:/devkitPro/devkitARM/lib/gcc/arm-none-eabi/14.1.0/include/stdarg.h" 1 3 4
# 40 "C:/devkitPro/devkitARM/lib/gcc/arm-none-eabi/14.1.0/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 41 "C:/devkitPro/devkitARM/arm-none-eabi/include/stdio.h" 2 3





typedef __gnuc_va_list va_list;
# 60 "C:/devkitPro/devkitARM/arm-none-eabi/include/stdio.h" 3
# 1 "C:/devkitPro/devkitARM/arm-none-eabi/include/sys/reent.h" 1 3
# 13 "C:/devkitPro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
# 1 "C:/devkitPro/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 14 "C:/devkitPro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "C:/devkitPro/devkitARM/lib/gcc/arm-none-eabi/14.1.0/include/stddef.h" 1 3 4
# 15 "C:/devkitPro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3

# 1 "C:/devkitPro/devkitARM/arm-none-eabi/include/sys/_types.h" 1 3
# 24 "C:/devkitPro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
# 1 "C:/devkitPro/devkitARM/lib/gcc/arm-none-eabi/14.1.0/include/stddef.h" 1 3 4
# 359 "C:/devkitPro/devkitARM/lib/gcc/arm-none-eabi/14.1.0/include/stddef.h" 3 4
typedef unsigned int wint_t;
# 25 "C:/devkitPro/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3


# 1 "C:/devkitPro/devkitARM/arm-none-eabi/include/machine/_types.h" 1 3






typedef __int64_t _off_t;


typedef __int64_t _fpos_t;


typedef __uint32_t __ino_t;


typedef __uint32_t __dev_t;
# 28 "C:/devkitPro/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3


typedef long __blkcnt_t;



typedef long __blksize_t;



typedef __uint64_t __fsblkcnt_t;



typedef __uint32_t __fsfilcnt_t;
# 52 "C:/devkitPro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef int __pid_t;







typedef unsigned short __uid_t;


typedef unsigned short __gid_t;



typedef __uint32_t __id_t;
# 90 "C:/devkitPro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef __uint32_t __mode_t;





__extension__ typedef long long _off64_t;





typedef _off_t __off_t;


typedef _off64_t __loff_t;


typedef long __key_t;
# 131 "C:/devkitPro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef unsigned int __size_t;
# 147 "C:/devkitPro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef signed int _ssize_t;
# 158 "C:/devkitPro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef _ssize_t __ssize_t;



typedef struct
{
  int __count;
  union
  {
    wint_t __wch;
    unsigned char __wchb[4];
  } __value;
} _mbstate_t;




typedef void *_iconv_t;






typedef unsigned long __clock_t;






typedef __int_least64_t __time_t;





typedef unsigned long __clockid_t;


typedef long __daddr_t;



typedef unsigned long __timer_t;


typedef __uint8_t __sa_family_t;



typedef __uint32_t __socklen_t;


typedef int __nl_item;
typedef unsigned short __nlink_t;
typedef long __suseconds_t;
typedef unsigned long __useconds_t;







typedef __builtin_va_list __va_list;
# 17 "C:/devkitPro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3






typedef unsigned long __ULong;
# 35 "C:/devkitPro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
# 1 "C:/devkitPro/devkitARM/arm-none-eabi/include/sys/lock.h" 1 3




# 1 "C:/devkitPro/devkitARM/lib/gcc/arm-none-eabi/14.1.0/include/stdint.h" 1 3 4
# 9 "C:/devkitPro/devkitARM/lib/gcc/arm-none-eabi/14.1.0/include/stdint.h" 3 4
# 1 "C:/devkitPro/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 13 "C:/devkitPro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "C:/devkitPro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 35 "C:/devkitPro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
       
# 190 "C:/devkitPro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
       
# 14 "C:/devkitPro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "C:/devkitPro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 20 "C:/devkitPro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "C:/devkitPro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "C:/devkitPro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "C:/devkitPro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "C:/devkitPro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "C:/devkitPro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "C:/devkitPro/devkitARM/lib/gcc/arm-none-eabi/14.1.0/include/stdint.h" 2 3 4
# 6 "C:/devkitPro/devkitARM/arm-none-eabi/include/sys/lock.h" 2 3

typedef int32_t _LOCK_T;

struct __lock_t {
 _LOCK_T lock;
 uint32_t thread_tag;
 uint32_t counter;
};

typedef struct __lock_t _LOCK_RECURSIVE_T;

typedef uint32_t _COND_T;
# 27 "C:/devkitPro/devkitARM/arm-none-eabi/include/sys/lock.h" 3
static inline void __libc_lock_init(_LOCK_T *lock) {
        *lock = ((_LOCK_T)0);
}

static inline void __libc_lock_close(_LOCK_T *lock ) {}

static inline void __libc_lock_init_recursive(_LOCK_RECURSIVE_T *lock) {
        *lock = ((_LOCK_RECURSIVE_T){((_LOCK_T)0),0,0});
}

static inline void __libc_lock_close_recursive(_LOCK_RECURSIVE_T *lock ) {}

extern void __libc_lock_acquire(_LOCK_T *lock);
extern void __libc_lock_acquire_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_release(_LOCK_T *lock);
extern void __libc_lock_release_recursive(_LOCK_RECURSIVE_T *lock);


extern int __libc_lock_try_acquire(_LOCK_T *lock);
extern int __libc_lock_try_acquire_recursive(_LOCK_RECURSIVE_T *lock);


static inline int __libc_cond_init(_COND_T *cond) {
        *cond = ((_COND_T)0);
}

extern int __libc_cond_signal(_COND_T *cond);
extern int __libc_cond_broadcast(_COND_T *cond);
extern int __libc_cond_wait(_COND_T *cond, _LOCK_T *lock, uint64_t timeout_ns);
extern int __libc_cond_wait_recursive(_COND_T *cond, _LOCK_RECURSIVE_T *lock, uint64_t timeout_ns);
# 36 "C:/devkitPro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
typedef _LOCK_RECURSIVE_T _flock_t;







struct _reent;

struct __locale_t;






struct _Bigint
{
  struct _Bigint *_next;
  int _k, _maxwds, _sign, _wds;
  __ULong _x[1];
};


struct __tm
{
  int __tm_sec;
  int __tm_min;
  int __tm_hour;
  int __tm_mday;
  int __tm_mon;
  int __tm_year;
  int __tm_wday;
  int __tm_yday;
  int __tm_isdst;
};







struct _on_exit_args {
 void * _fnargs[32];
 void * _dso_handle[32];

 __ULong _fntypes;


 __ULong _is_cxa;
};
# 99 "C:/devkitPro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _atexit {
 struct _atexit *_next;
 int _ind;

 void (*_fns[32])(void);
        struct _on_exit_args _on_exit_args;
};
# 116 "C:/devkitPro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct __sbuf {
 unsigned char *_base;
 int _size;
};
# 153 "C:/devkitPro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct __sFILE {
  unsigned char *_p;
  int _r;
  int _w;
  short _flags;
  short _file;
  struct __sbuf _bf;
  int _lbfsize;






  void * _cookie;

  int (*_read) (struct _reent *, void *,
        char *, int);
  int (*_write) (struct _reent *, void *,
         const char *,
         int);
  _fpos_t (*_seek) (struct _reent *, void *, _fpos_t, int);
  int (*_close) (struct _reent *, void *);


  struct __sbuf _ub;
  unsigned char *_up;
  int _ur;


  unsigned char _ubuf[3];
  unsigned char _nbuf[1];


  struct __sbuf _lb;


  int _blksize;
  _off_t _offset;


  struct _reent *_data;



  _flock_t _lock;

  _mbstate_t _mbstate;
  int _flags2;
};
# 270 "C:/devkitPro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
typedef struct __sFILE __FILE;



extern __FILE __sf[3];

struct _glue
{
  struct _glue *_next;
  int _niobs;
  __FILE *_iobs;
};

extern struct _glue __sglue;
# 306 "C:/devkitPro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _rand48 {
  unsigned short _seed[3];
  unsigned short _mult[3];
  unsigned short _add;




};
# 570 "C:/devkitPro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _reent
{
  int _errno;




  __FILE *_stdin, *_stdout, *_stderr;

  int _inc;
  char _emergency[25];




  struct __locale_t *_locale;





  void (*__cleanup) (struct _reent *);


  struct _Bigint *_result;
  int _result_k;
  struct _Bigint *_p5s;
  struct _Bigint **_freelist;


  int _cvtlen;
  char *_cvtbuf;

  union
    {
      struct
        {



          char * _strtok_last;
          char _asctime_buf[26];
          struct __tm _localtime_buf;
          int _gamma_signgam;
          __extension__ unsigned long long _rand_next;
          struct _rand48 _r48;
          _mbstate_t _mblen_state;
          _mbstate_t _mbtowc_state;
          _mbstate_t _wctomb_state;
          char _l64a_buf[8];
          char _signal_buf[24];
          int _getdate_err;
          _mbstate_t _mbrlen_state;
          _mbstate_t _mbrtowc_state;
          _mbstate_t _mbsrtowcs_state;
          _mbstate_t _wcrtomb_state;
          _mbstate_t _wcsrtombs_state;
   int _h_errno;
# 636 "C:/devkitPro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
        } _reent;







    } _new;







  void (**_sig_func)(int);

  void *deviceData;
};
# 786 "C:/devkitPro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
extern struct _reent *_impure_ptr ;





extern struct _reent _impure_data ;





  struct _reent * __getreent (void);
# 904 "C:/devkitPro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
extern struct _atexit *__atexit;
extern struct _atexit __atexit0;

extern void (*__stdio_exit_handler) (void);

void _reclaim_reent (struct _reent *);

extern int _fwalk_sglue (struct _reent *, int (*)(struct _reent *, __FILE *),
    struct _glue *);
# 61 "C:/devkitPro/devkitARM/arm-none-eabi/include/stdio.h" 2 3





typedef __FILE FILE;



typedef _fpos_t fpos_t;





typedef __off_t off_t;




typedef _ssize_t ssize_t;



# 1 "C:/devkitPro/devkitARM/arm-none-eabi/include/sys/stdio.h" 1 3
# 86 "C:/devkitPro/devkitARM/arm-none-eabi/include/stdio.h" 2 3
# 187 "C:/devkitPro/devkitARM/arm-none-eabi/include/stdio.h" 3
char * ctermid (char *);




FILE * tmpfile (void);
char * tmpnam (char *);

char * tempnam (const char *, const char *) __attribute__((__malloc__)) __attribute__((__warn_unused_result__));

int fclose (FILE *);
int fflush (FILE *);
FILE * freopen (const char *restrict, const char *restrict, FILE *restrict);
void setbuf (FILE *restrict, char *restrict);
int setvbuf (FILE *restrict, char *restrict, int, size_t);
int fprintf (FILE *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));
int fscanf (FILE *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 2, 3)));
int printf (const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 1, 2)));
int scanf (const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 1, 2)));
int sscanf (const char *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 2, 3)));
int vfprintf (FILE *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));
int vprintf (const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 1, 0)));
int vsprintf (char *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));
int fgetc (FILE *);
char * fgets (char *restrict, int, FILE *restrict);
int fputc (int, FILE *);
int fputs (const char *restrict, FILE *restrict);
int getc (FILE *);
int getchar (void);
char * gets (char *);
int putc (int, FILE *);
int putchar (int);
int puts (const char *);
int ungetc (int, FILE *);
size_t fread (void *restrict, size_t _size, size_t _n, FILE *restrict);
size_t fwrite (const void *restrict , size_t _size, size_t _n, FILE *);



int fgetpos (FILE *restrict, fpos_t *restrict);

int fseek (FILE *, long, int);



int fsetpos (FILE *, const fpos_t *);

long ftell ( FILE *);
void rewind (FILE *);
void clearerr (FILE *);
int feof (FILE *);
int ferror (FILE *);
void perror (const char *);

FILE * fopen (const char *restrict _name, const char *restrict _type);
int sprintf (char *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));
int remove (const char *);
int rename (const char *, const char *);
# 263 "C:/devkitPro/devkitARM/arm-none-eabi/include/stdio.h" 3
int fseeko (FILE *, off_t, int);
off_t ftello (FILE *);







int snprintf (char *restrict, size_t, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int vsnprintf (char *restrict, size_t, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int vfscanf (FILE *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 2, 0)));
int vscanf (const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 1, 0)));
int vsscanf (const char *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 2, 0)));
# 290 "C:/devkitPro/devkitARM/arm-none-eabi/include/stdio.h" 3
int asiprintf (char **, const char *, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));
char * asniprintf (char *, size_t *, const char *, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
char * asnprintf (char *restrict, size_t *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));

int diprintf (int, const char *, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));

int fiprintf (FILE *, const char *, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));
int fiscanf (FILE *, const char *, ...)
               __attribute__ ((__format__ (__scanf__, 2, 3)));
int iprintf (const char *, ...)
               __attribute__ ((__format__ (__printf__, 1, 2)));
int iscanf (const char *, ...)
               __attribute__ ((__format__ (__scanf__, 1, 2)));
int siprintf (char *, const char *, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));
int siscanf (const char *, const char *, ...)
               __attribute__ ((__format__ (__scanf__, 2, 3)));
int sniprintf (char *, size_t, const char *, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int vasiprintf (char **, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));
char * vasniprintf (char *, size_t *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
char * vasnprintf (char *, size_t *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int vdiprintf (int, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));
int vfiprintf (FILE *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));
int vfiscanf (FILE *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 2, 0)));
int viprintf (const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 1, 0)));
int viscanf (const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 1, 0)));
int vsiprintf (char *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));
int vsiscanf (const char *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 2, 0)));
int vsniprintf (char *, size_t, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
# 345 "C:/devkitPro/devkitARM/arm-none-eabi/include/stdio.h" 3
FILE * fdopen (int, const char *);

int fileno (FILE *);


int pclose (FILE *);
FILE * popen (const char *, const char *);



void setbuffer (FILE *, char *, int);
int setlinebuf (FILE *);



int getw (FILE *);
int putw (int, FILE *);


int getc_unlocked (FILE *);
int getchar_unlocked (void);
void flockfile (FILE *);
int ftrylockfile (FILE *);
void funlockfile (FILE *);
int putc_unlocked (int, FILE *);
int putchar_unlocked (int);
# 380 "C:/devkitPro/devkitARM/arm-none-eabi/include/stdio.h" 3
int dprintf (int, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));

FILE * fmemopen (void *restrict, size_t, const char *restrict);


FILE * open_memstream (char **, size_t *);
int vdprintf (int, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));



int renameat (int, const char *, int, const char *);
# 402 "C:/devkitPro/devkitARM/arm-none-eabi/include/stdio.h" 3
int _asiprintf_r (struct _reent *, char **, const char *, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
char * _asniprintf_r (struct _reent *, char *, size_t *, const char *, ...)
               __attribute__ ((__format__ (__printf__, 4, 5)));
char * _asnprintf_r (struct _reent *, char *restrict, size_t *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 4, 5)));
int _asprintf_r (struct _reent *, char **restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _diprintf_r (struct _reent *, int, const char *, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _dprintf_r (struct _reent *, int, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _fclose_r (struct _reent *, FILE *);
int _fcloseall_r (struct _reent *);
FILE * _fdopen_r (struct _reent *, int, const char *);
int _fflush_r (struct _reent *, FILE *);
int _fgetc_r (struct _reent *, FILE *);
int _fgetc_unlocked_r (struct _reent *, FILE *);
char * _fgets_r (struct _reent *, char *restrict, int, FILE *restrict);
char * _fgets_unlocked_r (struct _reent *, char *restrict, int, FILE *restrict);




int _fgetpos_r (struct _reent *, FILE *, fpos_t *);
int _fsetpos_r (struct _reent *, FILE *, const fpos_t *);

int _fiprintf_r (struct _reent *, FILE *, const char *, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _fiscanf_r (struct _reent *, FILE *, const char *, ...)
               __attribute__ ((__format__ (__scanf__, 3, 4)));
FILE * _fmemopen_r (struct _reent *, void *restrict, size_t, const char *restrict);
FILE * _fopen_r (struct _reent *, const char *restrict, const char *restrict);
FILE * _freopen_r (struct _reent *, const char *restrict, const char *restrict, FILE *restrict);
int _fprintf_r (struct _reent *, FILE *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _fpurge_r (struct _reent *, FILE *);
int _fputc_r (struct _reent *, int, FILE *);
int _fputc_unlocked_r (struct _reent *, int, FILE *);
int _fputs_r (struct _reent *, const char *restrict, FILE *restrict);
int _fputs_unlocked_r (struct _reent *, const char *restrict, FILE *restrict);
size_t _fread_r (struct _reent *, void *restrict, size_t _size, size_t _n, FILE *restrict);
size_t _fread_unlocked_r (struct _reent *, void *restrict, size_t _size, size_t _n, FILE *restrict);
int _fscanf_r (struct _reent *, FILE *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 3, 4)));
int _fseek_r (struct _reent *, FILE *, long, int);
int _fseeko_r (struct _reent *, FILE *, _off_t, int);
long _ftell_r (struct _reent *, FILE *);
_off_t _ftello_r (struct _reent *, FILE *);
void _rewind_r (struct _reent *, FILE *);
size_t _fwrite_r (struct _reent *, const void *restrict, size_t _size, size_t _n, FILE *restrict);
size_t _fwrite_unlocked_r (struct _reent *, const void *restrict, size_t _size, size_t _n, FILE *restrict);
int _getc_r (struct _reent *, FILE *);
int _getc_unlocked_r (struct _reent *, FILE *);
int _getchar_r (struct _reent *);
int _getchar_unlocked_r (struct _reent *);
char * _gets_r (struct _reent *, char *);
int _iprintf_r (struct _reent *, const char *, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));
int _iscanf_r (struct _reent *, const char *, ...)
               __attribute__ ((__format__ (__scanf__, 2, 3)));
FILE * _open_memstream_r (struct _reent *, char **, size_t *);
void _perror_r (struct _reent *, const char *);
int _printf_r (struct _reent *, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));
int _putc_r (struct _reent *, int, FILE *);
int _putc_unlocked_r (struct _reent *, int, FILE *);
int _putchar_unlocked_r (struct _reent *, int);
int _putchar_r (struct _reent *, int);
int _puts_r (struct _reent *, const char *);
int _remove_r (struct _reent *, const char *);
int _rename_r (struct _reent *,
      const char *_old, const char *_new);
int _scanf_r (struct _reent *, const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 2, 3)));
int _siprintf_r (struct _reent *, char *, const char *, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _siscanf_r (struct _reent *, const char *, const char *, ...)
               __attribute__ ((__format__ (__scanf__, 3, 4)));
int _sniprintf_r (struct _reent *, char *, size_t, const char *, ...)
               __attribute__ ((__format__ (__printf__, 4, 5)));
int _snprintf_r (struct _reent *, char *restrict, size_t, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 4, 5)));
int _sprintf_r (struct _reent *, char *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _sscanf_r (struct _reent *, const char *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 3, 4)));
char * _tempnam_r (struct _reent *, const char *, const char *);
FILE * _tmpfile_r (struct _reent *);
char * _tmpnam_r (struct _reent *, char *);
int _ungetc_r (struct _reent *, int, FILE *);
int _vasiprintf_r (struct _reent *, char **, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
char * _vasniprintf_r (struct _reent*, char *, size_t *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 4, 0)));
char * _vasnprintf_r (struct _reent*, char *, size_t *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 4, 0)));
int _vasprintf_r (struct _reent *, char **, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vdiprintf_r (struct _reent *, int, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vdprintf_r (struct _reent *, int, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vfiprintf_r (struct _reent *, FILE *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vfiscanf_r (struct _reent *, FILE *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 3, 0)));
int _vfprintf_r (struct _reent *, FILE *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vfscanf_r (struct _reent *, FILE *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 3, 0)));
int _viprintf_r (struct _reent *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));
int _viscanf_r (struct _reent *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 2, 0)));
int _vprintf_r (struct _reent *, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));
int _vscanf_r (struct _reent *, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 2, 0)));
int _vsiprintf_r (struct _reent *, char *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vsiscanf_r (struct _reent *, const char *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 3, 0)));
int _vsniprintf_r (struct _reent *, char *, size_t, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 4, 0)));
int _vsnprintf_r (struct _reent *, char *restrict, size_t, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 4, 0)));
int _vsprintf_r (struct _reent *, char *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vsscanf_r (struct _reent *, const char *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 3, 0)));



int fpurge (FILE *);
ssize_t __getdelim (char **, size_t *, int, FILE *);
ssize_t __getline (char **, size_t *, FILE *);


void clearerr_unlocked (FILE *);
int feof_unlocked (FILE *);
int ferror_unlocked (FILE *);
int fileno_unlocked (FILE *);
int fflush_unlocked (FILE *);
int fgetc_unlocked (FILE *);
int fputc_unlocked (int, FILE *);
size_t fread_unlocked (void *restrict, size_t _size, size_t _n, FILE *restrict);
size_t fwrite_unlocked (const void *restrict , size_t _size, size_t _n, FILE *);
# 583 "C:/devkitPro/devkitARM/arm-none-eabi/include/stdio.h" 3
int __srget_r (struct _reent *, FILE *);
int __swbuf_r (struct _reent *, int, FILE *);
# 607 "C:/devkitPro/devkitARM/arm-none-eabi/include/stdio.h" 3
FILE *funopen (const void *__cookie,
  int (*__readfn)(void *__cookie, char *__buf,
    int __n),
  int (*__writefn)(void *__cookie, const char *__buf,
     int __n),
  fpos_t (*__seekfn)(void *__cookie, fpos_t __off, int __whence),
  int (*__closefn)(void *__cookie));
FILE *_funopen_r (struct _reent *, const void *__cookie,
  int (*__readfn)(void *__cookie, char *__buf,
    int __n),
  int (*__writefn)(void *__cookie, const char *__buf,
     int __n),
  fpos_t (*__seekfn)(void *__cookie, fpos_t __off, int __whence),
  int (*__closefn)(void *__cookie));
# 691 "C:/devkitPro/devkitARM/arm-none-eabi/include/stdio.h" 3
static __inline__ int __sputc_r(struct _reent *_ptr, int _c, FILE *_p) {




 if (--_p->_w >= 0 || (_p->_w >= _p->_lbfsize && (char)_c != '\n'))
  return (*_p->_p++ = _c);
 else
  return (__swbuf_r(_ptr, _c, _p));
}
# 745 "C:/devkitPro/devkitARM/arm-none-eabi/include/stdio.h" 3
static __inline int
_getchar_unlocked(void)
{
 struct _reent *_ptr;

 _ptr = (__getreent());
 return ((--(((_ptr)->_stdin))->_r < 0 ? __srget_r(_ptr, ((_ptr)->_stdin)) : (int)(*(((_ptr)->_stdin))->_p++)));
}

static __inline int
_putchar_unlocked(int _c)
{
 struct _reent *_ptr;

 _ptr = (__getreent());
 return (__sputc_r(_ptr, _c, ((_ptr)->_stdout)));
}
# 801 "C:/devkitPro/devkitARM/arm-none-eabi/include/stdio.h" 3

# 20 "C:/devkitPro/libtonc/include/tonc_tte.h" 2


# 1 "C:/devkitPro/libtonc/include/tonc_surface.h" 1
# 116 "C:/devkitPro/libtonc/include/tonc_surface.h"

# 116 "C:/devkitPro/libtonc/include/tonc_surface.h"
typedef enum ESurfaceType
{
 SRF_NONE =0,
 SRF_BMP16 =1,
 SRF_BMP8 =2,

 SRF_CHR4R =4,
 SRF_CHR4C =5,
 SRF_CHR8 =6,
 SRF_ALLOCATED = 0x80
} ESurfaceType;






typedef struct TSurface
{
 u8 *data;
 u32 pitch;
 u16 width;
 u16 height;
 u8 bpp;
 u8 type;
 u16 palSize;
 u16 *palData;
} TSurface;





typedef u32 (*fnGetPixel)(const TSurface *src, int x, int y);

typedef void (*fnPlot)(const TSurface *dst, int x, int y, u32 clr);
typedef void (*fnHLine)(const TSurface *dst, int x1, int y, int x2, u32 clr);
typedef void (*fnVLine)(const TSurface *dst, int x, int y1, int y2, u32 clr);
typedef void (*fnLine)(const TSurface *dst, int x1, int y1, int x2, int y2, u32 clr);

typedef void (*fnRect)(const TSurface *dst,
 int left, int top, int right, int bottom, u32 clr);
typedef void (*fnFrame)(const TSurface *dst,
 int left, int top, int right, int bottom, u32 clr);

typedef void (*fnBlit)(const TSurface *dst, int dstX, int dstY,
 uint width, uint height, const TSurface *src, int srcX, int srcY);
typedef void (*fnFlood)(const TSurface *dst, int x, int y, u32 clr);


typedef struct TSurfaceProcTab
{
 const char *name;
 fnGetPixel getPixel;
 fnPlot plot;
 fnHLine hline;
 fnVLine vline;
 fnLine line;
 fnRect rect;
 fnFrame frame;
 fnBlit blit;
 fnFlood flood;
} TSurfaceProcTab;







extern const TSurface m3_surface;
extern __attribute__((section(".ewram"))) TSurface m4_surface;
extern __attribute__((section(".ewram"))) TSurface m5_surface;

extern const TSurfaceProcTab bmp16_tab;
extern const TSurfaceProcTab bmp8_tab;
extern const TSurfaceProcTab chr4c_tab;
# 217 "C:/devkitPro/libtonc/include/tonc_surface.h"
void srf_init(TSurface *srf, enum ESurfaceType type, const void *data,
 uint width, uint height, uint bpp, u16 *pal);
void srf_pal_copy(const TSurface *dst, const TSurface *src, uint count);

void *srf_get_ptr(const TSurface *srf, uint x, uint y);


static inline uint srf_align(uint width, uint bpp);
static inline void srf_set_ptr(TSurface *srf, const void *ptr);
static inline void srf_set_pal(TSurface *srf, const u16 *pal, uint size);

static inline void *_srf_get_ptr(const TSurface *srf, uint x, uint y, uint stride);
# 237 "C:/devkitPro/libtonc/include/tonc_surface.h"
u32 sbmp16_get_pixel(const TSurface *src, int x, int y);

void sbmp16_plot(const TSurface *dst, int x, int y, u32 clr);
void sbmp16_hline(const TSurface *dst, int x1, int y, int x2, u32 clr);
void sbmp16_vline(const TSurface *dst, int x, int y1, int y2, u32 clr);
void sbmp16_line(const TSurface *dst, int x1, int y1, int x2, int y2, u32 clr);

void sbmp16_rect(const TSurface *dst,
 int left, int top, int right, int bottom, u32 clr);
void sbmp16_frame(const TSurface *dst,
 int left, int top, int right, int bottom, u32 clr);
void sbmp16_blit(const TSurface *dst, int dstX, int dstY,
 uint width, uint height, const TSurface *src, int srcX, int srcY);
void sbmp16_floodfill(const TSurface *dst, int x, int y, u32 clr);


static inline void _sbmp16_plot(const TSurface *dst, int x, int y, u32 clr);
static inline u32 _sbmp16_get_pixel(const TSurface *src, int x, int y);







u32 sbmp8_get_pixel(const TSurface *src, int x, int y);

void sbmp8_plot(const TSurface *dst, int x, int y, u32 clr);
void sbmp8_hline(const TSurface *dst, int x1, int y, int x2, u32 clr);
void sbmp8_vline(const TSurface *dst, int x, int y1, int y2, u32 clr);
void sbmp8_line(const TSurface *dst, int x1, int y1, int x2, int y2, u32 clr);

void sbmp8_rect(const TSurface *dst,
 int left, int top, int right, int bottom, u32 clr);
void sbmp8_frame(const TSurface *dst,
 int left, int top, int right, int bottom, u32 clr);
void sbmp8_blit(const TSurface *dst, int dstX, int dstY,
 uint width, uint height, const TSurface *src, int srcX, int srcY);
void sbmp8_floodfill(const TSurface *dst, int x, int y, u32 clr);


static inline void _sbmp8_plot(const TSurface *dst, int x, int y, u32 clr);
static inline u32 _sbmp8_get_pixel(const TSurface *src, int x, int y);







u32 schr4c_get_pixel(const TSurface *src, int x, int y);

void schr4c_plot(const TSurface *dst, int x, int y, u32 clr);
void schr4c_hline(const TSurface *dst, int x1, int y, int x2, u32 clr);
void schr4c_vline(const TSurface *dst, int x, int y1, int y2, u32 clr);
void schr4c_line(const TSurface *dst, int x1, int y1, int x2, int y2, u32 clr);

void schr4c_rect(const TSurface *dst,
 int left, int top, int right, int bottom, u32 clr);
void schr4c_frame(const TSurface *dst,
 int left, int top, int right, int bottom, u32 clr);

void schr4c_blit(const TSurface *dst, int dstX, int dstY,
 uint width, uint height, const TSurface *src, int srcX, int srcY);
void schr4c_floodfill(const TSurface *dst, int x, int y, u32 clr);


void schr4c_prep_map(const TSurface *srf, u16 *map, u16 se0);
u32 *schr4c_get_ptr(const TSurface *srf, int x, int y);


static inline void _schr4c_plot(const TSurface *dst, int x, int y, u32 clr);
static inline u32 _schr4c_get_pixel(const TSurface *src, int x, int y);







u32 schr4r_get_pixel(const TSurface *src, int x, int y);

void schr4r_plot(const TSurface *dst, int x, int y, u32 clr);
void schr4r_hline(const TSurface *dst, int x1, int y, int x2, u32 clr);
void schr4r_vline(const TSurface *dst, int x, int y1, int y2, u32 clr);
void schr4r_line(const TSurface *dst, int x1, int y1, int x2, int y2, u32 clr);

void schr4r_rect(const TSurface *dst,
 int left, int top, int right, int bottom, u32 clr);
void schr4r_frame(const TSurface *dst,
 int left, int top, int right, int bottom, u32 clr);






void schr4r_prep_map(const TSurface *srf, u16 *map, u16 se0);
u32 *schr4r_get_ptr(const TSurface *srf, int x, int y);


static inline void _schr4r_plot(const TSurface *dst, int x, int y, u32 clr);
static inline u32 _schr4r_get_pixel(const TSurface *src, int x, int y);
# 353 "C:/devkitPro/libtonc/include/tonc_surface.h"
static inline uint srf_align(uint width, uint bpp)
{
 return (width*bpp+31)/32*4;
}


static inline void srf_set_ptr(TSurface *srf, const void *ptr)
{
 srf->data= (u8*)ptr;
}



static inline void srf_set_pal(TSurface *srf, const u16 *pal, uint size)
{
 srf->palSize= size;
 srf->palData= (u16*)pal;
}







static inline void *_srf_get_ptr(const TSurface *srf, uint x, uint y, uint stride)
{
 return (void*)(srf->data + y*srf->pitch + x*stride);
}




u32 _sbmp16_get_pixel(const TSurface *src, int x, int y)
{
 u16 *srcD= (u16*)(src->data + y*src->pitch);
 return srcD[x];
}


void _sbmp16_plot(const TSurface *dst, int x, int y, u32 clr)
{
 u16 *dstD= (u16*)(dst->data + y*dst->pitch);
 dstD[x]= clr;
}




static inline u32 _sbmp8_get_pixel(const TSurface *src, int x, int y)
{
 return src->data[y*src->pitch + x];
}



static inline void _sbmp8_plot(const TSurface *dst, int x, int y, u32 clr)
{
 u16 *dstD= (u16*)(dst->data + y*dst->pitch+(x&~1));

 if(x&1) *dstD= (*dstD& 0xFF) | (clr<< 8);
 else *dstD= (*dstD&~0xFF) | (clr&0xFF);
}



static inline u32 _schr4c_get_pixel(const TSurface *src, int x, int y)
{
 uint xx= x, yy= y;
 u32 *srcD= (u32*)(src->data + yy*4 + xx/8*src->pitch);
 uint shift= xx%8*4;

 return (*srcD>>shift)&15;
}


static inline void _schr4c_plot(const TSurface *dst, int x, int y, u32 clr)
{
 uint xx= x, yy= y;
 u32 *dstD= (u32*)(dst->data + yy*4 + xx/8*dst->pitch);
 uint shift= xx%8*4;

 *dstD = (*dstD &~ (15<<shift)) | (clr&15)<<shift;
}


static inline u32 _schr4r_get_pixel(const TSurface *src, int x, int y)
{
 uint xx= x, yy= y;
 u32 *srcD= (u32*)(src->data+yy/8*src->pitch + yy%8*4 + xx/8*32);
 uint shift= xx%8*4;

 return (*srcD>>shift)&15;
}



static inline void _schr4r_plot(const TSurface *dst, int x, int y, u32 clr)
{
 uint xx= x, yy= y;
 u32 *dstD= (u32*)(dst->data+yy/8*dst->pitch + yy%8*4 + xx/8*32);
 uint shift= xx%8*4;

 *dstD = (*dstD &~ (15<<shift)) | (clr&15)<<shift;
}
# 23 "C:/devkitPro/libtonc/include/tonc_tte.h" 2
# 257 "C:/devkitPro/libtonc/include/tonc_tte.h"
typedef void (*fnDrawg)(uint gid);


typedef void (*fnErase)(int left, int top, int right, int bottom);
# 283 "C:/devkitPro/libtonc/include/tonc_tte.h"
typedef struct TFont
{
 const void *data;
 const u8 *widths;
 const u8 *heights;
 u16 charOffset;
 u16 charCount;
 u8 charW;
 u8 charH;
 u8 cellW;
 u8 cellH;
 u16 cellSize;
 u8 bpp;
 u8 extra;
} TFont;



typedef struct TTC
{

 TSurface dst;
 s16 cursorX;
 s16 cursorY;
 TFont *font;
 u8 *charLut;
 u16 cattr[4];

 u16 flags0;
 u16 ctrl;
 u16 marginLeft;
 u16 marginTop;
 u16 marginRight;
 u16 marginBottom;
 s16 savedX;
 s16 savedY;

 fnDrawg drawgProc;
 fnErase eraseProc;
 const TFont **fontTable;
 const char **stringTable;
} TTC;
# 333 "C:/devkitPro/libtonc/include/tonc_tte.h"
extern TTC *gp_tte_context;





extern const TFont sys8Font;

extern const TFont verdana9Font;
extern const TFont verdana9bFont;
extern const TFont verdana9iFont;

extern const TFont verdana10Font;

extern const TFont verdana9_b4Font;




extern const unsigned int sys8Glyphs[192];

extern const unsigned int verdana9Glyphs[896];
extern const unsigned char verdana9Widths[224];

extern const unsigned int verdana9bGlyphs[896];
extern const unsigned char verdana9bWidths[224];

extern const unsigned int verdana9iGlyphs[896];
extern const unsigned char verdana9iWidths[224];

extern const unsigned int verdana10Glyphs[1792];
extern const unsigned char verdana10Widths[224];

extern const unsigned int verdana9_b4Glyphs[3584];
extern const unsigned char verdana9_b4Widths[224];
# 383 "C:/devkitPro/libtonc/include/tonc_tte.h"
void tte_set_context(TTC *tc);
static inline TTC *tte_get_context();

static inline uint tte_get_glyph_id(int ch);
static inline int tte_get_glyph_width(uint gid);
static inline int tte_get_glyph_height(uint gid);
static inline const void *tte_get_glyph_data(uint gid);


void tte_set_color(eint type, u16 clr);
void tte_set_colors(const u16 colors[]);

void tte_set_color_attr(eint type, u16 cattr);
void tte_set_color_attrs(const u16 cattrs[]);

char *tte_cmd_default(const char *str);

int tte_putc(int ch);
int tte_write(const char *text);
int tte_write_ex(int x, int y, const char *text, const u16 *clrlut);


void tte_erase_rect(int left, int top, int right, int bottom);
void tte_erase_screen(void);
void tte_erase_line(void);

POINT16 tte_get_text_size(const char *str);

void tte_init_base(const TFont *font, fnDrawg drawProc, fnErase eraseProc);
# 423 "C:/devkitPro/libtonc/include/tonc_tte.h"
static inline void tte_get_pos(int *x, int *y);
static inline u16 tte_get_ink(void);
static inline u16 tte_get_shadow(void);
static inline u16 tte_get_paper(void);
static inline u16 tte_get_special(void);

static inline TSurface *tte_get_surface(void);
static inline TFont *tte_get_font(void);
static inline fnDrawg tte_get_drawg(void);
static inline fnErase tte_get_erase(void);

static inline char **tte_get_string_table(void);
static inline TFont **tte_get_font_table(void);


static inline void tte_set_pos(int x, int y);
static inline void tte_set_ink(u16 cattr);
static inline void tte_set_shadow(u16 cattr);
static inline void tte_set_paper(u16 cattr);
static inline void tte_set_special(u16 cattr);

static inline void tte_set_surface(const TSurface *srf);
static inline void tte_set_font(const TFont *font);
static inline void tte_set_drawg(fnDrawg proc);
static inline void tte_set_erase(fnErase proc);

static inline void tte_set_string_table(const char *table[]);
static inline void tte_set_font_table(const TFont *table[]);

void tte_set_margins(int left, int top, int right, int bottom);
# 463 "C:/devkitPro/libtonc/include/tonc_tte.h"
void tte_init_con(void);
int tte_cmd_vt100(const char *text);

ssize_t tte_con_write(struct _reent *r, void *fd, const char *text, size_t len);
ssize_t tte_con_nocash(struct _reent *r, void *fd, const char *text, size_t len);
# 484 "C:/devkitPro/libtonc/include/tonc_tte.h"
void tte_init_se(int bgnr, u16 bgcnt, SCR_ENTRY se0, u32 clrs, u32 bupofs,
 const TFont *font, fnDrawg proc);

void se_erase(int left, int top, int right, int bottom);

void se_drawg_w8h8(uint gid);
void se_drawg_w8h16(uint gid);
void se_drawg(uint gid);
void se_drawg_s(uint gid);




void tte_init_ase(int bgnr, u16 bgcnt, u8 ase0, u32 clrs, u32 bupofs,
 const TFont *font, fnDrawg proc);

void ase_erase(int left, int top, int right, int bottom);

void ase_drawg_w8h8(uint gid);
void ase_drawg_w8h16(uint gid);
void ase_drawg(uint gid);
void ase_drawg_s(uint gid);
# 516 "C:/devkitPro/libtonc/include/tonc_tte.h"
void tte_init_chr4c(int bgnr, u16 bgcnt, u16 se0, u32 cattrs, u32 clrs,
 const TFont *font, fnDrawg proc);

void chr4c_erase(int left, int top, int right, int bottom);

void chr4c_drawg_b1cts(uint gid);
__attribute__((section(".iwram"), long_call)) void chr4c_drawg_b1cts_fast(uint gid);

void chr4c_drawg_b4cts(uint gid);
__attribute__((section(".iwram"), long_call)) void chr4c_drawg_b4cts_fast(uint gid);
# 539 "C:/devkitPro/libtonc/include/tonc_tte.h"
void tte_init_chr4r(int bgnr, u16 bgcnt, u16 se0, u32 cattrs, u32 clrs,
 const TFont *font, fnDrawg proc);

void chr4r_erase(int left, int top, int right, int bottom);

void chr4r_drawg_b1cts(uint gid);
__attribute__((section(".iwram"), long_call)) void chr4r_drawg_b1cts_fast(uint gid);
# 555 "C:/devkitPro/libtonc/include/tonc_tte.h"
void tte_init_bmp(int vmode, const TFont *font, fnDrawg proc);



void bmp8_erase(int left, int top, int right, int bottom);

void bmp8_drawg(uint gid);
void bmp8_drawg_t(uint gid);

void bmp8_drawg_b1cts(uint gid);
__attribute__((section(".iwram"), long_call)) void bmp8_drawg_b1cts_fast(uint gid);
void bmp8_drawg_b1cos(uint gid);




void bmp16_erase(int left, int top, int right, int bottom);

void bmp16_drawg(uint gid);
void bmp16_drawg_t(uint gid);

void bmp16_drawg_b1cts(uint gid);
void bmp16_drawg_b1cos(uint gid);
# 586 "C:/devkitPro/libtonc/include/tonc_tte.h"
void tte_init_obj(OBJ_ATTR *dst, u32 attr0, u32 attr1, u32 attr2,
 u32 clrs, u32 bupofs, const TFont *font, fnDrawg proc);

void obj_erase(int left, int top, int right, int bottom);

void obj_drawg(uint gid);
# 601 "C:/devkitPro/libtonc/include/tonc_tte.h"
static inline TTC *tte_get_context(void)
{ return gp_tte_context; }





static inline uint tte_get_glyph_id(int ch)
{
 TTC *tc= tte_get_context();
 ch -= tc->font->charOffset;
 return tc->charLut ? tc->charLut[ch] : ch;
}


static inline const void *tte_get_glyph_data(uint gid)
{
 TTC *tc= tte_get_context();
 TFont *font= tc->font;
 return ((u8*)font->data) + gid*font->cellSize;
}


static inline int tte_get_glyph_width(uint gid)
{
 TFont *font= tte_get_context()->font;
 return font->widths ? font->widths[gid] : font->charW;
}


static inline int tte_get_glyph_height(uint gid)
{
 TFont *font= tte_get_context()->font;
 return font->heights ? font->heights[gid] : font->charH;
}






static inline void tte_set_surface(const TSurface *srf)
{ tte_get_context()->dst= *srf; }


static inline TSurface *tte_get_surface()
{ return &tte_get_context()->dst; }




static inline void tte_set_pos(int x, int y)
{
 tte_get_context()->cursorX= x;
 tte_get_context()->cursorY= y;
}


static inline void tte_get_pos(int *x, int *y)
{
 if(x) *x= tte_get_context()->cursorX;
 if(y) *y= tte_get_context()->cursorY;
}



static inline void tte_set_font(const TFont *font)
{ tte_get_context()->font= (TFont*)font; }


static inline TFont *tte_get_font(void)
{ return tte_get_context()->font; }



static inline void tte_set_ink(u16 cattr)
{ tte_get_context()->cattr[0]= cattr; }


static inline void tte_set_shadow(u16 cattr)
{ tte_get_context()->cattr[1]= cattr; }


static inline void tte_set_paper(u16 cattr)
{ tte_get_context()->cattr[2]= cattr; }


static inline void tte_set_special(u16 cattr)
{ tte_get_context()->cattr[3]= cattr; }



static inline u16 tte_get_ink(void)
{ return tte_get_context()->cattr[0]; }


static inline u16 tte_get_shadow(void)
{ return tte_get_context()->cattr[1]; }


static inline u16 tte_get_paper(void)
{ return tte_get_context()->cattr[2]; }


static inline u16 tte_get_special(void)
{ return tte_get_context()->cattr[3]; }



static inline void tte_set_drawg(fnDrawg proc)
{ tte_get_context()->drawgProc= proc; }


static inline fnDrawg tte_get_drawg(void)
{ return tte_get_context()->drawgProc; }



static inline void tte_set_erase(fnErase proc)
{ tte_get_context()->eraseProc= proc; }


static inline fnErase tte_get_erase(void)
{ return tte_get_context()->eraseProc; }



static inline void tte_set_string_table(const char *table[])
{ tte_get_context()->stringTable= table; }


static inline char **tte_get_string_table(void)
{ return (char**)tte_get_context()->stringTable; }



static inline void tte_set_font_table(const TFont *table[])
{ tte_get_context()->fontTable= table; }


static inline TFont **tte_get_font_table(void)
{ return (TFont**)tte_get_context()->fontTable; }
# 29 "C:/devkitPro/libtonc/include/tonc.h" 2
# 1 "C:/devkitPro/libtonc/include/tonc_video.h" 1
# 84 "C:/devkitPro/libtonc/include/tonc_video.h"
static inline void vid_vsync(void);
void vid_wait(uint frames);
u16 *vid_flip(void);
# 143 "C:/devkitPro/libtonc/include/tonc_video.h"
void clr_rotate(COLOR *clrs, uint nclrs, int ror);
void clr_blend(const COLOR *srca, const COLOR *srcb, COLOR *dst,
  u32 nclrs, u32 alpha);
void clr_fade(const COLOR *src, COLOR clr, COLOR *dst,
  u32 nclrs, u32 alpha);

void clr_grayscale(COLOR *dst, const COLOR *src, uint nclrs);
void clr_rgbscale(COLOR *dst, const COLOR *src, uint nclrs, COLOR clr);

void clr_adj_brightness(COLOR *dst, const COLOR *src, uint nclrs, FIXED bright);
void clr_adj_contrast(COLOR *dst, const COLOR *src, uint nclrs, FIXED contrast);
void clr_adj_intensity(COLOR *dst, const COLOR *src, uint nclrs, FIXED intensity);

void pal_gradient(COLOR *pal, int first, int last);
void pal_gradient_ex(COLOR *pal, int first, int last, COLOR clr_first, COLOR clr_last);
# 168 "C:/devkitPro/libtonc/include/tonc_video.h"
__attribute__((section(".iwram"), long_call)) void clr_blend_fast(COLOR *srca, COLOR *srcb, COLOR *dst,
 uint nclrs, u32 alpha);
# 179 "C:/devkitPro/libtonc/include/tonc_video.h"
__attribute__((section(".iwram"), long_call)) void clr_fade_fast(COLOR *src, COLOR clr, COLOR *dst,
 uint nclrs, u32 alpha);


static inline COLOR RGB15(int red, int green, int blue);
static inline COLOR RGB15_SAFE(int red, int green, int blue);

static inline COLOR RGB8(u8 red, u8 green, u8 blue);
# 197 "C:/devkitPro/libtonc/include/tonc_video.h"
void bmp8_plot(int x, int y, u32 clr, void *dstBase, uint dstP);

void bmp8_hline(int x1, int y, int x2, u32 clr, void *dstBase, uint dstP);
void bmp8_vline(int x, int y1, int y2, u32 clr, void *dstBase, uint dstP);
void bmp8_line(int x1, int y1, int x2, int y2, u32 clr,
 void *dstBase, uint dstP);

void bmp8_rect(int left, int top, int right, int bottom, u32 clr,
 void *dstBase, uint dstP);
void bmp8_frame(int left, int top, int right, int bottom, u32 clr,
 void *dstBase, uint dstP);




void bmp16_plot(int x, int y, u32 clr, void *dstBase, uint dstP);

void bmp16_hline(int x1, int y, int x2, u32 clr, void *dstBase, uint dstP);
void bmp16_vline(int x, int y1, int y2, u32 clr, void *dstBase, uint dstP);
void bmp16_line(int x1, int y1, int x2, int y2, u32 clr, void *dstBase, uint dstP);

void bmp16_rect(int left, int top, int right, int bottom, u32 clr,
 void *dstBase, uint dstP);
void bmp16_frame(int left, int top, int right, int bottom, u32 clr,
 void *dstBase, uint dstP);
# 257 "C:/devkitPro/libtonc/include/tonc_video.h"
static inline void se_fill(SCR_ENTRY *sbb, SCR_ENTRY se);
static inline void se_plot(SCR_ENTRY *sbb, int x, int y, SCR_ENTRY se);
static inline void se_rect(SCR_ENTRY *sbb, int left, int top, int right, int bottom, SCR_ENTRY se);
static inline void se_frame(SCR_ENTRY *sbb, int left, int top, int right, int bottom, SCR_ENTRY se);

void se_window(SCR_ENTRY *sbb, int left, int top, int right, int bottom, SCR_ENTRY se0);

void se_hline(SCR_ENTRY *sbb, int x0, int x1, int y, SCR_ENTRY se);
void se_vline(SCR_ENTRY *sbb, int x, int y0, int y1, SCR_ENTRY se);





static inline void bg_aff_set(BG_AFFINE *bgaff,
 FIXED pa, FIXED pb, FIXED pc, FIXED pd);
static inline void bg_aff_identity(BG_AFFINE *bgaff);
static inline void bg_aff_scale(BG_AFFINE *bgaff, FIXED sx, FIXED sy);
static inline void bg_aff_shearx(BG_AFFINE *bgaff, FIXED hx);
static inline void bg_aff_sheary(BG_AFFINE *bgaff, FIXED hy);

void bg_aff_rotate(BG_AFFINE *bgaff, u16 alpha);
void bg_aff_rotscale(BG_AFFINE *bgaff, int sx, int sy, u16 alpha);
void bg_aff_premul(BG_AFFINE *dst, const BG_AFFINE *src);
void bg_aff_postmul(BG_AFFINE *dst, const BG_AFFINE *src);
void bg_aff_rotscale2(BG_AFFINE *bgaff, const AFF_SRC *as);
void bg_rotscale_ex(BG_AFFINE *bgaff, const AFF_SRC_EX *asx);
# 301 "C:/devkitPro/libtonc/include/tonc_video.h"
static inline void m3_fill(COLOR clr);
static inline void m3_plot(int x, int y, COLOR clr);

static inline void m3_hline(int x1, int y, int x2, COLOR clr);
static inline void m3_vline(int x, int y1, int y2, COLOR clr);
static inline void m3_line(int x1, int y1, int x2, int y2, COLOR clr);

static inline void m3_rect(int left, int top, int right, int bottom, COLOR clr);
static inline void m3_frame(int left, int top, int right, int bottom, COLOR clr);
# 319 "C:/devkitPro/libtonc/include/tonc_video.h"
static inline void m4_fill(u8 clrid);
static inline void m4_plot(int x, int y, u8 clrid);

static inline void m4_hline(int x1, int y, int x2, u8 clrid);
static inline void m4_vline(int x, int y1, int y2, u8 clrid);
static inline void m4_line(int x1, int y1, int x2, int y2, u8 clrid);

static inline void m4_rect(int left, int top, int right, int bottom, u8 clrid);
static inline void m4_frame(int left, int top, int right, int bottom, u8 clrid);
# 337 "C:/devkitPro/libtonc/include/tonc_video.h"
static inline void m5_fill(COLOR clr);
static inline void m5_plot(int x, int y, COLOR clr);

static inline void m5_hline(int x1, int y, int x2, COLOR clr);
static inline void m5_vline(int x, int y1, int y2, COLOR clr);
static inline void m5_line(int x1, int y1, int x2, int y2, COLOR clr);

static inline void m5_rect(int left, int top, int right, int bottom, COLOR clr);
static inline void m5_frame(int left, int top, int right, int bottom, COLOR clr);
# 360 "C:/devkitPro/libtonc/include/tonc_video.h"
static inline void vid_vsync(void)
{
 while(*(vu16*)(0x04000000 +0x0006) >= 160);
 while(*(vu16*)(0x04000000 +0x0006) < 160);
}







static inline COLOR RGB15(int red, int green, int blue)
{ return red + (green<<5) + (blue<<10); }


static inline COLOR RGB15_SAFE(int red, int green, int blue)
{ return (red&31) + ((green&31)<<5) + ((blue&31)<<10); }



static inline COLOR RGB8(u8 red, u8 green, u8 blue)
{ return (red>>3) + ((green>>3)<<5) + ((blue>>3)<<10); }






static inline void se_fill(SCR_ENTRY *sbb, SCR_ENTRY se)
{ memset32(sbb, dup16(se), 0x00800/4); }


static inline void se_plot(SCR_ENTRY *sbb, int x, int y, SCR_ENTRY se)
{ sbb[y*32+x]= se; }


static inline void se_rect(SCR_ENTRY *sbb, int left, int top, int right, int bottom,
 SCR_ENTRY se)
{ bmp16_rect(left, top, right, bottom, se, sbb, 32*2); }


static inline void se_frame(SCR_ENTRY *sbb, int left, int top, int right, int bottom,
 SCR_ENTRY se)
{ bmp16_frame(left, top, right, bottom, se, sbb, 32*2); }






static inline void bg_aff_copy(BG_AFFINE *dst, const BG_AFFINE *src)
{ *dst = *src; }


static inline void bg_aff_set(BG_AFFINE *bgaff,
 FIXED pa, FIXED pb, FIXED pc, FIXED pd)
{
 bgaff->pa= pa; bgaff->pb= pb;
 bgaff->pc= pc; bgaff->pd= pd;
}


static inline void bg_aff_identity(BG_AFFINE *bgaff)
{
 bgaff->pa= 0x0100; bgaff->pb= 0;
 bgaff->pc= 0; bgaff->pd= 0x0100;
}


static inline void bg_aff_scale(BG_AFFINE *bgaff, FIXED sx, FIXED sy)
{
 bgaff->pa= sx; bgaff->pb= 0;
 bgaff->pb= 0; bgaff->pd= sy;
}

static inline void bg_aff_shearx(BG_AFFINE *bgaff, FIXED hx)
{
 bgaff->pa= 0x0100; bgaff->pb= hx;
 bgaff->pc= 0; bgaff->pd= 0x0100;
}

static inline void bg_aff_sheary(BG_AFFINE *bgaff, FIXED hy)
{
 bgaff->pa= 0x0100; bgaff->pb= 0;
 bgaff->pc= hy; bgaff->pd= 0x0100;
}
# 456 "C:/devkitPro/libtonc/include/tonc_video.h"
static inline void m3_fill(COLOR clr)
{ memset32(((COLOR*)0x06000000), dup16(clr), 0x12C00/4); }



static inline void m3_plot(int x, int y, COLOR clr)
{ ((COLOR*)0x06000000)[y*240 +x]= clr; }



static inline void m3_hline(int x1, int y, int x2, COLOR clr)
{ bmp16_hline(x1, y, x2, clr, ((COLOR*)0x06000000), 240*2); }



static inline void m3_vline(int x, int y1, int y2, COLOR clr)
{ bmp16_vline(x, y1, y2, clr, ((COLOR*)0x06000000), 240*2); }



static inline void m3_line(int x1, int y1, int x2, int y2, COLOR clr)
{ bmp16_line(x1, y1, x2, y2, clr, ((COLOR*)0x06000000), 240*2); }
# 488 "C:/devkitPro/libtonc/include/tonc_video.h"
static inline void m3_rect(int left, int top, int right, int bottom, COLOR clr)
{ bmp16_rect(left, top, right, bottom, clr, ((COLOR*)0x06000000), 240*2); }
# 500 "C:/devkitPro/libtonc/include/tonc_video.h"
static inline void m3_frame(int left, int top, int right, int bottom, COLOR clr)
{ bmp16_frame(left, top, right, bottom, clr, ((COLOR*)0x06000000), 240*2); }






static inline void m4_fill(u8 clrid)
{ memset32(vid_page, quad8(clrid), 0x09600/4); }



static inline void m4_plot(int x, int y, u8 clrid)
{
 u16 *dst= &vid_page[(y*240 +x)>>1];
 if(x&1)
  *dst= (*dst& 0xFF) | (clrid<<8);
 else
  *dst= (*dst&~0xFF) | clrid;
}



static inline void m4_hline(int x1, int y, int x2, u8 clrid)
{ bmp8_hline(x1, y, x2, clrid, vid_page, 240); }



static inline void m4_vline(int x, int y1, int y2, u8 clrid)
{ bmp8_vline(x, y1, y2, clrid, vid_page, 240); }



static inline void m4_line(int x1, int y1, int x2, int y2, u8 clrid)
{ bmp8_line(x1, y1, x2, y2, clrid, vid_page, 240); }
# 546 "C:/devkitPro/libtonc/include/tonc_video.h"
static inline void m4_rect(int left, int top, int right, int bottom, u8 clrid)
{ bmp8_rect(left, top, right, bottom, clrid, vid_page, 240); }
# 558 "C:/devkitPro/libtonc/include/tonc_video.h"
static inline void m4_frame(int left, int top, int right, int bottom, u8 clrid)
{ bmp8_frame(left, top, right, bottom, clrid, vid_page, 240); }






static inline void m5_fill(COLOR clr)
{ memset32(vid_page, dup16(clr), 0x0A000/4); }



static inline void m5_plot(int x, int y, COLOR clr)
{ vid_page[y*160 +x]= clr; }



static inline void m5_hline(int x1, int y, int x2, COLOR clr)
{ bmp16_hline(x1, y, x2, clr, vid_page, 160*2); }



static inline void m5_vline(int x, int y1, int y2, COLOR clr)
{ bmp16_vline(x, y1, y2, clr, vid_page, 160*2); }



static inline void m5_line(int x1, int y1, int x2, int y2, COLOR clr)
{ bmp16_line(x1, y1, x2, y2, clr, vid_page, 160*2); }
# 598 "C:/devkitPro/libtonc/include/tonc_video.h"
static inline void m5_rect(int left, int top, int right, int bottom, COLOR clr)
{ bmp16_rect(left, top, right, bottom, clr, vid_page, 160*2); }
# 610 "C:/devkitPro/libtonc/include/tonc_video.h"
static inline void m5_frame(int left, int top, int right, int bottom, COLOR clr)
{ bmp16_frame(left, top, right, bottom, clr, vid_page, 160*2); }
# 30 "C:/devkitPro/libtonc/include/tonc.h" 2


# 1 "C:/devkitPro/libtonc/include/tonc_nocash.h" 1
# 31 "C:/devkitPro/libtonc/include/tonc_nocash.h"
extern __attribute__((section(".ewram"))) char nocash_buffer[80];
# 42 "C:/devkitPro/libtonc/include/tonc_nocash.h"
int nocash_puts(const char *str);


__attribute__((section(".ewram"), long_call)) void nocash_message(void);
# 33 "C:/devkitPro/libtonc/include/tonc.h" 2


# 1 "C:/devkitPro/libtonc/include/tonc_text.h" 1
# 64 "C:/devkitPro/libtonc/include/tonc_text.h"
typedef struct tagTXT_BASE
{
 u16 *dst0;
 u32 *font;
  u8 *chars;
  u8 *cws;
  u8 dx,dy;
 u16 flags;
  u8 extra[12];
} __attribute__((aligned(4))) TXT_BASE;







extern const u32 toncfontTiles[192];

extern TXT_BASE __txt_base, *gptxt;
extern u8 txt_lut[256];

extern u16 *vid_page;
# 116 "C:/devkitPro/libtonc/include/tonc_text.h"
void txt_init_std();
void txt_bup_1toX(void *dstv, const void *srcv, u32 len, int bpp, u32 base);
# 126 "C:/devkitPro/libtonc/include/tonc_text.h"
void txt_init_se(int bgnr, u16 bgcnt, SCR_ENTRY se0, u32 clrs, u32 base);
void se_putc(int x, int y, int c, SCR_ENTRY se0);
void se_puts(int x, int y, const char *str, SCR_ENTRY se0);
void se_clrs(int x, int y, const char *str, SCR_ENTRY se0);
# 141 "C:/devkitPro/libtonc/include/tonc_text.h"
void bm_putc(int x, int y, int c, COLOR clr);
void bm_puts(int x, int y, const char *str, COLOR clr);
void bm_clrs(int x, int y, const char *str, COLOR clr);




static inline void m3_putc(int x, int y, int c, COLOR clr);
static inline void m3_puts(int x, int y, const char *str, COLOR clr);
static inline void m3_clrs(int x, int y, const char *str, COLOR clr);




static inline void m4_putc(int x, int y, int c, u8 clrid);
static inline void m4_puts(int x, int y, const char *str, u8 clrid);
static inline void m4_clrs(int x, int y, const char *str, u8 clrid);




static inline void m5_putc(int x, int y, int c, COLOR clr);
static inline void m5_puts(int x, int y, const char *str, COLOR clr);
static inline void m5_clrs(int x, int y, const char *str, COLOR clr);




void bm16_putc(u16 *dst, int c, COLOR clr, int pitch);
void bm16_puts(u16 *dst, const char *str, COLOR clr, int pitch);
void bm16_clrs(u16 *dst, const char *str, COLOR clr, int pitch);

void bm8_putc(u16 *dst, int c, u8 clrid);
void bm8_puts(u16 *dst, const char *str, u8 clrid);
# 186 "C:/devkitPro/libtonc/include/tonc_text.h"
static inline void obj_putc2(int x, int y, int c, u16 attr2,
 OBJ_ATTR *obj0);
static inline void obj_puts2(int x, int y, const char *str, u16 attr2,
 OBJ_ATTR *obj0);

void txt_init_obj(OBJ_ATTR *obj0, u16 attr2, u32 clrs, u32 base);
void obj_putc(int x, int y, int c, u16 attr2);
void obj_puts(int x, int y, const char *str, u16 attr2);
void obj_clrs(int x, int y, const char *str);
# 209 "C:/devkitPro/libtonc/include/tonc_text.h"
static inline void m3_putc(int x, int y, int c, COLOR clr)
{ bm16_putc(&((COLOR*)0x06000000)[y*240+x], c, clr, 240); }


static inline void m3_puts(int x, int y, const char *str, COLOR clr)
{ bm16_puts(&((COLOR*)0x06000000)[y*240+x], str, clr, 240); }


static inline void m3_clrs(int x, int y, const char *str, COLOR clr)
{ bm16_clrs(&((COLOR*)0x06000000)[y*240+x], str, clr, 240); }




static inline void m4_putc(int x, int y, int c, u8 clrid)
{ bm8_putc(&vid_page[(y*240+x)>>1], c, clrid); }


static inline void m4_puts(int x, int y, const char *str, u8 clrid)
{ bm8_puts(&vid_page[(y*240+x)>>1], str, clrid); }


static inline void m4_clrs(int x, int y, const char *str, u8 clrid)
{
 gptxt->dx >>= 1;
 bm16_clrs(&vid_page[(y*240+x)>>1], str, dup8(clrid), 120);
 gptxt->dx <<= 1;
}


static inline void m5_putc(int x, int y, int c, COLOR clr)
{ bm16_putc(&vid_page[y*160+x], c, clr, 160); }


static inline void m5_puts(int x, int y, const char *str, COLOR clr)
{ bm16_puts(&vid_page[y*160+x], str, clr, 160); }


static inline void m5_clrs(int x, int y, const char *str, COLOR clr)
{ bm16_clrs(&vid_page[y*160+x], str, clr, 160); }






static inline void obj_putc2(int x, int y, int c, u16 attr2,
 OBJ_ATTR *obj0)
{
 gptxt->dst0= (u16*)obj0;
 obj_putc(x, y, c, attr2);
}


static inline void obj_puts2(int x, int y, const char *str, u16 attr2,
 OBJ_ATTR *obj0)
{
 gptxt->dst0= (u16*)obj0;
 obj_puts(x, y, str, attr2);
}
# 36 "C:/devkitPro/libtonc/include/tonc.h" 2
# 2 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/source/controlState.c" 2

# 1 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/include/GCCgfx.h" 1
# 1 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/include/graphicsDef.h" 1


extern void memcpy256(const void *dest,const void *src,const u32 len);

struct regObj {
 const u32 *tileData;
 const u16 charBlock;
 const u32 tileIndex;
 const u32 tileLen;
 const u16 ATTR0;
 const u16 ATTR1;
 const u16 ATTR2;
};

static inline void init_regObj(const struct regObj* obj,const int OAM_INDEX){
 memcpy256(&( (CHARBLOCK*)0x06000000)[obj->charBlock][obj->tileIndex],obj->tileData,obj->tileLen);
 obj_set_attr(&((OBJ_ATTR*)0x07000000)[OAM_INDEX],
  obj->ATTR0,
  obj->ATTR1,
  obj->ATTR2);
 return;
}
# 2 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/include/GCCgfx.h" 2

# 1 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/build/Abutton.h" 1
# 20 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/build/Abutton.h"
extern const unsigned int AbuttonTiles[128];
# 4 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/include/GCCgfx.h" 2
# 1 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/build/Bbutton.h" 1
# 20 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/build/Bbutton.h"
extern const unsigned int BbuttonTiles[32];
# 5 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/include/GCCgfx.h" 2
# 1 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/build/Xbutton.h" 1
# 20 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/build/Xbutton.h"
extern const unsigned int XbuttonTiles[16];
# 6 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/include/GCCgfx.h" 2
# 1 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/build/Ybutton.h" 1
# 20 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/build/Ybutton.h"
extern const unsigned int YbuttonTiles[16];
# 7 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/include/GCCgfx.h" 2
# 1 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/build/ZbuttonPressed.h" 1
# 20 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/build/ZbuttonPressed.h"
extern const unsigned int ZbuttonPressedTiles[64];
# 8 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/include/GCCgfx.h" 2
# 1 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/build/ZbuttonUnpressed.h" 1
# 20 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/build/ZbuttonUnpressed.h"
extern const unsigned int ZbuttonUnpressedTiles[64];
# 9 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/include/GCCgfx.h" 2
# 1 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/build/dStick.h" 1
# 20 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/build/dStick.h"
extern const unsigned int dStickTiles[128];
# 10 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/include/GCCgfx.h" 2
# 1 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/build/cStick.h" 1
# 20 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/build/cStick.h"
extern const unsigned int cStickTiles[32];
# 11 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/include/GCCgfx.h" 2
# 1 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/build/dPadLR.h" 1
# 20 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/build/dPadLR.h"
extern const unsigned int dPadLRTiles[16];
# 12 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/include/GCCgfx.h" 2
# 1 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/build/dPadUD.h" 1
# 20 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/build/dPadUD.h"
extern const unsigned int dPadUDTiles[16];
# 13 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/include/GCCgfx.h" 2
# 1 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/build/STARTbutton.h" 1
# 20 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/build/STARTbutton.h"
extern const unsigned int STARTbuttonTiles[8];
# 14 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/include/GCCgfx.h" 2
# 1 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/build/LTrigger.h" 1
# 20 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/build/LTrigger.h"
extern const unsigned int LtriggerTiles[64];
# 15 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/include/GCCgfx.h" 2
# 1 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/build/RTrigger.h" 1
# 20 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/build/RTrigger.h"
extern const unsigned int RtriggerTiles[64];
# 16 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/include/GCCgfx.h" 2
# 1 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/build/gcc.h" 1
# 21 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/build/gcc.h"
extern const unsigned int gccTiles[1064];


extern const unsigned short gccMap[1024];
# 17 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/include/GCCgfx.h" 2
# 4 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/source/controlState.c" 2
# 1 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/include/controllerStateDef.h" 1
# 14 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/include/controllerStateDef.h"
struct ctrlState{
 u16 buttons;
 u8 dStickX;
 u8 dStickY;
 u8 cStickX;
 u8 cStickY;
 u8 Ltrig;
 u8 Rtrig;
};
# 5 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/source/controlState.c" 2

extern void processInput(int newFrame);
extern void memcpy256(const void *dest,const void *src,const u32 len);
extern struct ctrlState controllerState;

const struct regObj AbuttonObj={AbuttonTiles,4,0,512,
 ( ((16 +28)&255) | (((0)&3)<<8) | (((0)&1)<<10) | (((0)&1)<<11) | (((0)&1)<<12) | (((0)&8)<<10)| (((0)&3)<<14) ), ( ((24 +134)&511) | (((0)&1)<<12) | (((0)&1)<<13) | (((2)&3)<<14) ), ( ((0)&0x3FF) | (((0)&15)<<12) | (((0)&3)<<10) )};

const struct regObj BbuttonObj={BbuttonTiles,4,512/32,128,
 ( ((16 +45)&255) | (((0)&3)<<8) | (((0)&1)<<10) | (((0)&1)<<11) | (((0)&1)<<12) | (((0)&8)<<10)| (((0)&3)<<14) ), ( ((24 +123)&511) | (((0)&1)<<12) | (((0)&1)<<13) | (((1)&3)<<14) ), ( ((512/32)&0x3FF) | (((0)&15)<<12) | (((0)&3)<<10) )};

const struct regObj XbuttonObj={XbuttonTiles,4,512/32 +128/32,64,
 ( ((16 +28)&255) | (((0)&3)<<8) | (((0)&1)<<10) | (((0)&1)<<11) | (((0)&1)<<12) | (((0)&8)<<10)| (((2)&3)<<14) ), ( ((24 +159)&511) | (((0)&1)<<12) | (((0)&1)<<13) | (((0)&3)<<14) ), ( ((512/32 +128/32)&0x3FF) | (((0)&15)<<12) | (((0)&3)<<10) )};

const struct regObj YbuttonObj={YbuttonTiles,4,512/32 +128/32 +64/32,64,
 ( ((16 +19)&255) | (((0)&3)<<8) | (((0)&1)<<10) | (((0)&1)<<11) | (((0)&1)<<12) | (((0)&8)<<10)| (((1)&3)<<14) ), ( ((24 +133)&511) | (((0)&1)<<12) | (((0)&1)<<13) | (((0)&3)<<14) ), ( ((512/32 +128/32 +64/32)&0x3FF) | (((0)&15)<<12) | (((0)&3)<<10) )};

const struct regObj ZbuttonObj={ZbuttonUnpressedTiles,4,512/32 +128/32 +64/32 +64/32,256,
 ( ((16 +9)&255) | (((0)&3)<<8) | (((0)&1)<<10) | (((0)&1)<<11) | (((0)&1)<<12) | (((0)&8)<<10)| (((1)&3)<<14) ), ( ((24 +141)&511) | (((0)&1)<<12) | (((0)&1)<<13) | (((2)&3)<<14) ), ( ((512/32 +128/32 +64/32 +64/32)&0x3FF) | (((0)&15)<<12) | (((0)&3)<<10) )};

const struct regObj dPadUObj={dPadUDTiles,4,512/32 +128/32 +64/32 +64/32 +256/32 +256/32,64,
 ( ((16 +63)&255) | (((0)&3)<<8) | (((0)&1)<<10) | (((0)&1)<<11) | (((0)&1)<<12) | (((0)&8)<<10)| (((2)&3)<<14) ), ( ((24 +67)&511) | (((0)&1)<<12) | (((0)&1)<<13) | (((0)&3)<<14) ), ( ((512/32 +128/32 +64/32 +64/32 +256/32 +256/32)&0x3FF) | (((0)&15)<<12) | (((0)&3)<<10) )};

const struct regObj dPadDObj={dPadUDTiles,4,512/32 +128/32 +64/32 +64/32 +256/32 +256/32,64,
 ( ((16 +68)&255) | (((0)&3)<<8) | (((0)&1)<<10) | (((0)&1)<<11) | (((0)&1)<<12) | (((0)&8)<<10)| (((2)&3)<<14) ), ( ((24 +66)&511) | (((1)&1)<<12) | (((1)&1)<<13) | (((0)&3)<<14) ), ( ((512/32 +128/32 +64/32 +64/32 +256/32 +256/32)&0x3FF) | (((0)&15)<<12) | (((0)&3)<<10) )};

const struct regObj dPadLObj={dPadLRTiles,4,512/32 +128/32 +64/32 +64/32 +256/32 +256/32 +64/32,64,
 ( ((16 +70)&255) | (((0)&3)<<8) | (((0)&1)<<10) | (((0)&1)<<11) | (((0)&1)<<12) | (((0)&8)<<10)| (((1)&3)<<14) ), ( ((24 +60)&511) | (((0)&1)<<12) | (((0)&1)<<13) | (((0)&3)<<14) ), ( ((512/32 +128/32 +64/32 +64/32 +256/32 +256/32 +64/32)&0x3FF) | (((0)&15)<<12) | (((0)&3)<<10) )};

const struct regObj dPadRObj={dPadLRTiles,4,512/32 +128/32 +64/32 +64/32 +256/32 +256/32 +64/32,64,
 ( ((16 +69)&255) | (((0)&3)<<8) | (((0)&1)<<10) | (((0)&1)<<11) | (((0)&1)<<12) | (((0)&8)<<10)| (((1)&3)<<14) ), ( ((24 +65)&511) | (((1)&1)<<12) | (((1)&1)<<13) | (((0)&3)<<14) ), ( ((512/32 +128/32 +64/32 +64/32 +256/32 +256/32 +64/32)&0x3FF) | (((0)&15)<<12) | (((0)&3)<<10) )};

const struct regObj STARTbuttonObj={STARTbuttonTiles,4,512/32 +128/32 +64/32 +64/32 +256/32 +256/32 +64/32 +64/32,32,
 ( ((16 +35)&255) | (((0)&3)<<8) | (((0)&1)<<10) | (((0)&1)<<11) | (((0)&1)<<12) | (((0)&8)<<10)| (((0)&3)<<14) ), ( ((24 +92)&511) | (((0)&1)<<12) | (((0)&1)<<13) | (((0)&3)<<14) ), ( ((512/32 +128/32 +64/32 +64/32 +256/32 +256/32 +64/32 +64/32)&0x3FF) | (((0)&15)<<12) | (((0)&3)<<10) )};

const struct regObj LtriggerObj={LtriggerTiles,4,512/32 +128/32 +64/32 +64/32 +256/32 +256/32 +64/32 +64/32 +32/32,256,
 ( ((16 +4)&255) | (((0)&3)<<8) | (((0)&1)<<10) | (((0)&1)<<11) | (((0)&1)<<12) | (((0)&8)<<10)| (((1)&3)<<14) ), ( ((24 +31)&511) | (((0)&1)<<12) | (((0)&1)<<13) | (((2)&3)<<14) ), ( ((512/32 +128/32 +64/32 +64/32 +256/32 +256/32 +64/32 +64/32 +32/32)&0x3FF) | (((0)&15)<<12) | (((1)&3)<<10) )};

const struct regObj RtriggerObj={RtriggerTiles,4,512/32 +128/32 +64/32 +64/32 +256/32 +256/32 +64/32 +64/32 +32/32 +256/32,256,
 ( ((16 +4)&255) | (((0)&3)<<8) | (((0)&1)<<10) | (((0)&1)<<11) | (((0)&1)<<12) | (((0)&8)<<10)| (((1)&3)<<14) ), ( ((24 +140)&511) | (((0)&1)<<12) | (((0)&1)<<13) | (((2)&3)<<14) ), ( ((512/32 +128/32 +64/32 +64/32 +256/32 +256/32 +64/32 +64/32 +32/32 +256/32)&0x3FF) | (((0)&15)<<12) | (((1)&3)<<10) )};

const struct regObj dStickObj={dStickTiles,4,512/32 +128/32 +64/32 +64/32 +256/32 +256/32 +64/32 +64/32 +32/32 +256/32 +256/32,512,
 ( ((16 +28)&255) | (((0)&3)<<8) | (((0)&1)<<10) | (((0)&1)<<11) | (((0)&1)<<12) | (((0)&8)<<10)| (((0)&3)<<14) ), ( ((24 +35)&511) | (((0)&1)<<12) | (((0)&1)<<13) | (((2)&3)<<14) ), ( ((512/32 +128/32 +64/32 +64/32 +256/32 +256/32 +64/32 +64/32 +32/32 +256/32 +256/32)&0x3FF) | (((0)&15)<<12) | (((0)&3)<<10) )};

const struct regObj cStickObj={cStickTiles,4,512/32 +128/32 +64/32 +64/32 +256/32 +256/32 +64/32 +64/32 +32/32 +256/32 +256/32 +512/32,128,
 ( ((16 +66)&255) | (((0)&3)<<8) | (((0)&1)<<10) | (((0)&1)<<11) | (((0)&1)<<12) | (((0)&8)<<10)| (((0)&3)<<14) ), ( ((24 +114)&511) | (((0)&1)<<12) | (((0)&1)<<13) | (((1)&3)<<14) ), ( ((512/32 +128/32 +64/32 +64/32 +256/32 +256/32 +64/32 +64/32 +32/32 +256/32 +256/32 +512/32)&0x3FF) | (((0)&15)<<12) | (((0)&3)<<10) )};

const struct regObj spriteObjs[14]={
 AbuttonObj,
 BbuttonObj,
 XbuttonObj,
 YbuttonObj,
 ZbuttonObj,
 dPadUObj,
 dPadDObj,
 dPadLObj,
 dPadRObj,
 STARTbuttonObj,
 dStickObj,
 cStickObj,
 LtriggerObj,
 RtriggerObj};


__attribute__((section(".ewram"), long_call)) void controlStateEntry(){

 *(vu32*)(0x04000000 +0x0000)|=0x0800;

 memcpy256(&( (CHARBLOCK*)0x06000000)[3],gccTiles,4256);
 memcpy256(&( (CHARBLOCK*)0x06000000)[2],gccMap,2048);

 *(vu16*)(0x04000000 +0x000E)=((3)<<2)|((16)<<8);
 *(vu16*)(0x04000000 +0x001C)=(-24);
 *(vu16*)(0x04000000 +0x001E)=(-16);

 for (int i=0;i<14;i++){
  init_regObj(&spriteObjs[i],i);
 }
 memcpy256(&( (CHARBLOCK*)0x06000000)[4][512/32 +128/32 +64/32 +64/32 +256/32],ZbuttonPressedTiles,256);

 *(vu16*)(0x04000000 +0x0004)=(*(vu16*)(0x04000000 +0x0004)&(~0xFF00))|(((20)<<8)|0x0020);
 return;
}
__attribute__((section(".ewram"), long_call)) void controlStateProcess(){
 u16 GCCbuttons=controllerState.buttons;
 (((OBJ_ATTR*)0x07000000)[0].attr2 = ((((OBJ_ATTR*)0x07000000)[0].attr2)&~0xF000) | ( (((GCCbuttons&0x0001)!=0)<<12) & 0xF000 ) );
 (((OBJ_ATTR*)0x07000000)[1].attr2 = ((((OBJ_ATTR*)0x07000000)[1].attr2)&~0xF000) | ( (((GCCbuttons&0x0002)!=0)<<12) & 0xF000 ) );
 (((OBJ_ATTR*)0x07000000)[2].attr2 = ((((OBJ_ATTR*)0x07000000)[2].attr2)&~0xF000) | ( (((GCCbuttons&0x0004)!=0)<<12) & 0xF000 ) );
 (((OBJ_ATTR*)0x07000000)[3].attr2 = ((((OBJ_ATTR*)0x07000000)[3].attr2)&~0xF000) | ( (((GCCbuttons&0x0008)!=0)<<12) & 0xF000 ) );
 (((OBJ_ATTR*)0x07000000)[4].attr2 = ((((OBJ_ATTR*)0x07000000)[4].attr2)&~0xF000) | ( (((GCCbuttons&0x1000)!=0)<<12) & 0xF000 ) );
 (((OBJ_ATTR*)0x07000000)[5].attr2 = ((((OBJ_ATTR*)0x07000000)[5].attr2)&~0xF000) | ( (((GCCbuttons&0x0800)!=0)<<12) & 0xF000 ) );
 (((OBJ_ATTR*)0x07000000)[6].attr2 = ((((OBJ_ATTR*)0x07000000)[6].attr2)&~0xF000) | ( (((GCCbuttons&0x0400)!=0)<<12) & 0xF000 ) );
 (((OBJ_ATTR*)0x07000000)[7].attr2 = ((((OBJ_ATTR*)0x07000000)[7].attr2)&~0xF000) | ( (((GCCbuttons&0x0100)!=0)<<12) & 0xF000 ) );
 (((OBJ_ATTR*)0x07000000)[8].attr2 = ((((OBJ_ATTR*)0x07000000)[8].attr2)&~0xF000) | ( (((GCCbuttons&0x0200)!=0)<<12) & 0xF000 ) );
 (((OBJ_ATTR*)0x07000000)[9].attr2 = ((((OBJ_ATTR*)0x07000000)[9].attr2)&~0xF000) | ( (((GCCbuttons&0x0010)!=0)<<12) & 0xF000 ) );
 (((OBJ_ATTR*)0x07000000)[12].attr2 = ((((OBJ_ATTR*)0x07000000)[12].attr2)&~0xF000) | ( (((GCCbuttons&0x4000)!=0)<<12) & 0xF000 ) );
 (((OBJ_ATTR*)0x07000000)[13].attr2 = ((((OBJ_ATTR*)0x07000000)[13].attr2)&~0xF000) | ( (((GCCbuttons&0x2000)!=0)<<12) & 0xF000 ) );
 (((OBJ_ATTR*)0x07000000)[4].attr2 = ((((OBJ_ATTR*)0x07000000)[4].attr2)&~0x03FF) | ( ((((GCCbuttons&0x1000)!=0)?512/32 +128/32 +64/32 +64/32 +256/32:512/32 +128/32 +64/32 +64/32)<<0) & 0x03FF ) );

 u16 triggerPress=(u16)controllerState.Ltrig;
 u16 t40=(triggerPress<<5)+(triggerPress<<3)+512;
 (((OBJ_ATTR*)0x07000000)[12].attr0 = ((((OBJ_ATTR*)0x07000000)[12].attr0)&~0x00FF) | ( (((t40>>10)+16 +4)<<0) & 0x00FF ) );

 triggerPress=(u16)controllerState.Rtrig;
 t40=(triggerPress<<5)+(triggerPress<<3)+512;
 (((OBJ_ATTR*)0x07000000)[13].attr0 = ((((OBJ_ATTR*)0x07000000)[13].attr0)&~0x00FF) | ( (((t40>>10)+16 +4)<<0) & 0x00FF ) );


 u16 stickTilt=(u16)controllerState.dStickX;
 u16 t16=stickTilt<<4;
 u16 t48=(t16<<1)+t16+512;
 (((OBJ_ATTR*)0x07000000)[10].attr1 = ((((OBJ_ATTR*)0x07000000)[10].attr1)&~0x01FF) | ( (((t48>>10)+24 +35 -6)<<0) & 0x01FF ) );

 stickTilt=(u16)controllerState.dStickY;
 t16=stickTilt<<4;
 t48=(t16<<1)+t16+512;
 (((OBJ_ATTR*)0x07000000)[10].attr0 = ((((OBJ_ATTR*)0x07000000)[10].attr0)&~0x00FF) | ( ((-(t48>>10)+16 +28 +6)<<0) & 0x00FF ) );

 stickTilt=(u16)controllerState.cStickX;
 t16=stickTilt<<4;
 t48=(t16<<1)+t16+512;
 (((OBJ_ATTR*)0x07000000)[11].attr1 = ((((OBJ_ATTR*)0x07000000)[11].attr1)&~0x01FF) | ( (((t48>>10)+24 +114 -6)<<0) & 0x01FF ) );

 stickTilt=(u16)controllerState.cStickY;
 t16=stickTilt<<4;
 t48=(t16<<1)+t16+512;
 (((OBJ_ATTR*)0x07000000)[11].attr0 = ((((OBJ_ATTR*)0x07000000)[11].attr0)&~0x00FF) | ( ((-(t48>>10)+16 +66 +6)<<0) & 0x00FF ) );

 processInput(1);

 *(vu16*)(0x04000000 +0x0200)|=(0x0004);
 IntrWait(0,(u32)0x0004);
 processInput(0);
 *(vu16*)(0x04000000 +0x0200)&=(~0x0004);
 return;
}

__attribute__((section(".ewram"), long_call)) void controlStateExit(){
 return;
}
