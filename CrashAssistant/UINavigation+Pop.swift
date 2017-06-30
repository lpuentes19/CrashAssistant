//
//  UINavigation+Pop.swift
//  CrashAssistant
//
//  Created by Luis Puentes on 6/29/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {
    func popToViewController<T: UIViewController>(withType type: T.Type) {
        for viewController in self.viewControllers {
            if viewController is T {
                self.popToViewController(viewController, animated: true)
                return
            }
        }
    }
}
