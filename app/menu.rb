# frozen_string_literal: true

class AppDelegate
  def buildMenu
    @mainMenu = NSMenu.new

    appName = NSBundle.mainBundle.infoDictionary['CFBundleName']

    find_menu = createMenu('Find') do
      addItemWithTitle('Find...', action: 'performFindPanelAction:', keyEquivalent: 'f')
      addItemWithTitle('Find Next', action: 'performFindPanelAction:', keyEquivalent: 'g')
      addItemWithTitle('Find Previous', action: 'performFindPanelAction:', keyEquivalent: 'G')
      addItemWithTitle('Use Selection for Find', action: 'performFindPanelAction:', keyEquivalent: 'e')
      addItemWithTitle('Jump to Selection', action: 'centerSelectionInVisibleArea:', keyEquivalent: 'j')
    end

    spelling_and_grammar_menu = createMenu('Spelling and Grammar') do
      addItemWithTitle('Show Spelling and Grammar', action: 'showGuessPanel:', keyEquivalent: ':')
      addItemWithTitle('Check Document Now', action: 'checkSpelling:', keyEquivalent: ';')
      addItem(NSMenuItem.separatorItem)
      addItemWithTitle('Check Spelling While Typing', action: 'toggleContinuousSpellChecking:', keyEquivalent: '')
      addItemWithTitle('Check Grammar With Spelling', action: 'toggleGrammarChecking:', keyEquivalent: '')
      addItemWithTitle('Correct Spelling Automatically', action: 'toggleAutomaticSpellingCorrection:',
                                                         keyEquivalent: '')
    end

    substitutions_menu = createMenu('Substitutions') do
      addItemWithTitle('Show Substitutions', action: 'orderFrontSubstitutionsPanel:', keyEquivalent: 'f')
      addItem(NSMenuItem.separatorItem)
      addItemWithTitle('Smart Copy/Paste', action: 'toggleSmartInsertDelete:', keyEquivalent: 'f')
      addItemWithTitle('Smart Quotes', action: 'toggleAutomaticQuoteSubstitution:', keyEquivalent: 'g')
      addItemWithTitle('Smart Dashes', action: 'toggleAutomaticDashSubstitution:', keyEquivalent: '')
      addItemWithTitle('Smart Links', action: 'toggleAutomaticLinkDetection:', keyEquivalent: 'G')
      addItemWithTitle('Text Replacement', action: 'toggleAutomaticTextReplacement:', keyEquivalent: '')
    end

    transformations_menu = createMenu('Transformations') do
      addItemWithTitle('Make Upper Case', action: 'uppercaseWord:', keyEquivalent: '')
      addItemWithTitle('Make Lower Case', action: 'lowercaseWord:', keyEquivalent: '')
      addItemWithTitle('Capitalize', action: 'capitalizeWord:', keyEquivalent: '')
    end

    speech_menu = createMenu('Speech') do
      addItemWithTitle('Start Speaking', action: 'startSpeaking:', keyEquivalent: '')
      addItemWithTitle('Stop Speaking', action: 'stopSpeaking:', keyEquivalent: '')
    end

    addMenu(appName) do
      addItemWithTitle("About #{appName}", action: 'orderFrontStandardAboutPanel:', keyEquivalent: '')
      addItem(NSMenuItem.separatorItem)
      servicesItem = addItemWithTitle('Services', action: nil, keyEquivalent: '')
      NSApp.servicesMenu = servicesItem.submenu = NSMenu.new
      addItem(NSMenuItem.separatorItem)
      addItemWithTitle("Hide #{appName}", action: 'hide:', keyEquivalent: 'h')
      item = addItemWithTitle('Hide Others', action: 'hideOtherApplications:', keyEquivalent: 'H')
      item.keyEquivalentModifierMask = NSCommandKeyMask | NSAlternateKeyMask
      addItemWithTitle('Show All', action: 'unhideAllApplications:', keyEquivalent: '')
      addItem(NSMenuItem.separatorItem)
      addItemWithTitle("Quit #{appName}", action: 'terminate:', keyEquivalent: 'q')
    end

    addMenu('Edit') do
      addItemWithTitle('Undo', action: 'undo:', keyEquivalent: 'z')
      addItemWithTitle('Redo', action: 'redo:', keyEquivalent: 'Z')
      addItem(NSMenuItem.separatorItem)
      addItemWithTitle('Cut', action: 'cut:', keyEquivalent: 'x')
      addItemWithTitle('Copy', action: 'copy:', keyEquivalent: 'c')
      addItemWithTitle('Paste', action: 'paste:', keyEquivalent: 'v')
      item = addItemWithTitle('Paste and Match Style', action: 'pasteAsPlainText:', keyEquivalent: 'V')
      item.keyEquivalentModifierMask = NSCommandKeyMask | NSAlternateKeyMask
      addItemWithTitle('Delete', action: 'delete:', keyEquivalent: '')
      addItemWithTitle('Select All', action: 'selectAll:', keyEquivalent: 'a')
      addItem(NSMenuItem.separatorItem)
      addItem(find_menu)
      addItem(spelling_and_grammar_menu)
      addItem(substitutions_menu)
      addItem(transformations_menu)
      addItem(speech_menu)
    end

    NSApp.windowsMenu = addMenu('Window') do
      addItemWithTitle('Minimize', action: 'performMiniaturize:', keyEquivalent: 'm')
      addItemWithTitle('Zoom', action: 'performZoom:', keyEquivalent: '')
      addItem(NSMenuItem.separatorItem)
      addItemWithTitle('Bring All To Front', action: 'arrangeInFront:', keyEquivalent: '')
    end.menu

    NSApp.mainMenu = @mainMenu
  end

  private

  def addMenu(title, &b)
    item = createMenu(title, &b)
    @mainMenu.addItem item
    item
  end

  def createMenu(title, &b)
    menu = NSMenu.alloc.initWithTitle(title)
    menu.instance_eval(&b) if b
    item = NSMenuItem.alloc.initWithTitle(title, action: nil, keyEquivalent: '')
    item.submenu = menu
    item
  end
end
