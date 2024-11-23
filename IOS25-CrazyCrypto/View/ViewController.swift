//
//  ViewController.swift
//  IOS25-CrazyCrypto
//
//  Created by Mert Ziya on 22.11.2024.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    var cryptoList = [Crypto]()
    let cryptoVM = CryptoVM()
    let disposeBag = DisposeBag()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = cryptoList[indexPath.row].currency
        content.secondaryText = cryptoList[indexPath.row].price
        cell.contentConfiguration = content
        return cell
    }

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        setupBindings() //
        cryptoVM.requestData(urlString: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/refs/heads/master/crypto.json")
        
    }
    
    private func setupBindings(){ // we observe the CryptoVM data here and do the required operations like changeing the data on the screen.
        
        cryptoVM
            .error
            .observe(on: MainScheduler.asyncInstance)
            .subscribe { errorString in
                print(errorString)
            }.disposed(by: disposeBag)
        
         cryptoVM
             .cryptos
             .observe(on: MainScheduler.asyncInstance)
             .subscribe { cryptos in
                 self.cryptoList = cryptos
                 self.tableView.reloadData()
             }
             .disposed(by: disposeBag)
         
        
        
         cryptoVM
            .loading
            .bind(to: self.indicatorView.rx.isAnimating)
            .disposed(by: disposeBag)
        
        
    }


}

