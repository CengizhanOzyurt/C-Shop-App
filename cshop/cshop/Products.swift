//
//  Products.swift
//  cshop
//
//  Created by Cengizhan Özyurt on 10.12.2024.
//

import Foundation

public struct Products: Identifiable{
    public var id = UUID()
    public var name : String
    public var image : String
    public var info : String
    public var price : Int
    
    public init(name: String, image: String, info: String, price: Int) {
            self.name = name
            self.image = image
            self.info = info
            self.price = price
        }
}

public class ProductManager: ObservableObject {
    public var totalPrice : Int = 0
    public static let shared = ProductManager()
    @Published public var productList: [Products] = []
    @Published public var OrderList: [Products] = []
    public init() {} 
}
var FeaturedList : [Products] = [
    Products(name: "iMac M1", image: "imacm1", info:"M1 Chip 8GB 512 SSD",price: 1299),
    Products(name: "iPad M4", image: "ipadm4", info:"M4 Chip 8GB 256 SSD",price: 950),
    Products(name: "iPhone 15", image: "iphone15",info:"128 GB White", price: 899),
    Products(name: "iPhone 14", image: "iphone14", info:"64 GB Blue",price: 799),
    Products(name: "Macbook M4", image: "macbookm4",info:"M4 Chip 16 GB 512 SSD", price: 1199)
]
var ComputerList : [Products] = [
    Products(name: "HP 14\"", image: "HP-i3", info:"Intel i3 8GB 512GB SSD",price: 399),
    Products(name: "MSI Thin",image: "MSI-THIN",info:"i5 16GB Rtx3050 512GB SSD ",price : 1000),
    Products(name: "iMac M1", image: "imacm1", info:"M1 Chip 8GB 512 SSD",price: 1299),
    Products(name: "Macbook M4", image: "macbookm4",info:"M4 Chip 16 GB 512 SSD", price: 1199)
]
var PhoneList : [Products] = [
    Products(name: "iPhone 15", image: "iphone15",info:"128 GB White", price: 899),
    Products(name: "iPhone 14", image: "iphone14", info:"64 GB Blue",price: 799),
    Products(name: "Samsung S23", image: "samsungs23", info:"512 GB Black",price: 1399),
    Products(name: "Samsung A55", image: "samsunga55", info:"256 GB Blue",price: 599),
    Products(name: "Xiaomi Redmi 13", image: "xiaomi13", info:"256 GB Black",price: 399),
    Products(name: "Xiaomi 14T", image: "xiaomi14t", info:"256 GB Black",price: 900)
]
var ElectronicList : [Products] = [
    Products(name: "STM32F407G", image: "stm32", info:"DISC1 Discovery Geliştirme Kartı",price: 45),
    Products(name: "Arduino Uno R3",image: "arduino",info:"Atmega328p Yazılım Geliştirme Kartı",price : 9)
]
var SoftwareList : [Products] = [
    Products(name: "Website", image: "Website", info:"Kişiye Özel WEB Sitesi",price: 100),
]

var ArticleList: [Products] = [
    Products(name: "Quantum Computers", image: "article", info: "What is Quantum Computers?", price: 0)
]

var NoteList: [Products] = [
    Products(name: "Mathematics Notes", image: "MathNote", info: "Calculus II Notes", price: 1),
    Products(name: "Phyics Notes", image: "PhyicsNote", info: "Quantum Physics Notes", price: 1)
]

var MeetingList: [Products] = [
    Products(name: "Atıl Samancıoğlu", image: "atil", info: "Meeting With Atıl", price: 20),
    Products(name: "Mustafa Namoğlu", image: "mustafa", info: "Meeting With Mustafa", price: 20)
]

 var CourseList: [Products] = [
    Products(name: "C# Course", image: "C#", info: "Let's learning C#", price: 10),
    Products(name: "Python Course", image: "python", info: "Let's learning Python", price: 10)
]
