///
//  e-Where
//
//  Created by Sean Warren on 2/19/17.
//  Copyright © 2017 Sean Warren. All rights reserved.
//

import LBTAComponents

class SettingsDatasource: Datasource {
    override init() {
        super.init()
        var menuItems = [SWMenuItem]()
        let item1 = SWMenuItem(title: "Profile Settings", imageName: "" )
        let item2 = SWMenuItem(title: "Profile Settings", imageName: "" )
        let item3 = SWMenuItem(title: "Invite Friends", imageName: "")
        let item4 = SWMenuItem(title: "About Us", imageName: "")
        let item5 = SWMenuItem(title: "Help & Support", imageName: "" )
        let item6 = SWMenuItem(title: "Give us Feedack", imageName: "")
        menuItems = [item1, item2, item3, item4, item5, item6]
        objects = menuItems
    }
    override func cellClass(_ indexPath: IndexPath) -> DatasourceCell.Type? {
            return SWSettingsMenuCell.self
    }
    override func cellClasses() -> [DatasourceCell.Type] {
        return [SWSettingsMenuCell.self]
    }
    override func headerClasses() -> [AnyClass]? {
        return [SWSettingsHeader.self]
    }
    override func footerClasses() -> [AnyClass]? {
        return [SWSettingsFooter.self]
    }
}
