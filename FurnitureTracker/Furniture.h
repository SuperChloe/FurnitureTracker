//
//  Furniture.h
//  FurnitureTracker
//
//  Created by Chloe on 2016-02-07.
//  Copyright © 2016 Chloe Horgan. All rights reserved.
//

#import <Realm/Realm.h>
@class Room;

@interface Furniture : RLMObject

@property NSString *name;

@property Room *room;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<Furniture>
RLM_ARRAY_TYPE(Furniture)
