import LBTAComponents
class SWInboxDataSource: Datasource {
    override init() {
        super.init()
        var SWInbox = [SWInboxModel]()
        let msg1 = SWInboxModel(title: "Hey, how are you doing?", imageName: "imageavatar")
        let msg2 = SWInboxModel(title: "Hit me up tomrrow if you want to.", imageName: "imageavatar")
        let msg3 = SWInboxModel(title: "Well whats going on and i dont?", imageName: "imageavatar" )
        SWInbox = [msg1, msg2, msg3]
        objects = SWInbox
    }
    override func cellClass(_ indexPath: IndexPath) -> DatasourceCell.Type? {
            return SWInbox.self
    }
    override func cellClasses() -> [DatasourceCell.Type] {
        return [SWInbox.self]
    }
    override func headerClasses() -> [AnyClass]? {
        return [SWHeaderInbox.self]
    }
    override func footerClasses() -> [AnyClass]? {
        return [SWFooterInbox.self]
    }
}
