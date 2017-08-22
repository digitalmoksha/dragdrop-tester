class WindowLayout < MotionKit::WindowLayout

  #------------------------------------------------------------------------------
  def layout
    frame [[240, 180], [1000, 600]]
    styleMask NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | 
              NSResizableWindowMask | NSFullSizeContentViewWindowMask

    self.movableByWindowBackground  = true
    self.collectionBehavior         = NSWindowCollectionBehaviorFullScreenPrimary
  end

end
