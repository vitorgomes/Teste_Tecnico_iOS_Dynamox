//
//  Model.swift
//  Teste_Tecnico_iOS_Dynamox
//
//  Created by Vitor Gomes on 22/02/24.
//

import Foundation

struct Question: Codable {
    let id: String
    let statement: String
    let options: [String]
}

struct AnswerResponse: Codable {
    let result: Bool
}

class QuizManager {
    let baseURL = "https://quiz-api-bwi5hjqyaq-uc.a.run.app"
    
    func fetchQuestions(completion: @escaping (Question?, Error?) -> Void) {
        let url = URL(string: "\(baseURL)/question")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil, error)
                return
            }
            
            do {
                let question = try JSONDecoder().decode(Question.self, from: data)
                completion(question, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
    
    func submitAnswer(questionId: String, answer: String, completion: @escaping (Bool?, Error?) -> Void) {
        let urlString = "\(baseURL)/answer?questionId=\(questionId)"
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let parameters: [String: String] = ["answer": answer]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil, error)
                return
            }
            
            do {
                let answerResponse = try JSONDecoder().decode(AnswerResponse.self, from: data)
                completion(answerResponse.result, nil)
                print(questionId)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
}
