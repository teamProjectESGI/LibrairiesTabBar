//
//  RectViewController.swift
//  RectTest
//
//  Created by TDSV on 19/01/2019.
//  Copyright © 2019 TDSV. All rights reserved.
//

import UIKit

class RectViewController: UIViewController {
    private var arrayView: [UIView] = []
    private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView(frame: CGRect(x: 200, y: 300, width: 150, height: 300))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        tableView.dataSource = self
        //myTableView.delegate = self
        tableView.backgroundColor = UIColor.gray.withAlphaComponent(0.1)
        tableView.isHidden = true
        self.view.addSubview(tableView)
        
        let vLayout = VerticalLayout(width: 30 * self.screeWidth / 100, height: self.screenHeight )
        vLayout.backgroundColor = UIColor.cyan
        view.addSubview(vLayout)

        let image1 = UIImage(named: "home")
        let button1 = UIButton(frame:  CGRect(x: 0, y: 0, width: 110, height: 100))
        let test1 = image1?.resizedImage(newSize: CGSize(width: 30, height: 30))
        button1.setImage(test1, for: .normal)

        let image2 = UIImage(named: "notification")
        let test2 = image2?.resizedImage(newSize: CGSize(width: 30, height: 30))
        let button2 = UIButton(frame: CGRect(x: 0, y: 0, width: 110, height: 100))
        button2.setImage(test2, for: .normal)
        
        let image3 = UIImage(named: "contact")
        let test3 = image3?.resizedImage(newSize: CGSize(width: 30, height: 30))
        let button3 = UIButton(frame: CGRect(x: 0, y: 0, width: 110, height: 100))
        button3.setImage(test3, for: .normal)
        
        let image4 = UIImage(named: "envelope")
        let test4 = image4?.resizedImage(newSize: CGSize(width: 30, height: 30))
        let button4 = UIButton(frame: CGRect(x: 0, y: 0, width: 110, height: 100))
        button4.setImage(test4, for: .normal)
        
        let image5 = UIImage(named: "time")
        let test5 = image5?.resizedImage(newSize: CGSize(width: 30, height: 30))
        let button5 = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
        button5.setImage(test5, for: .normal)
        
        let image6 = UIImage(named: "home")
        let test6 = image6?.resizedImage(newSize: CGSize(width: 30, height: 30))
        let button6 = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
        button6.setImage(test6, for: .normal)
        
        let imageMore = UIImage(named: "more")
        let testImageMore = imageMore?.resizedImage(newSize: CGSize(width: 30, height: 30))
        let buttonImageMore = UIButton(frame: CGRect(x: 0, y: 0, width: 110, height: 100))
        buttonImageMore.addTarget(self, action:#selector(RectViewController.buttonmore(_:)), for: .touchUpInside)
        buttonImageMore.setImage(testImageMore, for: .normal)

        let view1 = UIView()
        view1.backgroundColor = .red
        view1.addSubview(button1)

        let view2 = UIView()
        view2.backgroundColor = .blue
        view2.addSubview(button2)
        
        let view3 = UIView()
        view3.backgroundColor = .brown
        view3.addSubview(button3)
        
        let view4 = UIView()
        view4.backgroundColor = .yellow
        view4.addSubview(button4)
        
        let view5 = UIView()
        view5.backgroundColor = .green
        view5.addSubview(button5)
        
        let view6 = UIView()
        view6.backgroundColor = .blue
        view6.addSubview(button6)
        
        let viewImageMore = UIView()
        viewImageMore.backgroundColor = .green
        viewImageMore.addSubview(buttonImageMore)

        let stackView = UIStackView(arrangedSubviews: [view1, view2, view3, view4, view5, view6])
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        vLayout.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.widthAnchor.constraint(equalToConstant: 125).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 820).isActive = true
        stackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 80).isActive = true

        if(stackView.arrangedSubviews.count > 5 ) {
            view5.removeFromSuperview()
            view6.removeFromSuperview()
            stackView.addArrangedSubview(viewImageMore)
            print(stackView.arrangedSubviews.count)
        }
        
        self.arrayView.append(view5)
        self.arrayView.append(view6)
       
        
    }
    
    @objc func buttonmore(_ sender:UIButton!) {
        tableView.isHidden = !tableView.isHidden
    }
}

extension RectViewController {
    public var screeWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    public func getButtonMore(stackView: UIStackView, view: [UIView]) {
        if(stackView.arrangedSubviews.count > 5) {
            
        }
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

extension RectViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayView.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        // check if there is a view at the indexPath
        if indexPath.row < self.arrayView.count {
            // there is a view, add it to the cells contentView
            cell.contentView.addSubview(self.arrayView[indexPath.row])
        } else {
            print("no view at index")
        }
        cell.backgroundColor = UIColor.gray.withAlphaComponent(0)
        return cell
    }
    
    
}
