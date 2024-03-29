//
//  Teste_Tecnico_iOS_DynamoxTests.swift
//  Teste_Tecnico_iOS_DynamoxTests
//
//  Created by Vitor Gomes on 23/02/24.
//

import XCTest
@testable import Teste_Tecnico_iOS_Dynamox

final class Teste_Tecnico_iOS_DynamoxTests: XCTestCase {
    
    var quizManager: QuizManagerProtocol!

    override func setUpWithError() throws {
        quizManager = QuizManagerStub()
    }

    override func tearDownWithError() throws {
        quizManager = nil
    }
    
    func testQuizManagerFetchQuestions_WhenValidRequest_ReturnsQuestions() {
        let expectation = XCTestExpectation(description: "Fetch questions")
        
        quizManager.fetchQuestions { questions, error in
            
            XCTAssertNotNil(questions, "No answers returned")
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }

    func testQuizManagerSubmitAnswer_WhenValidAnswerProvided_ReturnsSuccess() {
        let expectation = XCTestExpectation(description: "Submit answer")
        
        let questionId = "28"
        let selectedOption = "6:20"
        
        quizManager.submitAnswer(questionId: questionId, answer: selectedOption) { result, error in
            
            XCTAssertNotNil(result, "No result returned")
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
}
