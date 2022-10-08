import Foundation

struct QuizBrain {
    let quiz = [
        Question(text: "Four plus two is equals to six", answer: "True"),
        Question(text: "Four plus two is equals to seven", answer: "False"),
        Question(text: "Four plus two is equals to eight", answer: "False"),
        Question(text: "What the Question!", answer: "False"),
        Question(text: "Another one", answer: "False"),
        Question(text: "What is the value of 1 + 1", answer: "True"),
        Question(text: "Programming is easy", answer: "False"),
        Question(text: "Programming is hard", answer: "True"),
        Question(text: "iOS is always better than android", answer: "True"),
        Question(text: "Android is always better than iOS", answer: "False"),
    ]
    
    var currentQuestion = 0
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        var result = false
        if userAnswer == quiz[currentQuestion].answer {
            result = true
        }
        
        if currentQuestion < quiz.count - 1 {
            currentQuestion += 1
        } else {
            currentQuestion = 0
        }
        
        return result
    }
    
    func getQuestionText() -> String {
        return quiz[self.currentQuestion].text
    }
    
    func getProgress() -> Float {
        return Float(currentQuestion) / Float(quiz.count - 1)
    }
}
