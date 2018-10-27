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
    
    let baseURL = "https://api.particle.io"
    let accessToken = "Bearer 5f954d861ab114c44a2ac650e9c69ec1bfc6de3b"
    
    init() {
        //POST DEVICE ID, FUNCTION
        
        //FROM DEVICE TO SERVER
        
        //WEB HOOK
    }
    
    /**
     // All three of these calls are equivalent
     Alamofire.request("https://httpbin.org/post", method: .post, parameters: parameters)
     Alamofire.request("https://httpbin.org/post", method: .post, parameters: parameters, encoding: URLEncoding.default)
     Alamofire.request("https://httpbin.org/post", method: .post, parameters: parameters, encoding: URLEncoding.httpBody)

     **/
    
    func makeRequest(url: URL) {
        guard let newURL = URL(string: baseURL + "/v1/devices") else { return }
        let headers = ["Authorization": accessToken]
        //let headers = HTTPHeaders(dictionaryLiteral: @["Authorization": accessToken])
        do {
            let urlRequest = try URLRequest(url: newURL, method: .get, headers: headers)
            Alamofire.request(urlRequest).response { (response) in
                guard let data = response.data else { return }
                print(response)
                let str = String(data: data, encoding: .utf8)
                print(str)
            }
        } catch {
            print("NONONNONONONON")
        }
     
    }
}
