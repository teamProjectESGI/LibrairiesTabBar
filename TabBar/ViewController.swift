//
//  ViewController.swift
//  TabBar
//
//  Created by under on 20/01/2019.
//  Copyright © 2019 under. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tabBarSubview: CustomView!
    
    var tabBar: TabBar { return self.view as! TabBar}
    
    /*override func viewDidLoad() {
        self.view.addSubview(tabBarSubview)
    }*/
    
    override func loadView() {
        self.view = TabBar(frame: UIScreen.main.bounds)
    }

    func buttonTaped(_sender:UIButton) {
        print("Button taped")
    }
    
    func buttonTaped2(sender: UIButton) {
        print("Button taped")

    }

}

class TabBar: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        self.setupViews()
        self.setupConstraints(height: 100, isBottom: false)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.addSubview(contentView)
        self.addSubview(item1)
    }
    
    func setupConstraints(height: CGFloat, isBottom: Bool) {
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
    
    let contentView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }()
    
    let item1: UIButton = {
        let item = UIButton(type: .system)
        item.setTitle("Home", for: .normal)
        return item
    }()
}
