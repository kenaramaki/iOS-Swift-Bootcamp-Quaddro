//: Operadores

import UIKit

// Atribuição: '='
var valor = 300
var código = 5

// Aritiméticos: '+','-','/','*','%'
let soma = 1 + 2
let subtração = 10 - 5
let multiplicação = 2 * 0.6
let divisão = 200 / 4
let resto = 7%4
let éPar = 55%2 == 0

// Operador composto: '+=','-=','/=','*=', '%='
var numero = 5
numero += 3 // mesmo que: numero = numero + 3
numero -= 2
numero *= 2
numero /= 5
numero %= 2

var texto = "Lorem ipsum"
texto += " dolor " + "sit \(numero)"

// numero++ não funciona no Swift 3
// --numero também não

// Operador de comparação
let(a,b) = (1,3)
let igual       = a == b
var diferente   = a != b

!igual // operador NOT lógico
!diferente

// maior ou menor
a > b
a < b

// maior igual, menor igual
a >= b
a <= b

// operador ternário
let n = 5
var parOuImpar = "não sei"
// ~ regrinha ~
// 'condição' ? 'retorno verdadeiro' : 'retorno falso'
parOuImpar = (n%2 == 0) ? "par" : "impar"

// Desafio

// Quantos porcento seu nome é maior que 
// o sobrenome?
// por ex: gustavo é 75% maior que lino

var nome = "Ken"
var sobrenome = "Aramaki"

var qtdCaracteresNome = Double(nome.characters.count)
var qtdCaracteresSobrenome = Double(sobrenome.characters.count)

if qtdCaracteresSobrenome > qtdCaracteresNome {
    
    var divisao = (qtdCaracteresSobrenome-qtdCaracteresNome)/qtdCaracteresNome
    var porcentoMaior = NSString(format:"%.2f", divisao * 100)
    var porcentoMenor = NSString(format:"%.2f", divisao * 100 - 100)
    
    print("O sobrenome \(sobrenome) é \(porcentoMaior)% maior que o nome \(nome)")
    print("O nome \(nome) é \(porcentoMenor)% menor que o sobrenome \(sobrenome)")
    
}else{
    
    var divisao = (qtdCaracteresNome-qtdCaracteresSobrenome)/qtdCaracteresNome
    var porcentoMaior = NSString(format: "%.2f", divisao * 100)
    var porcentoMenor = NSString(format:"%.2f",(divisao * 100 - 100)*(-1))
    
    print("O nome \(nome) é \(porcentoMaior)% maior que o sobrenome \(sobrenome)")
    print("O sobrenome \(sobrenome) é \(porcentoMenor)% menor que o nome \(nome)")
    
}

// casas decimais
/*
import UIKit
var formatado = NSString(format: "%.2f", 3.1416)
*/
