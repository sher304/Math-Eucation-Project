//
//  Models.swift
//  Math Education Project
//
//  Created by Шермат Эшеров on 17/04/2023.
//

import Foundation

// MARK: - CourseElement
struct CourseElement: Codable {
    let id: Int
    let title, text: String
    let cover: String
}

typealias Course = [CourseElement]

// MARK: - Quiz
struct Quiz: Codable {
    let id: Int
    let title: String
    let topic: Int
    let questions: [Question]
}

// MARK: - Question
struct Question: Codable {
    let id: Int
    let text: String
    let quiz: Int
    let answers: [Answer]
}

// MARK: - Answer
struct Answer: Codable {
    let id: Int
    let text: String
    let isCorrect: Bool
    let question: Int

    enum CodingKeys: String, CodingKey {
        case id, text
        case isCorrect = "is_correct"
        case question
    }
}

// MARK: - Topic
struct Topic: Codable {
    let id: Int
    let title, text: String
    let unit: Int
}

typealias Topics = [Topic]


// MARK: - SingleTopic
struct SingleTopic: Codable {
    let id: Int
    let title, text: String
    let unit: Int
    let photos: [Photo]
    let examples: [Example]
    let quizes: [Quiz]
}

// MARK: - Example
struct Example: Codable {
    let id: Int
    let text: String
    let topic: Int
    let examplePhotos: [ExamplePhoto]
    let exampleNumbers: [ExampleNumber]

    enum CodingKeys: String, CodingKey {
        case id, text, topic
        case examplePhotos = "example_photos"
        case exampleNumbers = "example_numbers"
    }
}

// MARK: - ExampleNumber
struct ExampleNumber: Codable {
    let id: Int
    let text: String
    let example: Int
}

// MARK: - ExamplePhoto
struct ExamplePhoto: Codable {
    let id: Int
    let photo: String
    let example: Int
}

// MARK: - Photo
struct Photo: Codable {
    let id: Int
    let photo: String
    let topic: Int
}

// MARK: - Unit
struct Unit: Codable {
    let id: Int
    let title: String
    let text: String
    let course: Int
}

typealias Units = [Unit]
