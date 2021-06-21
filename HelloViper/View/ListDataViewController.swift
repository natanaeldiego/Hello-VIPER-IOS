//
//  ListDataViewController.swift
//  HelloViper
//
//  Created by Natanael Diego on 21/06/21.
//

import UIKit
import RxSwift
import RxSwiftExt
import RxCocoa

protocol ListDataViewToPresenter: AnyObject {
    var credentials: Observable<SprintData> { get }
}


class ListDataViewController: UIViewController {
    
    var tableView = UITableView()

    var presenter: ListDataPresenterToView!
    
    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var linkText: UILabel!
    
    let dispose = DisposeBag()
    
    private var sprint = [SprintDatum]() {
        didSet {
            print("Result data: \(sprint)")
        }
    }
    
    var credential = BehaviorRelay<SprintData?>(value: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        bind()
        tableView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    private func bind() {
        presenter.resultList.bind { [weak self] sprint in
            self?.sprint = sprint
        }
        .disposed(by: dispose)
    }

}

//Passando informações para o Presenter
extension ListDataViewController: ListDataViewToPresenter {
    
    var credentials: Observable<SprintData> {
        return credential.unwrap().asObservable()
    }
}

extension ListDataViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sprint.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let sprintCell = sprint[indexPath.row]
        
        return cell
    }
}
