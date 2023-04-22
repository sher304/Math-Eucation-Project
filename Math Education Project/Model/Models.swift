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
