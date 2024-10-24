#include "graphicsDef.h"

#include "Abutton.h"
#include "Bbutton.h"
#include "Xbutton.h"
#include "Ybutton.h"
#include "ZbuttonPressed.h"
#include "ZbuttonUnpressed.h"
#include "dStick.h"
#include "cStick.h"
#include "dPadLR.h"
#include "dPadUD.h"
#include "STARTbutton.h"
#include "LTrigger.h"
#include "RTrigger.h"
#include "gcc.h"

#define AbuttonTileIndex 0
#define BbuttonTileIndex AbuttonTilesLen/32
#define XbuttonTileIndex BbuttonTileIndex+BbuttonTilesLen/32
#define YbuttonTileIndex XbuttonTileIndex+XbuttonTilesLen/32
#define ZunpressedTileIndex YbuttonTileIndex+YbuttonTilesLen/32
#define ZpressedTileIndex ZunpressedTileIndex+ZbuttonUnpressedTilesLen/32
#define dPadUDTileIndex ZpressedTileIndex+ZbuttonPressedTilesLen/32
#define dPadLRTileIndex dPadUDTileIndex+dPadUDTilesLen/32
#define STARTbuttonTileIndex dPadLRTileIndex+dPadLRTilesLen/32
#define LtriggerTileIndex STARTbuttonTileIndex+STARTbuttonTilesLen/32
#define RtriggerTileIndex LtriggerTileIndex+LtriggerTilesLen/32
#define dStickTileIndex RtriggerTileIndex+RtriggerTilesLen/32
#define cStickTileIndex dStickTileIndex+dStickTilesLen/32

#define controllerXoffs 24
#define controllerYoffs	16

#define AbuttonXoffs controllerXoffs+134
#define AbuttonYoffs controllerYoffs+28

#define BbuttonXoffs controllerXoffs+123
#define BbuttonYoffs controllerYoffs+45

#define XbuttonXoffs controllerXoffs+159
#define XbuttonYoffs controllerYoffs+28

#define YbuttonXoffs controllerXoffs+133
#define YbuttonYoffs controllerYoffs+19

#define ZbuttonXoffs controllerXoffs+141
#define ZbuttonYoffs controllerYoffs+9

#define dPadUXoffs controllerXoffs+67
#define dPadUYoffs controllerYoffs+63

#define dPadDXoffs controllerXoffs+66
#define dPadDYoffs controllerYoffs+68

#define dPadLXoffs controllerXoffs+60
#define dPadLYoffs controllerYoffs+70

#define dPadRXoffs controllerXoffs+65
#define dPadRYoffs controllerYoffs+69

#define STARTbuttonXoffs controllerXoffs+92
#define STARTbuttonYoffs controllerYoffs+35

#define triggerYoffs controllerYoffs+4

#define LtriggerXoffs controllerXoffs+31
#define RtriggerXoffs controllerXoffs+140

#define dStickXoffs controllerXoffs+35
#define dStickYoffs controllerYoffs+28

#define cStickXoffs controllerXoffs+114
#define cStickYoffs controllerYoffs+66