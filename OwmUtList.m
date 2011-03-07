#import "OwmUtList.h"
#import <stdlib.h>
@implementation OwmUtList

-init
{
	_first	=
	_end	=
	_cursor = NULL;
}

-add :(id)item
{
	OwmUtListRec* rec = NULL; 
	
	if (NULL == (rec = (OwmUtListRec*)malloc(sizeof(OwmUtListRec)))) {
		return NULL;
	}
	
	rec->item = item;
	rec->prev =
	rec->next = NULL;
	if(NULL == _first) {
		// 初回
		_first = _end = rec;
		rec->next = NULL;
		rec->prev = NULL;
		_cursor = _first;
	}
	else {
		rec->prev = _end;
		_end->next = rec;
		_end->prev->next = rec;
		_end = rec;
	}
	return self;
}

-(id)get
{
	if(NULL != _cursor) {
		return _cursor->item;
	}
	return NULL;
}

-(id)next
{	
	if(NULL != _cursor) {
		_cursor = _cursor->next;
		return self;
	}
	return NULL;
}

-(id)reset
{
	_cursor = _first;
	return self;
}

-(id)first
{
	return _first->item;
}

@end
