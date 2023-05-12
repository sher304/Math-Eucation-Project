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
    
//    func getUnit(id: Int, completion: @escaping(Result<Unit,Error>) -> Void){
//        Network.getUnits(id: id, method: "GET", completion: completion)
//    }
    
    func getUnit(completion: @escaping(Result<Units,Error>) -> Void){
        Network.getUnits(method: "GET", completion: completion)
    }
    
    func getTopics(id: Int, completion: @escaping(Result<SingleTopic,Error>) -> Void){
        Network.getTopics(id: id, method: "GET", completion: completion)
    }
}
