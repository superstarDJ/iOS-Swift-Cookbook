//********************************************************************
//********************************************************************
//**************************** Add Effect ****************************
//********************************************************************
//********************************************************************

import UIKit
import AVFoundation //1

class ViewController: UIViewController {
    var audioEngine:AVAudioEngine! //2
    var audioFile:AVAudioFile! //3

    override func viewDidLoad() {
        super.viewDidLoad()
        audioEngine = AVAudioEngine() //4
        let path = NSBundle.mainBundle().pathForResource("Areyouready", ofType: "m4a") //5
        audioFile = try! AVAudioFile(forReading: NSURL.fileURLWithPath(path!)) //6
    }

    @IBAction func playWithEffect(sender: UIButton) {
        audioEngine.stop()
        audioEngine.reset() //7
        
        let audioPlayerNode = AVAudioPlayerNode() //8
        audioEngine.attachNode(audioPlayerNode) //9
        
        //如果要改音檔的音高(Pitch)
        let addThisEffect = AVAudioUnitTimePitch() //10
        addThisEffect.pitch = 2000 //預設值是1.0，最大值為 2400，最小值為 -2400
        
        /* 其他的效果
        //加入破音效果(Distortion)
        var addThisEffect = AVAudioUnitDistortion() //17
        addThisEffect.loadFactoryPreset(.MultiEcho2) //18
        addThisEffect.wetDryMix = 100 //加入破音效果的量
        
        //加入延遲效果(Delay)
        var addThisEffect = AVAudioUnitDelay() //19
        addThisEffect.delayTime = 2 //預設值是1.0，最大值為 2，最小值為 0
        addThisEffect.wetDryMix = 100
        
        //加入殘音效果(Reverb)
        var addThisEffect = AVAudioUnitReverb() //20
        addThisEffect.loadFactoryPreset(.Cathedral) //21
        addThisEffect.wetDryMix = 100
        */
        
        audioEngine.attachNode(addThisEffect) //11
        audioEngine.connect(audioPlayerNode, to: addThisEffect, format: nil) //12
        audioEngine.connect(addThisEffect, to: audioEngine.outputNode, format: nil) //13
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil) //14
        
        do {
            try audioEngine.start() //15
        } catch _ {
        }

        audioPlayerNode.play()//16
    }
    
    
    @IBAction func stopPlay(sender: UIButton) {
        audioEngine.stop()
        audioEngine.reset()
    }
}

