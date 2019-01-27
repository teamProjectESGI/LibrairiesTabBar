//
//  ViewController.swift
//  TabBar
//
//  Created by under on 20/01/2019.
//  Copyright © 2019 under. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //@IBOutlet weak var tabBarSubview: CustomView!
    
    var tabBar: TabBar { return self.view as! TabBar}
    
    
    /*override func viewDidLoad() {
        self.view.addSubview(tabBarSubview)
    }*/
    
    override func loadView() {
        self.view = TabBar(frame: UIScreen.main.bounds)
    }

    

}

class TabBar: UIView {
    var screensize: CGRect = UIScreen.main.bounds
    var imageButtonWidth: Double = 0.0
    var imageButtonHeight: Double = 0.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        imageButtonWidth = Double(screensize.width * 0.2)
        imageButtonHeight = Double(screensize.height * 0.2)
        
        
        self.setupViews()
        self.setupConstraintsView(height: 100, isBottom: true)
        self.setupConstraintsButton(height: CGFloat(imageButtonWidth), isBottom: true, item: item1)
        self.setupConstraintsButton(height: CGFloat(imageButtonWidth), isBottom: true, item: item2)
        self.setupConstraintsButton(height: CGFloat(imageButtonWidth), isBottom: true, item: item3)
        self.setupConstraintsButton(height: CGFloat(imageButtonWidth), isBottom: true, item: item4)
        self.setupConstraintsButton(height: CGFloat(imageButtonWidth), isBottom: true, item: item5)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.addSubview(contentView)
        let stackView = UIStackView(arrangedSubviews: [item1, item2, item3, item4, item5])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.autoresizingMask = [.flexibleHeight]

    }
    
    func setupConstraintsView(height: CGFloat, isBottom: Bool) {
        self.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        if(isBottom) {
            contentView.heightAnchor.constraint(equalToConstant: height).isActive = true
            contentView.leftAnchor.constraint(equalToSystemSpacingAfter: self.leftAnchor, multiplier: 0).isActive = true
            contentView.rightAnchor.constraint(equalToSystemSpacingAfter: self.rightAnchor, multiplier: 0).isActive = true
            contentView.bottomAnchor.constraint(equalToSystemSpacingBelow: self.safeAreaLayoutGuide.bottomAnchor, multiplier: 0).isActive = true
        } else {
            contentView.topAnchor.constraint(equalToSystemSpacingBelow: self.safeAreaLayoutGuide.topAnchor, multiplier: 0).isActive = true
            contentView.leftAnchor.constraint(equalToSystemSpacingAfter: self.leftAnchor, multiplier: 0).isActive = true
            contentView.widthAnchor.constraint(equalToConstant: height).isActive = true
            contentView.bottomAnchor.constraint(equalToSystemSpacingBelow: self.safeAreaLayoutGuide.bottomAnchor, multiplier: 0).isActive = true
        }
        
    }
    func setupConstraintsButton(height: CGFloat, isBottom: Bool, item: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        item.translatesAutoresizingMaskIntoConstraints = false
        if(isBottom) {
            item.heightAnchor.constraint(equalToConstant: height).isActive = true
            item.widthAnchor.constraint(equalToConstant: height).isActive = true
            item.autoresizingMask = [.flexibleHeight]
        } else {
            item.heightAnchor.constraint(equalToConstant: height).isActive = true
            item.widthAnchor.constraint(equalToConstant: height).isActive = true
            item.autoresizingMask = [.flexibleWidth]
        }
        
    }
    
    let contentView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }()
    
    let item1: UIView = {
        let item = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        item.backgroundColor = UIColor.black
        return item
    }()
    
    let item2: UIView = {
        let item = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        item.backgroundColor = UIColor.blue
        return item
    }()
    
    let item3: UIView = {
        let item = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        item.backgroundColor = UIColor.yellow
        return item
    }()
    
    let item4: UIView = {
        let item = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        item.backgroundColor = UIColor.red
        return item
    }()
    
    let item5: UIView = {
        let item = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        item.backgroundColor = UIColor.brown
        return item
    }()
}
