###Sample Rubymotion Block Call Bug

Calling a Block which is returned from Ruby causes
EXC_BAD_ACCESS

```ruby
class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)


    BlockCaller.new.callBlockOn(RubyService.new)

    true
  end

  class RubyService
    def getBlock
      ->(text){ puts text }
    end  
  end  

end
```

```Objective-C
#import "BlockCaller.h"

@implementation BlockCaller

- (void)callBlockOn:(id <RubyService>)rubyService {
  RubyBlock rubyBlock = [rubyService getBlock];
  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    rubyBlock(@"Hello From Objective C");
  });  
}

@end

```