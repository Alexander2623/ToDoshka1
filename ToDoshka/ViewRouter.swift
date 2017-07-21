//
//  ViewRouter.swift
//  ToDoshka
//
//  Created by Александр on 21.07.17.
//  Copyright © 2017 Александр. All rights reserved.
//

import UIKit

protocol ViewRouter {
  func prepare(for segue: UIStoryboardSegue, sender: Any?)
}

extension ViewRouter {
  func prepare(for segue: UIStoryboardSegue, sender: Any?) { }
}
