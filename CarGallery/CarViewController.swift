//
//  ViewController.swift
//  CarGallery
//
//  Created by Doe on 2/9/18.
//  Copyright © 2018 Doe. All rights reserved.
//
import UIKit

class CarViewController: UIViewController {
    @IBOutlet var carSpecsLabel: UILabel!
    @IBOutlet var carImageView: UIImageView!
    var carToBeViewed : Car?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        carImageView.image = carToBeViewed?.getCarImage
        carSpecsLabel.text = carToBeViewed?.getSpecs
        self.title = carToBeViewed?.getModelName
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

struct Car  {
    // MARK:  - Properties
    private var carImage :UIImage?
    private var specs : String?
    private var modelName : String?
    var getModelName : String? {return self.modelName }
    var getCarImage : UIImage? { return self.carImage }
    var getSpecs : String? { return self.specs }
    
    init(specsDictionary :[String:String] ) {
        var specsArray = Array(specsDictionary.values)
        if let addressUrl = URL(string: specsArray.remove(at: 0)) , let data = try? Data(contentsOf: addressUrl) {
            let image = UIImage(data: data)
            carImage = image
        }
        modelName = specsArray.remove(at: 3)
        specs = specsArray.map{String($0)}.joined(separator: "\n")
    }
}
