//
//  SWHomeController.swift
//  Events
//
//  Created by Sean Warren on 2/12/17.
//  Copyright © 2017 Sean Warren. All rights reserved.
//

import UIKit
import LBTAComponents
class SWHomeController: DatasourceController {
    var pulledRefresh = true

    let jumpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Jump to Top", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Book", size: 20)
        button.backgroundColor = UIColor.white
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor(white: 100.0 / 255.0, alpha: 1.0).cgColor
        button.layer.cornerRadius = 16.0
        button.setTitleColor(UIColor(white: 100.0 / 255.0, alpha: 1.0), for: .normal)
        button.addTarget(self, action: #selector(jumpToTop), for: .touchUpInside)

        return button
    }()
    var errorMessage: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Apologies... Something went wrong; Please wait a few minutes and retry again!"
        label.font = UIFont(name: "HelveticaNeue-UltraLight", size: 30)
        label.numberOfLines = 0
        return label
    }()
    func addJumpButton() {
        jumpButton.isHidden = true
        view.addSubview(jumpButton)
        jumpButton.anchor(nil, left: view.leftAnchor,
                          bottom: view.bottomAnchor, right: view.rightAnchor,
                          topConstant: 0, leftConstant: 70,
                          bottomConstant: 10, rightConstant: 70,
                          widthConstant: 0, heightConstant: 0)
    }
    func getJsonDataWithAlert() {
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        alert.view.tintColor = UIColor.black
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
            as UIActivityIndicatorView
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        loadingIndicator.startAnimating()
        alert.view.addSubview(loadingIndicator)
        DispatchQueue.main.async(execute: {
            self.present(alert, animated: false, completion: {

                self.fetchVideos(finished: {})
            })
        })
    }
    func setupCollectionView() {
        self.navigationItem.title = "Home"
        view.backgroundColor = .white
        collectionView?.backgroundColor = .white
         let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.sectionHeadersPinToVisibleBounds = true
        collectionView?.alwaysBounceVertical = true
     }
    func jumpToTop() {
    collectionView?.setContentOffset(CGPoint(x: 0, y: -50), animated: true)
        jumpButton.isHidden = true
    }
    func fetchVideos(finished: () -> Void) {
        ApiService.sharedInstance.fetchVideos { (videos: ApiService.ApiData?, error: Error?) -> (Void) in
            if error != nil {
                 self.dismiss(animated: true, completion: {
                    self.errorMessage.alpha = 1
                    self.jumpButton.isHidden = true

                })
            } else {
            self.errorMessage.alpha = 0
            self.datasource = SWhomeDataSource(data: videos!)
            self.collectionView?.reloadData()
            self.dismiss(animated: false, completion: nil)
            self.collectionView!.refreshControl = nil

            self.addHeaderAnimation()

            }
            self.collectionView!.refreshControl?.endRefreshing()
        }
        finished()
 }
    func enableRefresh() {
    pulledRefresh = true
    }
    func addHeaderAnimation () {
        UIView.animate(withDuration: 1.0, delay: 1.0,
                       usingSpringWithDamping: 0.7, initialSpringVelocity: 1.0,
                       options: .curveEaseInOut, animations: {
            self.collectionView?.setContentOffset(CGPoint(x: 0, y: -100), animated: false)
        }) { _ in
        }
    }
    func refreshMe() {
       if pulledRefresh == true {
        self.pulledRefresh = false

            self.collectionView!.refreshControl?.beginRefreshing()
        self.fetchVideos(finished: {})
        self.collectionView!.refreshControl?.endRefreshing()

            }
       if pulledRefresh == false {
        self.pulledRefresh = true

        self.collectionView!.refreshControl?.endRefreshing()

        self.collectionView?.reloadData()
        }
}
    }
