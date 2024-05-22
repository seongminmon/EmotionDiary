//
//  EmotionViewController.swift
//  EmotionDiary
//
//  Created by 김성민 on 5/20/24.
//

import UIKit

class EmotionViewController: UIViewController {
    
    @IBOutlet var buttonList: [UIButton]!
    @IBOutlet var labelList: [UILabel]!
    @IBOutlet var resetButton: UIButton!
    
    let wordList: [String] = [
        "행복해",
        "사랑해",
        "좋아해",
        "당황해",
        "속상해",
        "우울해",
        "심심해",
        "행복해",
        "행복해"
    ]
    
    var countList = [Int](repeating: 0, count: 9)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "감정 다이어리"
        navigationItem.leftBarButtonItem?.tintColor = .black
        
        for i in 0..<buttonList.count {
            // 저장된 데이터 가져오기
            countList[i] = UserDefaults.standard.integer(forKey: "count\(i)")
            
            setupButton(index: i)
            setupLabel(index: i)
        }
        
        resetButton.setTitle("리셋", for: .normal)
    }
    
    func setupButton(index: Int) {
        let image = UIImage(named: "slime\(index+1)")?.withRenderingMode(.alwaysOriginal)
        buttonList[index].setImage(image, for: .normal)
        
        // 버튼 태그 설정
        buttonList[index].tag = index
    }
    
    func setupLabel(index: Int) {
        labelList[index].text = "\(wordList[index]) \(countList[index])"
        labelList[index].textAlignment = .center
    }
    
    @IBAction func emotionButtonTapped(_ sender: UIButton) {
        countList[sender.tag] += 1
        labelList[sender.tag].text = "\(wordList[sender.tag]) \(countList[sender.tag])"
        
        // 데이터 저장
        UserDefaults.standard.setValue(countList[sender.tag], forKey: "count\(sender.tag)")
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        countList = [Int](repeating: 0, count: 9)
        for i in 0..<9 {
            setupLabel(index: i)
            // 데이터 저장
            UserDefaults.standard.setValue(countList[i], forKey: "count\(i)")
        }
    }
    
}
