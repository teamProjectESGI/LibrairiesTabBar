//
//  RectViewController.swift
//  RectTest
//
//  Created by TDSV on 19/01/2019.
//  Copyright © 2019 TDSV. All rights reserved.
//

import UIKit

class RectViewController: UIViewController {
    
    @IBOutlet weak var tabBarSubview: viewLayout!
    @IBOutlet weak var firstIcon: UIButton!
    @IBOutlet weak var secondIcon: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vLayout = VerticalLayout(width: 50 * self.screeWidth / 100, height: self.screenHeight )
        vLayout.backgroundColor = UIColor.cyan
        view.addSubview(vLayout)

        let image1 = UIImage(named: "notification")
        let button1 = UIButton()
        let test1 = image1?.resizedImage(newSize: CGSize(width: 30, height: 30))
        button1.frame = CGRect(x: 0, y: 40 * screenHeight / 100, width: 150, height: 100)
        button1.setTitle("Home", for: [])
        button1.setTitleColor(.black, for: [])
        button1.titleEdgeInsets = UIEdgeInsets(top: 0, left: 60, bottom: 0, right: 0)
        button1.setImage(test1, for: .normal)
        button1.addTarget(self, action:#selector(RectViewController.imageButtonTapped(_:)), for: .touchUpInside)
        vLayout.addSubview(button1)

        let image2 = UIImage(named: "notification")
        let test2 = image2?.resizedImage(newSize: CGSize(width: 30, height: 30))
        let button2 = UIButton(frame: CGRect(x: 0, y: 20 * screenHeight / 100, width: 200, height: 100))
        button2.setTitle("Notification", for: [])
        button2.setTitleColor(.black, for: [])
        button2.titleEdgeInsets = UIEdgeInsets(top: 0, left: 60, bottom: 0, right: 0)
        button2.setImage(test2, for: .normal)
        vLayout.addSubview(button2)
        
        
    }
    
    @objc func imageButtonTapped(_ sender:UIButton!) {
        
    }
}

extension RectViewController {
    public var screeWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
}

extension UIImage {
    @discardableResult
    func resizedImage(newSize: CGSize) -> UIImage {
        // Guard newSize is different
        guard self.size != newSize else { return self }
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0);
        self.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
}
