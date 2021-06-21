//
//  LoginRouter.swift
//  HelloViper
//
//  Created by Natanael Diego on 18/06/21.
//

import UIKit

class LoginRouter {
    
    let view = ListDataViewController(nibName: "ListDataViewController", bundle: Bundle.main)
    let interactor = ListDataInteractor()
    let presenter = ListDataPresenter()
    
    init() {
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.output = presenter
    }
    
    func present(on window: UIWindow) {
        window.rootViewController = view
    }
    
}
