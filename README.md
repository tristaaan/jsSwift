# jsSwift
Swift type extensions for people who think in JavaScript.

All extension functions behave as similar as possible to how they are described in the [JavaScript docs on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects).

## Contributing
If there's a type or builtin function that is unsupported here:

1. Add a new file titled `js[Type].swift`.
2. Add a test file in the folder `jsSwiftTests/` titled `js[Type]Tests.swift`.
3. Add the new Type file to jsSwiftTests target membership. (Click on new file > Right Panel/Inspector Panel > Target Membership > Check jsSwiftTests)
4. Test it and submit a PR!

## ToDo
- Date setters
- RegExp
- JSON
- Number

## Notes
With other XCode projects you may be used to pressing ⌘B and ⌘R, you'll want to be pressing the test shortcut key here: **⌘U**.
