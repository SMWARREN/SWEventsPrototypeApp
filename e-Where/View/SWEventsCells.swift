//
//  EventsCell.swift
//  e-Where
//
//  Created by Sean Warren on 2/19/17.
//  Copyright © 2017 Sean Warren. All rights reserved.
//

import Foundation
import UIKit
import LBTAComponents
class AppCategoryCell: DatasourceCell {
    override var datasourceItem: Any? {
        didSet {
            appsController.datasource = datasourceItem as? AppCategory
        }
    }
    let appsController = AppsController()
    override func setupViews() {
        super.setupViews()
        addSubview(appsController.view)
        appsController.view.fillSuperview()
    }
}
struct App {
    let name: String
    let imageUrl: String
}

class AppCell: DatasourceCell {
    override var datasourceItem: Any? {
        didSet {
            let imageViewLayer = datasourceItem as? App
            nameLabel.text = imageViewLayer?.name
            imageview.image = UIImage(named:(imageViewLayer?.imageUrl)!)
        }
    }
    let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.lineBreakMode = NSLineBreakMode.byClipping
        label.textAlignment = .center
        label.text = "TOP 10"
        label.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 20)
        label.textColor = UIColor.black
        return label
    }()
    let nameLabel1: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.lineBreakMode = NSLineBreakMode.byClipping
        label.textAlignment = .center
        label.text = "Thursday, Feb 16, 2017"
        label.font = UIFont(name: "HelveticaNeue-UltraLight", size: 16)
        label.textColor = UIColor.black
        return label
    }()
    let nameLabel2: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.lineBreakMode = NSLineBreakMode.byClipping
        label.textAlignment = .center
        label.text = "@ Ascend"
        label.font = UIFont(name: "HelveticaNeue-UltraLight", size: 12)
        label.textColor = UIColor.black
        return label
    }()
    let nameLabelc: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor(patternImage: UIImage(named: "trans")!)
        return label
    }()
    let imageview: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named:"banner")
        theImageView.translatesAutoresizingMaskIntoConstraints = false
        theImageView.layer.shadowColor = UIColor.black.cgColor
        theImageView.layer.shadowOffset = CGSize(width: 1, height: 0)
        theImageView.layer.shadowOpacity = 0.6
        theImageView.layer.shadowRadius = 1.0
        return theImageView
    }()
    override func setupViews() {
        super.setupViews()
        backgroundColor = UIColor.white
        addSubview(imageview)
        addSubview(nameLabelc)
        addSubview(nameLabel)
        addSubview(nameLabel1)
        addSubview(nameLabel2)
        imageview.anchor(topAnchor, left: leftAnchor,
                         bottom: bottomAnchor, right: rightAnchor,
                         topConstant: 10, leftConstant: 10,
                         bottomConstant: 10, rightConstant: 10,
                         widthConstant: 0, heightConstant: 0)
        nameLabelc.anchor(topAnchor, left: leftAnchor,
                          bottom: bottomAnchor, right: rightAnchor,
                          topConstant: 150, leftConstant: 0,
                          bottomConstant: 0, rightConstant: 0,
                          widthConstant: 0, heightConstant: 0)
        nameLabel1.anchor(topAnchor, left: leftAnchor,
                          bottom: bottomAnchor, right: rightAnchor,
                          topConstant: 220, leftConstant: 0,
                          bottomConstant: 0, rightConstant: 0,
                          widthConstant: 0, heightConstant: 0)
        nameLabel2.anchor(topAnchor, left: leftAnchor,
                          bottom: bottomAnchor, right: rightAnchor,
                          topConstant: 260, leftConstant: 0,
                          bottomConstant: 0, rightConstant: 0,
                          widthConstant: 0, heightConstant: 0)
        nameLabel.anchor(topAnchor, left: leftAnchor,
                         bottom: bottomAnchor, right: rightAnchor,
                         topConstant: 180, leftConstant: 0,
                         bottomConstant: 0, rightConstant: 0,
                         widthConstant: 0, heightConstant: 0)
    }
}
