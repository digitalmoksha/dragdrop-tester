# frozen_string_literal: true

class MainLayout < MotionKit::Layout
  VERTICAL_SPACE_BETWEEN_ITEMS          = 25
  SPACE_BETWEEN_LABEL_CONTROL           = 10
  MARGIN_LEFT                           = 25
  MARGIN_RIGHT                          = 25
  MARGIN_TOP                            = 50
  MARGIN_BOTTOM                         = 25
  TEXT_INSET                            = 10

  #------------------------------------------------------------------------------
  def layout
    root NSView, :root do
      add DestinationView,  :destination_view
      add NSScrollView,     :scroll_view do
        self.documentView = add NSTextView, :log_field
      end
    end
  end

  #------------------------------------------------------------------------------
  def root_style
    self.translatesAutoresizingMaskIntoConstraints = true
    self.autoresizingMask       = NSViewWidthSizable | NSViewHeightSizable
    self.wantsLayer             = true
  end

  #------------------------------------------------------------------------------
  def destination_view_style
    constraints do
      top.equals(view).plus(MARGIN_TOP)
      left.equals(view).plus(MARGIN_LEFT)
      right.equals(view).minus(MARGIN_LEFT)
      bottom.equals(view, :top).plus(100)
    end
  end

  #------------------------------------------------------------------------------
  def scroll_view_style
    self.hasVerticalScroller    = true
    self.hasHorizontalScroller  = false
    self.autohidesScrollers     = true
    constraints do
      top.equals(:destination_view, :bottom).plus(VERTICAL_SPACE_BETWEEN_ITEMS)
      left.equals(view).plus(MARGIN_LEFT)
      right.equals(view).minus(MARGIN_RIGHT)
      bottom.equals(view).minus(MARGIN_BOTTOM)
    end
  end

  #------------------------------------------------------------------------------
  def log_field_style
    self.translatesAutoresizingMaskIntoConstraints = true
    self.autoresizingMask         = NSViewWidthSizable | NSViewHeightSizable
    self.editable                 = true
    self.allowsUndo               = true
    self.richText                 = true
    self.importsGraphics          = false
    self.allowsImageEditing       = false
    self.automaticLinkDetectionEnabled      = false
    self.automaticQuoteSubstitutionEnabled  = false
    self.automaticDashSubstitutionEnabled   = false
    self.usesInspectorBar         = false
    self.usesFontPanel            = false
    self.usesFindBar              = false

    # sets the left/right indent.  This is better than the textContainerInset
    # because in this case the indent responds to the mouse drags
    textContainer.lineFragmentPadding = 10

    self.textContainerInset       = [0, TEXT_INSET]
    self.enabledTextCheckingTypes = NSTextCheckingAllCustomTypes | NSTextCheckingTypeDate # NSTextCheckingTypeDash
    self.font                     = NSFont.fontWithName('Source Code Pro',
                                                        size: 13) || NSFont.userFixedPitchFontOfSize(13)
  end
end
