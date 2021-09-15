//
//  Quotes.swift
//  Otbbor
//
//  Created by KS54 on 15.09.2021.
//

import Foundation


struct QuotesModel: Decodable {
    let success: Bool
    let data: [QuotesDataModel]
}

struct QuotesDataModel: Decodable{
    let id: Int
    let title: String
    let image: String
    let description: String
}




class Quotes {
    
    
    func getFeelings() -> QuotesModel? {
        
        let semaphore = DispatchSemaphore (value: 0)
        var returnData: QuotesModel? = nil

        var request = URLRequest(url: URL(string: "http://mskko2021.mad.hakta.pro/api/quotes")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            semaphore.signal()
            return
          }
            returnData = try? JSONDecoder().decode(QuotesModel.self, from: data)
          semaphore.signal()
        }

        task.resume()
        semaphore.wait()
        
        return returnData
        
    }
    
    
}

