//
//  NetworkManager.swift
//  wrkSpot
//
//  Created by Tarun Upadhyay on 21/03/25.
//

import Foundation

class NetworkManager {
    var baseUrl = "https://api.sampleapis.com/countries/countries"
    func countryListdetails( completion: @escaping (Bool,Data?) -> ()){
        
        // Example: Creating a URLSessionDataTask for a GET request
        if let url = URL(string: baseUrl) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    // Handle the error
                    print("Error: \(error.localizedDescription)")
                    completion(false, data)
                } else if let data = data {
                    // Process the data
                    print("Data received: \(data)")
                    completion(true, data)
                }
            }
            task.resume()
        }
    }
}
