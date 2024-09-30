//
//  ContentView.swift
//  HWSCareerAccelerator
//
//  Created by Thomas Cowern on 9/30/24.
//

import SwiftUI

enum Position {
    case goal, defence, midfield, attack
}

struct Club {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Footballer {
    var name: String
    var club: Club
    var position: Position

    init(name: String, club: Club, position: Position) {
        self.name = name
        self.club = club
        self.position = position
    }
}

class Logger: TextOutputStream {
    private let fileHandle: FileHandle

    init(url: URL) throws {
        let fm = FileManager.default
        let path = url.path()

        if fm.fileExists(atPath: path) == false {
            fm.createFile(atPath: path, contents: nil)
        }

        fileHandle = try FileHandle(forWritingTo: url)
        try fileHandle.seekToEnd()
    }

    func write(_ string: String) {
        let data = Data(string.utf8)
        fileHandle.write(data)
    }

    deinit {
        try? fileHandle.close()
    }
}

struct ContentView: View {
    
    let richmond = Club(name: "AFC Richmond")
    
    
    var body: some View {
        VStack {
            Button("Click me") {
                let roy = Footballer(name: "Roy Kent", club: richmond, position: .midfield)
                do {
                    print("Do")
                    let url = URL.homeDirectory.appending(path: "output.log")
                    var logger = try Logger(url: url)
                    dump(roy, to: &logger, name: "Roy", maxDepth: 2, maxItems: 4)
                } catch {
                    print(error)
                }
                
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
