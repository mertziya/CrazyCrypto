//
//  WebService.swift
//  IOS25-CrazyCrypto
//
//  Created by Mert Ziya on 22.11.2024.
//

import Foundation


enum CryptoError : Error {
    case serverError
    case parsingError
}


class WebService {
    
    func downloadCurrencies(url: URL, completition: @escaping (Result<[Crypto],CryptoError>) -> () ){
        URLSession.shared.dataTask(with: url) { data, respone, error in
            
            if let error = error {
                completition(.failure(.serverError))
            }else if let data = data {
                let cryptoList = try? JSONDecoder().decode([Crypto].self, from: data)
                if let cryptoList = cryptoList{
                    completition(.success(cryptoList))
                }else{
                    completition(.failure(.parsingError))
                }
            }
        }.resume()
        
    }
    
}
