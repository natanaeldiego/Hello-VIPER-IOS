//
//  ListDataPresenter.swift
//  HelloViper
//
//  Created by Natanael Diego on 21/06/21.
//

import Foundation
import RxSwift
import RxCocoa
import RxSwiftExt

protocol ListDataPresenterToView: AnyObject {
    var resultList: Observable<SprintData> { get }
    func viewDidLoad()
}

class ListDataPresenter {
    
    weak var view: ListDataViewToPresenter?
    
    //Ponteiro weak para a view
    var interactor: ListDataInteractorInput?
    
    let dispose = DisposeBag()
    
    var sprint = BehaviorRelay<SprintData?>(value: nil)
    
    //Recebendo informações da View e passando para o Interactor
    func bind() {
        if let view = self.view {
            self.interactor?.listData()
            
        }
    }
}

extension ListDataPresenter: ListDataPresenterToView {
    var resultList: Observable<SprintData> {
        return sprint.asObservable().unwrap()
    }
    
    func viewDidLoad() {
        bind()
    }
}

extension ListDataPresenter: ListDataInteractorOutput {
    func sprintDidList(sprint: SprintData) {
        self.sprint.accept(sprint)
    }
    
    func errorOccured(error: Error?){
        debugPrint(error ?? "Deu erro")
    }
}
