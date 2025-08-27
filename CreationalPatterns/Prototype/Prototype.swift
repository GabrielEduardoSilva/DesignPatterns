//
//  Prototype.swift
//  
//
//  Created by Gabriel Eduardo on 25/08/25.
//

import Foundation

// MARK: - Prototype

final class Document: NSCopying {

    private(set) var title: String
    private(set) var content: String
    private weak var author: Author?
    private(set) var comments: [Comment] = []

    init(title: String, content: String, author: Author?) {
        self.title = title
        self.content = content
        self.author = author
        author?.add(document: self)
    }

    func add(comment: Comment) {
        comments.append(comment)
    }

    // Clone method
    func copy(with zone: NSZone? = nil) -> Any {
        // Here we define what should or should not be copied. For example:
        // - We are copying the title, but with a small change
        // - We are copying the reference to the same author
        // - We are not copying the comments
        let copy = Document(title: "Copy of '\(title)'", content: content, author: author)
        copy.comments = [] // No, not copying. (It's just for example. We don't need this line).
        return copy
    }

    var description: String {
        "Document(title: \(title), comments: \(comments.count))"
    }
}

final class Author {
    private let id: Int
    private let username: String
    private var documents: [Document] = []

    init(id: Int, username: String) {
        self.id = id
        self.username = username
    }

    func add(document: Document) {
        documents.append(document)
    }

    var documentsCount: Int {
        documents.count
    }

    var description: String {
        "Author(username: \(username), documents: \(documentsCount))"
    }
}

struct Comment {
    let date = Date()
    let message: String
}

// MARK: - Example

let author = Author(id: 1, username: "GabrielEduardo")
let original = Document(title: "My Prototype Doc", content: "Hello Prototype!", author: author)

original.add(comment: Comment(message: "Nice doc!"))

let copy: Document = original.copy() as! Document

print("Original ->", original.description)   // Has 1 comment
print("Copy ->", copy.description)           // Has 0 comments
print("Author documents count:", author.documentsCount)
