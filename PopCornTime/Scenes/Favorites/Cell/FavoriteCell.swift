//
//  FavoriteCell.swift
//  PopCornTime
//
//  Created by vakhushti metreveli on 05.12.20.
//

import UIKit
import RxSwift
import RxCocoa
import SDWebImage


final class FavoriteCell: UITableViewCell{
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet  weak var poster: UIImageView!
    public let backgroundImageView = UIImageView()
    public let verticalStackView = UIStackView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
  
    
    private func setupViews() {
        //backgroundImageView
        [movieNameLabel!,  verticalStackView].forEach(
            {
                $0.translatesAutoresizingMaskIntoConstraints = false
                
            })
        
        movieNameLabel!.font = .systemFont(ofSize: 34, weight: .bold)
        movieNameLabel!.textColor = .white
        verticalStackView.axis = .vertical
        verticalStackView.alignment = .trailing
    }
    
    private func setupHierarchy() {
        self.contentView.addSubview(verticalStackView)
        self.contentView.addSubview(movieNameLabel!)
        verticalStackView.addArrangedSubview(UIView())
    }
    
    private func setupLayouts() {
        verticalStackView.pinToSuperviewEdges([.top, .right, .bottom], constant: 15.0)
        movieNameLabel!.pinToSuperviewEdges([.left, .bottom], constant: 15.0)
    }
    
    func configCell(with viewModel: Favorites) {
        movieNameLabel!.text = viewModel.movieTitle
        poster.sd_setImage(with: URL(string: viewModel.moviePoster!), placeholderImage: UIImage(named: "offer_placeholder"), options: .retryFailed, completed: nil)
    }
}
