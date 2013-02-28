//
//  Card.h
//  Matchisimo
//
//  Created by Hillary Parham on 2/8/13.
//  Copyright (c) 2013 HJPCreations. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter = isFaceUp) BOOL faceUp;

@property (nonatomic, getter = isUnplayable) BOOL unplayable;

- (int)match:(NSArray *) otherCards;

@end
