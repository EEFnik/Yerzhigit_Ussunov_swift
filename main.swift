//
//  main.swift
//  L1_Yerzhigit_Ussunov
//
//  Created by Yerzhigit Ussunov on 11/20/18.
//  Copyright © 2018 Yerzhigit Ussunov. All rights reserved.
//

import Foundation

//Решение квадратных уравнений
print("Введите значения а, b, c")
let num1 = readLine()
let num2 = readLine()
let num3 = readLine()

var intA = Int(num1!)
var intB = Int(num2!)
var intC = Int(num3!)
var findD = ((intB! * intB!) - 4*intA! * intC!)

    if(findD >= 0){
        let findXOne:Double = ((-1 * Double(intB!) + sqrt(Double(findD))) / (2*Double(intA!)))
        print("Первый корень равен \(Int(findXOne))")
        let findXTwo: Double = ((-1 * Double(intB!) - sqrt(Double(findD))) / (2*Double(intA!)))
        print("Второй корень равен \(Int(findXTwo))")
    }else{
        print("Дискриминант меньше 0, корни невещественные.")
    }

// Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.
print("Введите значения длин треугольника ")
let length1 = readLine()
let length2 = readLine()
let length3 = readLine()

var lengthA = Int(length1!)
var lengthB = Int(length2!)
var lengthC = Int(length3!)

var arrayLength = [lengthA!, lengthB!, lengthC!]
var sortedArray = arrayLength.sorted(by: {$0 < $1})

var squareTriangle = ((sortedArray[0] * sortedArray[1]) / 2)
var perimeterTriangle = sortedArray[0] + sortedArray[1] + sortedArray[2]
 print("""
    Площадь треугольника равна = \(squareTriangle)
    Периметр треугольника равен = \(perimeterTriangle)
    Гипотенуза треугольника равна = \(sortedArray[2])
    """)

//Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.
print("""
    Введите сумму вклада:
    Введите годовой процент:
    Введите на какой срок открывается депозит:
""")
var sum = readLine()
let annual = readLine()
let deposit = readLine()

var sumOfDeposit = Float(sum!)
var annualInt = Float(annual!)
var depositTerm = Float(deposit!)
var annualInterest:Float = (annualInt!/100)
var year: Float? = 0
while (year! < depositTerm!) {
    sumOfDeposit! = sumOfDeposit! * (1 + annualInterest)
    year! += 1
    print("Сумма за \(year!) год равна \(NSString(format: "%.2f", sumOfDeposit!)) рублей")
}
