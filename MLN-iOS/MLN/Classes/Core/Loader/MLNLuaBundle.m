//
//  MLNBundle.m
//  MLNCore
//
//  Created by MoMo on 2019/7/23.
//

#import "MLNLuaBundle.h"

@interface MLNLuaBundle ()

@property (nonatomic, strong) NSBundle *currentBundle;

@end

@implementation MLNLuaBundle

+ (instancetype)mainBundle
{
    return [[self alloc] initWithBundle:[NSBundle mainBundle]];
}

+ (instancetype)mainBundleWithPath:(NSString *)path
{
    NSString *bundlePath = [[[NSBundle  mainBundle] bundlePath] stringByAppendingPathComponent:path];
    NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
    return [[self alloc] initWithBundle:bundle];
}

+ (instancetype)bundleLibraryWithPath:(NSString *)path
{
    NSString *libraryDir = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
    NSString *bundlePath = [libraryDir stringByAppendingPathComponent:path];
    NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
    return [[self alloc] initWithBundle:bundle];
}

+ (instancetype)bundleDocumentsWithPath:(NSString *)path
{
    return [self bundleWithPath:path directory:NSDocumentDirectory];
}

+ (instancetype)bundleCachesWithPath:(NSString *)path
{
    return [self bundleWithPath:path directory:NSCachesDirectory];
}

+ (instancetype)bundleWithPath:(NSString *)path directory:(NSSearchPathDirectory)directory
{
    NSString *directorypPath = [NSSearchPathForDirectoriesInDomains(directory, NSUserDomainMask, YES) firstObject];
    NSString *bundlePath = [directorypPath stringByAppendingPathComponent:path];
    NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
    return [[self alloc] initWithBundle:bundle];;
}

- (instancetype)initWithBundlePath:(NSString *)bundlePath
{
    return [self initWithBundle:[NSBundle bundleWithPath:bundlePath]];
}

- (instancetype)initWithBundle:(NSBundle *)bundle
{
    if (self = [super init]) {
        _currentBundle = bundle;
    }
    return self;
}

- (NSString *)filePathWithName:(NSString *)name
{
    return [self.currentBundle pathForResource:name ofType:nil];
}

- (NSString *)bundlePath
{
    return self.currentBundle.bundlePath;
}

@end