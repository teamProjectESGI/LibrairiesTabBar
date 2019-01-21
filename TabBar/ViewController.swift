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
    
    override func viewDidLoad() {
        self.view.addSubview(tabBarSubview)
    }

    func buttonTaped(_sender:UIButton) {
        print("Button taped")
    }
    
    func buttonTaped2(sender: UIButton) {
        print("Button taped")

    }

}
