//
//  SWInboxCells. swift
//  e - Where
//
//  Created by Sean Warren on 2/14/17.
//  Copyright © 2017 Sean Warren. All rights reserved.
//
//

import LBTAComponents

class SWHeaderInbox: DatasourceCell {
    let inboxLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Inbox"
        label.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 35)

        return label
    }()
    let secondaryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "You have no unread messages"
        label.font = UIFont(name: "HelveticaNeue-UltraLight", size: 18)
        return label
    }()
    let menuLeft: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "Bagitems-1")
        theImageView.translatesAutoresizingMaskIntoConstraints = false
        return theImageView
    }()
    let menuRight: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "Bagitems-1")
        theImageView.translatesAutoresizingMaskIntoConstraints = false
        return theImageView
    }()
    override func setupViews() {
        super.setupViews()
        backgroundColor = UIColor.white
        addSubview(inboxLabel)
        addSubview(secondaryLabel)
        addSubview(menuLeft)
        addSubview(menuRight)

        inboxLabel.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 50, leftConstant: 30,
                          bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        secondaryLabel.anchor(inboxLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 5,
        leftConstant: 30, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
         menuLeft.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 5,
                         leftConstant: 30, bottomConstant: 0, rightConstant: 0, widthConstant: 30, heightConstant: 30)
       menuRight.anchor(topAnchor, left: nil, bottom: nil, right: rightAnchor, topConstant: 5,
                        leftConstant: 0, bottomConstant: 0, rightConstant: 30, widthConstant: 30, heightConstant: 30)
    }
}

class SWFooterInbox: DatasourceCell {
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

class SWInbox: DatasourceCell {
    override var datasourceItem: Any? {
        didSet {
            guard let data = datasourceItem as? (SWInboxModel) else { return }
            wordlabel.text = data.title
            imageview.image = UIImage(named: "\(data.imageName)")
        }
    }
    let wordlabel = UILabel()
    let imageview: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "imageavatar")
        theImageView.translatesAutoresizingMaskIntoConstraints = false
        theImageView.layer.borderWidth = 0
        theImageView.layer.masksToBounds = false
        theImageView.layer.cornerRadius = 20.0
        theImageView.clipsToBounds = true
        return theImageView
    }()
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.08)
        return view
    }()
    let button: UIButton = {
    let button = UIButton()
    button.setTitle("  Click to pop or dismiss  ", for: .normal)
    button.backgroundColor = .white
    button.layer.borderWidth = 2
    button.layer.borderColor = UIColor(white: 100.0 / 255.0, alpha: 1.0).cgColor
    button.layer.cornerRadius = 16.0
    button.setTitleColor(UIColor(white: 100.0 / 255.0, alpha: 1.0), for: .normal)
        return button
   // button.addTarget(self, action: #selector(ExampleViewController.backAction), for: .touchUpInside) 
    }()
    override func setupViews() {
        super.setupViews()
        wordlabel.font = UIFont(name: "Avenir-Light", size: 20)
        wordlabel.textColor = UIColor(r: 83, g: 83, b: 83)
        addSubview(wordlabel)
        addSubview(imageview)
        addSubview(dividerLineView)
        imageview.anchor(topAnchor, left: leftAnchor,
                         bottom: nil, right: nil,
                         topConstant: 30, leftConstant: 30,
                         bottomConstant: 0, rightConstant: 0,
                         widthConstant: 40, heightConstant: 40)
        wordlabel.anchor(topAnchor, left: imageview.rightAnchor,
                         bottom: bottomAnchor, right: rightAnchor,
                         topConstant: 0, leftConstant: 10,
                         bottomConstant: 0, rightConstant: 30,
                         widthConstant: 0, heightConstant: 0)
        dividerLineView.anchor(nil, left: leftAnchor,
                               bottom: bottomAnchor, right: rightAnchor,
                               topConstant: 0, leftConstant: 30,
                               bottomConstant: 0, rightConstant: 30,
                               widthConstant: 0, heightConstant: 0.5)
}
}
