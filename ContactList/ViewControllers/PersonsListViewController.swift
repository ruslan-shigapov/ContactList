//
//  PersonsListViewController.swift
//  ContactList
//
//  Created by Руслан Шигапов on 19.10.2022.
//

import UIKit

class PersonsListViewController: UITableViewController {
    var persons: [Person]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "person", for: indexPath)
        let person = persons[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = person.fullName
        cell.contentConfiguration = content
        return cell
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let infoVC = segue.destination as? InfoViewController
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        infoVC?.person = persons[indexPath.row]
    }
    
    // MARK: - Private Methods
    private func setupData() {
        guard let tabBar = tabBarController as? TabBarViewController else { return }
        persons = tabBar.persons
    }
}
