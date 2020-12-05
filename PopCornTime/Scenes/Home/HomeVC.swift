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
    var movieList: [PopularMovieModel] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Stored properties
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 250
        
    }
    
    func bindViewModel() {
        viewModel.loadPopularMovies().asObservable()
            .bind(to: tableView.rx.items) { (tableView, row, element) in
                let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.identifier) as! MovieCell
                cell.configCell(with: element)
                cell.selectionStyle = .none
                return cell
            }
            .disposed(by: disposeBag)
        
        tableView.rx.modelSelected(PopularMovieModel.self)
               .subscribe(onNext: { [weak self] item in
                   // other actions with Item object
                self?.viewModel.detailAction.execute(item)
               }).disposed(by: disposeBag)
        
//        tableView.rx.modelSelected(PopularMovieModel.self)
//            .bind(to: viewModel.showDetailTrigger)
//            .disposed(by: disposeBag)
//
     
    }
    
 
    
    
}


