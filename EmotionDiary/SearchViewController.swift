//
//  SearchViewController.swift
//  EmotionDiary
//
//  Created by 김성민 on 5/20/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var searchButton: UIButton!
    @IBOutlet var wordButtonList: [UIButton]!
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var resultLabel: UILabel!
    
    let wordDictionary: [String: String] = [
        "무야호": "예능 프로그램 <무한도전>에 출연했던 한 출연자에 의해 생겨난 유행어로, 매우 신난다는 뜻.",
        "나심비": "'나'와 '심리' 그리고 '가성비'의 합성어. 가성비보다 스스로의 만족을 위해 지갑을 여는 소비 심리를 일컫는다.",
        "군싹": "'군침이 싹 돌다'의 줄임말. 군침이 돌 만큼 맛있거나 좋아 보이는 것을 수식할 때 쓴다.",
        "얼죽아": "'얼어 죽어도 아이스커피'의 줄임말. 추운 날씨에도 아이스 아메리카노만 마시는 이들을 지칭한다.",
        "스불재": "'스스로 불러온 재앙'으로, 순전히 자신이 자초한 일로 다른 누구를 탓할 수 없는 상황에 쓰는 말",
        "삼귀다": "아직 사귀는 사이가 아닌 썸 타는 단계. 사귀다의 '사'를 숫자 4에 빗대어 4가 되기 전 3=삼으로 표현.",
        "머선129": "경상도 사투리로 '이게 무슨 일이고?'를 비슷한 발음의 숫자 129로 표현. 영문을 모르는 일이나 황당한 일을 겪을 때 쓴다.",
        "억텐": "'억지 텐션'의 줄임말로 억지로 재미있는 척 격한 반응을 보일 때 쓰인다",
        "찐텐": "'진짜 텐션'을 뜻하는 찐텐은 실제 신이 난 반응을 뜻한다.",
        "고답이": "고구마 잔뜩 먹은 것처럼 답답하게 행동하는 사람을 일컫는 말",
        "내또출": "'내일 또 출근'의 줄임말. 월요일 출근에 대한 스트레스를 표현한다.",
        "국룰": "'국민 룰'의 줄임말로 보편적으로 통용되는 정해진 규칙을 말한다. 예를 들면 '비 오는 날 막걸리와 부침개는 국룰이지' 등으로 쓸 수 있다.",
        "꾸안꾸": "'꾸민 듯 안 꾸민 듯' 내추럴하지만 스타일리시한 패션 센스를 이르는 말",
        "마상": "'마음의 상처'를 줄인 말. 아쉽거나 실망스러운 일이 있을 때 주로 쓴다.",
        "낄낄빠빠": "'낄 때 끼고 빠질 때 빠지자'로 나설 상황이 아닌데 눈치 없이 오지랖을 부리는 사람에게 쓰는 표현.",
        "슬세권": "슬리퍼처럼 편한 복장으로 나다닐 수 있는 범위의 생활권역을 지칭",
        "복세편살": "'복잡한 세상 편하게 살자'의 준말. 스스로가 원하는 방식으로 즐겁게 살겠다는 의지를 다지는 말.",
//        "AAA": "대소문자 비교"
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchTextField.placeholder = "신조어를 검색해보세요."
        searchTextField.layer.borderColor = UIColor.black.cgColor
        searchTextField.layer.borderWidth = 2
        
        searchButton.setTitle("", for: .normal)
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)
        searchButton.tintColor = .white
        searchButton.backgroundColor = .black
        
        setWordButtonsTitle()
        
        wordButtonList.forEach {
            setupWordButton($0)
        }
        
        backgroundImageView.image = UIImage(named: "background")
        backgroundImageView.contentMode = .scaleAspectFill
        
        resultLabel.text = "신조어의 뜻이 표시됩니다."
        resultLabel.font = .systemFont(ofSize: 20)
        resultLabel.textAlignment = .center
        resultLabel.numberOfLines = 0
    }
    
    func setupWordButton(_ button: UIButton) {
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
    }
    
    // 랜덤으로 word버튼들의 타이틀을 설정해주는 함수 (중복없이)
    func setWordButtonsTitle() {
        var tempWords = Set<String>()
        wordButtonList.forEach {
            var title = wordDictionary.keys.randomElement()!
            while tempWords.contains(title) {
                title = wordDictionary.keys.randomElement()!
            }
            $0.setTitle(title, for: .normal)
            tempWords.insert(title)
        }
    }
    
    // 텍스트필드의 텍스트를 딕셔너리에서 검색해주는 함수 (대소문자 구분 없이)
    func searchNewWordWithDictionary() {
        let word = (searchTextField.text ?? "").lowercased()
        
        for key in wordDictionary.keys {
            if key.lowercased() == word {
                resultLabel.text = wordDictionary[key]
                return
            }
        }
        resultLabel.text = "검색 결과가 없습니다."
        
        
//        if let description = wordDictionary[word] {
//            resultLabel.text = description
//        } else {
//            resultLabel.text = "검색 결과가 없습니다."
//        }
    }
    
    @IBAction func returnTapped(_ sender: UITextField) {
        searchNewWordWithDictionary()
    }
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        searchNewWordWithDictionary()
        view.endEditing(true)
    }
    
    @IBAction func wordButtonTapped(_ sender: UIButton) {
        searchTextField.text = sender.titleLabel?.text
        searchNewWordWithDictionary()
        setWordButtonsTitle()
    }
    
    // 다른 화면 터치 시 키보드 내려가게 만들기
    @IBAction func keyboardDismiss(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}
