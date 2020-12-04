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
        
       
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 250
        
        viewModel.loadPopularMovies().subscribe(onNext: { data in
            self.movieList = data
        }).disposed(by: disposeBag)
    }
    
    
    
    func bindViewModel() {
     //   tableView.register(MovieCell.self, forCellReuseIdentifier: "Cell")
      //  tableView.register(UINib(nibName: "MovieCellView", bundle: nil), forCellReuseIdentifier: "Cell")
        // Set tableview delegate. (for setting table view cell height)
//        tableView.rx
//               .setDelegate(self)
//               .disposed(by: disposeBag)
               //cellIdentifier: "Cell", cellType: MovieCell.self)
           // Bind fruit dictionary and tableview.
//        viewModel.loadPopularMovies().asObservable()
//            .bind(to: tableView.rx.items) { (tableView: UITableView, index: Int, element: PopularMovieModel)  -> MovieCell  in
//               // let cell1 = self.tableView.dequeueReusableCell(withIdentifier: "EventCell") as! MovieCell
//                let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! MovieCell
//                cell.movieNameLabel.text = element.originalTitle
//                cell.selectionStyle = .none
//                return cell
//            }
//            .disposed(by: disposeBag)
//
//        tableView.tableFooterView = UIView()
        
        //        viewModel.loadPopularMovies().asObservable()
        //            .bind(to: tableView.rx.items(cellIdentifier: "Cell", cellType: MovieCell.self)) { (row, element, cell) in
        //
        //             //  cell.textLabel?.text = "\(element) @ row \(row)"
        //           //  let cell1 = cell as! MovieCell//tableView.dequeueReusableCell(withIdentifier: "EventCell", for: row) as! EventCell
        //                //cell.update(with: eventCellViewModel)
        //               // cell1.update(with: cell)
        //                //cell.configCell(with: element)
        //                cell.movieNameLabel.text = element.originalTitle
        //                //print(element)
        //                cell.selectionStyle = .none
        //
        //            }
        //            .disposed(by: disposeBag)
        //        viewModel.loadPopularMovies().subscribe(onNext: { data in
        //
        //            self.items.onNext([SectionOfPopularMovie(model: .main, items: data)])
        //        })
        //
        //
        //        items.bind(to: tableView.rx.items(dataSource: dataSource))
        //                .disposed(by: disposeBag)
    }
    
    @IBAction func onTap(_ sender: Any) {
//        viewModel.loadPopularMovies().subscribe(onNext: { data in
//            // print(data[0].originalTitle)
//        })
//        .disposed(by: disposeBag)
    }
    
   
}


extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return movieList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = movieList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.identifier) as! MovieCell

        //cell.movieNameLabel.text = movie.originalTitle
       // cell.textLabel?.text = movie.originalTitle
        cell.configCell(with: movie)
        
        
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      //  let movie = movieList[indexPath.row]
    }
}

