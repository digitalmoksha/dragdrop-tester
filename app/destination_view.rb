# frozen_string_literal: true

# Parts based on the tutorial
# https://www.raywenderlich.com/136272/drag-and-drop-tutorial-for-macos
#------------------------------------------------------------------------------
class DestinationView < NSView
  attr_accessor :delegate

  #------------------------------------------------------------------------------
  def initialize_dragging
    registerForDraggedTypes([KUTTypeItem])
    @isReceivingDrag = false
  end

  #------------------------------------------------------------------------------
  #  NSDraggingInfo
  def shouldAllowDrag(draggingInfo)
    canAccept  = false
    pasteBoard = draggingInfo.draggingPasteboard
    # if pasteBoard.canReadObjectForClasses([NSURL], options: {})
    true
    # end
  end

  #------------------------------------------------------------------------------
  # NSDraggingInfo -> NSDragOperation
  def draggingEntered(sender)
    allow = shouldAllowDrag(sender)
    @isReceivingDrag = allow
    self.needsDisplay = true
    allow ? NSDragOperationGeneric : NSDragOperationNone
  end

  #------------------------------------------------------------------------------
  def draggingExited(_sender)
    @isReceivingDrag  = false
    self.needsDisplay = true
  end

  #------------------------------------------------------------------------------
  def draggingEnded(_sender)
    @isReceivingDrag  = false
    self.needsDisplay = true
  end

  #------------------------------------------------------------------------------
  def prepareForDragOperation(draggingInfo)
    shouldAllowDrag(draggingInfo)
  end

  #------------------------------------------------------------------------------
  def performDragOperation(draggingInfo)
    @isReceivingDrag = false

    point       = convertPoint(draggingInfo.draggingLocation, fromView: nil)
    pasteboard  = draggingInfo.draggingPasteboard

    urls        = pasteboard.readObjectsForClasses([NSURL], options: {})
    urls.each { |x| @delegate.log_msg x.isFileReferenceURL ? x.path : x.absoluteString }

    pasteboard.types.each do |type|
      @delegate.log_msg "   PB type: #{type}"
      @delegate.log_msg "     properties: #{pasteboard.propertyListForType(type)}"
    end
    @delegate.log_msg '------------------------------------------------------'
    true
  end

  #------------------------------------------------------------------------------
  def concludeDragOperation(draggingInfo); end

  #------------------------------------------------------------------------------
  # NSRect
  def drawRect(_dirtyRect)
    @isReceivingDrag ? NSColor.selectedControlColor.set : NSColor.secondaryLabelColor.set
    path = NSBezierPath.bezierPathWithRect(bounds)
    path.lineWidth = 1
    path.stroke
  end
end
