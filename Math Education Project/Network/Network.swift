//
//  Network.swift
//  Math Education Project
//
//  Created by Шермат Эшеров on 17/04/2023.
//

import Foundation
import Alamofire



protocol NetworkSerice{
    static func getCourses<T: Codable>(methid: String, completion: @escaping(Result<T, Error>) -> Void)
    
}


class Network: NetworkSerice{
    
    static func getCourses<T: Codable>(methid: String, completion: @escaping(Result<T, Error>) -> Void){
        guard let url = URL(string: "https://math-course.vercel.app/course/course/") else { return }
        
        AF.request(url).response { response in
            guard let data = response.data else { return }
            guard let jsonOBJ = try? JSONDecoder().decode(T.self, from: data) else {
                print("ERROR NETOWK DATA")
                return }
            completion(.success(jsonOBJ))
        }
    }
}
