//
//  ViewController.swift
//  SuperMemo
//
//  Created by Mikhail Levant on 10.08.2022.
//

import UIKit
import AVFoundation
import AudioToolbox

class ViewController: UIViewController {
    @IBOutlet weak var UltraMemo: UILabel!
    @IBOutlet weak var sound: UIButton!
    @IBOutlet weak var vk: UIButton!
    @IBOutlet weak var kartinka: UIImageView!
    @IBOutlet weak var levo: UIButton!
    @IBOutlet weak var pravo: UIButton!
    @IBOutlet weak var touch: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var Reset: UIButton!
    @IBOutlet weak var k1: kurd!
    @IBOutlet weak var k2: kurd!
    @IBOutlet weak var k4: kurd!
    @IBOutlet weak var k3: kurd!
    @IBOutlet weak var k5: kurd!
    @IBOutlet weak var k6: kurd!
    @IBOutlet weak var k7: kurd!
    @IBOutlet weak var k8: kurd!
    @IBOutlet weak var k9: kurd!
    @IBOutlet weak var k10: kurd!
    @IBOutlet weak var k11: kurd!
    @IBOutlet weak var k12: kurd!
    @IBOutlet weak var k13: kurd!
    @IBOutlet weak var k14: kurd!
    @IBOutlet weak var k15: kurd!
    @IBOutlet weak var k16: kurd!
    @IBOutlet weak var k17: kurd!
    @IBOutlet weak var k18: kurd!
    @IBOutlet weak var k19: kurd!
    @IBOutlet weak var k20: kurd!
    var kart = [0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9]
    var knop = [kurd]()
    var touches = 0 {
        didSet {
            touch.text = "Touches : \(touches)"
        }
    }
    var zvukest = 0
    var player: AVAudioPlayer?
    var strana: [UIImage] = [UIImage(named: "africa.png")!, UIImage(named: "asia.png")!, UIImage(named: "sever.png")!]
    var nostr = 0
    var afric: [UIImage] = [UIImage(named: "Le.png")!, UIImage(named: "makaka.png")!,UIImage(named: "gira.png")!,UIImage(named: "zebr.png")!,UIImage(named: "zmey.png")!,UIImage(named: "pirania.png")!,UIImage(named: "grif.png")!,UIImage(named: "scorpion.png")!,UIImage(named: "popugay")!,UIImage(named: "kolibri")!,UIImage(named: "???m.png")!,UIImage(named: "Background")!,UIImage(named: "Background (1)")!]
    var asian: [UIImage] = [UIImage(named: "tsar.png")!, UIImage(named: "kot.png")!,UIImage(named: "tigr.png")!,UIImage(named: "Vol.png")!,UIImage(named: "bik.png")!,UIImage(named: "panda.png")!,UIImage(named: "kon.png")!,UIImage(named: "juravl.png")!, UIImage(named: "iybijn")!,UIImage(named: "38e27527bf81be7d4239a79c5dfcbcc8")!,UIImage(named: "???m.png")!,UIImage(named: "Background")!,UIImage(named: "Background (1)")!]
    var severn: [UIImage] = [UIImage(named: "gigachad.png")!, UIImage(named: "kasatka.png")!,UIImage(named: "kashalot.png")!,UIImage(named: "medved.png")!,UIImage(named: "pingvin.png")!,UIImage(named: "rchanka.png")!,UIImage(named: "tulen.png")!,UIImage(named: "kotik.png")!,UIImage(named: "lemming")!,UIImage(named: "los")!,UIImage(named: "???m.png")!,UIImage(named: "Background")!,UIImage(named: "Background (1)")!,UIImage(named: "vkl.png")!,UIImage(named: "vikli.png")!,UIImage(named: "bezzv.png")!]
    var mass : [Array<UIImage>] = []
    var sco = ["Score:1", "Score:2", "Score:3", "Score:4", "Score:5", "Score:6", "Score:7", "Score:8", "Score:9", "Score:10 - YOU WON!"]
    var strani = ["Африка", "Азия", "Север"]
    var nach = -1
    var kak = 0
    var non = -1
    var sop : [kurd : Int] = [:]
    var idet = 0
    var kako = 0
    var AudioPlayer = AVAudioPlayer()
    var BenYes = AVAudioPlayer()
    var BenNo = AVAudioPlayer()
    var BenBen = AVAudioPlayer()
    var BenHoHo = AVAudioPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(willEnterForegroundNotification(_:)), name: UIApplication.willEnterForegroundNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didEnterBackgroundNotification(_:)), name: UIApplication.didEnterBackgroundNotification, object: nil)
        let AssortedMusics = NSURL(fileURLWithPath: Bundle.main.path(forResource: "jojo", ofType: "mp3")!)
        AudioPlayer = try! AVAudioPlayer(contentsOf: AssortedMusics as URL)
        AudioPlayer.prepareToPlay()
        AudioPlayer.numberOfLoops = -1
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(2000)){ [self] in
            AudioPlayer.play()
        }
        let Yes = NSURL(fileURLWithPath: Bundle.main.path(forResource: "BenYes", ofType: "mp3")!)
        BenYes = try! AVAudioPlayer(contentsOf: Yes as URL)
        BenYes.prepareToPlay()
        BenYes.numberOfLoops = 0
        let No = NSURL(fileURLWithPath: Bundle.main.path(forResource: "BenNo", ofType: "mp3")!)
        BenNo = try! AVAudioPlayer(contentsOf: No as URL)
        BenNo.prepareToPlay()
        BenNo.numberOfLoops = 0
        let Ben = NSURL(fileURLWithPath: Bundle.main.path(forResource: "BenBen", ofType: "mp3")!)
        BenBen = try! AVAudioPlayer(contentsOf: Ben as URL)
        BenBen.prepareToPlay()
        BenBen.numberOfLoops = 0
        let HoHo = NSURL(fileURLWithPath: Bundle.main.path(forResource: "BenHoHo", ofType: "mp3")!)
        BenHoHo = try! AVAudioPlayer(contentsOf: HoHo as URL)
        BenHoHo.prepareToPlay()
        BenHoHo.numberOfLoops = 0
        mass.append(afric)
        mass.append(asian)
        mass.append(severn)
        kart.shuffle()
        k1.cht = kart[0]
        k2.cht = kart[1]
        k3.cht = kart[2]
        k4.cht = kart[3]
        k5.cht = kart[4]
        k6.cht = kart[5]
        k7.cht = kart[6]
        k8.cht = kart[7]
        k9.cht = kart[8]
        k10.cht = kart[9]
        k11.cht = kart[10]
        k12.cht = kart[11]
        k13.cht = kart[12]
        k14.cht = kart[13]
        k15.cht = kart[14]
        k16.cht = kart[15]
        k17.cht = kart[16]
        k18.cht = kart[17]
        k19.cht = kart[18]
        k20.cht = kart[19]
        k1.kok = 1
        k2.kok = 2
        k3.kok = 3
        k4.kok = 4
        k5.kok = 5
        k6.kok = 6
        k7.kok = 7
        k8.kok = 8
        k9.kok = 9
        k10.kok = 10
        k11.kok = 11
        k12.kok = 12
        k13.kok = 13
        k14.kok = 14
        k15.kok = 15
        k16.kok = 16
        k17.kok = 17
        k18.kok = 18
        k19.kok = 19
        k20.kok = 20
        knop.append(k1)
        knop.append(k2)
        knop.append(k3)
        knop.append(k4)
        knop.append(k5)
        knop.append(k6)
        knop.append(k7)
        knop.append(k8)
        knop.append(k9)
        knop.append(k10)
        knop.append(k11)
        knop.append(k12)
        knop.append(k13)
        knop.append(k14)
        knop.append(k15)
        knop.append(k16)
        knop.append(k17)
        knop.append(k18)
        knop.append(k19)
        knop.append(k20)
        sop = [k1 : 0, k2 : 1, k3 : 2, k4 : 3, k5 : 4, k6 : 5, k7 : 6, k8 : 7, k9 : 7, k10 : 7, k11 : 7, k12 : 7, k13 : 7, k14 : 7, k15 : 7, k16 : 7]
        
        k1.layer.cornerRadius = 5
        k2.layer.cornerRadius = 5
        k3.layer.cornerRadius = 5
        k4.layer.cornerRadius = 5
        k5.layer.cornerRadius = 5
        k6.layer.cornerRadius = 5
        k7.layer.cornerRadius = 5
        k8.layer.cornerRadius = 5
        k9.layer.cornerRadius = 5
        k10.layer.cornerRadius = 5
        k11.layer.cornerRadius = 5
        k12.layer.cornerRadius = 5
        k13.layer.cornerRadius = 5
        k14.layer.cornerRadius = 5
        k15.layer.cornerRadius = 5
        k16.layer.cornerRadius = 5
        k17.layer.cornerRadius = 5
        k18.layer.cornerRadius = 5
        k19.layer.cornerRadius = 5
        k20.layer.cornerRadius = 5
        vk.layer.cornerRadius = 5
        UltraMemo.layer.borderWidth = 3
        kartinka.layer.borderWidth = 3
        pravo.layer.cornerRadius = 15
        levo.layer.cornerRadius = 15
        sound.layer.cornerRadius = 5
        Reset.layer.cornerRadius = 10
                
    }
    @objc private func willEnterForegroundNotification(_ notification: Notification) {
        sleep(2)
    }
    func reset(){
        nach = -1
        kak = 0
        touches = 0
        non = -1
        idet = 0
        score.text = "Score : 0"
        kart.shuffle()
        k1.cht = kart[0]
        k2.cht = kart[1]
        k3.cht = kart[2]
        k4.cht = kart[3]
        k5.cht = kart[4]
        k6.cht = kart[5]
        k7.cht = kart[6]
        k8.cht = kart[7]
        k9.cht = kart[8]
        k10.cht = kart[9]
        k11.cht = kart[10]
        k12.cht = kart[11]
        k13.cht = kart[12]
        k14.cht = kart[13]
        k15.cht = kart[14]
        k16.cht = kart[15]
        k17.cht = kart[16]
        k18.cht = kart[17]
        k19.cht = kart[18]
        k20.cht = kart[19]
        k1.setImage(afric[10], for: .normal)
        k2.setImage(afric[10], for: .normal)
        k3.setImage(afric[10], for: .normal)
        k4.setImage(afric[10], for: .normal)
        k5.setImage(afric[10], for: .normal)
        k6.setImage(afric[10], for: .normal)
        k7.setImage(afric[10], for: .normal)
        k8.setImage(afric[10], for: .normal)
        k9.setImage(afric[10], for: .normal)
        k10.setImage(afric[10], for: .normal)
        k11.setImage(afric[10], for: .normal)
        k12.setImage(afric[10], for: .normal)
        k13.setImage(afric[10], for: .normal)
        k14.setImage(afric[10], for: .normal)
        k15.setImage(afric[10], for: .normal)
        k16.setImage(afric[10], for: .normal)
        k17.setImage(afric[10], for: .normal)
        k18.setImage(afric[10], for: .normal)
        k19.setImage(afric[10], for: .normal)
        k20.setImage(afric[10], for: .normal)
        k1.sos = 0
        k2.sos = 0
        k3.sos = 0
        k4.sos = 0
        k5.sos = 0
        k6.sos = 0
        k7.sos = 0
        k8.sos = 0
        k9.sos = 0
        k10.sos = 0
        k11.sos = 0
        k12.sos = 0
        k13.sos = 0
        k14.sos = 0
        k15.sos = 0
        k16.sos = 0
        k17.sos = 0
        k18.sos = 0
        k19.sos = 0
        k20.sos = 0
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
            // This function is called on the parent's controller whenever the child of this parent is trying to rotate
            let childrenVCArray = self.children
            if childrenVCArray.count > 0 {
                // assuming the array of the first element is the current childVC
                let topMostVC = childrenVCArray[0]
                if topMostVC is ViewController {
                    // Assuming only allowing landscape mode
                    return .landscape
                }
            }
            // Return portrait otherwise
            return .portrait

        }
    @objc private func didEnterBackgroundNotification(_ notification: Notification) {
        AudioPlayer.stop()
        reset()
        sound.setImage(severn[14], for: .normal)
        zvukest = 1
    }
    @IBAction func vkssilka(_ sender: UIButton) {
        AudioPlayer.stop()
        UIApplication.shared.openURL(NSURL(string: "https://twitter.com/itachi2008aaa")! as URL)
        sound.setImage(severn[14], for: .normal)
        zvukest = 1
    }
    
    @IBAction func zvuk(_ sender: UIButton) {
        if zvukest == 2 {
            AudioPlayer.play()
            zvukest = 0
            sound.setImage(severn[13], for: .normal)
        }
        else {
            AudioPlayer.stop()
            zvukest += 1
            sound.setImage(severn[13 + zvukest], for: .normal)
        }
    }
    
    
    
    @IBAction func vlevo(_ sender: UIButton) {
        if nostr == 2 {
            nostr = 0
        }
        else {
            nostr += 1
        }
        if zvukest == 1 {
            BenBen.play()
        }
        kartinka.image = strana[nostr]
        kako = nostr
        reset()
    }
    @IBAction func vpravo(_ sender: UIButton) {
        if (nostr == 0) {
            nostr = 2
        }
        else {
            nostr -= 1
        }
        if zvukest == 1 {
            BenBen.play()
        }
        kartinka.image = strana[nostr]
        kako = nostr
        reset()
    }
    @IBAction func res(_ sender: Any) {
        if zvukest == 1 {
            BenHoHo.play()
        }
        reset()
    }
    @IBAction func logic(_ sender: kurd) {
        if sender.sos == 0 {
            if idet == 0{
                touches += 1
            sender.sos = 1
            sender.setImage(mass[kako][kart[sender.kok - 1]], for: .normal)
            if nach == -1 {
                nach = kart[sender.kok - 1]
                kak = sender.kok
            }
            else {
                idet = 1
                if nach == kart[sender.kok - 1] {
                    DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(330)){ [self] in
                        if zvukest == 1 {
                            BenYes.play()
                        }
                        sender.setImage(afric[11], for: .normal)
                        sender.sos = 2
                        knop[kak - 1].setImage(afric[11], for: .normal)
                        knop[kak - 1].sos = 2
                        nach = -1
                        score.text = sco[non + 1]
                        non += 1
                        idet = 0
                    }
                }
                else {
                    DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(400)) { [self] in
                        if zvukest == 1 {
                            BenNo.play()
                        }
                        sender.setImage(afric[12], for: .normal)
                        knop[kak - 1].setImage(afric[12], for: .normal)
                        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(400)) { [self] in
                            sender.setImage(afric[10], for: .normal)
                            knop[kak - 1].setImage(afric[10], for: .normal)
                            nach = -1
                            sender.sos = 0
                            knop[kak - 1].sos = 0
                            idet = 0
                        }
                    }
                }
            }
        }
        }
    }
}



