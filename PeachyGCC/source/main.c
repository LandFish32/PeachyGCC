	#include <tonc.h>
	#include "palette.h"
	#include "controlLogic.h"
	#include "controlState.h"
	#include "memcpy256.h"
	#include "mainISR.h"

void (*currentProcess)()=&controlStateProcess;

void init(){
	REG_IME=0;
	REG_IE=IRQ_VBLANK|IRQ_SERIAL;
	REG_IF=0xffff;
	REG_ISR_MAIN=&ISRmain;
	REG_DISPSTAT=DSTAT_VBL_IRQ;
	REG_RCNT=R_MODE_GPIO|GPIO_IRQ|GPIO_SO_IO|GPIO_SO;
	REG_DISPCNT=DCNT_OBJ_1D|DCNT_OBJ;
	REG_IME=1;
	VBlankIntrWait();
	for (int i=0;i<128;i+=1){
		oam_mem[i].attr0=ATTR0_HIDE;
	}
	memcpy256((const void *)MEM_PAL_BG,palettePal,palettePalLen);
	memcpy256((const void *)MEM_PAL_OBJ,palettePal,palettePalLen);
	controlStateEntry();
	return;
}
int main(){
	init();
	while(1){
		(*currentProcess)();
	}
	return 0;	
}