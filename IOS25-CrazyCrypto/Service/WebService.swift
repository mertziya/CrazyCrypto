
import Foundation


enum CryptoError : Error {
    case serverError
    case parsingError
}
// this enum is defined in order to define the errortype used inside the WebService class's downloadCurrencies functions completion handler (closure)
// the error can either be .serverError or .parsingError


class WebService {
    
    func downloadCurrencies(url : URL , completition: @escaping (Result<[Crypto] , CryptoError >) -> () ){
        
        URLSession.shared.dataTask(with: url) { data, respone, error in
            if let error = error{
                completition(.failure(.serverError))
            }else if let data = data{
                let cryptoList = try? JSONDecoder().decode([Crypto].self, from: data)
                if let cryptoList = cryptoList {
                    completition(.success(cryptoList)) // data decoded sucesfully
                }else{
                    completition(.failure(.parsingError)) // data decoded but couldn't parse
                }
            }
        }.resume()
        
    }
    
}

// if let error = error{ //codeblock } --> this is a method known as **OPTIONAL BINDING** and it ensures that optional value has a value.

// @escaping --> means works after the function runs.

// Result< 'success' , 'failiure' >  --> Closure tanımlarken kullanılır. Normalde return etmesini istediğimiz veri 'success'dür. Hata olması halinde return etmesini istedğimiz veri ise 'failiure'dur
// Result'ın 'success' data type ını kendimiz belirleyebiliriz. Fakat 'failiure' kesinlikle Error data type olmalıdır.
// Bu yüzdenyukarda tanımladığımız enum CryptoError, Error protocolunu adopt eder.

// Bu örnek'te return etmesini istediğimiz değer Model klasörü içerisinde tanımladığımız Crypto Classınıun bir arrayidir o yüzden -> [Crypto]
