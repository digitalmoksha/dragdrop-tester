class MainController < NSViewController

  #------------------------------------------------------------------------------
  def loadView
    @layout   = MainLayout.new
    self.view = @layout.view

    @destination_view = @layout.get(:destination_view)
    @destination_view.delegate = self
    @destination_view.initialize_dragging

    @log_field    = @layout.get(:log_field)
  end

  #------------------------------------------------------------------------------
  def log_msg(msg)
    @log_field.setSelectedRange(NSMakeRange(@log_field.string.length, 0))
    @log_field.insertText("#{msg}\n")
    @log_field.setSelectedRange(NSMakeRange(@log_field.string.length, 0))    
  end

end