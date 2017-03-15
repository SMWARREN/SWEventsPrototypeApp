
import UIKit
import LBTAComponents
class iconView: UIView {
    var shouldSetupConstraints = true

    let like: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "like")
        theImageView.translatesAutoresizingMaskIntoConstraints = false
        theImageView.alpha = 0
        return theImageView
    }()
    let dislike: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "dislike")
        theImageView.translatesAutoresizingMaskIntoConstraints = false
        theImageView.alpha = 0
        return theImageView
    }()
    let share: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "share")
        theImageView.translatesAutoresizingMaskIntoConstraints = false
        theImageView.alpha = 0
        return theImageView
    }()
    let love: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "love")
        theImageView.translatesAutoresizingMaskIntoConstraints = false
        theImageView.alpha = 0
        return theImageView
    }()
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        
        addSubview(like)
        addSubview(dislike)
        addSubview(love)
        addSubview(share)

    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func updateConstraints() {
        
        if shouldSetupConstraints {
                       like.anchor(topAnchor, left: leftAnchor,
                        bottom: nil, right: nil,
                        topConstant: 10, leftConstant: 50,
                        bottomConstant: 0, rightConstant: 0,
                        widthConstant: 35, heightConstant: 35)
            dislike.anchor(topAnchor, left: like.leftAnchor,
                           bottom: nil, right: nil,
                           topConstant: 10, leftConstant: 100,
                           bottomConstant: 0, rightConstant: 0,
                           widthConstant: 35, heightConstant: 35)
            love.anchor(topAnchor, left: nil,
                        bottom: nil, right: rightAnchor,
                        topConstant: 10, leftConstant: 0,
                        bottomConstant: 0, rightConstant: 130,
                        widthConstant: 35, heightConstant: 35)
            share.anchor(topAnchor, left: nil,
                         bottom: nil, right: rightAnchor,
                         topConstant: 10, leftConstant: 0,
                         bottomConstant: 0, rightConstant: 50,
                         widthConstant: 35, heightConstant: 35)
                                shouldSetupConstraints = false
        }
        super.updateConstraints()
    }
}
