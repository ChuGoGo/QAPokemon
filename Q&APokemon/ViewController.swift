//
//  ViewController.swift
//  Q&APokemon
//
//  Created by Chu Go-Go on 2022/1/21.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    @IBOutlet weak var pokeImageView: UIImageView!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var questionCountLabel: UILabel!
    @IBOutlet weak var answerTextField: UITextField!
    //    先叫出你的struct
    var questions = [Questions]()
    //    設定你的index為0
    var questionsIndex = 0
    //    設定一個func負責上傳照片跟沒有值的答案label.text
    func updateUI(){
        //        從UIImage的named裡面叫出你的Questions(questionImage: "圖片名稱")
        pokeImageView.image = UIImage(named: allQuestion[questionsIndex].questionImage)
        //讓答案先是空的，這樣才不會洩漏天機。
        answerLabel.text = ""
    }
    //    設定你的題目Array
    var allQuestion = [Questions(questionImage: "超夢", answer: "超夢"),
                       Questions(questionImage: "夢幻", answer: "夢幻"),
                       Questions(questionImage: "化石翼龍", answer: "化石翼龍"),
                       Questions(questionImage: "卡比獸", answer: "卡比獸"),
                       Questions(questionImage: "多邊獸", answer: "多邊獸"),
                       Questions(questionImage: "風速狗", answer: "風速狗"),
                       Questions(questionImage: "耿鬼", answer: "耿鬼"),
                       Questions(questionImage: "飛天螳螂", answer: "飛天螳螂"),
                       Questions(questionImage: "拉普拉斯", answer: "拉普拉斯"),
                       Questions(questionImage: "魔牆人偶", answer: "魔牆人偶")]
    //    設定你再啟動畫面時要做得事情
    override func viewDidLoad() {
        super.viewDidLoad()
        //        顯示題目index第一個數字是0所以要＋1
        questionCountLabel.text = "第\(questionsIndex + 1)題"
        //        對你的 allQuestion洗牌
        allQuestion.shuffle()
        //        顯示洗牌後的圖片
        updateUI()
        
    }
    
    @IBAction func nextQustion(_ sender: UIButton) {
        questionCountLabel.text = "第\(questionsIndex + 1)題"
        answerTextField.isHidden = false
        questionsIndex += 1
        //        如果題目數量跟你有的數量一樣就會重置
        if questionsIndex == allQuestion.count{
            questionsIndex = 0
            //            重置之後再洗一次
            allQuestion.shuffle()
        }
        //        顯示圖片
        updateUI()
    }
    
    @IBAction func sendAnswer(_ sender: UIButton) {
        if answerTextField.text == allQuestion[questionsIndex].answer {
            questionCountLabel.text = "你是神奇寶貝大師！"
        }else {
            questionCountLabel.text = "再想一想吧！"
            answerTextField.isHidden = false
        }
        answerTextField.text = ""
    }
    @IBAction func showAnswer(_ sender: Any) {
        //        顯示答案時隱藏輸入格
        answerTextField.isHidden = true
        //        顯示你的答案從struct的answer裡面叫出你的Questions(answer: "答案")
        answerLabel.text = allQuestion[questionsIndex].answer
        view.endEditing(true)
    }
}

