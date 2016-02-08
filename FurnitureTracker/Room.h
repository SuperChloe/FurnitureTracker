//
//  Room.h
//  FurnitureTracker
//
//  Created by Chloe on 2016-02-07.
//  Copyright © 2016 Chloe Horgan. All rights reserved.
//

#import <Realm/Realm.h>
#import "Furniture.h"

@interface Room : RLMObject

@property NSString *name;

@property RLMArray<Furniture *><Furniture> *furniture;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<Room>
RLM_ARRAY_TYPE(Room)
