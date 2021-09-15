//
//  AuthorizationModel.swift
//  Otbbor
//
//  Created by KS54 on 15.09.2021.
//

import Foundation


struct AuthModel: Decodable {
    let id: String?
    let email: String?
    let nickName: String?
    let avatar: String?
    let token: String?
    let error: String?
    let success: Bool?
}



class Authorization {
    
    
    func auth(login: String, password: String) -> AuthModel {
        
        let semaphore = DispatchSemaphore (value: 0)
        var returnData: AuthModel? = nil

        let parameters = "{\n    \"email\": \"\(login)\",\n    \"password\":\"\(password)\"\n}"
        let postData = parameters.data(using: .utf8)

        var request = URLRequest(url: URL(string: "http://mskko2021.mad.hakta.pro/api/user/login")!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "POST"
        request.httpBody = postData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          let data = data
          
            if data != nil{
                returnData = try? JSONDecoder().decode(AuthModel.self, from: data!)
                semaphore.signal()
            }
        }

        task.resume()
        semaphore.wait()
        
        return returnData!
        
    }
    
    
}
