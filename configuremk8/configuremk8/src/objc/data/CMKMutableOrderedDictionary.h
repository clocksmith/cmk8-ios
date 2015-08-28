//
//  CMKMutableOrderedDictionary.h
//  CMKMutableOrderedDictionary.h
//
//  Adapted from https://github.com/nicklockwood/OrderedDictionary

#import <Foundation/Foundation.h>
#import "CMKOrderedDictionary.h"

/**
 * Mutable subclass of OrderedDictionary.
 * Supports all the same methods as NSMutableDictionary, plus a few
 * new methods for operating on entities by index rather than key.
 * Note that although it has the same interface, MutableOrderedDictionary
 * is not a subclass of NSMutableDictionary, and cannot be used as one
 * without generating compiler warnings (unless you cast it).
 */
@interface CMKMutableOrderedDictionary : CMKOrderedDictionary

+ (instancetype)dictionaryWithCapacity:(NSUInteger)count;
- (instancetype)initWithCapacity:(NSUInteger)count;

- (void)addEntriesFromDictionary:(NSDictionary *)otherDictionary;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)key;
- (void)removeObjectsForKeys:(NSArray *)keyArray;
- (void)setDictionary:(NSDictionary *)otherDictionary;
- (void)setObject:(id)object forKey:(id)key;
- (void)setObject:(id)object forKeyedSubscript:(id<NSCopying>)key;

/** Inserts an object at a specific index in the dictionary. */
- (void)insertObject:(id)object forKey:(id)key atIndex:(NSUInteger)index;
/** Replace an object at a specific index in the dictionary. */
- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)object;
- (void)setObject:(id)object atIndexedSubscript:(NSUInteger)index;
/** Swap the indexes of two key/value pairs in the dictionary. */
- (void)exchangeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2;
/** Removes the nth object in the dictionary. */
- (void)removeObjectAtIndex:(NSUInteger)index;

@end