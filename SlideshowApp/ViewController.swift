import UIKit

class ViewController: UIViewController {
//    定義
    @IBOutlet weak var gazou: UIImageView!
    let image0 = UIImage(named: "再生")
    let image1 = UIImage(named: "停止")
    @IBOutlet weak var startbutton: UIButton!
    @IBOutlet weak var downcountbutton: UIButton!
    @IBOutlet weak var upcountbutton: UIButton!
    
    var count = 0
    var imagecount = 0
    var timer1 = Timer()
    @IBOutlet weak var kakuninlabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
//        初期画面・拡大後画面
        startbutton.setImage(image0, for: .normal)
        
        if (imagecount == 0) {
            gazou.image = UIImage(named: "gazou1.jpg")
        }else if (imagecount == 1){
           gazou.image = UIImage(named: "gazou2.jpg")
    }else if (imagecount == 2){
           gazou.image = UIImage(named: "gazou3.jpg")
        }else if (imagecount == 3){
            gazou.image = UIImage(named: "gazou4.jpg")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func startbutton(_ sender: Any) {
//        startbuttonおす
        count = count + 1
        upcountbutton.isEnabled = false
        downcountbutton.isEnabled = false
        
        if(count == 1){
//            再生ボタンにする
            startbutton.setImage(image1, for: .normal)
            timer1 = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true, block: { (Timer) in
                self.imagecount = self.imagecount + 1
//                ２秒ごとにスライドショーにする
                if (self.imagecount == 0){
                    self.gazou.image = UIImage(named: "gazou0.jpg")
                }else if (self.imagecount == 1){
                    self.gazou.image = UIImage(named: "gazou1.jpg")
                }else if (self.imagecount == 2){
                    self.gazou.image = UIImage(named: "gazou2.jpg")
                }else if (self.imagecount == 3){
                    self.gazou.image = UIImage(named: "gazou3.jpg")
                        self.imagecount = -1
                }})
//            ボタンを復活させる・タイマーの終了
        }else if (count == 2){
            self.startbutton.setImage(image0, for: .normal)
            self.timer1.invalidate()
            self.count = 0
            upcountbutton.isEnabled = true
            downcountbutton.isEnabled = true
            
        }
    }
    @IBAction func upcountbutton(_ sender: Any) {
//        画像を進める
        self.imagecount = self.imagecount + 1
        if (imagecount == 0) {
            gazou.image = UIImage(named: "gazou1.jpg")
        }else if (imagecount == 1){
            self.gazou.image = UIImage(named: "gazou2.jpg")
        }else if (imagecount == 2){
            self.gazou.image = UIImage(named: "gazou3.jpg")
        }else if (imagecount == 3){
            self.gazou.image = UIImage(named: "gazou4.jpg")
            imagecount = -1
        }
    }
    @IBAction func downcountbutton(_ sender: Any) {
//        画像を戻す
        imagecount = imagecount - 1
     
        if (imagecount == 0) {
            self.gazou.image = UIImage(named: "gazou1.jpg")
            imagecount = 4
        }else if (imagecount == 1){
            self.gazou.image = UIImage(named: "gazou2.jpg")
        }else if (imagecount == 2){
            self.gazou.image = UIImage(named: "gazou3.jpg")
        }else if (imagecount == 3){
            self.gazou.image = UIImage(named: "gazou4.jpg")
        }
    }
    @IBAction func kakudaibutton(_ sender: Any) {
    }
//    imagecountを画面繊維で渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let gamenseni:kakudaiViewController = segue.destination as! kakudaiViewController
        gamenseni.upimage = imagecount
    }
}
