import LBTAComponents

class SWhomeDataSource: Datasource {
    open static let imageCache = NSCache<NSString, DiscardableImageCacheItem>()
    typealias HomeInput = [(title: String, imageName: String, thumb: String)]
    open var shouldUseEmptyImage = true
    private var urlStringForChecking: String?
    private var emptyImage: UIImage?
    private var image: UIImage?
    override init() {
        super.init()

        var objectsNew = [(title: String, imageName: String)]()
        objectsNew.append((title: "Sean Warren", imageName: "imageavatar"))
        objectsNew.append((title: "Sean Warren", imageName: "imageavatar"))
        objectsNew.append((title: "Sean Warren", imageName: "imageavatar" ))
        objects = objectsNew
    }
    var title = ""
    var imageName = ""
    init(data: HomeInput) {
        super.init()
        objects = data
    }
    override func cellClass(_ indexPath: IndexPath) -> DatasourceCell.Type? {
        return HomeCell.self

    }
    override func cellClasses() -> [DatasourceCell.Type] {
        return [HomeCell.self]
    }
    override func headerClasses() -> [AnyClass]? {
        return [HeaderHome.self]
    }
    override func footerClasses() -> [AnyClass]? {
        return [FooterHome.self]
    }
}
