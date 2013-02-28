//
//  PlayingCard.h
//  Matchisimo
//
//  Created by Hillary Parham on 2/9/13.
//  Copyright (c) 2013 HJPCreations. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;

@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger) maxRank;

@end
