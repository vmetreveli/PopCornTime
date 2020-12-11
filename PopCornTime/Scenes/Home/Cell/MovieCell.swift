//
//  MovieCell.swift
//  PopCornTime
//
//  Created by vakhushti metreveli on 03.12.20.
//

import UIKit
import RxSwift
import RxCocoa
import SDWebImage


final class MovieCell: UITableViewCell{
   
     @IBOutlet weak var movieNameLabel: UILabel!
     @IBOutlet  weak var poster: UIImageView!
    // public let backgroundImageView = UIImageView()
    public let verticalStackView = UIStackView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        //layer.cornerRadius = 10
        //layer.masksToBounds = true
        layer.transform = CATransform3DMakeScale(1,1,1)
      //  setupViews()
      //  setupHierarchy()
        // setupLayouts()
        
    }
    
    
    
    private func setupViews() {
        //backgroundImageView
        [movieNameLabel!, verticalStackView].forEach(
            {
                $0.translatesAutoresizingMaskIntoConstraints = false
            })
        
        movieNameLabel!.font = .systemFont(ofSize: 18, weight: .regular)
        movieNameLabel!.textColor = .black
        verticalStackView.axis = .vertical
        verticalStackView.alignment = .trailing
    }
    
    private func setupHierarchy() {
        // self.contentView.addSubview(backgroundImageView)
        self.contentView.addSubview(verticalStackView)
        self.contentView.addSubview(movieNameLabel!)
        
        verticalStackView.addArrangedSubview(UIView())
        
    }
    
    
    func configCell(with viewModel: PopularMovieModel) {
        movieNameLabel!.text = viewModel.originalTitle
        poster.sd_setImage(with: URL(string: ("\(Constant.imagebaseURL)\(viewModel.posterPath!)")), placeholderImage: UIImage(named: "offer_placeholder"), options: .retryFailed, completed: nil)
    }
}

