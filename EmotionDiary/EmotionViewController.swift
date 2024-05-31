//
//  EmotionViewController.swift
//  EmotionDiary
//
//  Created by 김성민 on 5/20/24.
//

import UIKit

struct Emotion {
    let word: String
    var index: Int
    var number: Int {
        get {
            return UserDefaults.standard.integer(forKey: "count\(index)")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "count\(index)")
        }
    }
    
    var labelString: String {
        return "\(word) \(number)"
    }
}

class EmotionViewController: UIViewController {
    
    @IBOutlet var buttonList: [UIButton]!
    @IBOutlet var labelList: [UILabel]!
    @IBOutlet var resetButton: UIButton!
    
    var emotionList: [Emotion] = [
        Emotion(word: "행복해", index: 0),
        Emotion(word: "사랑해", index: 1),
        Emotion(word: "좋아해", index: 2),
        Emotion(word: "당황해", index: 3),
        Emotion(word: "속상해", index: 4),
        Emotion(word: "우울해", index: 5),
        Emotion(word: "심심해", index: 6),
        Emotion(word: "찝찝해", index: 7),
        Emotion(word: "울적해", index: 8),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "감정 다이어리"
        navigationItem.leftBarButtonItem?.tintColor = .black
        
        for i in 0..<emotionList.count {
            setupLabel(index: i)
            setupButton(index: i)
        }
        
        resetButton.setTitle("리셋", for: .normal)
    }
    
    func setupLabel(index: Int) {
        labelList[index].text = emotionList[index].labelString
        labelList[index].textAlignment = .center
    }
    
    func setupButton(index: Int) {
        let image = UIImage(named: "slime\(index+1)")?.withRenderingMode(.alwaysOriginal)
        buttonList[index].setImage(image, for: .normal)
        
        // 버튼 태그 설정
        buttonList[index].tag = index
    }
    
    @IBAction func emotionButtonTapped(_ sender: UIButton) {
        emotionList[sender.tag].number += 1
        labelList[sender.tag].text = emotionList[sender.tag].labelString
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        for i in 0..<emotionList.count {
            emotionList[i].number = 0
            labelList[i].text = emotionList[i].labelString
        }
    }
    
}
