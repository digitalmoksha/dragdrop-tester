# App for testing different drag/drop scenarios and the information available.
#------------------------------------------------------------------------------
class AppDelegate
  #------------------------------------------------------------------------------
  def applicationDidFinishLaunching(notification)
    buildMenu
    buildWindow
  end

  #------------------------------------------------------------------------------
  def buildWindow
    @window_controller = WindowController.alloc.init
    @window_controller.showWindow(self)
    @window_controller.window.orderFrontRegardless
  end
end
