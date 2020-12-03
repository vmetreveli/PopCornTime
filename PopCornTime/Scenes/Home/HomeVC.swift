//
//  HomeVC.swift
//  PopCornTime
//
//  Created by vakhushti metreveli on 02.12.20.
//

import RxCocoa
import RxSwift
import UIKit

class HomeVC: UIViewController, BindableType {
    var viewModel: HomeVM!
    
    @IBOutlet weak var tableView: UITableView!
    // MARK: Stored properties
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func bindViewModel() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        viewModel.loadPopularMovies().asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: "Cell", cellType: UITableViewCell.self)) { (row, element, cell) in
               cell.textLabel?.text = "\(element) @ row \(row)"
            }
            .disposed(by: disposeBag)

    }

    @IBAction func onTap(_ sender: Any) {
        viewModel.loadPopularMovies().subscribe(onNext: { data in
           // print(data[0].originalTitle)
        })
        .disposed(by: disposeBag)
    }
}
