//
//  RootViewController.swift
//  AbsoluteModal
//
//  Created by muukii on 10/7/17.
//  Copyright © 2017 eure. All rights reserved.
//

import UIKit

import EasyPeasy

final class RootViewController : UIViewController {

  lazy var baseViewController = ViewController()
  lazy var topLevelViewController = TopLevelViewController()

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .white

    base: do {
      addChildViewController(baseViewController)

      baseViewController.willMove(toParentViewController: self)
      view.addSubview(baseViewController.view)
      baseViewController.view.easy.layout(Edges())
      baseViewController.didMove(toParentViewController: self)
    }

    top: do {

      addChildViewController(topLevelViewController)

      topLevelViewController.willMove(toParentViewController: self)
      view.addSubview(topLevelViewController.view)
      topLevelViewController.view.easy.layout(Edges())
      topLevelViewController.didMove(toParentViewController: self)
    }
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)


    showAlert: do {

      let alert = UIAlertController(title: "Hello", message: nil, preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
      baseViewController.present(alert, animated: true, completion: {

        let _alert = UIAlertController(title: "Hello", message: nil, preferredStyle: .alert)
        _alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        alert.present(_alert, animated: true, completion: {

        })

      })
    }
  }
}
