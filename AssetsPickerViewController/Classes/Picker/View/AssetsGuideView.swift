//
//  AssetsGuideView.swift
//  Pods
//
//  Created by DragonCherry on 5/26/17.
//
//

import Foundation
import SwiftARGB

open class AssetsGuideView: UIView {
    
    private var didSetupConstraints: Bool = false
    var lineSpace: CGFloat = 10
    var titleStyle: UIFontTextStyle = .title1
    var bodyStyle: UIFontTextStyle = .body
    
    lazy var messageLabel: UILabel = {
        let label = UILabel.newAutoLayout()
        label.textAlignment = .center
        label.numberOfLines = 10
        return label
    }()
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit() {
        backgroundColor = .white
        addSubview(messageLabel)
    }
    
    open override func updateConstraints() {
        if !didSetupConstraints {
            messageLabel.autoCenterInSuperview()
            messageLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 15)
//            messageLabel.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15))
            didSetupConstraints = true
        }
        super.updateConstraints()
    }
    
    open func set(title: String, message: String) {
        
        let attributedString = NSMutableAttributedString()
        
        let titleParagraphStyle = NSMutableParagraphStyle()
        titleParagraphStyle.paragraphSpacing = lineSpace
        titleParagraphStyle.alignment = .center
        let attributedTitle = NSMutableAttributedString(string: "\(title)\n", attributes: [
            NSAttributedStringKey.font: UIFont.systemFont(forStyle: titleStyle),
            NSAttributedStringKey.foregroundColor: UIColor(rgbHex: 0x999999),
            NSAttributedStringKey.paragraphStyle: titleParagraphStyle
            ])
        
        let bodyParagraphStyle = NSMutableParagraphStyle()
        bodyParagraphStyle.alignment = .center
        bodyParagraphStyle.firstLineHeadIndent = 20
        bodyParagraphStyle.headIndent = 20
        bodyParagraphStyle.tailIndent = -20
        let attributedBody = NSMutableAttributedString(string: message, attributes: [
            NSAttributedStringKey.font: UIFont.systemFont(forStyle: bodyStyle),
            NSAttributedStringKey.foregroundColor: UIColor(rgbHex: 0x999999),
            NSAttributedStringKey.paragraphStyle: bodyParagraphStyle
            ])
        
        attributedString.append(attributedTitle)
        attributedString.append(attributedBody)
        messageLabel.attributedText = attributedString
    }
}
