//
//  ViewController.swift
//  DummyApp
//
//  Created by Ilgar Ilyasov on 10/25/22.
//

import UIKit
import Cosmos

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    lazy var ratingSettings: CosmosSettings = {
        var settings = CosmosSettings()
        settings.fillMode = .full
        settings.minTouchRating = 1.0
        settings.totalStars = 5
        settings.textColor = .black
        settings.textMargin = 10.0
        settings.textFont = .italicSystemFont(ofSize: 18)
        settings.starSize = 20
        settings.starMargin = 2
        return settings
    }()
    
    lazy var ratingView: CosmosView = {
        var ratingView = CosmosView(settings: ratingSettings)
        ratingView.translatesAutoresizingMaskIntoConstraints = false
        return ratingView
    }()
    
    
    /* Maintains consistency with the existing
     "Done" string across most languages,
     and provides a concise translation
    "ShortenedViewer" =
     "Done"; */

    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutRatingView()
        handleRatingAction()
    }
    
    
    // MARK: - Helper methods
    
    private func layoutRatingView() {
        view.addSubview(ratingView)
        
        NSLayoutConstraint.activate([
            ratingView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            ratingView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func handleRatingAction() {
        ratingView.didFinishTouchingCosmos = { rating in
            print(rating)
        }
        
        ratingView.didTouchCosmos = { rating in
            print(rating)
        }
    }
}

