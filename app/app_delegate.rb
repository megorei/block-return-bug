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
