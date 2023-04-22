//
//  APiAuth.swift
//  Math Education Project
//
//  Created by Шермат Эшеров on 17/04/2023.
//

import Foundation


class APiAuth{
    
    func getAllCourses(completion: @escaping(Result<Course, Error>) -> Void){
        Network.getCourses(method: "GET", completion: completion)
    }
    
    func getQuize(topic: Int, completion: @escaping(Result<Quiz, Error>) -> Void){
        Network.getQuiz(id: topic, completion: completion)
    }
    
    func getTopics(completion: @escaping(Result<Topics,Error>) -> Void){
        Network.getTopics(method: "GET", completion: completion)
    }
}
