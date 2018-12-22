//
//  AssetsNoPermissionView.swift
//  Pods
//
//  Created by DragonCherry on 5/26/17.
//
//

import UIKit
import SwiftARGB

open class AssetsNoPermissionView: AssetsGuideView {
   
    public fileprivate(set) lazy var permissionButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle(NSLocalizedString("authorization_status_empty_button", comment: ""), for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(permissionButtonClick(_:)), for: .touchUpInside)
        return button
    }()
    
    override func commonInit() {
        set(title: String(key: "Title_No_Permission"), message: String(key: "Message_No_Permission"))
        super.commonInit()
        addSubview(permissionButton)
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        permissionButton.sizeToFit()
        permissionButton.center = CGPoint(x: bounds.midX, y: messageLabel.frame.origin.y + messageLabel.frame.height + permissionButton.frame.height)
    }
    
    @objc func permissionButtonClick(_ sender: UIButton) {
        if let appSettings = URL(string: UIApplicationOpenSettingsURLString) {
            UIApplication.shared.openURL(appSettings)
        }
    }
}
