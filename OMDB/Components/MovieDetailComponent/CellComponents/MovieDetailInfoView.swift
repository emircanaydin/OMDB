//
//  MovieDetailInfoView.swift
//  OMDB
//
//  Created by Emircan Aydın on 5.11.2021.
//

import UIKit

class MovieDetailInfoView: GenericBaseView<MovieDetailInfoViewData> {
    
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [genreLabel, plotLabel])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.alignment = .leading
        temp.distribution = .fill
        temp.axis = .vertical
        temp.spacing = 10
        return temp
    }()
    
    private lazy var genreLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.textColor = .black
        temp.text = " "
        temp.lineBreakMode = .byWordWrapping
        temp.numberOfLines = 0
        temp.contentMode = .left
        temp.textAlignment = .left
        temp.font = MainFont.regular(16).value
        return temp
    }()
    
    private lazy var plotLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.textColor = .black
        temp.text = " "
        temp.lineBreakMode = .byWordWrapping
        temp.numberOfLines = 0
        temp.contentMode = .left
        temp.textAlignment = .left
        temp.font = MainFont.regular(16).value
        return temp
    }()
    
    private func addUserComponents() {
        addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
        
            mainStackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        
        ])
        
    }
    
    override func loadDataToView() {
        super.loadDataToView()
        
        guard let data = returnData() else { return }
        genreLabel.text = data.genre
        plotLabel.text = data.plot
    }
}
