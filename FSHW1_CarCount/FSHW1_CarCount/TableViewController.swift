//
//  TableViewController.swift
//  FSHW1_CarCount
//
//  Created by Дмитрий Константинов on 15.04.2021.
//

import UIKit

class TableViewController: UITableViewController {
    
    var cars: [Car] = []
    let errorCar: Car = Car(manufacturer: "Error",
                            model: "Error",
                            body: Car.Body.SUV,
                            yearOfIssue: -1,
                            carNumber: "")

    override func viewDidLoad()
    {
        super.viewDidLoad()
        cars.append(Car(manufacturer: "Honda",
                        model: "Civic",
                        body: Car.Body.Hatch,
                        yearOfIssue: 1999,
                        carNumber: "X443CH38"))
        cars.append(Car(manufacturer: "Nissan",
                        model: "X-Trail",
                        body: Car.Body.SUV,
                        yearOfIssue: 2010,
                        carNumber: ""))
        cars.append(Car(manufacturer: "Honda",
                        model: "Civic",
                        body: Car.Body.Hatch,
                        yearOfIssue: 1999,
                        carNumber: "X443CH38"))
        tableView.rowHeight = 100.0
        
    }
    @IBAction func touchFilterButton(_ sender: UIButton)
    {
        cars = cars.sorted(by: {$0.body.rawValue > $1.body.rawValue})
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return cars.count
    }

    @IBAction func unwindSegue(unwindSegue: UIStoryboardSegue)
    {
        if unwindSegue.identifier == "addCarSegue"
        {
            let vc = unwindSegue.source as! AddCarViewController
            cars.append(vc.newCar ?? errorCar)
            print(vc.newCar ?? errorCar)
            tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let checkYear = cars[indexPath.row].yearOfIssue == -1 ? "-" : "\(cars[indexPath.row].yearOfIssue)"
        
        cell.textLabel?.text = """
            Марка: \(cars[indexPath.row].manufacturer)
            Модель: \(cars[indexPath.row].model)
            Год: \(checkYear)
        """
        cell.detailTextLabel?.text = "\nКузов: \(cars[indexPath.row].body.rawValue)"

        return cell
    }
    
    

}
