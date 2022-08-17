//
//  ContentView.swift
//  TicTacToe WatchKit Extension
//
//  Created by Tristan Camejo on 16/8/2022.
//

import SwiftUI

struct ContentView: View {
    @State var board: [[String]] = [["", "", ""], ["", "", ""], ["", "", ""]]
    @State var turn: String = "X"
    @State var winner: String = ""
    @State var gameOver: Bool = false
    @State var pause: Bool = false
    @State var status: String = "X's turn"
    
    func reset() {
        board = [["", "", ""], ["", "", ""], ["", "", ""]]
        turn = "X"
        status = "X's turn"
        winner = ""
        gameOver = false
        pause = false
    }

    func endGame() {
        status = winner == "Tie" ? "Tie" : "\(winner) Won!"
        pause = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            gameOver = true
        }
        
    }
    
    func checkWinner() {
        if board[0][0] == board[0][1] && board[0][1] == board[0][2] && board[0][0] != "" {
            winner = board[0][0]
            endGame()
        } else if board[1][0] == board[1][1] && board[1][1] == board[1][2] && board[1][0] != "" {
            winner = board[1][0]
            endGame()
        } else if board[2][0] == board[2][1] && board[2][1] == board[2][2] && board[2][0] != "" {
            winner = board[2][0]
            endGame()
        } else if board[0][0] == board[1][0] && board[1][0] == board[2][0] && board[0][0] != "" {
            winner = board[0][0]
            endGame()
        } else if board[0][1] == board[1][1] && board[1][1] == board[2][1] && board[0][1] != "" {
            winner = board[0][1]
            endGame()
        } else if board[0][2] == board[1][2] && board[1][2] == board[2][2] && board[0][2] != "" {
            winner = board[0][2]
            endGame()
        } else if board[0][0] == board[1][1] && board[1][1] == board[2][2] && board[0][0] != "" {
            winner = board[0][0]
            endGame()
        } else if board[0][2] == board[1][1] && board[1][1] == board[2][0] && board[0][2] != "" {
            winner = board[0][2]
            endGame()
        } else if board[0][0] != "" && board[0][1] != "" && board[0][2] != "" && board[1][0] != "" && board[1][1] != "" && board[1][2] != "" && board[2][0] != "" && board[2][1] != "" && board[2][2] != "" {
            winner = "Tie"
            endGame()
        }
    }
    
    func takeTurn(row: Int, col: Int) {
        if (pause) {return}
            
        WKInterfaceDevice.current().play(.success)
        if board[row][col] == "" {
            board[row][col] = turn
            if turn == "X" {
                turn = "O"
                status = "O's turn"
            } else {
                turn = "X"
                status = "X's turn"
            }
        }
        checkWinner()
    }
    
    var body: some View {
        
        if (gameOver) {
            VStack {
                Text(winner == "Tie" ? "Tie" : "\(winner) Won!")
                    .padding(.bottom, 10)
                Button(action: {
                    reset()
                }) {
                    Text("Play again?")
                }
            }}
        VStack {
            Text(status)
                .padding(.top, 6.0)
        HStack {
           
            VStack {
                Button(action: {
                    takeTurn(row: 0, col: 0)
                }, label: {
                    Text(board[0][0])
                })
                Button(action: {
                    takeTurn(row: 1, col: 0)
                }, label: {
                    Text(board[1][0])
                })
                Button(action: {
                    takeTurn(row: 2, col: 0)
                }, label: {
                    Text(board[2][0])
                })
            }
            VStack {
                Button(action: {
                    takeTurn(row: 0, col: 1)
                }, label: {
                    Text(board[0][1])
                })
                Button(action: {
                    takeTurn(row: 1, col: 1)
                }, label: {
                    Text(board[1][1])
                })
                Button(action: {
                    takeTurn(row: 2, col: 1)
                }, label: {
                    Text(board[2][1])
                })
            }
            VStack {
                Button(action: {
                    takeTurn(row: 0, col: 2)
                }, label: {
                    Text(board[0][2])
                })
                Button(action: {
                    takeTurn(row: 1, col: 2)
                }, label: {
                    Text(board[1][2])
                })
                Button(action: {
                    takeTurn(row: 2, col: 2)
                }, label: {
                    Text(board[2][2])
                })
            }
        }
    }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
