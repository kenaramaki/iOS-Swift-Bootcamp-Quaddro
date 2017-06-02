//: Playground - noun: a place where people can play

//: Recap Day 1

var nomeCompleto = "Árthur Ken Aramaki Mota"
var idade:Int = 26

typealias Cidade = (cidade: String, estado: String)

typealias Numero = Int
var um:Numero = 1

var saoPaulo:Cidade = ("São Paulo", "SP")

typealias Endereço = (rua:String, número:Int, bairro:String)
var kissFM:Endereço = ("Paulista", 2200, "Bela Vista")

kissFM.bairro

typealias Pessoa = (nome:String, idade:Int, endereço: Endereço)

var ken:Pessoa
ken.endereço = kissFM
ken.nome = "Árthur Ken"
ken.idade = 26

var thiago:Pessoa = ("Thiago Mota", 27, ("Rua Treze", 350, "Centro"))

let diaDoDescobrimentoDoBrasil = 22
let mesDoDescobrimentoDoBrasil = "Abril"
let anoDoDescobrimentoDoBrasil = 1500
let valorDePI = 3.1416

typealias DataDeNascimento = (dia:Int, mês:String, ano:Int)
let nasceuNoDiaQuePedroChegou:DataDeNascimento = (22,"Abril",1500)

let continentes = ["Asia","America","Oceania","Europa","África"]

let regiões = ["Sul","Sudeste","Centro-Oeste","Norte","Nordeste"]

let sobrinhada = ["Huguinho", "Zezinho", "Luisinho"]

let primos = [1,2,3,5,7]

let impérioDaCasaVerde = [10.0,9.5,10.0,9.0]

// Outra maneira de escrever:
let 💀 : [(max:Int, min:Int, tempo:String)] = [
    (32,20,"Chuvoso"),
    (20,12,"Nublado")
]

💀[0].tempo

let numeros:[Int:String] = [
    1:"Um",
    2:"Dois"
]

numeros[1]

let estadosDasRegiões:[String:[String]] = [
    "Sudeste":["São Paulo", "Minas Gerais","Rio de Janeiro", "Espírito Santo"],
    "Sul":["Paraná","Santa Catarina","Rio Grande do Sul"]
]

estadosDasRegiões["Sul"]



