#include "graphicsDef.h"
#include "GCCgfxConsts.h"

const struct regObj AbuttonObj={(const u32 *)AbuttonTiles,4,AbuttonTileIndex,AbuttonTilesLen,
	ATTR0_BUILD(AbuttonYoffs,0,0,0,0,0,0), ATTR1_BUILDR(AbuttonXoffs,2,0,0), ATTR2_BUILD(AbuttonTileIndex,0,0)};

const struct regObj BbuttonObj={(const u32 *)BbuttonTiles,4,BbuttonTileIndex,BbuttonTilesLen,
	ATTR0_BUILD(BbuttonYoffs,0,0,0,0,0,0), ATTR1_BUILDR(BbuttonXoffs,1,0,0), ATTR2_BUILD(BbuttonTileIndex,0,0)};

const struct regObj XbuttonObj={(const u32 *)XbuttonTiles,4,XbuttonTileIndex,XbuttonTilesLen,
	ATTR0_BUILD(XbuttonYoffs,2,0,0,0,0,0), ATTR1_BUILDR(XbuttonXoffs,0,0,0), ATTR2_BUILD(XbuttonTileIndex,0,0)};
	
const struct regObj YbuttonObj={(const u32 *)YbuttonTiles,4,YbuttonTileIndex,YbuttonTilesLen,
	ATTR0_BUILD(YbuttonYoffs,1,0,0,0,0,0), ATTR1_BUILDR(YbuttonXoffs,0,0,0), ATTR2_BUILD(YbuttonTileIndex,0,0)};

const struct regObj ZbuttonObj={(const u32 *)ZbuttonUnpressedTiles,4,ZunpressedTileIndex,ZbuttonUnpressedTilesLen,
	ATTR0_BUILD(ZbuttonYoffs,1,0,0,0,0,0), ATTR1_BUILDR(ZbuttonXoffs,2,0,0), ATTR2_BUILD(ZunpressedTileIndex,0,0)};

const struct regObj dPadUObj={(const u32 *)dPadUDTiles,4,dPadUDTileIndex,dPadUDTilesLen,
	ATTR0_BUILD(dPadUYoffs,2,0,0,0,0,0), ATTR1_BUILDR(dPadUXoffs,0,0,0), ATTR2_BUILD(dPadUDTileIndex,0,0)};

const struct regObj dPadDObj={(const u32 *)dPadUDTiles,4,dPadUDTileIndex,dPadUDTilesLen,
	ATTR0_BUILD(dPadDYoffs,2,0,0,0,0,0), ATTR1_BUILDR(dPadDXoffs,0,1,1), ATTR2_BUILD(dPadUDTileIndex,0,0)};

const struct regObj dPadLObj={(const u32 *)dPadLRTiles,4,dPadLRTileIndex,dPadLRTilesLen,
	ATTR0_BUILD(dPadLYoffs,1,0,0,0,0,0), ATTR1_BUILDR(dPadLXoffs,0,0,0), ATTR2_BUILD(dPadLRTileIndex,0,0)};

const struct regObj dPadRObj={(const u32 *)dPadLRTiles,4,dPadLRTileIndex,dPadLRTilesLen,
	ATTR0_BUILD(dPadRYoffs,1,0,0,0,0,0), ATTR1_BUILDR(dPadRXoffs,0,1,1), ATTR2_BUILD(dPadLRTileIndex,0,0)};

const struct regObj STARTbuttonObj={(const u32 *)STARTbuttonTiles,4,STARTbuttonTileIndex,STARTbuttonTilesLen,
	ATTR0_BUILD(STARTbuttonYoffs,0,0,0,0,0,0), ATTR1_BUILDR(STARTbuttonXoffs,0,0,0), ATTR2_BUILD(STARTbuttonTileIndex,0,0)};

const struct regObj LtriggerObj={(const u32 *)LtriggerTiles,4,LtriggerTileIndex,LtriggerTilesLen,
	ATTR0_BUILD(triggerYoffs,1,0,0,0,0,0), ATTR1_BUILDR(LtriggerXoffs,2,0,0), ATTR2_BUILD(LtriggerTileIndex,0,1)};

const struct regObj RtriggerObj={(const u32 *)RtriggerTiles,4,RtriggerTileIndex,RtriggerTilesLen,
	ATTR0_BUILD(triggerYoffs,1,0,0,0,0,0), ATTR1_BUILDR(RtriggerXoffs,2,0,0), ATTR2_BUILD(RtriggerTileIndex,0,1)};

const struct regObj dStickObj={(const u32 *)dStickTiles,4,dStickTileIndex,dStickTilesLen,
	ATTR0_BUILD(dStickYoffs,0,0,0,0,0,0), ATTR1_BUILDR(dStickXoffs,2,0,0), ATTR2_BUILD(dStickTileIndex,0,0)};

const struct regObj cStickObj={(const u32 *)cStickTiles,4,cStickTileIndex,cStickTilesLen,
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
	RtriggerObj
	};