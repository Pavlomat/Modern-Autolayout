//
//  TileView.swift
//  Modarn Autolayout
//
//  Created by Pavlov Matvey on 27.10.2022.
//

import UIKit
@IBDesignable //позволяет показывать созданные в коде элементы в Interface Builder

class TileView: UIView {
    
    private let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    private let blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    @IBInspectable var padding: CGFloat = 25.0 { //@IBInspectable - если бы был Interface builder то этот парметр можно менять прям в нем
        didSet {
            setNeedsLayout()
        }
    }
    
    override init(frame: CGRect) { //CGRect используется если view создается в коде
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) { //NSCoder используется есть view создается через xib или storyboard
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        addSubview(blueView)
        addSubview(redView)
    }
    
    override func layoutSubviews() { super.layoutSubviews()
        // Size of this container view
        let containerWidth = bounds.width
        let containerHeight = bounds.height
        
        // Calculate width and height of each item
        // including the padding
        let numberOfItems: CGFloat = 2
        
        let itemWidth = (containerWidth - (numberOfItems + 1) * padding) / numberOfItems
        let itemHeight = containerHeight - 2 * padding
        
        // Set the frames of the two subviews
        blueView.frame = CGRect(x: padding, y: padding, width: itemWidth, height: itemHeight)
        redView.frame = CGRect(x: 2 * padding + itemWidth, y: padding, width: itemWidth, height: itemHeight)
    }
    
}
