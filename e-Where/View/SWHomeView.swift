//
//  cellsHome.swift
//  Events
//
//  Created by Sean Warren on 2/14/17.
//  Copyright © 2017 Sean Warren. All rights reserved.
//
//

import LBTAComponents

class HeaderHome: DatasourceCell {
    let headerStory: UILabel = {
        let label = UILabel()
        label.text = "The Greatest Application Ever"
        label.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 25)
        return label
    }()
    let secondaryHeaderStory: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "eWhere"
        label.font = UIFont(name: "HelveticaNeue-UltraLight", size: 18)
        return label
    }()

    let headerIcon: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named:"me")
        theImageView.translatesAutoresizingMaskIntoConstraints = false
        theImageView.contentMode = .scaleAspectFill
        return theImageView
    }()
    let dividerLineViewBottom: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.10)
        return view
    }()
    override func setupViews() {
        super.setupViews()
        backgroundColor = .white
        addSubview(headerStory)
        addSubview(secondaryHeaderStory)
        addSubview(headerIcon)
        addSubview(dividerLineView)
        addSubview(dividerLineViewBottom)

        headerStory.anchor(topAnchor, left: leftAnchor,
                         bottom: nil, right: headerIcon.leftAnchor,
                         topConstant: 10, leftConstant: 30,
                         bottomConstant: 0, rightConstant: 0,
                         widthConstant: 0, heightConstant: 0)
        secondaryHeaderStory.anchor(headerStory.bottomAnchor, left: leftAnchor,
                          bottom: nil, right: nil,
                          topConstant: 0, leftConstant: 30,
                          bottomConstant: 0, rightConstant: 0,
                          widthConstant: 0, heightConstant: 0)
        headerIcon.anchor(topAnchor, left: nil,
                          bottom: nil, right: rightAnchor,
                          topConstant: 20, leftConstant: 0,
                          bottomConstant: 0, rightConstant: 30,
                          widthConstant: 35, heightConstant: 35)
        dividerLineView.anchor(topAnchor, left: leftAnchor,
                               bottom: nil, right: rightAnchor,
                               topConstant: 70, leftConstant: 0,
                               bottomConstant: 0, rightConstant: 0,
                               widthConstant: 0, heightConstant: 0.5)

     }
}

class FooterHome: DatasourceCell {
    let textlabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = ""
        return label
    }()
    override func setupViews() {
        super.setupViews()
        backgroundColor = UIColor.white
        addSubview(textlabel)
        textlabel.fillSuperview()
    }
}

class HomeCell: DatasourceCell {
    var downloadData1 = [(title: String, imageName: String, thumb: String)]()
    override var datasourceItem: Any? {
        didSet {
            guard let data = datasourceItem as? (Swift.String, Swift.String, Swift.String) else { return }
            title.text = data.0
            mainImage.loadImage(urlString: data.1)
            profileAvatar.loadImage(urlString:data.2)
        }
    }
    let title = UILabel()
    let mainImage: SWCachedImageView = {
        let theImageView = SWCachedImageView()
        theImageView.image = UIImage(named:"newexample2")
        theImageView.translatesAutoresizingMaskIntoConstraints = false
        theImageView.contentMode = .scaleAspectFill
        return theImageView
    }()
    let profileAvatar: SWCachedImageView = {
        let theImageView = SWCachedImageView()
        theImageView.image = UIImage(named: "imageavatar")
        theImageView.translatesAutoresizingMaskIntoConstraints = false
        theImageView.layer.borderWidth = 0
        theImageView.layer.masksToBounds = false
        theImageView.layer.cornerRadius = 20.0
        theImageView.contentMode = .scaleAspectFill

        theImageView.clipsToBounds = true
        return theImageView
    }()
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.15)
        return view
    }()
    let dividerLineView2: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.08)
        return view
    }()
    
    let like: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "like")
        theImageView.translatesAutoresizingMaskIntoConstraints = false
        return theImageView
    }()
    let dislike: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "dislike")
        theImageView.translatesAutoresizingMaskIntoConstraints = false
        return theImageView
    }()
    let share: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "share")
        theImageView.translatesAutoresizingMaskIntoConstraints = false
        return theImageView
    }()
    let love: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "love")
        theImageView.translatesAutoresizingMaskIntoConstraints = false
        return theImageView
    }()
    
    override func setupViews() {
        super.setupViews()
        title.font = UIFont(name: "Avenir-Light", size: 20)
        title.textColor = UIColor(r: 83, g: 83, b: 83)
        
        addSubview(title)
        addSubview(profileAvatar)
        addSubview(mainImage)
        addSubview(dividerLineView)
        addSubview(dividerLineView2)
        addSubview(like)
        addSubview(dislike)
        addSubview(love)
        addSubview(share)
        profileAvatar.anchor(topAnchor, left: leftAnchor,
                         bottom: nil, right: nil,
                         topConstant: 15, leftConstant: 30,
                         bottomConstant: 0, rightConstant: 0,
                         widthConstant: 40, heightConstant: 40)
        mainImage.anchor(dividerLineView2.bottomAnchor, left: leftAnchor,
                            bottom: bottomAnchor, right: rightAnchor,
                            topConstant: 5, leftConstant: 0,
                            bottomConstant: 50, rightConstant: 0,
                            widthConstant: 0, heightConstant: 0)
        title.anchor(topAnchor, left: leftAnchor,
                         bottom: nil, right: rightAnchor,
                         topConstant: 20, leftConstant: 80,
                         bottomConstant: 0, rightConstant: 30,
                         widthConstant: 0, heightConstant: 0)
        dividerLineView2.anchor(profileAvatar.bottomAnchor, left: leftAnchor,
                                bottom: nil, right: rightAnchor,
                                topConstant: 10, leftConstant: 30,
                                bottomConstant: 0, rightConstant: 30,
                                widthConstant: 0, heightConstant: 0.5)
        dividerLineView.anchor(nil, left: leftAnchor,
                               bottom: bottomAnchor, right: rightAnchor,
                               topConstant: 0, leftConstant: 0,
                               bottomConstant: 0, rightConstant: 0,
                               widthConstant: 0, heightConstant: 0.5)

                    like.anchor(mainImage.bottomAnchor, left: leftAnchor,
                                bottom: nil, right: nil,
                                topConstant: 10, leftConstant: 50,
                                bottomConstant: 0, rightConstant: 0,
                                widthConstant: 35, heightConstant: 35)
                    dislike.anchor(mainImage.bottomAnchor, left: like.leftAnchor,
                                   bottom: nil, right: nil,
                                   topConstant: 10, leftConstant: 100,
                                   bottomConstant: 0, rightConstant: 0,
                                   widthConstant: 35, heightConstant: 35)
                    love.anchor(mainImage.bottomAnchor, left: nil,
                                bottom: nil, right: rightAnchor,
                                topConstant: 10, leftConstant: 0,
                                bottomConstant: 0, rightConstant: 130,
                                widthConstant: 35, heightConstant: 35)
                    share.anchor(mainImage.bottomAnchor, left: nil,
                                 bottom: nil, right: rightAnchor,
                                 topConstant: 10, leftConstant: 0,
                                 bottomConstant: 0, rightConstant: 50,
                                 widthConstant: 35, heightConstant: 35)
      }
}
