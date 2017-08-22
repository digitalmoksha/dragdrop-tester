class WindowController < NSWindowController
  attr_accessor :main_controller
  
  #------------------------------------------------------------------------------
  def init
    super.tap do
      @layout       = WindowLayout.new
      self.window   = @layout.window
      window.title  = NSBundle.mainBundle.infoDictionary['CFBundleName']

      @main_controller = MainController.alloc.init
      window.contentView.addSubview @main_controller.view

      @main_controller.view.frame             = window.contentView.bounds
      @main_controller.view.autoresizingMask  = window.contentView.autoresizingMask
    end
  end
end
