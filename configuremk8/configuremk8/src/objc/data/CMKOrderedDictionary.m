//
//  CMKOrderedDictionary.m
//  CMKOrderedDictionary
//
//  Adapted from https://github.com/nicklockwood/OrderedDictionary

#import "CMKOrderedDictionary.h"

#pragma GCC diagnostic ignored "-Wobjc-missing-property-synthesis"
#pragma GCC diagnostic ignored "-Wdirect-ivar-access"
#pragma GCC diagnostic ignored "-Wgnu"

@implementation CMKOrderedDictionary

+ (instancetype)dictionaryWithContentsOfFile:(NSString *)path {
  return [self dictionaryWithDictionary:[NSDictionary dictionaryWithContentsOfFile:path]];
}

+ (instancetype)dictionaryWithContentsOfURL:(NSURL *)url {
  return [self dictionaryWithDictionary:[NSDictionary dictionaryWithContentsOfURL:url]];
}

- (instancetype)initWithContentsOfFile:(NSString *)path {
  return [self initWithDictionary:[NSDictionary dictionaryWithContentsOfFile:path]];
}

- (instancetype)initWithContentsOfURL:(NSURL *)url {
  return [self initWithDictionary:[NSDictionary dictionaryWithContentsOfURL:url]];
}

- (instancetype)initWithObjects:(NSArray *)objects forKeys:(NSArray *)keys {
  if ((self = [super init])) {
    _values = [objects copy];
    _keys = [NSOrderedSet orderedSetWithArray:keys];

    NSParameterAssert([_keys count] == [_values count]);
  }
  return self;
}

- (instancetype)initWithObjects:(const __unsafe_unretained id[])objects
                        forKeys:(const __unsafe_unretained id<NSCopying>[])keys
                          count:(NSUInteger)count {
  if ((self = [super init])) {
    _values = [[NSArray alloc] initWithObjects:objects count:count];
    _keys = [[NSOrderedSet alloc] initWithObjects:keys count:count];

    NSParameterAssert([_values count] == count);
    NSParameterAssert([_keys count] == count);
  }
  return self;
}

- (Class)classForCoder {
  return [self class];
}

- (instancetype)initWithCoder:(NSCoder *)decoder {
  if ((self = [super init])) {
    _values = [decoder decodeObjectOfClass:[NSArray class] forKey:@"values"];
    _keys = [decoder decodeObjectOfClass:[NSOrderedSet class] forKey:@"keys"];
  }
  return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
  [coder encodeObject:_values forKey:@"values"];
  [coder encodeObject:_keys forKey:@"keys"];
}

- (instancetype)copyWithZone:(__unused NSZone *)zone {
  return self;
}

- (instancetype)mutableCopyWithZone:(NSZone *)zone {
  return [[CMKOrderedDictionary allocWithZone:zone] initWithDictionary:self];
}

- (NSArray *)allKeys {
  return [_keys array];
}

- (NSArray *)allValues {
  return [_values copy];
}

- (NSUInteger)count {
  return [_keys count];
}

- (NSUInteger)indexOfKey:(id)key {
  return [_keys indexOfObject:key];
}

- (id)objectForKey:(id)key {
  NSUInteger index = [_keys indexOfObject:key];
  if (index != NSNotFound) {
    return _values[index];
  }
  return nil;
}

- (NSEnumerator *)keyEnumerator {
  return [_keys objectEnumerator];
}

- (NSEnumerator *)reverseKeyEnumerator {
  return [_keys reverseObjectEnumerator];
}

- (NSEnumerator *)objectEnumerator {
  return [_values objectEnumerator];
}

- (NSEnumerator *)reverseObjectEnumerator {
  return [_values reverseObjectEnumerator];
}

- (void)enumerateKeysAndObjectsWithIndexUsingBlock:(void (^)(id key, id obj, NSUInteger idx, BOOL *stop))block {
  [_keys enumerateObjectsUsingBlock:^(id key, NSUInteger idx, BOOL *stop) {
    block(key, self->_values[idx], idx, stop);
  }];
}

- (id)keyAtIndex:(NSUInteger)index {
  return _keys[index];
}

- (id)objectAtIndex:(NSUInteger)index {
  return _values[index];
}

- (id)objectAtIndexedSubscript:(NSUInteger)index {
  return _values[index];
}

@end
