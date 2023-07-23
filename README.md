Dead Code Stripping for static lib:

I've tried to prove the concept `Dead code stripping` for static lib/frameworks on SPM but no luck.
Things I've tried base on these articles:

- Turn on Dead code stripping:
    + https://developer.apple.com/library/archive/documentation/Performance/Conceptual/CodeFootprint/Articles/CompilerOptions.html#//apple_ref/doc/uid/20001861-131369
    + https://stackoverflow.com/questions/44128825/ios-static-library-dead-code-stripping-configurable-apns

- https://forums.swift.org/t/why-public-symbols-are-always-no-dead-strip/47264: 
    + Public symbols will not be stripped, only internal will be striped: I've saw the internal symbols which not be reference anywhere in the app will be stripped 
        + "things that might rely on runtime lookup that won't be obviously alive to the linker, like metadata for types that are looked up by name, or protocol conformances for types that are dynamically cast using as? Protocol casts. For most other things, that should be safe, though."'
        
    + however, if the internal symbols is being referenced by some public symbols => Seems like internal symbols will not be stripped.
    => Only unused code will be stripped? => So I think dead code stripping can't reduce app size much.
    
    + There is an active thread since 2020 to support dead strip public symbols 
        + https://forums.swift.org/t/pitch-2-opt-in-reflection-metadata/41696
        + https://github.com/apple/swift/pull/34199
        
- https://ohdarling88.medium.com/analyze-ios-app-binary-size-with-link-map-5d74ad4ec795
    After read this article, things I've tried to prove "dead code stripping":
        + Step1: Generate a linkmap when archive the project
        + Step2: Navigate to the `.o` file of the static framework
        + Step3: run script: `nm -m $PATH_TO_.O_FILE | grep "no dead strip"`
        
    Result:
        + Public symbols will not be stripped (as expected)
        + Internal symbols which not being reference anywhere will be stripped (as expected)
        + Internal symbols which being reference by public symbols still be stripped ???? => Unexpected
        
- Other maybe helpful articles:
    + https://juejin.cn/post/6969562598610042888
    + https://zeddios.tistory.com/1313
    + https://www.emergetools.com/blog/posts/static-vs-dynamic-frameworks-ios-discussion-chat-gpt: Using `otool`
    + https://llvm.org/docs/CommandGuide/llvm-dwarfdump.html
    

    
