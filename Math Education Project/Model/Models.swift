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
