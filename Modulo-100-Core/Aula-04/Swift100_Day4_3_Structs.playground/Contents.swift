
import UIKit
//: Structs

// São bem semelhantes à class, mas representam de maneira mais simples estruturas
// menos complexas (não há herança, por exemplo)

struct Coordenadas {
    var latitude:Double
    var longitude:Double
}

let saoPaulo = Coordenadas(latitude: -46.5, longitude: -23.4)
let brasilia = Coordenadas(latitude: -15.79, longitude: -47.86)

print("São Paulo fica nas coordenadas: \(saoPaulo.latitude) x \(saoPaulo.longitude)")

// Em Swift é possível adicionar métodos em structs

struct Retangulo {
    var largura:Int
    var altura:Int
    
    func área() -> Int {
        return largura*altura
    }
}

let quadrado = Retangulo(largura: 4, altura: 4)
quadrado.área()

// Quando uma struct altera um de seus métodos o valor
// de uma propriedade, temos que marcar como mutating

struct Contador {
    var valor:Int = 0
    
    mutating func incrementar(){
        self.valor += 1
    }
}

var meuContador = Contador()
for _ in 1...10 {
    meuContador.incrementar()
}

meuContador.valor


// Quick Fix
// Crie uma struct Cadastro, com nome, cpf, data de nascimento
// Crie nessa struct uma função que calcula a idade 
// (assumir que estamos em 2016)

struct Cadastro {
    var nome:String
    let cpf:Int
    let dataNascimento:Int
    
    func calcularIdade() -> Int{
        return 2016 - dataNascimento
    }
}

var meuCadastro = Cadastro(nome: "Ken", cpf: 123467789, dataNascimento: 1990)
meuCadastro.calcularIdade()

var data = NSDate()
var calendário = NSCalendar.currentCalendar()
let ano = calendário.components(.NSYearCalendarUnit, fromDate: data)

//--------------------------------------

struct Data {
    let dia:Int
    let mes:Int
    let ano:Int
}

struct Cadastro2 {
    let nome:String
    let cpf:Int
    let dataNascimento:Data
    
    func idadeAproximada()->Int{
        return 2016 - dataNascimento.ano
    }
    
}

let meuCadastro2 = Cadastro2(nome: "Bia", cpf: 123_456_789_20, dataNascimento: Data(dia: 22, mes: 08, ano: 1994))

meuCadastro2.idadeAproximada()

// Crie uma struct Circulo, que tenha um raio e uma função que retorna a área

struct Circulo {
    var raio:Double
    func area() -> Double {
        return 3.14159 * raio * raio
    }
}

let bolinha = Circulo(raio: 2)
bolinha.area()
