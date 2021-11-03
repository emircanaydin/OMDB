//
//  SplashViewController.swift
//  OMDB
//
//  Created by Emircan Aydın on 3.11.2021.
//

import Foundation
import UIKit

class SplashViewController: BaseViewController<SplashViewModel> {
    
    private lazy var image: UIImageView = {
        let temp = UIImageView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = false
        temp.image = PageViewImages.defaultSplashBackground.value
        temp.contentMode = .scaleAspectFill
        return temp
    }()
    
    private lazy var splashLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.text = " "
        temp.font = MainFont.medium(32).value
        temp.textColor = .white
        return temp
    }()
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        appendComponents()
        subscribeSplashViewState()
    }
    
    private func subscribeSplashViewState() {
        viewModel.subscribeSplashViewState { [weak self] state in
            switch state {
            case .noInternet:
                let alert = UIAlertController(title: "Error!", message: "Please check your internet connection.", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                DispatchQueue.main.async {
                    self?.present(alert, animated: true, completion: nil)
                }
                
                break
            case .loading:
                self?.viewModel.subscribeRemoteConfigManager()
            case .done(let splashText):
                DispatchQueue.main.async {
                    self?.splashLabel.text = splashText
                }
            }
        }
    }
    
    private func appendComponents() {
        view.addSubview(image)
        view.addSubview(splashLabel)
        
        NSLayoutConstraint.activate([
        
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            image.topAnchor.constraint(equalTo: view.topAnchor),
            image.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            splashLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            splashLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -200)
        ])
    }
    
}
