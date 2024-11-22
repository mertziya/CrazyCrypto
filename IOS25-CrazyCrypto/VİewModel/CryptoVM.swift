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
    
    func requestData(urlString: String){
        self.loading.onNext(true)
        let url = URL(string: urlString)!
        WebService().downloadCurrencies(url: url) { result in
            self.loading.onNext(false)
            switch result {
            case .success(let cryptos):
                self.cryptos.onNext(cryptos)
            case .failure(let error):
                switch error {
                case .parsingError :
                    self.error.onNext("Parsing Error")
                case .serverError :
                    self.error.onNext("Server Error")
                    
                }
            }
        }
    }
    
}


