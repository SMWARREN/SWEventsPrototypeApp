//
//  SWDiscoveryCells.swift
//  e-Where
//
//  Created by Sean Warren on 2/19/17.
//  Copyright © 2017 Sean Warren. All rights reserved.
//

import LBTAComponents

class SWHeaderDiscovery: DatasourceCell {
    override func setupViews() {
        super.setupViews()
        backgroundColor = UIColor.white
    }
}
class SWFooterDiscovery: DatasourceCell {
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

class SWDiscovery: DatasourceCell {
    override var datasourceItem: Any? {
        didSet {
            guard let hey = datasourceItem as? (Swift.String, Swift.String) else { return }
            leftItem.text = hey.0
            imageview.image = UIImage(named: "\(hey.1)")
        }
    }
    let leftItem: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Bars"
        label.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 25)
        label.textColor = UIColor.white
        return label
    }()
    let rightItem: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "TOP 10"
        label.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 20)
        label.textColor = UIColor.white

        let textFontAttributes = [
            NSFontAttributeName: label.font,
             NSForegroundColorAttributeName: UIColor.white,
            NSStrokeColorAttributeName: UIColor.black,
             NSStrokeWidthAttributeName: -3.0
            ] as [String : Any]
        var myMutableString = NSMutableAttributedString(string: label.text!, attributes: textFontAttributes)
         label.attributedText = myMutableString
        return label
    }()
    let imageview: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named:"bar")
        theImageView.translatesAutoresizingMaskIntoConstraints = false
        theImageView.contentMode = .scaleAspectFill
        return theImageView
    }()

    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    override func setupViews() {
        super.setupViews()
        addSubview(imageview)
        addSubview(dividerLineView)
        addSubview(leftItem)
        addSubview(rightItem)
        leftItem.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 30,
                        bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        rightItem.anchor(topAnchor, left: nil, bottom: nil, right: rightAnchor, topConstant: 10, leftConstant: 0,
                         bottomConstant: 0, rightConstant: 30, widthConstant: 0, heightConstant: 0)
        imageview.anchor(topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 0,
                         bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 210)
        dividerLineView.anchor(nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0,
                    leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 2)
    }
}
