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
    
    fileprivate var notchView = UIView()
    fileprivate var notchViewBottomConstraint: NSLayoutConstraint!
    fileprivate var numberOfItemsInSection = 1
    
    
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
               // cell.animation()
               
                return cell
            }
            .disposed(by: disposeBag)
        
        tableView.rx.modelSelected(PopularMovieModel.self)
               .subscribe(onNext: { [weak self] item in
                   // other actions with Item object
                self?.viewModel.detailAction.execute(item)
               }).disposed(by: disposeBag)
        
//        tableView.rx.itemSelected
//          .subscribe(onNext: { [weak self]indexPath in
//            let cell = self?.tableView.cellForRow(at: indexPath) as? MovieCell
//            //cell.button.isEnabled = false
//            
//            UIView.animate(withDuration: 0.3, animations: {
//                cell?.layer.transform = CATransform3DMakeScale(1.5,1.5,1.5)
//                   },completion: { finished in
//                    UIView.animate(withDuration: 0.3, animations: {
//                        cell?.layer.transform = CATransform3DMakeScale(1,1,1)
//                       // cell.layer.transform = CATransform3DMakeScale(0.1,0.1,1)
//                       })
//               })
//          }).disposed(by: disposeBag)
        

     
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


