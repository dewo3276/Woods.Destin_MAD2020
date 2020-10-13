//
//  ViewController.swift
//  Spice It Up
//
//  Created by Dusty on 10/1/20.
//  Copyright © 2020 Destin Woods. All rights reserved.
//

import UIKit

let filterCategories=["Cuisine Type":["Chinese","Indian","Italian","Mediteranian","Mexican","Thai"],"Time":["30 mins", "1 hour", "1+ hour"],"Dietary Needs":["Dairy Free","Vegan","Vegetarian"]]

let filterKeys=["Cuisine Type","Time","Dietary Needs"]

let ChineseCat=[["30 mins","Dairy Free"]:"https://www.simplyrecipes.com/recipes/easy_coconut_shrimp_curry/",["30 mins","Vegetarian"]:"https://www.simplyrecipes.com/recipes/easy_vegetable_stir_fried_rice/",["30 mins", "Vegan"]:"https://www.simplyrecipes.com/recipes/easy_vegetable_lo_mein/",["1 hour","Dairy Free"]:"https://www.simplyrecipes.com/recipes/chili_garlic_chicken/",["1 hour","Vegetarian"]:"https://www.simplyrecipes.com/recipes/asian_noodle_salad/",["1 hour","Vegan"]:"https://www.simplyrecipes.com/recipes/scallion_pancakes/",["1+ hour","Dairy Free"]:"https://www.simplyrecipes.com/recipes/sous_vide_sesame_chicken/",["1+ hour","Vegetarian"]:"https://biancazapatka.com/en/pan-fried-bao-buns-vegan-steamed-dumplings/",["1+ hour","Vegan"]:"https://thefoodietakesflight.com/chinese-chive-pies-vegan-recipe/"]

let IndianCat=[["30 mins","Dairy Free"]:"https://www.simplyrecipes.com/recipes/easy_coconut_shrimp_curry/",["30 mins","Vegetarian"]:"https://www.simplyrecipes.com/recipes/shahi_cauliflower_curry/",["30 mins", "Vegan"]:"https://www.simplyrecipes.com/recipes/red_lentil_dal/",["1 hour","Dairy Free"]:"https://www.simplyrecipes.com/recipes/shahi_cauliflower_curry/",["1 hour","Vegetarian"]:"https://www.simplyrecipes.com/recipes/saffron_rice_pilaf/",["1 hour","Vegan"]:"https://www.simplyrecipes.com/recipes/chana_masala/",["1+ hour","Dairy Free"]:"https://www.simplyrecipes.com/recipes/tandoori_chicken/",["1+ hour","Vegetarian"]:"https://www.simplyrecipes.com/recipes/vegetable_samosas_with_mint_cilantro_chutney/",["1+ hour","Vegan"]:"https://www.simplyrecipes.com/recipes/slow_cooker_chickpea_curry_with_sweet_potatoes_and_red_peppers/"]

let ItalianCat=[["30 mins","Dairy Free"]:"https://oursaltykitchen.com/white-bean-soup-italian-sausage/",["30 mins","Vegetarian"]:"https://www.simplyrecipes.com/recipes/pasta_with_spinach_artichokes_and_ricotta/",["30 mins", "Vegan"]:"https://vegetariangastronomy.com/pasta-primavera-vegan-option-gluten/?utm_medium=social&utm_source=pinterest&utm_campaign=tailwind_tribes&utm_content=tribes&utm_term=1132129546_55439898_104863",["1 hour","Dairy Free"]:"https://shawsimpleswaps.com/dairy-free-lasagna/",["1 hour","Vegetarian"]:"https://www.simplyrecipes.com/recipes/cheesy_tortellini_casserole/",["1 hour","Vegan"]:"https://namelymarly.com/meatless-baked-ziti-vegan/",["1+ hour","Dairy Free"]:"https://oursaltykitchen.com/instant-pot-beef-ragu/",["1+ hour","Vegetarian"]:"https://www.simplyrecipes.com/recipes/eggplant_parmesan/",["1+ hour","Vegan"]:"https://homecookedroots.com/margherita-flatbread-pizza/?utm_medium=social&utm_source=pinterest&utm_campaign=tailwind_tribes&utm_content=tribes&utm_term=1102311832_53347532_104863"]

let MediteranianCat=[["30 mins","Dairy Free"]:"https://www.simplyrecipes.com/recipes/scrambled_eggs_with_tomatillos/",["30 mins","Vegetarian"]:"https://www.simplyrecipes.com/recipes/grilled_mexican_street_corn_elotes/",["30 mins", "Vegan"]:"https://www.simplyrecipes.com/recipes/bbq_pulled_jackfruit_tacos/",["1 hour","Dairy Free"]:"https://www.simplyrecipes.com/recipes/chicken_fajitas/",["1 hour","Vegetarian"]:"https://www.simplyrecipes.com/recipes/enchiladas/",["1 hour","Vegan"]:"https://www.simplyrecipes.com/recipes/pineapple_salsa_with_jicama/",["1+ hour","Dairy Free"]:"https://www.simplyrecipes.com/recipes/posole_rojo/",["1+ hour","Vegetarian"]:"https://www.eatingbirdfood.com/roasted-broccoli-kale-quinoa-salad/",["1+ hour","Vegan"]:"https://www.themediterraneandish.com/briam-greek-roasted-vegetables/"]

let MexicanCat=[["30 mins","Dairy Free"]:"https://www.simplyrecipes.com/recipes/scrambled_eggs_with_tomatillos/",["30 mins","Vegetarian"]:"https://www.simplyrecipes.com/recipes/grilled_mexican_street_corn_elotes/",["30 mins", "Vegan"]:"https://www.simplyrecipes.com/recipes/bbq_pulled_jackfruit_tacos/",["1 hour","Dairy Free"]:"https://www.simplyrecipes.com/recipes/chicken_fajitas/",["1 hour","Vegetarian"]:"https://www.simplyrecipes.com/recipes/enchiladas/",["1 hour","Vegan"]:"https://www.simplyrecipes.com/recipes/pineapple_salsa_with_jicama/",["1+ hour","Dairy Free"]:"https://www.simplyrecipes.com/recipes/posole_rojo/",["1+ hour","Vegetarian"]:"https://www.thegraciouswife.com/mexican-breakfast-casserole/",["1+ hour","Vegan"]:"https://yumveganlunchideas.com/vegan-tortas-with-bbq-seitan-ribs/"]

let ThaiCat=[["30 mins","Dairy Free"]:"https://www.ambitiouskitchen.com/spicy-thai-peanut-chicken-sweet-potato-noodle-stir-fry/",["30 mins","Vegetarian"]:"https://veggiesociety.com/vegan-zuppa-toscana-recipe/",["30 mins", "Vegan"]:"https://earthofmaria.com/easy-vegan-pad-thai/",["1 hour","Dairy Free"]:"https://www.evolvingtable.com/baked-thai-chicken-wings/",["1 hour","Vegetarian"]:"None",["1 hour","Vegan"]:"None",["1+ hour","Dairy Free"]:"None",["1+ hour","Vegetarian"]:"None",["1+ hour","Vegan"]:"None"]

var pickerCaseNum = 0

var mainChoice1 = "Any"
var mainChoice2 = "Any"
var mainChoice3 = "Any"
var choice1 = "Any"
var choice2 = "Any"
var choice3 = "Any"

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var filter1label: UILabel!
       
    @IBOutlet weak var filter1button: UIButton!
    @IBOutlet weak var filter2button: UIButton!
    @IBOutlet weak var filter3button: UIButton!
    
    @IBOutlet weak var additionButton: UIButton!
    @IBOutlet weak var addition2button: UIButton!
    @IBOutlet weak var addition3button: UIButton!
    @IBOutlet weak var GoNow: UIButton!
    
    @IBOutlet weak var filterPikcer: UIPickerView!
    
    //set number of scrollers (columns) in picker view
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    //set number of items in each component
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component==0{
            return filterKeys.count
        }
        else{
            let selected = pickerView.selectedRow(inComponent: 0)
            return filterCategories[filterKeys[selected]]!.count
        }
        
    }
    
    //give each item in each component a name on the scroll wheel
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0{
            return filterKeys[row]
        }
        else{
            let selected = pickerView.selectedRow(inComponent: 0)
            
            //index error that was never found until exiting app to go to safari. Does not seem to change functionality but no errors now
            if row>filterCategories[filterKeys[selected]]!.count-1
            {
                return filterCategories[filterKeys[selected]]![0]
            }
            return filterCategories[filterKeys[selected]]![row]
        }
    }
    
    //find which item was selected in the compoenent and change other component accordingly via the dictionary up top
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerView.reloadComponent(1)
        
        let mainFilter=filterKeys[pickerView.selectedRow(inComponent: 0)] //pick out main filter in first component and save
        let subFilter=filterCategories[filterKeys[pickerView.selectedRow(inComponent: 0)]] //pick out second filter in second component and save
        var selected=pickerView.selectedRow(inComponent: 1) //what subfilter was selected
        
        //gets rid of outside of index errors when scrolling from cuisine filters to a filter with less items in the second component
        if selected > filterCategories[filterKeys[pickerView.selectedRow(inComponent: 0)]]!.count-1
            {
                selected=0
            }
        
        //pickerCaseNum is a varriable to keep track of which filterbutton was selected last. Which ever one was selected last, make sure to update only the title of that button
        switch pickerCaseNum {
        case 0:
             filter1button.setTitle("\(mainFilter): \(subFilter![selected])", for: UIControl.State.normal)
             mainChoice1="\(mainFilter)"
             choice1="\(subFilter![selected])"
            break
        case 1:
             filter2button.setTitle("\(mainFilter): \(subFilter![selected])", for: UIControl.State.normal)
             mainChoice2="\(mainFilter)"
             choice2="\(subFilter![selected])"
            break
        case 2:
             filter3button.setTitle("\(mainFilter): \(subFilter![selected])", for: UIControl.State.normal)
             mainChoice3="\(mainFilter)"
             choice3="\(subFilter![selected])"
            break
        default:
            print("error")
        }
    }
    
   
    //activation function for picking based on filters
    @IBAction func goButton(_ sender: UIButton)
    {
        //also doubles as a button to exit the current filter picker view and save the results to that filter button
        if GoNow.currentBackgroundImage == UIImage(named:"done button") //check to make sure we are not in go button mode
        {
            filterPikcer.isHidden=true
            GoNow.setBackgroundImage(UIImage(named:"go button"), for: UIControl.State.normal) //change back to go button so user knows they are not editing anymore and can use the function to get a recipe with the inputs they selected
            return
        }
        //now we figure out what the user chose as filters and start finding the recipe links based on the filters
        else
        {
            var arr=[mainChoice1,mainChoice2,mainChoice3]
            var arr2=[choice1,choice2,choice3]
            var counts = arr.reduce(into: [:]) { counts, word in counts[word, default: 0] += 1 } // for counting occurances of words within array: https://stackoverflow.com/questions/30545518/how-to-count-occurrences-of-an-element-in-a-swift-array
            
            var tempArray=Array(counts.keys)
            tempArray=tempArray.sorted(by: <) //sort alphabetically. Now we know that Any will always appear in the 0 index because it is the only filter with the letter "A"

            var choice:String,choiceS:String,choiceF:String
            
            //if all filters are set to any
            if counts.values.count==1 && Array(counts.keys)[0]=="Any"
            {
                var randomInt = Int.random(in: 1...6)
                //pick category of cuisine randomly
                switch randomInt
                {
                case 1:
                    //generate full list of values within category and pick randomly
                    randomInt=Int.random(in: 0...ChineseCat.values.count-1)
                    var ar=Array(ChineseCat.values)
                    UIApplication.shared.open(URL (string: ar[randomInt])!) //takes user to recipe website
                    break
                case 2:
                    randomInt=Int.random(in: 0...IndianCat.values.count-1)
                    var ar=Array(IndianCat.values)
                    UIApplication.shared.open(URL (string: ar[randomInt])!)
                    break
                case 3:
                    randomInt=Int.random(in: 0...ItalianCat.values.count-1)
                    var ar=Array(ItalianCat.values)
                    UIApplication.shared.open(URL (string: ar[randomInt])!)
                    break
                case 4:
                    randomInt=Int.random(in: 0...MediteranianCat.values.count-1)
                    var ar=Array(MediteranianCat.values)
                    UIApplication.shared.open(URL (string: ar[randomInt])!)
                    break
                case 5:
                    randomInt=Int.random(in: 0...MexicanCat.values.count-1)
                    var ar=Array(MexicanCat.values)
                    UIApplication.shared.open(URL (string: ar[randomInt])!)
                    break
                case 6:
                    randomInt=Int.random(in: 0...3)
                    var ar=Array(ThaiCat.values)
                    UIApplication.shared.open(URL (string: ar[randomInt])!)
                    break
                default:
                    print("error")
                }
            }
                
            //prevents user from having multiple of the same filter. i.e. Dietary and Dietary
            else if (counts.count==1 || counts.count==2) && (counts[tempArray[0]] != 2)//if counts.values.count only equals 1, the user has set cuisine type or dietary needs or time 3 times because there is only one category for the count to produce. check and make sure we don't have multiple "Any"s though
            {
                let alert=UIAlertController(title: "Error", message: "You can't have two or three filters that are the same. Please make all filters different or delete a filter", preferredStyle: .alert) //send out message
                
                let okAction = UIAlertAction(title: "OK", style: .default, handler: { action -> Void in
                                    //dismiss the action with ok button
                })
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
            }
            
                //if cuisine was the only thing chosen
            else if (tempArray[1] == "Cuisine Type") && counts["Any"]==2
            {
                var choice="Any"
                var randInt=Int.random(in: 0...2)
                
                //find which choice has cuisine type in it and save that
                for n in 0...2
                {
                    if arr[n]=="Cuisine Type"
                    {
                        choice=arr2[n]
                    }
                }
                
                //use cuisine choice to pick category
                switch choice {
                case "Chinese":
                    //use initial randint for which time to pick
                    //time must always come first in order to correctly pick within dictionary
                    choiceF = filterCategories["Time"]![randInt]
                    
                    //reset randint for second choice
                    randInt=Int.random(in: 0...2)
                    choiceS = filterCategories["Dietary Needs"]![randInt]
                    
                    //use all these choice generated to get link
                    UIApplication.shared.open(URL (string: ChineseCat[[choiceF,choiceS]]!)!)
                    break
                case "Indian":
                    choiceF = filterCategories["Time"]![randInt]
                    randInt=Int.random(in: 0...2)
                    choiceS = filterCategories["Dietary Needs"]![randInt]
                    UIApplication.shared.open(URL (string: IndianCat[[choiceF,choiceS]]!)!)
                    break
                case "Italian":
                    choiceF = filterCategories["Time"]![randInt]
                    randInt=Int.random(in: 0...2)
                    choiceS = filterCategories["Dietary Needs"]![randInt]
                    UIApplication.shared.open(URL (string: ItalianCat[[choiceF,choiceS]]!)!)
                    break
                case "Mediteranian":
                    choiceF = filterCategories["Time"]![randInt]
                    randInt=Int.random(in: 0...2)
                    choiceS = filterCategories["Dietary Needs"]![randInt]
                    UIApplication.shared.open(URL (string: MediteranianCat[[choiceF,choiceS]]!)!)
                    break
                case "Mexican":
                    choiceF = filterCategories["Time"]![randInt]
                    randInt=Int.random(in: 0...2)
                    choiceS = filterCategories["Dietary Needs"]![randInt]
                    UIApplication.shared.open(URL (string: MexicanCat[[choiceF,choiceS]]!)!)
                    break
                case "Thai":
                    choiceF = filterCategories["Time"]![randInt]
                    randInt=Int.random(in: 0...2)
                    choiceS = filterCategories["Dietary Needs"]![randInt]
                    if choiceS != "Dairy Free" && choiceF != "30 mins"
                    {
                        choiceF="30 mins"
                    }
                    UIApplication.shared.open(URL (string: ThaiCat[[choiceF,choiceS]]!)!)
                    break
                default:
                    print("error")
                }
            }
            
                //everything but cuisine was chosen
            else if counts["Any"]==1 && counts["Cuisine Type"]==nil
            {
                var randInt=Int.random(in: 1...6)
                var choiceF="Any"
                var choiceS="Any"
                
                //find where both choices were made and save them with time being the first element
                for n in 0...2 {
                    if arr[n]=="Time"
                    {
                        choiceF=arr2[n]
                    }
                    else if arr[n]=="Dietary Needs"
                    {
                        choiceS=arr2[n]
                    }
                }
                
                //no cuisine was chosen so make that up
                switch randInt {
                case 1:
                    UIApplication.shared.open(URL (string: ChineseCat[[choiceF,choiceS]]!)!)
                    break
                case 2:
                    UIApplication.shared.open(URL (string: IndianCat[[choiceF,choiceS]]!)!)
                    break
                case 3:
                    UIApplication.shared.open(URL (string: ItalianCat[[choiceF,choiceS]]!)!)
                    break
                case 4:
                    UIApplication.shared.open(URL (string: MediteranianCat[[choiceF,choiceS]]!)!)
                    break
                case 5:
                    UIApplication.shared.open(URL (string: MexicanCat[[choiceF,choiceS]]!)!)
                    break
                case 6:
                    //it seems no recipes exist for longer than 30 mins for vegan or vegetarian options in the thai category
                    if choiceS != "Dairy Free" && choiceF != "30 mins"
                    {
                        choiceF="30 mins"
                    }
                    UIApplication.shared.open(URL (string: ThaiCat[[choiceF,choiceS]]!)!)
                    break
                default:
                    print("error")
                }
            }
            
                //only one parameter was chosen
            else
            {
                var randInt=Int.random(in: 1...6)
                var choiceF="Any"
                var choiceS="Any"
                
                //find the one parameter chosen and save it
                for n in 0...2 {
                    if arr[n]=="Time"
                    {
                        choiceF=arr2[n]
                    }
                    else if arr[n]=="Dietary Needs"
                    {
                        choiceS=arr2[n]
                    }
                }
                
                //take the parameter not chosen by the user and create a randomized parameter for it
                if choiceF=="Any"
                {
                    randInt=Int.random(in: 0...2)
                    choiceF=filterCategories["Time"]![randInt]
                }
                if choiceS=="Any"
                {
                    randInt=Int.random(in: 0...2)
                    choiceS=filterCategories["Dietary Needs"]![randInt]
                }
                
                //since no cuisine was chosen in this instance, choose a cuisine and work from there using what we created above and the 1 user input we had
                randInt=Int.random(in: 1...6)
                switch randInt {
                case 1:
                    UIApplication.shared.open(URL (string: ChineseCat[[choiceF,choiceS]]!)!)
                    break
                case 2:
                    UIApplication.shared.open(URL (string: IndianCat[[choiceF,choiceS]]!)!)
                    break
                case 3:
                    UIApplication.shared.open(URL (string: ItalianCat[[choiceF,choiceS]]!)!)
                    break
                case 4:
                    UIApplication.shared.open(URL (string: MediteranianCat[[choiceF,choiceS]]!)!)
                    break
                case 5:
                    UIApplication.shared.open(URL (string: MexicanCat[[choiceF,choiceS]]!)!)
                    break
                case 6:
                    if choiceS != "Dairy Free" && choiceF != "30 mins"
                    {
                        choiceF="30 mins"
                    }
                    UIApplication.shared.open(URL (string: ThaiCat[[choiceF,choiceS]]!)!)
                    break
                default:
                    print("error")
                }
            }

    }
}
    func bringUpPicker() {
        filterPikcer.isHidden=false
        GoNow.setBackgroundImage(UIImage(named:"done button"), for: UIControl.State.normal)
    }
    
    @IBAction func labeledButton1(_ sender: UIButton) {
        bringUpPicker()
        pickerCaseNum=0
    }
    @IBAction func labeledButton2(_ sender: UIButton) {
        bringUpPicker()
        pickerCaseNum=1
    }
    @IBAction func labeledButton3(_ sender: UIButton) {
        bringUpPicker()
        pickerCaseNum=2
    }
    
    //add icon action
    @IBAction func addFilterButton(_ sender: UIButton) {
        //if button for picker is gone, reveal it and change plus icon to the left to x to allow user to get rid of this new filter
        if filter1button.isHidden==true{
            filter1button.isHidden=false
             additionButton.setBackgroundImage(UIImage(named:"exit button"), for: UIControl.State.normal)
            return
        }
        
        //"else" we are already at the x button so the user is trying to get rid of this filter. Hide the filter button for the picker and change the button back to a + icon
        filter1button.isHidden=true
        additionButton.setBackgroundImage(UIImage(named:"add button"), for: UIControl.State.normal)
        filter1button.setTitle("Any", for: UIControl.State.normal)
        
        //make sure to reset choices and set them later within the picker functions
        choice1="Any"
        mainChoice1="Any"
    }
    
    @IBAction func addFilter2Button(_ sender: UIButton) {
        if filter2button.isHidden==true{
            filter2button.isHidden=false
             addition2button.setBackgroundImage(UIImage(named:"exit button"), for: UIControl.State.normal)
            return
        }
        filter2button.isHidden=true
        addition2button.setBackgroundImage(UIImage(named:"add button"), for: UIControl.State.normal)
        filter2button.setTitle("Any", for: UIControl.State.normal)
        choice2="Any"
        mainChoice2="Any"
    }
    
    
    @IBAction func addFilter3Button(_ sender: UIButton) {
        if filter3button.isHidden==true{
            filter3button.isHidden=false
             addition3button.setBackgroundImage(UIImage(named:"exit button"), for: UIControl.State.normal)
            return
        }
        filter3button.isHidden=true
        addition3button.setBackgroundImage(UIImage(named:"add button"), for: UIControl.State.normal)
        filter3button.setTitle("Any", for: UIControl.State.normal)
        choice3="Any"
        mainChoice3="Any"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filterPikcer.delegate=self
        filterPikcer.dataSource=self
        // Do any additional setup after loading the view.
    }


}

