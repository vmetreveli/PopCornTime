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
    let refreshControl = UIRefreshControl()
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Stored properties
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        title =  "Popular Movies"
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 250
        
        refreshControl.tintColor = UIColor(red:0.25, green:0.72, blue:0.85, alpha:1.0)
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        loadData()
        
    }
    
    func bindViewModel() {
        tableView.refreshControl = refreshControl
        tableView.estimatedRowHeight = 250
        
        viewModel.dataSource
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
        

     
    }
    override func viewWillAppear(_ animated: Bool) {
        loadData()
    }
    
    
    func loadData(){
        viewModel.loadPopularMovies()
            .subscribe(onNext:
                        { [weak self] data in
                            self?.viewModel.dataSource.accept(data)
                            self?.refreshControl.endRefreshing()

                        })
    }
    
    
    @objc func refresh(_ sender: AnyObject) {
        loadData()
    }
   
}


