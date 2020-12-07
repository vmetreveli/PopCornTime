//
//  Reactive+Ex.swift
//  PopCornTime
//
//  Created by vakhushti metreveli on 07.12.20.
//
import UIKit
import RxCocoa
import RxSwift

extension Reactive where Base: UITableView {
    func isEmpty(message: String) -> Binder<Bool> {
        return Binder(base) { tableView, isEmpty in
            if isEmpty {
                tableView.setNoDataPlaceholder(message)
            } else {
                tableView.removeNoDataPlaceholder()
            }
        }
    }
    
    func isEmpty(image: UIImage) -> Binder<Bool> {
        return Binder(base) { tableView, isEmpty in
            if isEmpty {
                tableView.isScrollEnabled = false
                tableView.separatorStyle = .none
                tableView.backgroundView = UIImageView(image: image)
            } else {
                tableView.removeNoDataPlaceholder()
            }
        }
    }
}
