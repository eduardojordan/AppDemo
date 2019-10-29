//
//  ViewController.swift
//  AppDemo
//
//  Created by MAC on 29/10/2019.
//  Copyright © 2019 EdJordan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let dataController = DataController()
    
    fileprivate var listOfPeople = [Person](){
        didSet{
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        initialize()
    }
    
    private func initialize(){
        tableView.delegate = self
        tableView.dataSource = self
        dataController.delegate = self
        dataController.requestData(fileName: "people.json")
    }
    
    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfPeople.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let peopleCell = tableView.dequeueReusableCell(withIdentifier: "peopleCell", for: indexPath) as! PeopleTableViewCell
        let person = listOfPeople[indexPath.row]
        
        peopleCell.bind(person: person)
        
        return peopleCell
    }
    
}

extension ViewController: DataControllerDelegate{
    func didReceivedPeople(people: [Person]) {
        self.listOfPeople = people
    }
}
