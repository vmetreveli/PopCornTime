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
    public let backgroundImageView = UIImageView()
    public let verticalStackView = UIStackView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       // holderView.backgroundColor = .white
        //holderView.layer.cornerRadius = 12
    }
    
    
    // Make disposbag empty for reusing cell.
    
    //    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    //        super.init(style: style, reuseIdentifier: reuseIdentifier)
    //        setupViews()
    //        setupHierarchy()
    //        setupLayouts()
    //    }
    
        @objc class var identifier: String {
            return String(describing: self)
        }
    
    //    required init?(coder: NSCoder) {
    //        fatalError("init(coder:) has not been implemented")
    //    }
    
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
        // self.contentView.addSubview(backgroundImageView)
        self.contentView.addSubview(verticalStackView)
        self.contentView.addSubview(movieNameLabel!)
        
        verticalStackView.addArrangedSubview(UIView())
        
    }
    
    private func setupLayouts() {
        //        backgroundImageView.pinToSuperviewEdges([.left, .top, .right])
        //        let bottomConstraint = backgroundImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        //        bottomConstraint.priority = .required - 1
        //        bottomConstraint.isActive = true
        //
        //        backgroundImageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        verticalStackView.pinToSuperviewEdges([.top, .right, .bottom], constant: 15.0)
        movieNameLabel!.pinToSuperviewEdges([.left, .bottom], constant: 15.0)
        
    }
    
    func configCell(with viewModel: PopularMovieModel) {
        
        movieNameLabel!.text = viewModel.originalTitle
    
        poster.sd_setImage(with: URL(string: ("\(Constant.imagebaseURL)\(viewModel.posterPath!)")), placeholderImage: UIImage(named: "offer_placeholder"), options: .retryFailed, completed: nil)
  
    }
}

