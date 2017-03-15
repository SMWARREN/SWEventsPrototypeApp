//
//  SWEventsController.swift
//  Events
//
//  Created by Sean Warren on 2/14/17.
//  Copyright © 2017 Sean Warren. All rights reserved.
//

import LBTAComponents

class AppsController: DatasourceController {
    
    weak var theNavController:  UINavigationController? = nil

    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.alwaysBounceVertical = false
        layout?.scrollDirection = .horizontal
        collectionView?.showsHorizontalScrollIndicator = false
        layout?.minimumLineSpacing = 10
        layout?.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    override func collectionView(_ collectionView: UICollectionView,
                                 layout collectionViewLayout: UICollectionViewLayout,
                                 sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: view.frame.height)
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let data = collectionView.cellForItem(at: indexPath) as? AppCell
            else { return }
        
       guard let dataobject = data.datasourceItem! as? App else { return }
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        appDelegate.currentNavController?.pushViewController(SWHomeDetail(imageLocal: "\(dataobject.imageUrl)", titleData: "\(dataobject.name)" ), animated: true)
        
    }
    func goBack() {
        dismiss(animated: true, completion: nil)
    }
}
class SWEventsController: DatasourceController {

    override func viewDidLoad() {
        super.viewDidLoad()
        datasource = AdvancedDatasource()
        self.navigationItem.title = "Events"
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.currentNavController = self.navigationController
       }
 
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
       override func collectionView(_ collectionView: UICollectionView,
                                 layout collectionViewLayout: UICollectionViewLayout,
                                 sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 280)
    }
}

