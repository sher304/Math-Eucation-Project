//
//  Network.swift
//  Math Education Project
//
//  Created by Шермат Эшеров on 17/04/2023.
//

import Foundation
import Alamofire



protocol NetworkSerice{
    static func getCourses<T: Codable>(method: String, completion: @escaping(Result<T, Error>) -> Void)
    static func getQuiz<T: Codable>(id: Int, completion: @escaping(Result<T, Error>) -> Void)
    static func getUnits<T: Codable>(id: Int, method: String, completion: @escaping(Result<T, Error>) -> Void)
    static func getTopics<T: Codable>(id: Int, method: String, completion: @escaping(Result<T, Error>) -> Void)
}


class Network: NetworkSerice{
    
    static func getCourses<T: Codable>(method: String, completion: @escaping(Result<T, Error>) -> Void){
        guard let url = URL(string: "https://math-course.vercel.app/course/course/") else { return }
        
        AF.request(url).response { response in
            guard let data = response.data else { return }
            guard let jsonOBJ = try? JSONDecoder().decode(T.self, from: data) else {
                print("ERROR NETOWK DATA")
                return }
            completion(.success(jsonOBJ))
        }
    }
    
    static func getQuiz<T: Codable>(id: Int, completion: @escaping(Result<T, Error>) -> Void){
        guard let url = URL(string: "https://math-course.vercel.app/quiz/quiz/\(id)") else { return }
        
        AF.request(url).response { responce in
            guard let data = responce.data,
                  let jsonObj = try? JSONDecoder().decode(T.self, from: data) else {
                print("Error Data")
                return }
            completion(.success(jsonObj))
        }
    }
    
    static func getUnits<T: Codable>(id: Int, method: String, completion: @escaping(Result<T, Error>) -> Void){
        guard let url = URL(string: "https://math-course.vercel.app/course/unit/\(id)") else { return }
        AF.request(url).response { responce in
            guard let data = responce.data,
                  let jsonObj = try? JSONDecoder().decode(T.self, from: data) else { return }
            completion(.success(jsonObj))
        }
    }
    
    static func getTopics<T: Codable>(id: Int, method: String, completion: @escaping(Result<T, Error>) -> Void){
        guard let url = URL(string: "https://math-course.vercel.app/course/topic/\(id)") else { return }
        AF.request(url).response { responce in
            guard let data = responce.data,
                  let jsonObj = try? JSONDecoder().decode(T.self, from: data) else {
                print("eerrr")
                return }
            completion(.success(jsonObj))
        }
    }
}
