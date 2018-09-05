//
//  Library .swift
//  VGL
//
//  Created by Brian Sadler on 9/4/18.
//  Copyright © 2018 Brian Sadler. All rights reserved.
//

import Foundation

// handles storing array of games and will handle interactions with the array

class Library {
    
    //  array for game objects
    private var gameArray: [Game] = [Game(title: "Shark Tale"), Game(title: "Shark Tale 2"), Game(title: "Shark Tale 3")]
    func addGame() {
        print("Input the game's name:")
        var newGameTitle = readLine()
        while newGameTitle == nil || newGameTitle == "" {
            print("Invalid title, please try again:")
            newGameTitle = readLine()
        }
        let newGame = Game(title: newGameTitle!)
        gameArray.append(newGame)
    }
    func removeGame() {
        for index in 0..<gameArray.count {
            print("\(index) \(gameArray[index].title)")
            print("Please enter the index of the game you want to remove:")
        }
        // if user enters an incorrect input it will ask them to try again
        var userInput = Int(readLine()!)
        while userInput == nil {
            print("Invalid input. Please enter a usable index:")
            userInput = Int(readLine()!)
        }
        gameArray.remove(at: userInput!)
    }
    func listAvailable() {
        print("These games are availble")
        for game in gameArray {
            if game.checkedIn {
                print(game.title)
            }
        }
        
    }
    func listUnavailable() {
        for game in gameArray {
            if !game.checkedIn {
                print(game.title)
                if let dueDate = game.dueDate {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MM/dd/yyyy"
                    print("This game is due on \(dateFormatter.string(from: dueDate))")
                }
            }
        }
    }
    func checkGameOut() {
        for index in 0..<gameArray.count {
            print("\(index) \(gameArray[index].title)")
            print("Please enter the index of the game you want to check out:")
            
        }
        var userInput = Int(readLine()!)
        while userInput == nil {
            print("Invalid input. Please enter a usable index:")
            userInput = Int(readLine()!)
        }
        gameArray[userInput!].checkedIn = false
        let currentCalander = Calendar.current
        let dueDate = currentCalander.date(byAdding: .day, value:14, to: Date()) // this generates a date object 2 weeks in the future by adding 14 days to the current date
        gameArray[userInput!].dueDate = dueDate // sets game being checled out to the new date 2 weeks ahead
         
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
        print("This game is due on \(dateFormatter.string(from: dueDate!))")

    }
    
    
    
    func checkGameIn() {
        for index in 0..<gameArray.count {
            print("\(index) \(gameArray[index].title)")
        }
        
        print("Please enter the index of the game you want to check out:")
        var userInput = Int(readLine()!)
        while userInput == nil {
            print("Invalid input. Please enter a usable index:")
            userInput = Int(readLine()!)
        }
        gameArray[userInput!].checkedIn = true
        gameArray[userInput!].dueDate = nil
    }
    
}

