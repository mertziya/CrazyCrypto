//
//  CryptoVM.swift
//  IOS25-CrazyCrypto
//
//  Created by Mert Ziya on 22.11.2024.
//
import Foundation
import RxSwift
import RxCocoa

// Logic of RxSwift --> You **PUBLISH** the ViewModel and **SUBSCRIBE** from the view
// --> in this case ve publish the CryptoVM and subscribe to CryptoVM from our ViewcController

class CryptoVM{
    
    let cryptos : PublishSubject<[Crypto]> = PublishSubject()
    let error : PublishSubject<String> = PublishSubject()
    let loading : PublishSubject<Bool> = PublishSubject()
    
    // These 3 objects are observables. We observe them from our View.
    
    func requestData(urlString : String){
        self.loading.onNext(true)
        
        let url = URL(string: urlString)!
        WebService().downloadCurrencies(url: url) { result in
            self.loading.onNext(false)
            switch result{
            case .success(let cryptos): // inside the success([cryptos]) it returns a value and we assign that value to cryptos by let cryptos
                self.cryptos.onNext(cryptos)
                
            case .failure(let error):
                switch error{
                case .parsingError:
                    self.error.onNext("parsing error")
                case .serverError:
                    self.error.onNext("server error")
                }
                
            }
        }
    }

    
}

// In order to sent data from ViewModel --> View there are few methods that are being used:
// 1 --> RxSwift
// 2 --> Combine Framework
// 3 --> Delegate Pattern
