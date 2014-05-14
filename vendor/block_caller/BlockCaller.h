#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

typedef void (^RubyBlock)(NSString *text);

@protocol RubyService <NSObject>

- (RubyBlock)getBlock;

@end

@interface BlockCaller : NSObject

- (void)callBlockOn:(id <RubyService>)rubyService;

@end

