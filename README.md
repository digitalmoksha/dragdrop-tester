## Drag and Drop Tester for macOS

Simple macOS app that allows you to drag and drop anything and inspect the pasteboard types.  It was written using [RubyMotion](http://www.rubymotion.com).

### Installation

A built application can be found in the `bin` folder.  If you have RubyMotion installed, then you can change to the folder and run `rake` from the command line.

### Using the program

After starting the app, drag anything (a webpage image, text, etc) into the drop rectangle.  You will
then be shown the Pasteboard types for that object.

For example, dragging the address bar link `https://www.apple.com` from Safari will generate
the following output:

```
https://www.apple.com/
   PB type: dyn.ah62d4rv4gu8yc6durvwwa3xmrvw1gkdusm1044pxqyuha2pxsvw0e55bsmwca7d3sbwu
     properties: ["webloc"]
   PB type: Apple files promise pasteboard type
     properties: ["webloc"]
   PB type: com.apple.Safari.bookmarkDictionaryList
     properties: [{"URIDictionary"=>{"title"=>"Apple"}, "WebBookmarkType"=>"WebBookmarkTypeLeaf", "WebBookmarkUUID"=>"3BE0B2B3-5574-4885-B4A5-2062C2D4E3EE", "URLString"=>"https://www.apple.com/"}]
   PB type: com.apple.Safari.bookmarkStatistics
     properties: {"TotalCount"=>1, "FolderCount"=>0}
   PB type: dyn.ah62d4rv4gu8zs3pcnzme2641rf4guzdmsv0gn64uqm10c6xenv61a3k
     properties: [["https://www.apple.com/"], ["Apple"]]
   PB type: WebURLsWithTitlesPboardType
     properties: [["https://www.apple.com/"], ["Apple"]]
   PB type: public.url
     properties: https://www.apple.com/
   PB type: CorePasteboardFlavorType 0x75726C20
     properties: https://www.apple.com/
   PB type: dyn.ah62d4rv4gu8yc6durvwwaznwmuuha2pxsvw0e55bsmwca7d3sbwu
     properties: ["https://www.apple.com/", ""]
   PB type: Apple URL pasteboard type
     properties: ["https://www.apple.com/", ""]
   PB type: public.utf8-plain-text
     properties: https://www.apple.com/
   PB type: NSStringPboardType
     properties: https://www.apple.com/
   PB type: public.url-name
     properties: Apple
   PB type: CorePasteboardFlavorType 0x75726C6E
     properties: Apple
   PB type: com.apple.pasteboard.promised-file-content-type
     properties: com.apple.web-internet-location
   PB type: com.apple.pasteboard.promised-file-url
     properties: 
   PB type: dyn.ah62d4rv4gu8y6y4usm1044pxqzb085xyqz1hk64uqm10c6xenv61a3k
     properties: 
   PB type: NSPromiseContentsPboardType
     properties: 
```