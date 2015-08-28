//
//  CMKOrderedDictionary.h
//  CMKOrderedDictionary
//
//  Adapted from https://github.com/nicklockwood/OrderedDictionary

#import <Foundation/Foundation.h>

/**
 * Ordered subclass of NSDictionary.
 * Supports all the same methods as NSDictionary, plus a few
 * new methods for operating on entities by index rather than key.
 */
@interface CMKOrderedDictionary : NSDictionary {
 @protected
  NSArray *_values;
  NSOrderedSet *_keys;
}

+ (instancetype)dictionaryWithContentsOfFile:(NSString *)path;
+ (instancetype)dictionaryWithContentsOfURL:(NSURL *)url;

/** Returns the nth key in the dictionary. */
- (id)keyAtIndex:(NSUInteger)index;
/** Returns the nth object in the dictionary. */
- (id)objectAtIndex:(NSUInteger)index;
- (id)objectAtIndexedSubscript:(NSUInteger)index;
/** Returns the index of the specified key, or NSNotFound if key is not found. */
- (NSUInteger)indexOfKey:(id)key;
/** Returns an enumerator for backwards traversal of the dictionary keys. */
- (NSEnumerator *)reverseKeyEnumerator;
/** Returns an enumerator for backwards traversal of the dictionary objects. */
- (NSEnumerator *)reverseObjectEnumerator;
/** Enumerates keys ands objects with index using block. */
- (void)enumerateKeysAndObjectsWithIndexUsingBlock:(void (^)(id key, id obj, NSUInteger idx, BOOL *stop))block;

@end