//
// Created by Lucas Rocali
// Copyright (c) 2017 Rocali. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController, LoginViewProtocol {

    var presenter: LoginPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func setNavInfo(title: String?, leftBtnText: String?, rightBtnText: String?) {
        self.title = title

        let leftButton =  UIBarButtonItem(title: leftBtnText, style: .plain, target: self, action: #selector(self.leftBtnClicked(_:)))
        self.navigationItem.leftBarButtonItem = leftButton

        let rightButton =  UIBarButtonItem(title: rightBtnText, style: .plain, target: self, action: #selector(self.rightBtnClicked(_:)))
        self.navigationItem.rightBarButtonItem = rightButton
    }

    func leftBtnClicked(_ sender:UIBarButtonItem) {
        presenter?.leftBtnClicked()

    }
    func rightBtnClicked(_ sender:UIBarButtonItem) {
        presenter?.rightBtnClicked()
    }
    @IBAction func login(_ sender: Any) {
        presenter?.loginClicked()
    }
}
