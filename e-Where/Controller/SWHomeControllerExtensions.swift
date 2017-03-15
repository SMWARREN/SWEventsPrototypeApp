//
//  SWHomeControllerExtensions.swift
//  e-Where
//
//  Created by Sean Warren on 2/26/17.
//  Copyright © 2017 Sean Warren. All rights reserved.
//

import UIKit

extension SWHomeController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(errorMessage)
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .red
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to Refresh")
        refreshControl.addTarget(self, action: #selector(refreshMe), for: .valueChanged)
        collectionView!.refreshControl = refreshControl
        errorMessage.alpha = 0
        errorMessage.anchor(view.topAnchor, left: view.leftAnchor,
                            bottom: nil, right: view.rightAnchor,
                            topConstant: view.center.y - 100, leftConstant: 0,
                            bottomConstant: 0, rightConstant: 0,
                            widthConstant: 0, heightConstant: 0)
        setupCollectionView()
        getJsonDataWithAlert()
        addJumpButton()
    }
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        jumpButton.isHidden = true
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        jumpButton.isHidden = false
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int)
        -> CGSize {
            return CGSize(width: view.frame.width, height: 71)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 80)
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var data = self.datasource?.objects as [Any]!
        guard let dataObject = data?[indexPath.item] as? (title: Swift.String, image: Swift.String, thumb: Swift.String)
            else { return }
   /*     let transition: CATransition = CATransition()
        transition.duration =  1.0
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromBottom
        self.navigationController!.view.layer.add(transition, forKey: nil) */
        self.navigationController?.pushViewController(SWHomeDetail(image: "\(dataObject.image)",
            titleData: "\(dataObject.title)" ), animated: true)
    }
    override func collectionView(_ collectionView: UICollectionView,
                                 layout collectionViewLayout: UICollectionViewLayout,
                                 sizeForItemAt indexPath: IndexPath ) -> CGSize {
        return CGSize(width: view.frame.width, height: 460)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
