//
//  ViewController.swift
//  MagicTheGathering
//
//  Created by Ivan Kramarchuk on 09/09/2019.
//  Copyright © 2019 i0532386223.me. All rights reserved.
//

import UIKit

import RxCocoa
import RxSwift

class mainVC: UIViewController {
    
    @IBOutlet weak var searchText: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
        
    let cellIdentifier = "card"
    let minimumHeightRow: CGFloat = 100
    
    var cards: [Datum]?
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configuration table
        tableView.register(UINib(nibName: "CardTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        tableView.estimatedRowHeight = minimumHeightRow
        tableView.rowHeight = UITableView.automaticDimension
        tableView.dataSource = self
        
        searchText.rx.text
            .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .subscribe({ [unowned self] query in
                print("Search : \(query)")
                if let element = query.element {
                    self.loadData(query: element ?? "")
                }})
            .disposed(by: disposeBag)
    }
    
    func loadData(query: String) {
        indicator.startAnimating()
        networkService.getCards(searchText: query, completion: { [unowned self] (success, data) -> Void in
            self.cards = data
            self.tableView.reloadData()
            if self.tableView.numberOfRows(inSection: 0) > 0 {
                self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
            }
            self.indicator.stopAnimating()
            if (!success) {
                let alertController = UIAlertController(title: "Error", message:
                    "Sorry, the app cannot get data from the server", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                self.present(alertController, animated: true, completion: nil)
            }
        })
    }
    
}

extension mainVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let data = self.cards else {
            return 0
        }
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CardTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! CardTableViewCell
        if let items = self.cards {
            if items.count > indexPath.row {
                let item = items[indexPath.row]
                cell.cardName.text = item.name
                var text = ""
                if let oracleText = item.oracleText {
                    text = oracleText
                }
                if text.count == 0 {
                    if let cardFaces = item.cardFaces {
                        if cardFaces.count > 0 {
                            let oracleText = cardFaces[0].oracleText
                            text = oracleText ?? ""
                        }
                    }
                }
                cell.cardText.text = text
                var imagePath = ""
                if let imageUris = item.imageUris {
                    if let small = imageUris.small {
                        imagePath = small
                    }
                }
                if imagePath.count == 0 {
                    if let cardFaces = item.cardFaces {
                        if cardFaces.count > 0 {
                            if let imageUris = cardFaces[0].imageUris {
                                if let small = imageUris.small {
                                    imagePath = small
                                }
                            }
                        }
                    }
                }
                cell.cardImage.image = nil
                if imagePath.count > 0 {
                    networkService.placeImage(imagePath: imagePath, cardImage: cell.cardImage)
                } else {
                    cell.cardImage.image = noPhotoImage
                }
                cell.cardImage.contentMode = .scaleAspectFit
            }
        }
        return cell
    }
    
}


