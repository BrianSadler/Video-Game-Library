//
//  menu.swift
//  VGL
//
//  Created by Brian Sadler on 8/30/18.
//  Copyright © 2018 Brian Sadler. All rights reserved.
//

import Foundation
class Menu {
    var shouldQuit = false
    let library = Library() // creates new instance of library class
    
    func go(){
        repeat{
            print("""
            Menu
            1. Add Game
            2. Remove Game
            3. List Available Games
            4. Check out Game
            5. Check in Game
            6. list checked out Game
            7. Help
            8 Quit
            """)
            var input = getInput()
            while validateInput(input) == false {
                print("Invalid input")
                input = getInput()
            }
            handleInput(input)
        } while !shouldQuit
        
    }
    
    func help() {
        print("""
            Menu
            1. Add Game
            2. Remove Game
            3. List Available Games
            4. Check out Game
            5. Check in Game
            6. list checked out Game
            7. Help
            8 Quit
            """)
    }
    func handleInput (_ input: String) {
        switch input {
        case "1":
            library.addGame()
            
        case "2":
            library.removeGame()
            
        case "3":
            library.listAvailable()
            
        case "4":
            library.checkGameOut()
        case "5":
            library.checkGameIn()
        case "6":
           library.listUnavailable()
            
        
        case "7":
            help()
        case "8":
            quit()
        default:
            break
        }
    }
    func quit() {
        shouldQuit = true
        print("Thanks for using the video game library")
    }
    func validateInput(_ input: String) -> Bool {
        let menuOptions = Array(1...8)
        
        guard let number = Int(input) else { return false }
        return menuOptions.contains(number)
    }
    func getInput() -> String {
        var input: String? = nil
        repeat {
            let line = readLine()!.trimmingCharacters(in: .whitespacesAndNewlines)
            if line != "" {
                input = line
            } else {
                print("Invalid input.")
            }
        } while input == nil
        return input!
    }
}
