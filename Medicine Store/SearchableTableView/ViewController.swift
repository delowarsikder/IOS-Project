//
//  ViewController.swift
//  SearchableTableView
//
//  Created by Delowar on 12/4/19.
//  Copyright © 2019 Delowar. All rights reserved.
//

import UIKit
class Courses : Decodable {
    let id:Int
    let name:String
    let link:String
    let imageUrl:String
    let number_of_lessons: Int

    init(id :Int,name:String,link:String,imageUrl:String,number_of_lessons:Int) {
        self.id = id
        self.name = name
        self.link = link
        self.imageUrl = imageUrl
        self.number_of_lessons = number_of_lessons
    }
}

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource,UISearchBarDelegate{
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var table: UITableView!
//    var developers : Developers
    
    var details = [Courses]()
    
    var medicineArray = [Medicine]()//set up tabel view
    var currentMedicineArray = [Medicine]() //set up current array
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let jsonUrl = "https://api.letsbuildthatapp.com/jsondecodable/courses"
        guard let url = URL(string: jsonUrl) else {return}
        URLSession.shared.dataTask(with: url) { (data, respons, err) in
            do{
               let courses = try JSONDecoder().decode([Courses].self, from: data!)
                for i in 0..<courses.count
                {
                    print(courses[i].id , courses[i].name + "\n")
                    
                    self.details.append(Courses(id: courses[i].id, name: courses[i].name, link: courses[i].link, imageUrl: courses[i].imageUrl, number_of_lessons: courses[i].number_of_lessons))
                }
                

            } catch let jsonerr {
                print("Error serializing json",jsonerr)
            }
            
            }.resume()
        
        setUpMedicine();
        setUpSearchBar();
    }
    
    private func setUpMedicine(){
        medicineArray.append(Medicine(name: "Ben", price: "10 tk",image: "ben.jpg"))
        medicineArray.append(Medicine(name: "Calopril", price: "50 tk",image: "calopril.jpg"))
        medicineArray.append(Medicine(name: "Dirozyl", price: "60 tk",image: "dirozyl.jpg"))
        medicineArray.append(Medicine(name: "Histacin", price: "5 tk",image: "histacin.jpg"))
        medicineArray.append(Medicine(name: "Landocin", price: "25 tk",image: "landocin.jpg"))
        medicineArray.append(Medicine(name: "Napa", price: "20 tk",image: "napa.jpg"))
        medicineArray.append(Medicine(name: "Priton", price: "15 tk",image: "priton.jpg"))
        medicineArray.append(Medicine(name: "Recipro", price: "20 tk",image: "recipro.jpg"))
        medicineArray.append(Medicine(name: "Seclo", price: "50 tk",image: "seclo.jpg"))
        medicineArray.append(Medicine(name: "Sedno", price: "30 tk",image: "sedno.jpg"))
        medicineArray.append(Medicine(name: "Sompraz", price: "80 tk",image: "sompraz.jpg"))
        currentMedicineArray = medicineArray
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentMedicineArray.count
//  return details.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for: indexPath) as? TableCell else{
            return UITableViewCell()
        }
        cell.ImageView.image = UIImage(named: currentMedicineArray[indexPath.row].image)
        cell.nameLabel.text = currentMedicineArray[indexPath.row].name
        cell.rollLabel.text = currentMedicineArray[indexPath.row].price
        //print cell index
        
        cell.cellDelegate =  self
        cell.index = indexPath
//            cell.ImageView?.image = UIImage(named: "test.jpg");
//            cell.nameLabel?.text = self.details[indexPath.row].name
//            cell.rollLabel?.text = self.details[indexPath.row].link
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    //Search bar
    func setUpSearchBar(){
        searchBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        guard !searchText.isEmpty else {
        currentMedicineArray = medicineArray
            table.reloadData()
            return
        }
        currentMedicineArray = medicineArray.filter({medicine ->Bool in medicine.name.lowercased().contains(searchText.lowercased())
            
        })
        table.reloadData()
    }
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
    }
}


class Medicine{
    let name : String
    let image : String
    let price : String
    init(name : String,price : String,image: String) {
        self.name = name
        self.price = price
        self.image = image
    }
}



extension ViewController:TableViewNew{
    func onClickCell(index: Int) {
        print(medicineArray[index].name)
        print("\(index) is clicked")
    }
    
}

