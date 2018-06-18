//
//  ViewController.swift
//  PlayInCBA_yoo
//
//  Created by 게임공학과 on 2018. 5. 27..
//  Copyright © 2018년 게임공학과. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBAction func doneToPickerViewController(segue:UIStoryboardSegue){
        
    }
    
    var pickerDataSource = ["필레오", "인천", "남서울", "강북", "신촌", "천안", "성용", "대학로", "서지전"]
    var ChooseCampus : String = "필레오"
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return pickerDataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return pickerDataSource[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        if row == 0{
            ChooseCampus = "필레오"
        } else if row == 1{
            ChooseCampus = "인천"
        } else if row == 2 {
            ChooseCampus = "남서울"
        } else if row == 3 {
            ChooseCampus = "강원"
        } else if row == 4 {
            ChooseCampus = "신촌"
        } else if row == 5 {
            ChooseCampus = "천안"
        } else if row == 6 {
            ChooseCampus = "성용"
        } else if row == 7 {
            ChooseCampus = "대학로"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "SegueToTableView"{
            if let navController = segue.destination as? UINavigationController{
                if let campusTableViewController = navController.topViewController as?
                    CampusTableViewController {
                    campusTableViewController.campusName = ChooseCampus
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pickerView.delegate = self;
        self.pickerView.dataSource = self;
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

