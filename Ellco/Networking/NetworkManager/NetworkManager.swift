//
//  NetworkMabager.swift
//  Ellco
//
//  Created by Arslanali on 31.01.2021.
//

import Foundation
import Alamofire

protocol NetworkManager {
    func getData(completion: @escaping (Result <Ticket , Error>) -> Void)
}

class NetworkManagerImp: NetworkManager {
    
    let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Application": "application/json",
            "X-AUTH-TOKEN": "38fa0880d113c79d8e0196481d4f4562576b5348de1ab9619696d3449de5"
        ]
    
    func getData(completion: @escaping (Result<Ticket , Error>) -> Void) {
        AF.request(Api.url , method: .get , headers: headers).responseJSON {(response) in
            if let error = response.error {
                print(error.localizedDescription)
            }
            
            guard let data = response.data else { return }
            
            do {
                let jsonData = try JSONDecoder().decode(Ticket .self, from: data)
                completion(.success(jsonData))
                print(jsonData)
            } catch(let error) {
                completion(.failure(error))
                print("Не правильный формат данных \(error.localizedDescription)")
            }
        }
    }
}
