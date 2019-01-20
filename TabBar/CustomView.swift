//
//  CustomView.swift
//  TabBar
//
//  Created by under on 20/01/2019.
//  Copyright © 2019 under. All rights reserved.
//

import UIKit

@IBDesignable class CustomView: UIView {

    @IBOutlet weak var firstIcon: UIButton!
    @IBOutlet weak var secondIcon: UIButton!
    @IBOutlet weak var thirdIcon: UIButton!
    @IBOutlet weak var fourthIcon: UIButton!
    @IBOutlet weak var fifthIcon: UIButton!
    
    var view: UIView!
    
   override func prepareForInterfaceBuilder() {
        let designTimeBundle = Bundle(for: CustomView.self)
        
        let homeIcon = UIImage(named: "home", in: designTimeBundle, compatibleWith: nil)
        let profileIcon = UIImage(named: "profile", in: designTimeBundle, compatibleWith: nil)
        let folderIcon = UIImage(named: "folder", in: designTimeBundle, compatibleWith: nil)
        let infoIcon = UIImage(named: "info", in: designTimeBundle, compatibleWith: nil)
        let settingsIcon = UIImage(named: "settings", in: designTimeBundle, compatibleWith: nil)
        
        firstIcon.setImage(homeIcon, for: .normal)
        secondIcon.setImage(profileIcon, for: .normal)
        thirdIcon.setImage(folderIcon, for: .normal)
        fourthIcon.setImage(infoIcon, for: .normal)
        fifthIcon.setImage(settingsIcon, for: .normal)
    }
    
    /*@IBInspectable var firstButtonIcon: UIButton {
        let bundle = Bundle(for: CustomView.self)
        let image = UIImage(named: "home", in: bundle, compatibleWith: nil)
       firstIcon.setImage(image, for: .normal)
        
        return firstIcon
    }*/

    
    /*@IBInspectable var fifthButtonIcon: UIButton! {
        let bundle = Bundle(for: CustomView.self)
        let image = UIImage(named: "settings", in: bundle, compatibleWith: nil)
        fifthIcon.setImage(image, for: .normal)
        
        return fifthIcon
    }*/
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setup()
    }
    
    func setup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = UIView.AutoresizingMask(rawValue:
            UIView.AutoresizingMask.flexibleWidth.rawValue |
                UIView.AutoresizingMask.flexibleHeight.rawValue)
        
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "CustomView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }

}
