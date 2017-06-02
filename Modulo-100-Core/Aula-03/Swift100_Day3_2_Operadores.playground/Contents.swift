//: Operadores Customizados

// No Swift podemos criar novos operadores
// Exemplo tradicional: operador '+'
let a: Int = 10
let b: Int = 3
print(a+b) // aqui '+' é o que a gente chama de operador

// PREFIX
prefix operator ✂︎ {} // procure emoji por: sci

prefix func ✂︎ (texto: String) -> String {
    return String(texto.characters.filter{
        return ["a","e","i","o","u"].contains(String($0))
        })
}

let vogais = ✂︎"Hello"

// Criar um operador de raíz quadrada (√)
// Ou seja: print(√9) -> 3
// dica: import Darwin, tem função sqrt()

import Darwin
prefix operator √ {}

prefix func √ (num:Double) -> Double {
    return sqrt(num)
}

print(√9)

// POSTFIX

// Quick fix: crie um operador de %
// print(9%) // mostrar 0.09
// dica: postfix vs. prefix, tipagem

postfix operator % {}

postfix func % (num: Double) -> Double {
    return num/100
}

print(100 * 9%)

// INFIX
// symb ♒︎ : aquarius

infix operator ♒︎ {}
func ♒︎(esquerda:Int, direita:Int) -> [Int]{
    
    let inicio = min(esquerda, direita)
    let fim = max(esquerda, direita)
    
    var resposta:[Int] = []
    for i in inicio...fim{
        resposta.append(i)
    }
    
    return resposta
}

func ♒︎ (esquerda:String, direita:String) -> [String]{
    return []
}



/*
func ♒︎ (esquerda:String, direita:String) -> [String]{
    
    if esquerda.characters.count != 1 {
        return []
    }
    
    if direita.characters.count != 1 {
        return []
    }
    
    let codEsq = Int(String(esquerda.uppercaseString.unicodeScalars.first!))!
    let codDir = Int(String(direita.uppercaseString.unicodeScalars.first))
    
    let inicio = min(codEsq,codDir))
    let fim = max(codEsq,codDir)
    
    var resposta:[Int] = []
    
    
    //let a:String = "A"
    //a.unicodeScalars.first
    
    return []
}
*/

print(2♒︎10)
print(10♒︎2)
print(2♒︎2)
print(2♒︎(-10))

//Desafio
print("a"♒︎"c") // ["a","b","c"]



