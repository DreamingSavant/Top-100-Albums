//
//  Utils.swift
//  Top 100 Albums
//
//  Created by Roderick Presswoodd on 5/3/20.
//  Copyright © 2020 Roderick Presswoodd. All rights reserved.
//

import Foundation
import UIKit

class Utils {
static func showActivityIndicator(view: UIView, targetVC: UIViewController) {

    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()

    activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    activityIndicator.backgroundColor = UIColor(red:0.16, green:0.17, blue:0.21, alpha:1)
    activityIndicator.layer.cornerRadius = 6
    activityIndicator.center = targetVC.view.center
    activityIndicator.hidesWhenStopped = true
    activityIndicator.style = UIActivityIndicatorView.Style.large
    activityIndicator.tag = 1
    view.addSubview(activityIndicator)
    activityIndicator.startAnimating()
    view.isUserInteractionEnabled = false
}

static func hideActivityIndicator(view: UIView) {
    let activityIndicator = view.viewWithTag(1) as? UIActivityIndicatorView
    activityIndicator?.stopAnimating()
    activityIndicator?.removeFromSuperview()
    view.isUserInteractionEnabled = true
}
}
