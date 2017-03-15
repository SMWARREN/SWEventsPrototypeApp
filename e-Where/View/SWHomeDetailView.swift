//
//  homeDetailView.swift
//  e-Where
//
//  Created by Sean Warren on 3/5/17.
//  Copyright © 2017 Sean Warren. All rights reserved.
//

//ProfileView.swift
import UIKit
import LBTAComponents
class ProfileView: UIView {
    var shouldSetupConstraints = true
    let textLabelName: UILabel = {
        let label = UILabel()
        label.text = "CHARMING HOUSE Seaside & Pine Forest"
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        //label.lineBreakMode = NSLineBreakMode.byClipping
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir-Black", size: 26)
        label.textColor = UIColor(white: 0, alpha: 0.80)
        label.backgroundColor = UIColor.white
        label.alpha = 0
        return label
    }()
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.20 )
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.zPosition = 0.01
        view.alpha = 0

        return view
    }()
    let dividerLineView3: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.20 )
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.layer.zPosition = 0.01
       // view.alpha = 0
        return view
    }()
    let dividerLineView2: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.zPosition = 0.0
        view.alpha = 0
        return view
    }()
    let container: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Entire Place"
        label.font = UIFont(name: "Avenir-Heavy", size: 16)
        label.alpha = 0

        return label
    }()
    let aboutLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "About This Article"
        label.font = UIFont(name: "Avenir-Heavy", size: 16)
        label.alpha = 0
        return label
    }()
    let secondaryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "by Sean Warren"
        label.font = UIFont(name: "Avenir-Light", size: 16)
        label.alpha = 0

        return label
    }()
    let textLabelMore: UILabel = {
        let label = UILabel()
        label.text = "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain... Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean accumsan risus at massa euismod fermentum. Vestibulum sit amet elementum nisi. In ut lectus quis massa blandit fermentum. Mauris nec nunc pretium felis vestibulum eleifend vitae nec dui. Vivamus id diam vel tortor sodales aliquam at vitae dui. Integer vitae sodales sem, fermentum consequat arcu. Nullam quis tempus lacus. Mauris vel enim porttitor, dignissim sapien et, malesuada tortor. Morbi iaculis ornare turpis ut sodales. Aenean dictum pharetra finibus. Sed posuere eros sit amet malesuada aliquet. Nam in scelerisque magna. Maecenas consequat ligula quis mollis vestibulum. Pellentesque accumsan sollicitudin turpis et sollicitudin. Donec turpis nibh, faucibus efficitur ex id, faucibus porttitor mi. Curabitur a justo urna. Donec vehicula lacus lacus, non commodo turpis ullamcorper sed.\n\n Pellentesque laoreet dui at rhoncus ultricies. Suspendisse auctor est lorem, ac tincidunt dui tincidunt nec. Nulla in libero ac diam eleifend maximus. Nullam vel urna nec risus fermentum hendrerit eu vitae purus. Integer ut nulla quam. Praesent vestibulum sollicitudin mi, id venenatis felis eleifend sed."
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.lineBreakMode = NSLineBreakMode.byClipping
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir-Light", size: 16)
        label.textColor = UIColor.black
        label.layer.zPosition = 0.0
        label.backgroundColor = UIColor.white
        label.alpha = 0

        return label
    }()
    let userProfileImage: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "imageavatar")
        theImageView.translatesAutoresizingMaskIntoConstraints = false
        theImageView.layer.borderWidth = 0
        theImageView.layer.masksToBounds = false
        theImageView.layer.cornerRadius = 37.5
        theImageView.clipsToBounds = true
        theImageView.alpha = 0
        return theImageView
    }()
    let like: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "like")
        theImageView.translatesAutoresizingMaskIntoConstraints = false
        theImageView.alpha = 0
        return theImageView
    }()
    let dislike: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "dislike")
        theImageView.translatesAutoresizingMaskIntoConstraints = false
        theImageView.alpha = 0
        return theImageView
    }()
    let share: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "share")
        theImageView.translatesAutoresizingMaskIntoConstraints = false
        theImageView.alpha = 0
        return theImageView
    }()
    let love: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "love")
        theImageView.translatesAutoresizingMaskIntoConstraints = false
        theImageView.alpha = 0
        return theImageView
    }()
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        addSubview(container)
        addSubview(userNameLabel)
        addSubview(secondaryLabel)
        addSubview(userProfileImage)
        addSubview(dividerLineView2)
        addSubview(dividerLineView3)
        addSubview(like)
        addSubview(textLabelMore)
        addSubview(dislike)
        addSubview(love)
        addSubview(share)
        addSubview(aboutLabel)
        dividerLineView2.addSubview(dividerLineView)
        addSubview(aboutLabel)
        addSubview(textLabelName)

    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func updateConstraints() {

        if shouldSetupConstraints {
            container.anchor(topAnchor, left: leftAnchor,
                             bottom: bottomAnchor, right: rightAnchor,
                             topConstant: 50, leftConstant: 0,
                             bottomConstant: 0, rightConstant: 0,
                             widthConstant: 0, heightConstant: 1000)

            sendSubview(toBack: container)
            textLabelName.anchor(topAnchor, left: leftAnchor,
                                 bottom: nil, right: rightAnchor,
                                 topConstant: 70, leftConstant: 30,
                                 bottomConstant: 0, rightConstant: 30,
                                 widthConstant: 0, heightConstant: 0)
            userNameLabel.anchor(textLabelName.bottomAnchor, left: leftAnchor,
                                 bottom: nil, right: nil,
                                 topConstant: 20, leftConstant: 30,
                                 bottomConstant: 0, rightConstant: 0,
                                 widthConstant: 0, heightConstant: 0)
            secondaryLabel.anchor(userNameLabel.bottomAnchor, left: leftAnchor,
                                  bottom: nil, right: nil,
                                  topConstant: 5, leftConstant: 30,
                                  bottomConstant: 0, rightConstant: 0,
                                  widthConstant: 0, heightConstant: 0)
            userProfileImage.anchor(textLabelName.bottomAnchor, left: nil,
                                    bottom: nil, right: rightAnchor,
                                    topConstant: 10, leftConstant: 0,
                                    bottomConstant: 0, rightConstant: 30,
                                    widthConstant: 75, heightConstant: 75)
            dividerLineView2.anchor(secondaryLabel.bottomAnchor, left:  leftAnchor,
                                    bottom:  nil, right:  rightAnchor,
                                    topConstant: 40, leftConstant: 0, bottomConstant: 0,
                                    rightConstant: 0, widthConstant: 0, heightConstant: 50)
            dividerLineView.anchor(secondaryLabel.bottomAnchor, left:  leftAnchor,
                                   bottom:  nil, right:  rightAnchor,
                                   topConstant: 40, leftConstant: 20, bottomConstant: 0,
                                   rightConstant: 20, widthConstant: 0, heightConstant: 0.50)
            dividerLineView.sendSubview(toBack: dividerLineView2)
            like.anchor(dividerLineView.bottomAnchor, left: leftAnchor,
                        bottom: nil, right: nil,
                        topConstant: 10, leftConstant: 50,
                        bottomConstant: 0, rightConstant: 0,
                        widthConstant: 35, heightConstant: 35)
             dislike.anchor(dividerLineView.bottomAnchor, left: like.leftAnchor,
                            bottom: nil, right: nil,
                            topConstant: 10, leftConstant: 100,
                            bottomConstant: 0, rightConstant: 0,
                            widthConstant: 35, heightConstant: 35)
            love.anchor(dividerLineView.bottomAnchor, left: nil,
                        bottom: nil, right: rightAnchor,
                        topConstant: 10, leftConstant: 0,
                        bottomConstant: 0, rightConstant: 130,
                        widthConstant: 35, heightConstant: 35)
                share.anchor(dividerLineView.bottomAnchor, left: nil,
                             bottom: nil, right: rightAnchor,
                             topConstant: 10, leftConstant: 0,
                             bottomConstant: 0, rightConstant: 50,
                             widthConstant: 35, heightConstant: 35)
            dividerLineView3.anchor(like.bottomAnchor, left:  leftAnchor,
                                    bottom:  nil, right:  rightAnchor,
                                    topConstant: 20, leftConstant: 20, bottomConstant: 0,
                                    rightConstant: 20, widthConstant: 0, heightConstant: 0.50)
            aboutLabel.anchor(dividerLineView3.bottomAnchor, left: leftAnchor,
                              bottom: nil, right: rightAnchor,
                              topConstant: 10, leftConstant: 0,
                              bottomConstant: 0, rightConstant: 0,
                              widthConstant: 0, heightConstant: 0)
            textLabelMore.anchor(aboutLabel.bottomAnchor, left: leftAnchor,
                                 bottom: nil, right: rightAnchor,
                                 topConstant: 20, leftConstant: 30,
                                 bottomConstant: 0, rightConstant: 30,
                                 widthConstant: 0, heightConstant: 0)
            shouldSetupConstraints = false
        }
        super.updateConstraints()
    }
}
