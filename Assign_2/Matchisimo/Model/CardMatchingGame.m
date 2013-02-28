//
//  CardMatchingGame.m
//  Matchisimo
//
//  Created by Hillary Parham on 2/12/13.
//  Copyright (c) 2013 HJPCreations. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (strong, nonatomic) NSMutableArray *cards;
@end

@implementation CardMatchingGame

- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (id)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (!card) {
                self = nil;
            } else {
                self.cards[i] = card;
            }
        }
    }
    
    return self;
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < self.cards.count) ? self.cards[index] : nil;
}

#define MATCH_BONUS 2
#define MISMATCH_PENALTY 2
#define FLIP_COST 1

- (void)flipCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    int thisFlipScore = 0;
    self.flipState = nil;
    
    if (!card.isUnplayable) {
        if (!card.isFaceUp) {
            //see if flipping this card up creates a match
            for (Card *otherCard in self.cards) {
                if (otherCard.isFaceUp && !otherCard.isUnplayable) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        otherCard.unplayable = YES;
                        card.unplayable = YES;
                        thisFlipScore = matchScore * MATCH_BONUS;
                        self.score += thisFlipScore;
                        self.flipState = [NSString stringWithFormat:@"Matched %@ & %@ for %d points", otherCard.contents, card.contents,thisFlipScore];
                    } else {
                        otherCard.faceUp = NO;
                        self.score -= MISMATCH_PENALTY;
                        self.flipState = [NSString stringWithFormat:@"%@ and %@ don't match! 2 point penalty!", otherCard.contents, card.contents];
                    }
                    break;
                }
            }
            self.score -= FLIP_COST;
        }
        if (!self.flipState && !card.isFaceUp) {
            self.flipState = [NSString stringWithFormat:@"Flipped up %@", card.contents];
            NSLog(@"Flipped up %@", card.contents);
        } else if (!self.flipState && card.isFaceUp) {
            self.flipState = [NSString stringWithFormat:@"Flipped down %@", card.contents];
        }
        card.faceUp = !card.isFaceUp;
    }
}


@end
