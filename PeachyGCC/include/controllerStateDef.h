#define Apress 0x0001
#define Bpress 0x0002
#define Xpress 0x0004
#define Ypress 0x0008
#define STARTpress 0x0010
#define LFTpress 0x0100
#define RHTpress 0x0200
#define DWNpress 0x0400
#define UPpress 0x0800
#define Zpress 0x1000
#define Rpress 0x2000
#define Lpress 0x4000

struct ctrlState{
	u16 buttons;	//15=0,14=L,13=R,12=Z,11=up,10=down,9=right,8=left,7=0,6=0,5=0,4=start,3=y,2=x,1=b,0=a
	u8 dStickX;
	u8 dStickY;
	u8 cStickX;
	u8 cStickY;
	u8 Ltrig;
	u8 Rtrig;
};