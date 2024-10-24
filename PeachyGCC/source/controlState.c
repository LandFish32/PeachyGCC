#include <tonc.h>

#include "GCCgfx.h"
#include "controllerStateDef.h"

extern void processInput(int newFrame);
extern void memcpy256(const void *dest,const void *src,const u32 len);
extern struct ctrlState controllerState;
extern void stupidFunc();

const struct regObj AbuttonObj={AbuttonTiles,4,AbuttonTileIndex,AbuttonTilesLen,
	ATTR0_BUILD(AbuttonYoffs,0,0,0,0,0,0), ATTR1_BUILDR(AbuttonXoffs,2,0,0), ATTR2_BUILD(AbuttonTileIndex,0,0)};

const struct regObj BbuttonObj={BbuttonTiles,4,BbuttonTileIndex,BbuttonTilesLen,
	ATTR0_BUILD(BbuttonYoffs,0,0,0,0,0,0), ATTR1_BUILDR(BbuttonXoffs,1,0,0), ATTR2_BUILD(BbuttonTileIndex,0,0)};

const struct regObj XbuttonObj={XbuttonTiles,4,XbuttonTileIndex,XbuttonTilesLen,
	ATTR0_BUILD(XbuttonYoffs,2,0,0,0,0,0), ATTR1_BUILDR(XbuttonXoffs,0,0,0), ATTR2_BUILD(XbuttonTileIndex,0,0)};
	
const struct regObj YbuttonObj={YbuttonTiles,4,YbuttonTileIndex,YbuttonTilesLen,
	ATTR0_BUILD(YbuttonYoffs,1,0,0,0,0,0), ATTR1_BUILDR(YbuttonXoffs,0,0,0), ATTR2_BUILD(YbuttonTileIndex,0,0)};

const struct regObj ZbuttonObj={ZbuttonUnpressedTiles,4,ZunpressedTileIndex,ZbuttonUnpressedTilesLen,
	ATTR0_BUILD(ZbuttonYoffs,1,0,0,0,0,0), ATTR1_BUILDR(ZbuttonXoffs,2,0,0), ATTR2_BUILD(ZunpressedTileIndex,0,0)};

const struct regObj dPadUObj={dPadUDTiles,4,dPadUDTileIndex,dPadUDTilesLen,
	ATTR0_BUILD(dPadUYoffs,2,0,0,0,0,0), ATTR1_BUILDR(dPadUXoffs,0,0,0), ATTR2_BUILD(dPadUDTileIndex,0,0)};

const struct regObj dPadDObj={dPadUDTiles,4,dPadUDTileIndex,dPadUDTilesLen,
	ATTR0_BUILD(dPadDYoffs,2,0,0,0,0,0), ATTR1_BUILDR(dPadDXoffs,0,1,1), ATTR2_BUILD(dPadUDTileIndex,0,0)};

const struct regObj dPadLObj={dPadLRTiles,4,dPadLRTileIndex,dPadLRTilesLen,
	ATTR0_BUILD(dPadLYoffs,1,0,0,0,0,0), ATTR1_BUILDR(dPadLXoffs,0,0,0), ATTR2_BUILD(dPadLRTileIndex,0,0)};

const struct regObj dPadRObj={dPadLRTiles,4,dPadLRTileIndex,dPadLRTilesLen,
	ATTR0_BUILD(dPadRYoffs,1,0,0,0,0,0), ATTR1_BUILDR(dPadRXoffs,0,1,1), ATTR2_BUILD(dPadLRTileIndex,0,0)};

const struct regObj STARTbuttonObj={STARTbuttonTiles,4,STARTbuttonTileIndex,STARTbuttonTilesLen,
	ATTR0_BUILD(STARTbuttonYoffs,0,0,0,0,0,0), ATTR1_BUILDR(STARTbuttonXoffs,0,0,0), ATTR2_BUILD(STARTbuttonTileIndex,0,0)};

const struct regObj LtriggerObj={LtriggerTiles,4,LtriggerTileIndex,LtriggerTilesLen,
	ATTR0_BUILD(triggerYoffs,1,0,0,0,0,0), ATTR1_BUILDR(LtriggerXoffs,2,0,0), ATTR2_BUILD(LtriggerTileIndex,0,1)};

const struct regObj RtriggerObj={RtriggerTiles,4,RtriggerTileIndex,RtriggerTilesLen,
	ATTR0_BUILD(triggerYoffs,1,0,0,0,0,0), ATTR1_BUILDR(RtriggerXoffs,2,0,0), ATTR2_BUILD(RtriggerTileIndex,0,1)};

const struct regObj dStickObj={dStickTiles,4,dStickTileIndex,dStickTilesLen,
	ATTR0_BUILD(dStickYoffs,0,0,0,0,0,0), ATTR1_BUILDR(dStickXoffs,2,0,0), ATTR2_BUILD(dStickTileIndex,0,0)};

const struct regObj cStickObj={cStickTiles,4,cStickTileIndex,cStickTilesLen,
	ATTR0_BUILD(cStickYoffs,0,0,0,0,0,0), ATTR1_BUILDR(cStickXoffs,1,0,0), ATTR2_BUILD(cStickTileIndex,0,0)};

const struct regObj spriteObjs[14]={	//Directional stick sprite must come before L trigger sprite, or weird stuff will happen when they overlap.
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

	REG_DISPSTAT=(REG_DISPSTAT&(~DSTAT_VCT_MASK))|(DSTAT_VCT(20)|DSTAT_VCT_IRQ);	//Set vCount IRQ, set vCount trigger value to 20
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
	

	u16 stickTilt=(u16)controllerState.dStickX;					//48/1024~=1/21.25
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
	
	REG_IE|=(IRQ_VCOUNT);		//Set vCount IRQ in REG_IE
	IntrWait(0,(u32)IRQ_VCOUNT);
	processInput(0);					//Process input twice per frame
	REG_IE&=(~IRQ_VCOUNT);		//Unset vCount IRQ in REG_IE after processing input again
	return;
}

EWRAM_CODE void controlStateExit(){
	return;
}
