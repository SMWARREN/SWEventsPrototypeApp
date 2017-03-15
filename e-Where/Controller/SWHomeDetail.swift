//
//  SWHomeDetail.swift
//  Events
//
//  Created by Sean Warren on 2/12/17.
//  Copyright © 2017 Sean Warren. All rights reserved.
//

import UIKit
import LBTAComponents
class SWHomeDetail: UIViewController {
    var image: String = ""
    var titleData: String = ""
    var imageLocal: String = ""
    var scale: UIViewContentMode? = nil
    var transform : CGAffineTransform? = CGAffineTransform(scaleX: 1, y: 0.5)
    var anchorPoint :  CGPoint? = CGPoint(x: 0.5, y: 1.0)
    


    var imageData = false
    var isTransformed: Bool = true
    let imageview: SWCachedImageView = {
        let theImageView = SWCachedImageView()
        theImageView.image = UIImage(named: "newexample2")
        theImageView.translatesAutoresizingMaskIntoConstraints = false
        theImageView.contentMode = .scaleAspectFill
        theImageView.clipsToBounds = true
        return theImageView
    }()
    init(image: String, titleData: String) {
        self.image = image
        self.titleData = titleData
        super.init(nibName: nil, bundle: nil)
        imageview.loadImage(urlString: self.image)
        self.navigationItem.title = self.titleData
         scale  = .scaleToFill
 
        
    }
    init(imageLocal: String, titleData: String) {
        self.imageLocal = imageLocal
        self.titleData = titleData
        super.init(nibName: nil, bundle: nil)
        imageview.image = UIImage(named: self.imageLocal)
        self.navigationItem.title = self.titleData
        scale  = .scaleAspectFit
        
        transform = CGAffineTransform(scaleX: 0.5, y: 0.52)
          anchorPoint  = CGPoint(x: 0.5, y: 1.0)
        

    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var scrollView: UIScrollView!

    var profile: ProfileView!
    
    
    let dividerLineView2: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.backgroundColor = UIColor.white
        view.addSubview(scrollView)
        scrollView.addSubview(imageview)
 
         scrollView.addSubview(dividerLineView2)
        
        profile = ProfileView(frame: CGRect.zero)
        scrollView.addSubview(profile)
        let estimatedH =  "\(profile.textLabelMore.text)".heightWithConstrainedWidth(width: view.bounds.width - 60,
        font: UIFont(name: "Avenir-Light", size: 16)!)
        scrollView.contentSize = CGSize(width: view.frame.width, height: 680 + estimatedH)
        imageview.anchor( scrollView.topAnchor, left:  view.leftAnchor,
                         bottom:  view.bottomAnchor, right:  view.rightAnchor,
                         topConstant: 0, leftConstant: 0, bottomConstant: 0,
                         rightConstant: 0, widthConstant: 0, heightConstant: 0)
     
        

        profile.anchor(scrollView.topAnchor, left: view.leftAnchor,
                       bottom:  nil, right: view.rightAnchor,
                       topConstant: 250, leftConstant: 0, bottomConstant: 0,
                       rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
                 dividerLineView2.anchor(profile.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 49, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 3)
        self.jumpToTop()
    }
    func goBack() {
    self.dismiss(animated: false, completion: nil)
    }
    func iconsAnimations() {
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 10,
                       initialSpringVelocity: 2, options: .curveEaseInOut, animations: {
                        self.profile.like.alpha = 1
        }, completion: { _ in
              self.profile.dislike.alpha = 1
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 10,
                           initialSpringVelocity: 0.80, options: .curveEaseIn, animations: {

                            self.profile.love.alpha = 1
            }, completion: { _ in
                self.profile.share.alpha = 1
            })
            
        })
        
       

    }
    func jumpToTop() {
        if isTransformed {
             isTransformed = false
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1,
                           initialSpringVelocity: 2, options: .curveEaseIn, animations: {
               self.imageview.transform = self.transform!
               self.imageview.layer.anchorPoint = self.anchorPoint!
                self.imageview.contentMode = self.scale!
                self.iconsAnimations()
                            
    
            }, completion: { _ in
                self.profile.dividerLineView2.alpha = 1
                self.profile.dividerLineView.alpha = 1
                self.profile.textLabelName.alpha = 1
                self.profile.textLabelName.alpha = 1
                self.profile.secondaryLabel.alpha = 1
                self.profile.userProfileImage.alpha = 1
                self.profile.aboutLabel.alpha = 1
                self.profile.textLabelMore.alpha = 1
                self.profile.userNameLabel.alpha = 1
            })

        } else {
            isTransformed = true
            self.imageview.transform = CGAffineTransform.identity
            self.imageview.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)

            self.imageview.contentMode = .scaleAspectFill
         }

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension String {
    func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin,
                                            attributes: [NSFontAttributeName: font], context: nil)
        return boundingBox.height
    }
}
