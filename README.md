# About

- Having a simple kept project with the most common used architectures/technologies by *us Makery ™* for proofing performance/leaks/best practices in IOS.

Key Points:
- Closures are hot spots for strong references/but can be useful
[/ worth to read link](http://stackoverflow.com/questions/24320347/shall-we-always-use-unowned-self-inside-closure-in-swift)
- Always dismiss a view controller from his parent through a delegate. Otherwise it's gonna be disconnected from the window hierarchy.
