//
//  Feelings.swift
//  Otbbor
//
//  Created by KS54 on 15.09.2021.
//

import Foundation


struct FeelingsModel: Decodable {
    let success: Bool
    let data: [DataModel]
}

struct DataModel: Decodable{
    let id: Int
    let title: String
    let image: String
    let position: Int
}


class Feelings {
    
    
    func getFeelings() -> FeelingsModel? {
        
        let semaphore = DispatchSemaphore (value: 0)
        var returnData: FeelingsModel? = nil

        var request = URLRequest(url: URL(string: "http://mskko2021.mad.hakta.pro/api/feelings")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            semaphore.signal()
            return
          }
            returnData = try? JSONDecoder().decode(FeelingsModel.self, from: data)
          semaphore.signal()
        }

        task.resume()
        semaphore.wait()
        
        return returnData
        
    }
    
    
}
