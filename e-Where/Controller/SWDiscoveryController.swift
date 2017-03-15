//
//  SWSettingController.swift
//  Events
//
//  Created by Sean Warren on 2/12/17.
//  Copyright © 2017 Sean Warren. All rights reserved.
//

import UIKit
import LBTAComponents

class SWDiscoveryController: DatasourceController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Discover"
        let btn1 = UIButton(type: .custom)
        btn1.setImage(UIImage(named: "Lovemail-1"), for: .normal)
        btn1.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btn1.addTarget(self, action: #selector(doNothing), for: .touchUpInside)
        let item1 = UIBarButtonItem(customView: btn1)
        let btn2 = UIButton(type: .custom)
        btn2.setImage(UIImage(named: "Lovemail-1"), for: .normal)
        btn2.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btn2.addTarget(self, action: #selector(doNothing), for: .touchUpInside)
        let item2 = UIBarButtonItem(customView: btn2)
        self.navigationItem.setRightBarButtonItems([item1], animated: true)
        self.navigationItem.setLeftBarButton(item2, animated: true)
        view.backgroundColor = .white
        collectionView?.backgroundColor = .white
        datasource = SWDiscoverDatasource()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 0)
    }
    func doNothing() {}
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 0)
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dataSource =  SWDiscoverDatasource().objects as [Any]!
        guard  let dataObject = dataSource?[indexPath.item] as? (title: Swift.String, image: Swift.String)
            else { return }
        print(dataObject.title + " \(indexPath.item)")
    }
    override func collectionView(_ collectionView: UICollectionView,
                                 layout collectionViewLayout: UICollectionViewLayout,
                                 sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 212)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
