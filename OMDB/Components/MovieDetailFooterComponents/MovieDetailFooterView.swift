//
//  MovieDetailFooterView.swift
//  OMDB
//
//  Created by Emircan Aydın on 5.11.2021.
//

import UIKit

class MovieDetailFooterView: GenericBaseView<MovieDetailFooterViewData> {
    
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [directorLabel, writersLabel, actorsLabel, releasedDateLabel])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.alignment = .leading
        temp.distribution = .fill
        temp.axis = .vertical
        temp.spacing = 10
        return temp
    }()
    
    private lazy var directorLabel: UILabel = {
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
    
    private lazy var writersLabel: UILabel = {
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
    
    private lazy var actorsLabel: UILabel = {
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
    
    private lazy var releasedDateLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.textColor = .black
        temp.text = " "
        temp.contentMode = .left
        temp.textAlignment = .left
        temp.font = MainFont.regular(16).value
        return temp
    }()
    
    override func addMajorFields() {
        super.addMajorFields()
        addUserComponents()
    }
    
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
        directorLabel.text = data.director
        writersLabel.text = data.writers
        actorsLabel.text = data.actors
        releasedDateLabel.text = data.releasedDate
    }
}
