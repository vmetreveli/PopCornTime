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
    
    func bindViewModel() {
        viewModel.loadFavoritesMovies().asObservable()
            .bind(to: tableView.rx.items) { (tableView, row, element) in
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
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}
