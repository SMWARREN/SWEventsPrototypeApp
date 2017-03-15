import LBTAComponents

class SWDiscoverDatasource: Datasource {
    override init() {
        super.init()
        var objectsNew = [(title: String, imageName: String)]()
        objectsNew.append((title: "Profile Settings", imageName: "bar" ))
        objectsNew.append((title: "Invite Friends", imageName: "bar"))
        objectsNew.append((title: "About Us", imageName: "bar"))
        objectsNew.append((title: "Help & Support", imageName: "bar" ))
        objectsNew.append((title: "Give us Feedack", imageName: "bar"))
        objects = objectsNew
    }
    override func cellClass(_ indexPath: IndexPath) -> DatasourceCell.Type? {
             return SWDiscovery.self
    }
    override func cellClasses() -> [DatasourceCell.Type] {
        return [SWDiscovery.self]
    }
    override func headerClasses() -> [AnyClass]? {
        return [SWHeaderDiscovery.self]
    }
    override func footerClasses() -> [AnyClass]? {
        return [SWFooterDiscovery.self]
    }
}
