//
//  ListDataInteractor.swift
//  HelloViper
//
//  Created by Natanael Diego on 21/06/21.
//

import Foundation
import RxSwift

// MARK: - Esse cara será o Presenter
protocol ListDataInteractorOutput: AnyObject {
    func sprintDidList(sprint: SprintData)
    func errorOccured(error: Error?)
}

// MARK: - Esse cara é o Ponteiro strong do Presenter
protocol ListDataInteractorInput: AnyObject {
    func listData()
}

class ListDataInteractor {
    
    weak var output: ListDataInteractorOutput?
    let dispose = DisposeBag()
}

//Recebendo informações do Presenter -> passando para o Entity -> devolvendo os dados da API para o Presenter
extension ListDataInteractor: ListDataInteractorInput {
    func listData() {
        SprintClient.getSprint()
            .subscribe { [weak self = self] event in
                if let sprint = event.element {
                    self?.output?.sprintDidList(sprint: sprint)
                }
                if let error = event.error {
                    self?.output?.errorOccured(error: error)
                }
            }
            .disposed(by: dispose)
    }
}
