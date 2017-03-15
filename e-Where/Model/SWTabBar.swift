///
//  e-Where
//
//  Created by Sean Warren on 2/19/17.
//  Copyright © 2017 Sean Warren. All rights reserved.
//

import UIKit
class SWTabBar {
    var title: String = ""
    var imageName: String = ""
    var contoller: UIViewController
    init(title: String = "", imageName: String = "", contoller: UIViewController = ViewController()) {
        self.title =  title
        self.imageName = imageName
        self.contoller = contoller
    }
    open func createDemoData() -> [SWTabBar] {
        var arrayOfTabs = [SWTabBar]()
        let home = SWTabBar(title: "Home", imageName: "Starhome", contoller: SWHomeController())
        let events = SWTabBar(title: "Events", imageName: "Pinfavorite", contoller: SWEventsController())
        let hyannis = SWTabBar(title: "Discover", imageName: "discover", contoller: SWDiscoveryController())
        let msg = SWTabBar(title: "Inbox", imageName: "mail", contoller: SWInboxController())
        let settings = SWTabBar(title: "Settings", imageName: "settings", contoller: SWSettingController())
        arrayOfTabs = [home, events, hyannis, msg, settings]
        return arrayOfTabs
    }
}
