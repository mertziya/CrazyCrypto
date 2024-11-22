//
//  CryptoVM.swift
//  IOS25-CrazyCrypto
//
//  Created by Mert Ziya on 22.11.2024.
//
import Foundation
import RxSwift
import RxCocoa

class CryptoVM{
    
    let cryptos : PublishSubject<[Crypto]> = PublishSubject()
    let error : PublishSubject<String> = PublishSubject()
    let loading : PublishSubject<Bool> = PublishSubject()
    
    func requestData(cryptoList: [Crypto] , urlString: String){
        self.loading.onNext(true)
        let url = URL(string: urlString)!
        WebService().downloadCurrencies(url: url) { result in
            switch result {
            case .success(let cryptos):
                print("asd")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}


