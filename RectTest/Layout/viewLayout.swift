import Foundation
import UIKit

class viewLayout: UIView {
    
    var view: UIView!
    @IBOutlet weak var firstIcon: UIButton!
    @IBOutlet weak var secondIcon: UIButton!
    
    override func prepareForInterfaceBuilder() {
        let bundle = Bundle(for: viewLayout.self)
        
        let bell1 = UIImage(named: "notification", in: bundle, compatibleWith: nil)
        let bell2 = UIImage(named: "notification", in: bundle, compatibleWith: nil)
        
        firstIcon.setImage(bell1, for: .normal)
        secondIcon.setImage(bell2, for: .normal)
    }
    
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
        let nib = UINib(nibName: "viewLayout", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
}
