//
//  FavoritesVC.swift
//  PopCornTime
//
//  Created by vakhushti metreveli on 05.12.20.
//

import RxCocoa
import RxSwift
import RxCocoa
import UIKit

class FavoritesVC: UIViewController, BindableType {
    var viewModel: FavoritesVM!
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak var tableView: UITableView!
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl.attributedTitle = NSAttributedString(string: "refresh")
        refreshControl.tintColor = UIColor(red:0.25, green:0.72, blue:0.85, alpha:1.0)
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        loadData()
    }
    
    func bindViewModel() {
        
      
        tableView.refreshControl = refreshControl
        tableView.estimatedRowHeight = 250
      
        viewModel.dataSource.bind(to: tableView.rx.items) { (tableView, row, element) in
            let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteCell.identifier) as! FavoriteCell
            cell.configCell(with: element)
            cell.selectionStyle = .none
            return cell
        }
        .disposed(by: disposeBag)
        
        
        tableView.rx.modelSelected(Favorites.self)
            .subscribe(onNext: { [weak self] item in
                // other actions with Item object
                self?.viewModel.detailAction.execute(item)
            }).disposed(by: disposeBag)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        loadData()
    }
    
    
    @objc func refresh(_ sender: AnyObject) {
        loadData()
    }
    
    func loadData(){
        viewModel.loadFavoritesMovies()
            .subscribe(onNext:
                        { [weak self] data in
                            self?.viewModel.dataSource.accept(data)
                            self?.refreshControl.endRefreshing()

                        })
    }
}
