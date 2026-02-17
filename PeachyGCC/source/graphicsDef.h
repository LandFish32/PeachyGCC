#include <tonc.h>

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

INLINE void init_regObj(const struct regObj* obj,const int OAM_INDEX){				//Initializes a regular object in OAM
	memcpy256(&tile_mem[obj->charBlock][obj->tileIndex],obj->tileData,obj->tileLen);
	obj_set_attr(&oam_mem[OAM_INDEX],
		obj->ATTR0,
		obj->ATTR1,
		obj->ATTR2);
	return;
}