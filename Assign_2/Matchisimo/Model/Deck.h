//
//  Deck.h
//  Matchisimo
//
//  Created by Hillary Parham on 2/8/13.
//  Copyright (c) 2013 HJPCreations. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL) atTop;

- (Card *)drawRandomCard;
@end
