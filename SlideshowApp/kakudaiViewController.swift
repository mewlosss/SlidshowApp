import UIKit

class kakudaiViewController: UIViewController {
    
    var upimage : Int!
    
    @IBOutlet weak var imageview: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
              if (upimage == 0){
            self.imageview.image = UIImage(named: "kakudaigazou1.jpg")
        }else if (upimage == 1){
            self.imageview.image = UIImage(named: "kakudaigazou2.jpg")
        }else if  (upimage == 2){
            self.imageview.image = UIImage(named: "kakudaigazou3.jpg")
        }else if (upimage == 3){
                self.imageview.image = UIImage(named: "kakudaigazou4.jpg")
        }else if (upimage == -1){
                self.imageview.image = UIImage(named: "kakudaigazou4.jpg")
        }else if (upimage == -2){
                self.imageview.image = UIImage(named: "kakudaigazou4.jpg")
        }
    }
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let seni:ViewController = segue.destination as! ViewController
        seni.imagecount = upimage
    }
}
