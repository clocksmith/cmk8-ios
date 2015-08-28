//
//  CMKOrderedDictionary.m
//  CMKOrderedDictionary
//
//  Adapted from https://github.com/nicklockwood/OrderedDictionary

#import "CMKMutableOrderedDictionary.h"

#pragma GCC diagnostic ignored "-Wobjc-missing-property-synthesis"
#pragma GCC diagnostic ignored "-Wdirect-ivar-access"
#pragma GCC diagnostic ignored "-Wgnu"

@implementation CMKMutableOrderedDictionary

#define _mutableValues ((NSMutableArray *)_values)
#define _mutableKeys ((NSMutableOrderedSet *)_keys)

+ (instancetype)dictionaryWithCapacity:(NSUInteger)count {
  return [(CMKMutableOrderedDictionary *)[super alloc] initWithCapacity:count];
}

- (instancetype)initWithObjects:(const __unsafe_unretained id[])objects
                        forKeys:(const __unsafe_unretained id<NSCopying>[])keys
                          count:(NSUInteger)count {
  if ((self = [super init])) {
    _values = [[NSMutableArray alloc] initWithObjects:objects count:count];
    _keys = [[NSMutableOrderedSet alloc] initWithObjects:keys count:count];
  }
  return self;
}

- (id)initWithCapacity:(NSUInteger)capacity {
  if ((self = [super init])) {
    _values = [[NSMutableArray alloc] initWithCapacity:capacity];
    _keys = [[NSMutableOrderedSet alloc] initWithCapacity:capacity];
  }
  return self;
}

- (id)init {
  return [self initWithCapacity:0];
}

- (instancetype)initWithCoder:(NSCoder *)decoder {
  if ((self = [super init])) {
    _values = [decoder decodeObjectOfClass:[NSMutableArray class] forKey:@"values"];
    _keys = [decoder decodeObjectOfClass:[NSMutableOrderedSet class] forKey:@"keys"];
  }
  return self;
}

- (id)copyWithZone:(NSZone *)zone {
  return [[CMKOrderedDictionary allocWithZone:zone] initWithDictionary:self];
}

- (void)addEntriesFromDictionary:(NSDictionary *)otherDictionary {
  [otherDictionary enumerateKeysAndObjectsUsingBlock:^(id key, id obj, __unused BOOL *stop) {
    [self setObject:obj forKey:key];
  }];
}

- (void)insertObject:(id)object forKey:(id)key atIndex:(NSUInteger)index {
  [self removeObjectForKey:key];
  [_mutableKeys insertObject:key atIndex:index];
  [_mutableValues insertObject:object atIndex:index];
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)object {
  _mutableValues[index] = object;
}

- (void)setObject:(id)object atIndexedSubscript:(NSUInteger)index {
  _mutableValues[index] = object;
}

- (void)exchangeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2 {
  [_mutableKeys exchangeObjectAtIndex:idx1 withObjectAtIndex:idx2];
  [_mutableValues exchangeObjectAtIndex:idx1 withObjectAtIndex:idx2];
}

- (void)removeAllObjects {
  [_mutableKeys removeAllObjects];
  [_mutableValues removeAllObjects];
}

- (void)removeObjectAtIndex:(NSUInteger)index {
  [_mutableKeys removeObjectAtIndex:index];
  [_mutableValues removeObjectAtIndex:index];
}

- (void)removeObjectForKey:(id)key {
  NSUInteger index = [self->_keys indexOfObject:key];
  if (index != NSNotFound) {
    [self removeObjectAtIndex:index];
  }
}

- (void)removeObjectsForKeys:(NSArray *)keyArray {
  for (id key in [keyArray copy]) {
    [self removeObjectForKey:key];
  }
}

- (void)setDictionary:(NSDictionary *)otherDictionary {
  [_mutableKeys removeAllObjects];
  [_mutableKeys addObjectsFromArray:[otherDictionary allKeys]];
  [_mutableValues setArray:[otherDictionary allValues]];
}

- (void)setObject:(id)object forKey:(id)key {
  NSUInteger index = [_keys indexOfObject:key];
  if (index != NSNotFound) {
    _mutableValues[index] = object;
  } else {
    [_mutableKeys addObject:key];
    [_mutableValues addObject:object];
  }
}

- (void)setValue:(id)value forKey:(NSString *)key {
  if (value) {
    [self setObject:value forKey:key];
  } else {
    [self removeObjectForKey:key];
  }
}

- (void)setObject:(id)object forKeyedSubscript:(id<NSCopying>)key {
  [self setObject:object forKey:key];
}

@end
