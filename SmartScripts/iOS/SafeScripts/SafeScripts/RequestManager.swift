//
//  RequestManager.swift
//  SafeScripts
//
//  Created by Chad Brady on 10/27/18.
//  Copyright © 2018 SafeScripts. All rights reserved.
//

import Foundation
import Alamofire

class RequestManager {
    
    static let apiBaseURL = "192.168.60.57/5000/api/main"
    static let baseURL = "http://192.168.60.57:5000/db"
    static let carlaURL = "http://207.250.0.170:5000/db"
    static let getURL = "http://207.250.0.170:5000/db"
    
    /**
     // All three of these calls are equivalent
     Alamofire.request("https://httpbin.org/post", method: .post, parameters: parameters)
     Alamofire.request("https://httpbin.org/post", method: .post, parameters: parameters, encoding: URLEncoding.default)
     Alamofire.request("https://httpbin.org/post", method: .post, parameters: parameters, encoding: URLEncoding.httpBody)

     **/
    
    static func savePrescription(_ script: PrescriptionReminder) {
        guard let newURL = URL(string: baseURL) else { return }
//        let request = URLRequest(url: newURL)
//        let task = URLSession.shared.dataTask(with: request) {  data, response, error in
//
//        }
//        task.resume()
//
        
        if var urlRequest = try? URLRequest(url: newURL, method: .post) {
            let encoder = JSONEncoder()
                if let encoded = try? encoder.encode(script) {
                    urlRequest.httpBody = encoded
                    let task = URLSession.shared.dataTask(with: urlRequest) {
                        data, response, error in
                        print(response)
                        // Your completion handler code here
                    }
                task.resume()
            }
        }
    }

    static func turnOnLight() {
        guard let newURL = URL(string: apiBaseURL) else { return }
//        let data =
        if var urlRequest = try? URLRequest(url: newURL, method: .post) {
//            let encoder = JSONEncoder()
//            if let encoded = try? encoder.encode(script) {
//                urlRequest.httpBody = encoded
                let task = URLSession.shared.dataTask(with: urlRequest) {
                    data, response, error in
                    print(response)
                    print(error)
                    print(data)
                    // Your completion handler code here
                }
                task.resume()
//            }
        }
    }
    
}
