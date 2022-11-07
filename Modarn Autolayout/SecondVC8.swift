//
//  SecondVC7.swift
//  Modarn Autolayout
//
//  Created by Pavlov Matvey on 06.11.2022.
//

import UIKit

class SecondVC8: UIViewController {
    
    private enum ViewMetrics {
        static let margin: CGFloat = 20.0
        static let nameFontSize: CGFloat = 18.0
        static let bioFontSize: CGFloat = 17.0
    }
    
    var profile: Profile? {
        didSet {
            configureView()
        }
    }
    
    let sueName = Profile(name: "Sue Appleseed", bio: "Deep sea diver. Donut maker. Tea drinker.", avatar: UIImage(named: "300x300"))
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: ViewMetrics.nameFontSize)
        label.numberOfLines = 0
        label.setContentHuggingPriority(.defaultLow + 1, for: .vertical)
        return label
    }()
    
    private let bioLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: ViewMetrics.bioFontSize)
        label.numberOfLines = 0
        return label
    }()
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .top
        imageView.setContentHuggingPriority(.defaultLow + 1, for: .horizontal)
        return imageView
    }()
    
    private lazy var labelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, bioLabel])
        stackView.axis = .vertical
        stackView.spacing = UIStackView.spacingUseSystem
        return stackView
    }()
    
    private lazy var profileStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [profileImageView, labelStackView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = UIStackView.spacingUseSystem
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configureView()
    }
    
    private func setupView() {
        profile = sueName
        view.backgroundColor = UIColor(red: 0.3, green: 0.8, blue: 0.8, alpha: 1.0)
        view.directionalLayoutMargins = NSDirectionalEdgeInsets(top: ViewMetrics.margin, leading: ViewMetrics.margin, bottom: ViewMetrics.margin, trailing: ViewMetrics.margin)
        view.addSubview(profileStackView)
        
        let margin = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            profileStackView.leadingAnchor.constraint(equalTo: margin.leadingAnchor),
            profileStackView.topAnchor.constraint(equalTo: margin.topAnchor),
            profileStackView.trailingAnchor.constraint(equalTo: margin.trailingAnchor)
        ])
    }
    
    private func configureView() {
        if let image = profile?.avatar {
            profileImageView.image = image
        } else {
            profileImageView.image = UIImage(named: "placeholder")
        }
        
        title = profile?.name
        nameLabel.text = profile?.name
        bioLabel.text = profile?.bio
    }
}

struct Profile {
    let name: String
    let bio: String
    let avatar: UIImage?
}


