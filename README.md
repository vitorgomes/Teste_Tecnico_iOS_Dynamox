# Teste Técnico - iOS (versão SwiftUI)

Bem-vindo(a) ao projeto de teste técnico de montagem de um Quiz! Este teste tem como objetivo avaliar minhas habilidades técnicas na criação de um Quiz utilizando tecnologias específicas envolvendo a linguagem Swift.

## Instruções de uso do código:

1. Clone este repositório em sua máquina local.
2. Abra usando a IDE Xcode.
3. Com o Xcode aberto, aperte o botão "Run" que fica na parte superior ou simplesmente aperte cmd + R em seu teclado.

## Instruções do Quiz:

1. Na primeira tela após a tela de apresentação do App o usuário deve cadastrar seu nome ou apelido e apertar o botão "INICIAR".
2. Na segunda tela iniciará o jogo em si, apresentando uma pergunta de cada vez e 5 opções em que o usuário deve escolher apenas uma e apertar "RESPONDER" para conferir se acertou ou errou e assim, passar para próxima pergunta.
3. Ao responder 10 questões o usuário será enviado para última tela, podendo conferir sua pontuação e visualizar uma lista com o nome e pontuação de outros usuários. Também poderá reiniciar o jogo apertando o botão "REINICIAR".

## Tecnologias e Padrões utilizadas:

- SwiftUI para a construções das telas e animações.
- Arquitetura MVVM para a separação de comunicações entre Views e Models utilizando ViewModels.
- Consumo de requisições HTTP (API RESTful que foi disponibilizada pela empresa).
- SwifData o novo framework para persistência local de dados (e também o Realm, um banco de dados terceiro de persistência local que pode ser encontrado no branch "realmVersion").
- Testes usando o framework XCTest.
- Injeções de dependências, para os testes que utilizavam requisições via internet.
- Reutilização de código criando estilos customizados.
- Tratamento de erros.

## Dúvidas:

Se surgirem dúvidas sobre o código, entre em contato comigo através do meu email vitorgomes_silva@outlook.com

---

# (EN) Technical Test - iOS (SwiftUI version)

Welcome to the technical test project for building a Quiz! This test aims to evaluate my technical skills in creating a Quiz using specific technologies involving the Swift language.

## Code usage instructions:

1. Clone this repository to your local machine.
2. Open it using the Xcode IDE.
3. With Xcode open, press the "Run" button located at the top or simply press cmd + R on your keyboard.

## Quiz Instructions:

1. On the first screen after the App's presentation screen, the user should enter their name or nickname and press the “INICIAR” button.
2. On the second screen, the game itself will start, presenting one question at a time and 5 options where the user must choose only one and press “RESPONDER” to check if they got it right or wrong and thus, move on to the next question.
3. After answering 10 questions, the user will be taken to the last screen, where they can check their score and view a list with the name and score of other users. They can also restart the game by pressing the “REINICIAR” button.

## Technologies and Patterns Used:

- SwiftUI for building screens and animations.
- MVVM architecture for separating communications between Views and Models using ViewModels.
- Consumption of HTTP requests (RESTful API provided by the company).
- SwifData, the new framework for local data persistence (and also Realm, a third-party local persistence database which can be found in the "realmVersion" branch).
- Tests using the XCTest framework.
- Dependency injections for tests that used internet requests.
- Code reuse by creating custom styles.
- Error handling.

## Questions:

If you have any questions about the code, please contact me via email at vitorgomes_silva@outlook.com
