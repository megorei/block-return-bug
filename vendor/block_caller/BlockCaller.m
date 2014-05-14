#import "BlockCaller.h"

@implementation BlockCaller

- (void)callBlockOn:(id <RubyService>)rubyService {
  RubyBlock rubyBlock = [rubyService getBlock];
  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    rubyBlock(@"Hello From Objective C");
  });  
}

@end