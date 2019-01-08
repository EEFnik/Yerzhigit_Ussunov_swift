//
//  main.swift
//  L5_Yerzhigit_Ussunov
//
//  Created by Yerzhigit Ussunov on 12/9/18.
//  Copyright © 2018 Yerzhigit Ussunov. All rights reserved.
//

import Foundation

protocol Car {
    var time: Double { get set }
    var distance: Double { get set }
    func speed () -> Double
}

protocol CarMovable {
    func move(newDistance: Double) -> String
}

protocol TrunkWight {
    func loadTruck (weight: Double) -> Double
}

class SportCar : Car, CarMovable {
    var time: Double
    var distance: Double
    var turboEngine: turboEngine
    enum turboEngine: String {
        case rotor = "роторном"
        case cilinderV = "V-образном "
    }
    
    init(time: Double, distance: Double, turboEngine: turboEngine) {
        self.time = time
        self.distance = distance
        self.turboEngine = turboEngine
    }
    
    func speed() -> Double {
        return self.distance / self.time
    }
    
    func move(newDistance: Double) -> String {
        let mov = self.distance + newDistance
        return "Авто проехало \(mov) км"
    }
    
    func printAbout( car: SportCar) -> SportCar{
        var one = car
        print("Введите 0 если тип двигателя - роторный или 1, если - V-образный")
        let oneOrTwo = readLine()
        let op0 = Int(oneOrTwo!)
        print("Введите время в пути для спорткара")
        let sTime = readLine()
        let st = Double(sTime!)
        print("Введите дистанцию, которую проехал спорткар")
        let sDistance = readLine()
        let sd = Double(sDistance!)
        if op0 == 1 || op0 == 0{
            if op0 == 0 {
                one = SportCar(time: st!, distance: sd!, turboEngine: .rotor)
               return one
            } else if op0 == 1{
                one  = SportCar(time: st!, distance: sd!, turboEngine: .cilinderV)
                return one
            }else {
                print("Введите 1 или 0")
            }
        }
        return one
    }
}

extension SportCar : CustomStringConvertible {
    var description: String {
        return "Спорткар на двигателе \(self.turboEngine.rawValue) проехал \(self.distance) км за \(self.time) часов, скорость составила \(self.speed()) км/ч. \n"
    }
}

class TrunkCar: Car, TrunkWight {
    var time: Double
    var distance: Double
    let capacity: Double
    var currentLoad: Double
    
    init(time: Double, distance: Double, capacity: Double, currentLoad: Double) {
        self.time = time
        self.distance = distance
        self.capacity = capacity
        self.currentLoad = currentLoad
    }
    
    func speed() -> Double {
        return self.distance / self.time
    }
    
    func loadTruck (weight: Double) -> Double {
        let load = self.currentLoad + weight
        print(">>>>>>>", self.currentLoad, weight)
        if load > capacity {
            print("Превышена допустимая вместимость")
        }
        return load
    }
    
    func printAbout( car: TrunkCar) -> TrunkCar{
        var one = car
        print("Введите время в пути для грузового автомобиля")
        let tTime = readLine()
        let tt = Double(tTime!)
        print("Введите дистанцию, которую проехал грузовик")
        let sDistance = readLine()
        let sd = Double(sDistance!)
        print("Введите общую вместимость грузового автомобиля")
        let sum = readLine()
        let sumCapacity = Double(sum!)
        print("Введите на сколько загружен грузовой автомобиль")
        let tWigth = readLine()
        let tw = Double(tWigth!)
        one = TrunkCar(time: tt!, distance: sd!, capacity: sumCapacity!, currentLoad: tw!)
        return one
    }
}

extension TrunkCar : CustomStringConvertible {
    var description: String {
        
        let someString = self.loadTruck(weight: 25)
        
        return "Грузовик проехал \(self.distance) км за \(self.time) часов, скорость составила \(self.speed()) км/ч. Назрузка составила \(self.currentLoad) из \(self.capacity) возможных.\n and Weight: \(someString)"
    }
}


let sportCar1 = SportCar(time: 4, distance: 520, turboEngine: .cilinderV)
let trunkCar2 = TrunkCar(time: 8, distance: 600, capacity: 500, currentLoad: 100)

print(sportCar1.description)
print("================================ \n")
print(trunkCar2.description)
print("================================ \n")

print(sportCar1.printAbout(car: sportCar1),"\n")
print("================================")
print(trunkCar2.printAbout(car: trunkCar2),"\n")
print("================================ \n")


print(sportCar1.move(newDistance: 200))
print("================================ \n")
print(trunkCar2.loadTruck(weight: 130))
