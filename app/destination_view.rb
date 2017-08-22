# Parts based on the tutorial 
# https://www.raywenderlich.com/136272/drag-and-drop-tutorial-for-macos
#------------------------------------------------------------------------------
class DestinationView < NSView

  attr_accessor :delegate
  
  #------------------------------------------------------------------------------
  def initialize_dragging
    registerForDraggedTypes([KUTTypeItem])
    @isReceivingDrag  = false
  end

  #------------------------------------------------------------------------------
  def shouldAllowDrag(draggingInfo) #  NSDraggingInfo
    canAccept  = false
    pasteBoard = draggingInfo.draggingPasteboard
    # if pasteBoard.canReadObjectForClasses([NSURL], options: {})
      canAccept = true
    # end
    return canAccept
  end
  
  #------------------------------------------------------------------------------
  def draggingEntered(sender) # NSDraggingInfo -> NSDragOperation
    allow = shouldAllowDrag(sender)
    @isReceivingDrag = allow
    self.needsDisplay = true
    return allow ? NSDragOperationGeneric : NSDragOperationNone
  end
  
  #------------------------------------------------------------------------------
  def draggingExited(sender)
    @isReceivingDrag  = false
    self.needsDisplay = true
  end

  #------------------------------------------------------------------------------
  def draggingEnded(sender)
    @isReceivingDrag  = false
    self.needsDisplay = true
  end

  #------------------------------------------------------------------------------
  def prepareForDragOperation(draggingInfo)
    return shouldAllowDrag(draggingInfo)
  end

  #------------------------------------------------------------------------------
  def performDragOperation(draggingInfo)
    @isReceivingDrag = false

    point       = convertPoint(draggingInfo.draggingLocation, fromView: nil)
    pasteboard  = draggingInfo.draggingPasteboard  

    urls        = pasteboard.readObjectsForClasses([NSURL, ], options: {})
    urls.each {|x| @delegate.log_msg x.isFileReferenceURL ? x.path : x.absoluteString}

    pasteboard.types.each do |type|
      @delegate.log_msg "   PB type: #{type}"
      @delegate.log_msg "     properties: #{pasteboard.propertyListForType(type)}"
    end
    @delegate.log_msg "------------------------------------------------------"
    return true
  end

  #------------------------------------------------------------------------------
  def concludeDragOperation(draggingInfo)
  end

  #------------------------------------------------------------------------------
  def drawRect(dirtyRect) # NSRect
    @isReceivingDrag ? NSColor.selectedControlColor.set : NSColor.secondaryLabelColor.set
    path = NSBezierPath.bezierPathWithRect(self.bounds)
    path.lineWidth = 1
    path.stroke
  end
end