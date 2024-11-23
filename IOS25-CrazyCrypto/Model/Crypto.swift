//
//  Crypto.swift
//  IOS25-CrazyCrypto
//
//  Created by Mert Ziya on 22.11.2024.
//

import Foundation

struct Crypto : Codable { // the data for this struct will be dervied from a JSON DATA. so the data will be decoded from a JSON ata thats why this struct needs to be Decodable
    
    let currency : String
    let price : String
    
}

// Decodable: Sunucudan veriyi alıp değişkenlere tanımlamak için gerekli bir Protocol
// Encodable: Verileri alıp sunucuya geri yollamak için gerekli olan bir Protocol
// Codable: İki özelliği birden destekleyen bir Prtotocol
