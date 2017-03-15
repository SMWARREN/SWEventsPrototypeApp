//
//  SWCachedImage.swift
//  e-Where
//
//  Created by Sean Warren on 2/19/17.
//  Copyright © 2017 Sean Warren. All rights reserved.
//

import Foundation
import LBTAComponents
import UIKit

open class SWCachedImageView: UIImageView {
    open static let imageCache = NSCache<NSString, DiscardableImageCacheItem>()
    open var shouldUseEmptyImage = true
    private var urlStringForChecking: String?
    private var emptyImage: UIImage?
    public convenience init(cornerRadius: CGFloat = 0, tapCallback: @escaping (() -> (Void))) {
        self.init(cornerRadius: cornerRadius, emptyImage: nil)
        self.tapCallback = tapCallback
        isUserInteractionEnabled = true
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    func handleTap() {
        tapCallback?()
    }
    private var tapCallback: (() -> (Void))?
    public init(cornerRadius: CGFloat = 0, emptyImage: UIImage? = nil) {
        super.init(frame: .zero)
        contentMode = .scaleAspectFill
        backgroundColor = .black
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
        self.emptyImage = emptyImage
    }
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    open func loadImage(urlString: String, completion: (() -> (Void))? = nil) {
        let image1 = getImageWithColor(color: .black, size: CGSize(width: 300, height: 300))
        image = textToImage(drawText: "Loading Image..." as NSString, inImage: image1, atPoint: CGPoint(x: 75, y: 150))
        self.urlStringForChecking = urlString
        let urlKey = urlString as NSString
        if let cachedItem = SWCachedImageView.imageCache.object(forKey: urlKey) {
            image = cachedItem.image
            completion?()
            return
        }
        guard let url = URL(string: urlString) else {
            if shouldUseEmptyImage {
                image = emptyImage
            }
            return
        }
        URLSession.shared.dataTask(with: url, completionHandler: { [weak self] (data, _, error) in
            if error != nil {
                return
            }
            DispatchQueue.main.async {
                if let image = UIImage(data: data!) {
                    let cacheItem = DiscardableImageCacheItem(image: image)
                    SWCachedImageView.imageCache.setObject(cacheItem, forKey: urlKey)
                    if urlString == self?.urlStringForChecking {
                        self?.image = image
                        completion?()
                    }
                }
            }
        }) .resume()
    }
    open func textToImage(drawText text: NSString, inImage image: UIImage, atPoint point: CGPoint) -> UIImage {
        let textColor = UIColor.white
        let textFont = UIFont(name: "HelveticaNeue-Light", size: 20)!
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(image.size, false, scale)
        let textFontAttributes = [
            NSFontAttributeName: textFont,
            NSForegroundColorAttributeName: textColor
            ] as [String : Any]
        image.draw(in: CGRect(origin: CGPoint.zero, size: image.size))
        let rect = CGRect(origin: point, size: image.size)
        text.draw(in: rect, withAttributes: textFontAttributes)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    open func getImageWithColor(color: UIColor, size: CGSize) -> UIImage {
        let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: size.width, height: size.height))
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}
