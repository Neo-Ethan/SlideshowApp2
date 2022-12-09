//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by Hiro Katoh on 2022/12/04.
//

import UIKit

class ResultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = image
        // Do any additional setup after loading the view.
    }
    
    var image: UIImage? = nil
    @IBOutlet weak var imageView: UIImageView!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
