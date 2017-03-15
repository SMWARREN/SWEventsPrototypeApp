//
//  EventsDataSource.swift
//  e-Where
//
//  Created by Sean Warren on 2/19/17.
//  Copyright © 2017 Sean Warren. All rights reserved.
//

import UIKit
import LBTAComponents
class AdvancedDatasource: Datasource {
        override init() {
        super.init()
        let spotify = App(name: "Cheat Codes", imageUrl: "banner")
        let pandora = App(name: "Cheat", imageUrl: "banner2")
        let soundCloud = App(name: "Cheat Co", imageUrl: "banner3")
        let appleMusic = App(name: "Cheat ", imageUrl: "banner")
        let twitter = App(name: "Twitter", imageUrl: "banner3")
        let facebook = App(name: "Facebook", imageUrl: "banner2")
        let googlePlus = App(name: "Google Plus", imageUrl: "banner")
        let musicCategory = AppCategory(name: "Music", apps: [spotify, pandora, soundCloud, appleMusic])
        let socialCategory = AppCategory(name: "Video",
                                         apps: [twitter, facebook, googlePlus, twitter, facebook, googlePlus])
        objects = [musicCategory, socialCategory]
    }
    override func numberOfSections() -> Int {
        return objects?.count ?? 0
    }
    override func numberOfItems(_ section: Int) -> Int {
        return 1
    }
    override func item(_ indexPath: IndexPath) -> Any? {
        return objects?[indexPath.section]
    }
    override func headerItem(_ section: Int) -> Any? {
        let category = objects?[section] as? AppCategory
        return category?.name
    }
    override func cellClasses() -> [DatasourceCell.Type] {
        return [AppCategoryCell.self]
    }
}

class AppCategory: Datasource {
    let name: String
    let apps: [App]
    init(name: String, apps: [App]) {
        self.name = name
        self.apps = apps
        super.init()
        self.objects = apps
    }
    override func item(_ indexPath: IndexPath) -> Any? {
        return apps[indexPath.item]
    }
    override func cellClasses() -> [DatasourceCell.Type] {
        return [AppCell.self]
    }
}
