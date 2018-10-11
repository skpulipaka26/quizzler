import UIKit

class ViewController: UIViewController {
    
    let allQuestions = QuestionBank().list
    var currentQuestion: Question?
    var userAnswer: Bool = false
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentQuestion = allQuestions.first
        updateUI(0, false)
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        userAnswer = sender.tag == 1
        nextQuestion()
    }
    
    
    func nextQuestion(){
        let currIndex = allQuestions.firstIndex(where: {$0 === currentQuestion!})!
        let lastIndex = allQuestions.endIndex - 1
        if currIndex == lastIndex {
            let alert = UIAlertController(title: "Awesome", message: "You have finished all the questions", preferredStyle: .alert )
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.restartQuiz()
            }
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
            return
        } else {
            currentQuestion = allQuestions[currIndex + 1]
        }
        updateUI(currIndex + 1, checkAnswer())
    }
    
    
    func updateUI(_ currIndex: Int, _ answer: Bool) {
        questionLabel.text = currentQuestion?.questionText
        progressLabel.text = "\(currIndex)/\(allQuestions.count)"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(currIndex)
        // TODO: update the score label - use the correctness of the answer selected
    }
    
    
    func checkAnswer() -> Bool {
        return currentQuestion?.answer == userAnswer
    }
    
    
    func restartQuiz() {
        currentQuestion = allQuestions.first
        updateUI(0, false)
    }
    

}
