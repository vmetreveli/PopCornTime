//
//  DetailVC.swift
//  PopCornTime
//
//  Created by vakhushti metreveli on 04.12.20.
//

import Foundation
import UIKit
import SDWebImage
import PanModal
import RxCocoa
import RxSwift

class DetailVC: UIViewController, BindableType {
    var viewModel: DetailVM!
    // MARK: Stored properties
    private let disposeBag = DisposeBag()
    
    var contentSize: CGFloat = 0
    @IBOutlet weak var imoviePoster: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var descriptionLabel: CustomTextView!
    @IBOutlet weak var progressBar: CircularProgressBar!
    @IBOutlet weak var titleLabel: UILabel!
    
  //  @IBOutlet weak var newPriceLabel: CustomLabel!
    
    func bindViewModel() {
        btnBack.rx.tap
                .bind {
                    self.viewModel.closeAction.execute()
                }
                .disposed(by: disposeBag)
   
    }
    //==============================================================
    //    MARK: - LiveCycle
    //==============================================================
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        imoviePoster.sd_setImage(with: URL(string: ("\(Constant.imagebaseURL)\(viewModel.movie.posterPath!)")), placeholderImage: UIImage(named: "offer_placeholder"), options: .retryFailed, completed: nil)
        descriptionLabel.text = viewModel.movie.overview
        titleLabel.text = viewModel.movie.title
        progressBar.labelSize = 15
    
        self.progressBar.setProgress(to:  viewModel.movie.voteAverage! / 10, withAnimation: true)
       
        panModalSetNeedsLayoutUpdate()
    }
  
}

//==============================================================
//    MARK: - PanModalPresentable
//==============================================================

extension DetailVC: PanModalPresentable {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    var panScrollable: UIScrollView? {
        return self.scrollView
    }

    var longFormHeight: PanModalHeight {
        scrollView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return .contentHeight(min(contentSize, UIScreen.main.bounds.height))
    }
    
    
    
    
    
    //    var anchorModalToLongForm: Bool {
    //        return false
    //    }
    //
    //    var shouldRoundTopCorners: Bool {
    //        return true
    //    }
    //
    //    var allowsDragToDismiss: Bool {
    //        return true
    //    }
    //
    //    var allowsTapToDismiss: Bool {
    //        return true
    //    }
    //
    //     var isUserInteractionEnabled: Bool {
    //           return true
    //       }
    //
    //     var showDragIndicator: Bool {
    //         return true
    //     }
    }
