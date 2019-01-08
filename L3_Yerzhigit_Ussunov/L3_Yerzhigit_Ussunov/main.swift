//
//  main.swift
//  L3_Yerzhigit_Ussunov
//
//  Created by Yerzhigit Ussunov on 11/28/18.
//  Copyright © 2018 Yerzhigit Ussunov. All rights reserved.
//

import Foundation

enum TypeCar {
    case passengerCar, truck
}
enum Transmission {
    case manual, auto
}
enum EngineSarting {
    case turnOn, turnOff
}
enum WindowState {
    case open, close
}
enum DoorState {
    case open, close
}
enum TrunkState {
    case full, empty
}

struct Cars {
    let brandCar: String
    let yearOfIssue: Int
    let typeOfCar: TypeCar
    let tramsmission: Transmission
    var engineState: EngineSarting
    let color: CGColor
    let mp3: Bool
    var km: Double
    var windowState: WindowState
    var doorState: DoorState
    var trunk: TrunkState
    
    mutating func turnOnEngine(){
        self.engineState = .turnOn
    }
    mutating func turnOffEngine(){
        self.engineState = .turnOff
    }
    mutating func openDoor(){
        self.doorState = .open
    }
    mutating func closeDoor(){
        self.doorState = .close
    }
    mutating func openWindow(){
        self.windowState = .open
    }
    mutating func closeWindow(){
        self.windowState = .close
    }
    func trunkState(_ stateTrunk: TrunkState, _ valueTrunk: Double, _ s:Double) -> String {
        var str: String
        if valueTrunk >= s {
            var i: Double
            if stateTrunk == TrunkState.full{
                i = valueTrunk - s
                str = String("Из багажника объемом - \(String(valueTrunk)) л. Отгруженно - \(String(s)) л. В багажнике груз на \(String(i))")
                return str
            }else {
                i = s
                str = String("В багажник объемом - \(String(valueTrunk)) л. Загруженно - \(String(s)) л. В багажнике груз на \(String(i))")
                return str
            }
        } else{
            print("Невозможно загрузить багажник, так как превышен его объем!")
        }
        return "str"
    }
    func printAbout(car: Cars){
        print("Введите 1 если багажник заполнен или 0 если пустой ")
        let oneOrTwo = readLine()
        let op0 = Int(oneOrTwo!)
        if op0 == 1 || op0 == 0{
            print("Введите объем багажника ")
            let one = readLine()
            print("Введите объем груза ")
            let two = readLine()
            
            let op1 = Double(one!)
            let op2 = Double(two!)
            if op0 == 0 {
                print("""
                    Марка автомобиля - \(brandCar)
                    Год выпуска автомобиля  - \(yearOfIssue)
                    Тип автомобиля - \(typeOfCar)
                    Тип трансмиссии - \(tramsmission)
                    Cтатус двигателя - \(engineState)
                    Цвет - \(color)
                    Наличае МР3 плеера - \(mp3)
                    Киллометраж - \(km)
                    Положение окон - \(windowState)
                    Статус дверей - \(doorState)
                    Статутс багажника - заполнен на \(self.trunkState(.empty, op1!, op2!))
                    
                    
                    
                    
                    """)
            } else if op0 == 1{
                print("""
                    Марка автомобиля - \(brandCar)
                    Год выпуска автомобиля  - \(yearOfIssue)
                    Тип автомобиля - \(typeOfCar)
                    Тип трансмиссии - \(tramsmission)
                    Cтатус двигателя - \(engineState)
                    Цвет - \(color)
                    Наличае МР3 плеера - \(mp3)
                    Киллометраж - \(km)
                    Положение окон - \(windowState)
                    Статус дверей - \(doorState)
                    Статутс багажника - выгружено \(self.trunkState(.full, op1!, op2!))
                    
                    
                    
                    
                    """)
            }
        }else {
            print("Введите 1 или 0")
        }
    }
}

var carMercedes = Cars(brandCar: "Mercedes", yearOfIssue: 2001, typeOfCar: .passengerCar, tramsmission: .auto, engineState: .turnOff, color: .black, mp3: true, km: 120.0, windowState: .close, doorState: .close, trunk: .empty)
var carNissan = Cars(brandCar: "Nissan", yearOfIssue: 2009, typeOfCar: .passengerCar, tramsmission: .manual, engineState: .turnOn, color: .white, mp3: true, km: 110.0, windowState: .open, doorState: .close, trunk: .full)
var mercedesTruck = Cars(brandCar: "Mercedes", yearOfIssue: 2019, typeOfCar: .truck, tramsmission: .auto, engineState: .turnOn, color: .white, mp3: false, km: 0.0, windowState: .close, doorState: .close, trunk: .full)

carMercedes.printAbout(car: carMercedes)
carNissan.printAbout(car: carNissan)
mercedesTruck.printAbout(car: mercedesTruck)
