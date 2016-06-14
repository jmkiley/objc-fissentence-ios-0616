//
//  FISSentence.m
//  objc-fissentence
//
//  Created by Jordan Kiley on 6/10/16.
//  Copyright © 2016 The Flatiron School. All rights reserved.
//

#import "FISSentence.h"

@interface FISSentence ()

@property (strong, nonatomic, readwrite) NSString *sentence ;

- (void)assembleSentence ;
- (BOOL)validWord:(NSString *)word ;
- (BOOL)validPunctuation:(NSString *)punctuation ;
- (BOOL)validIndex:(NSUInteger)index ;


@end

@implementation FISSentence

- (void)assembleSentence { // Makes a sentence by putting spaces between the words in the array, then appending punctuation
    NSLog(@"asssemble sentence");
    if (self.punctuation == nil) {
        NSLog(@"nil nil");
        return ;
    } else {
        self.sentence = [[ self.words componentsJoinedByString:@" "] stringByAppendingFormat:@"%@", self.punctuation ];
    }
    NSLog(@"After: %@", self.sentence);
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    return YES;
}
//Private Methods

- (BOOL)validWord:(NSString *)word {
    if ( word == nil || [word isEqualToString:@""] || [word isEqualToString:@" "]) {
        return NO ;
    }
    else { return YES ;}
}

- (BOOL)validPunctuation:(NSString *)punctuation {
    NSString *acceptablePunctuation = @".,;:—?!";
//    if (![acceptablePunctuation containsString:punctuation] || punctuation == nil || punctuation == @"") {
        if ( ![acceptablePunctuation containsString:punctuation] || !([ punctuation length] > 0) ) {
            NSLog(@"0");
           return NO ;
    } else {
        return YES;
    }
    
}

- (BOOL)validIndex:(NSUInteger)index {
    if ( index >= [ self.words count] ) {
        return NO ; }
    else { return YES ;}
}

//Public Methods
- (void) addWord:(NSString *)word {
    // In addWord:, use the self keyword to add the word arguments towords property array (Hint: Use the addObject: method.). End the method implementation with a call to self of the privateassembleSentence method.
    if ( [ self validWord:word ] ) {
        [ self.words addObject:word ];
    }
    [ self assembleSentence ];
    NSLog(@"%@", self.words);
}

- (void)addWords:(NSArray *)words withPunctuation:(NSString *)punctuation {
    if (punctuation == nil  || ![self validPunctuation:punctuation]) {
        return;
    }
    else if ( words && ![ words isEqualToArray:@[] ] ) {
        for (NSString *word in words) {
            if ( [ self validWord:word] ){
            [ self.words addObject:word ];
            }
        }
        
        self.punctuation = punctuation ;
        [ self assembleSentence ];
    }
}

- (void)removeWordAtIndex:(NSUInteger)index {
    if ([ self validIndex:index] ) {
        [ self.words removeObjectAtIndex:index];

    } else {
        return ;
    }
            [ self assembleSentence ];
    
}

- (void)insertWord:(NSString *)word atIndex:(NSUInteger)index {
    if ( [ self validIndex:index] && [ self validWord:word] ) {
        [ self.words insertObject:word atIndex:index];
    }
    [self assembleSentence];
}

- (void)replacePunctuationWithPunctuation:(NSString *)punctuation {
    if ( [ self validPunctuation:punctuation]) {
        self.punctuation = punctuation ;
    }
    [ self assembleSentence ];
    
}

- (void)replaceWordAtIndex:(NSUInteger)index withWord:(NSString *)word {
    if ( [ self validWord:word] && [ self validIndex:index]) {
        [ self.words replaceObjectAtIndex:index withObject:word] ;
    }
    [ self assembleSentence];
}

@end
