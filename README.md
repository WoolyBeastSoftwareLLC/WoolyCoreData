WoolyCoreData
=============

Core Data extensions and helper classes

Best if used in conjunction with WoolyFoundation and WoolyUIKit, but neither are required.

This is definitely "work in progress", has minimal documentation, and could be considered
quite sparse.

Installation
------------
1. Add WoolyCoreData.xcodeproj to your current project.
2. Add "WoolyCoreData.h" to your prefix file.
3. Update project [User] Header Search Paths and target dependencies appropriately.
4. Update Other Linker Flags with '-all_load' in order to work around a bug in Apple's linkers with using static libraries that composed of categories. This may be fixed in future releases of Apple's developer tools: http://developer.apple.com/library/mac/#qa/qa1490/_index.html
