# Prototype – iOS Conceptual Example with Document Cloning

This project demonstrates the **Prototype design pattern** in a minimal, abstract, and didactic way using concepts familiar to iOS developers. It showcases how objects can be cloned instead of being created from scratch, while allowing fine-grained control over what gets copied and what doesn’t.

## 📐 Context

In real-world iOS apps, there are scenarios where creating new objects from scratch is expensive or undesirable. For example:
- Cloning large documents.
- Duplicating pre-configured models.
- Generating similar view models with slight variations.

This example focuses on a document management scenario where:
- An Author owns multiple Documents.
- Each Document can be cloned using the Prototype pattern.
- When cloning, you choose which parts of the original state to copy or ignore.

## 🧠 Pattern Roles

| Role                | Implementation                            |
|---------------------|-------------------------------------------|
| Prototype           | `NSCopying` (via `Document`)              |
| Concrete Prototype  | `Document`                                |
| Client              | Example usage at the bottom               |

## 🧪 Example Usage
```swift
let author = Author(id: 1, username: "GabrielEduardo")
let original = Document(
    title: "My Prototype Doc", 
    content: "Hello Prototype!", 
    author: author)

original.add(comment: Comment(message: "Nice doc!"))

let copy: Document = original.copy() as! Document

print("Original ->", original.description)   // Has 1 comment
print("Copy ->", copy.description)           // Has 0 comments
print("Author documents count:", author.documentsCount)
```

### Output:

```swift
Original -> Document(title: My Prototype Doc, comments: 1)
Copy -> Document(title: Copy of 'My Prototype Doc', comments: 0)
Author documents count: 2
```

## 📌 Benefits Illustrated

✅ Object duplication without rebuilding: Instead of manually creating a new document, you reuse the existing one as a prototype.

✅ You can control what gets cloned. In this example, the document’s title and content are copied, but comments are ignored.

✅ By reusing an existing object, you maintain relationships. For example, both documents share the same author reference.

## ⚠️ Drawbacks

❗️ Requires careful thought about deep vs. shallow copies. Especially when objects reference other objects.

❗️ Can introduce unexpected bugs if mutable shared references are cloned unintentionally.

❗️ May add complexity when cloning graphs of interconnected objects.

## 🧱 File Overview

All logic is contained in a single file for clarity and portability:
Prototype.swift

You can run this file in a Swift Playground, command-line project, or reuse it as a conceptual reference when designing cloning strategies in iOS apps.
## 👨‍💻 Author
Created by Gabriel Eduardo on August 25, 2025.
