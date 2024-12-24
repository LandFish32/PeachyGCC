#include <tonc.h>

#include "GCCgfx.h"
#include "inputDefs.h"
#include "memcpy256.h"
#include "controlLogic.h"

EWRAM_CODE void controlStateEntry(){			//Initialize background and all sprite objects in scene

	REG_DISPCNT|=DCNT_BG3;
	
	memcpy256(&tile_mem[3],gccTiles,gccTilesLen);
	memcpy256(&tile_mem[2],gccMap,gccMapLen);

	REG_BG3CNT=BG_CBB(3)|BG_SBB(16);
	REG_BG3HOFS=(-controllerXoffs);
	REG_BG3VOFS=(-controllerYoffs);

	for (int i=0;i<14;i++){
		init_regObj(&spriteObjs[i],i);
	}
	memcpy256(&tile_mem[4][ZpressedTileIndex],ZbuttonPressedTiles,ZbuttonPressedTilesLen);

	REG_DISPSTAT=(REG_DISPSTAT&(~DSTAT_VCT_MASK))|DSTAT_VCT(20)|DSTAT_VCT_IRQ;	//Allow vCount IRQs, set vCount trigger value to 20
	return;
}
EWRAM_CODE void controlStateProcess(){
	u16 GCCbuttons=controllerState.buttons;
	BFN_SET(oam_mem[0].attr2,(GCCbuttons&Apress)!=0,ATTR2_PALBANK);			//Sets sprite to darker palette bank (palBank 1) if the corresponding button is pressed
	BFN_SET(oam_mem[1].attr2,(GCCbuttons&Bpress)!=0,ATTR2_PALBANK);
	BFN_SET(oam_mem[2].attr2,(GCCbuttons&Xpress)!=0,ATTR2_PALBANK);
	BFN_SET(oam_mem[3].attr2,(GCCbuttons&Ypress)!=0,ATTR2_PALBANK);
	BFN_SET(oam_mem[4].attr2,(GCCbuttons&Zpress)!=0,ATTR2_PALBANK);
	BFN_SET(oam_mem[5].attr2,(GCCbuttons&UPpress)!=0,ATTR2_PALBANK);
	BFN_SET(oam_mem[6].attr2,(GCCbuttons&DWNpress)!=0,ATTR2_PALBANK);
	BFN_SET(oam_mem[7].attr2,(GCCbuttons&LFTpress)!=0,ATTR2_PALBANK);
	BFN_SET(oam_mem[8].attr2,(GCCbuttons&RHTpress)!=0,ATTR2_PALBANK);
	BFN_SET(oam_mem[9].attr2,(GCCbuttons&STARTpress)!=0,ATTR2_PALBANK);
	BFN_SET(oam_mem[12].attr2,(GCCbuttons&Lpress)!=0,ATTR2_PALBANK);
	BFN_SET(oam_mem[13].attr2,(GCCbuttons&Rpress)!=0,ATTR2_PALBANK);
	BFN_SET(oam_mem[4].attr2,((GCCbuttons&Zpress)!=0)?ZpressedTileIndex:ZunpressedTileIndex,ATTR2_ID);
	
	u16 triggerPress=(u16)controllerState.Ltrig;
	u16 t40=(triggerPress<<5)+(triggerPress<<3)+512;				// 40/1024 ~= 255/25.5, giving us a Y offset from 0 to 10 for our triggers
	BFN_SET(oam_mem[12].attr0,(t40>>10)+triggerYoffs,ATTR0_Y);
	
	triggerPress=(u16)controllerState.Rtrig;
	t40=(triggerPress<<5)+(triggerPress<<3)+512;
	BFN_SET(oam_mem[13].attr0,(t40>>10)+triggerYoffs,ATTR0_Y);
	

	u16 stickTilt=(u16)controllerState.dStickX;						// 48/1024~=1/21.25
	u16 t16=stickTilt<<4;
	u16 t48=(t16<<1)+t16+512;
	BFN_SET(oam_mem[10].attr1,(t48>>10)+dStickXoffs-6,ATTR1_X);
	
	stickTilt=(u16)controllerState.dStickY;
	t16=stickTilt<<4;
	t48=(t16<<1)+t16+512;
	BFN_SET(oam_mem[10].attr0,-(t48>>10)+dStickYoffs+6,ATTR0_Y);
	
	stickTilt=(u16)controllerState.cStickX;
	t16=stickTilt<<4;
	t48=(t16<<1)+t16+512;
	BFN_SET(oam_mem[11].attr1,(t48>>10)+cStickXoffs-6,ATTR1_X);
	
	stickTilt=(u16)controllerState.cStickY;
	t16=stickTilt<<4;
	t48=(t16<<1)+t16+512;
	BFN_SET(oam_mem[11].attr0,-(t48>>10)+cStickYoffs+6,ATTR0_Y);
	
	
	processInput(1);
	
	REG_IE|=(IRQ_VCOUNT);			//Set vCount IRQ in REG_IE
	IntrWait(0,(u32)IRQ_VCOUNT);
	processInput(0);				//Process input twice per frame
	REG_IE&=(~IRQ_VCOUNT);			//Unset vCount IRQ in REG_IE after processing input again
	return;
}

EWRAM_CODE void controlStateExit(){
	return;
}
