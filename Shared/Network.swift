//
//  Network.swift
//  Network
//
//  Created by youngho joo on 2021/11/22.
//

import Foundation
import Combine

class Network: ObservableObject {
    
    @Published var data: Data?
    static let shared = Network()
    
    func connect(url: URL) {

        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else {
                return
            }
            self.data = data
        }
        
        task.resume()
    }
    
}
