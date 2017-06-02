//: 

// Função que conta quantas vogais
func contarVogais(texto:String) -> Int {
    
    var vogais = 0
    for char in texto.characters {
        
        let listaVogais = ["a","e","i","o","u","A","E","I","O","U"]
        if listaVogais.contains(String(char)){
            vogais += 1
        }
    }
    return vogais
}

contarVogais("Texto Texto")
contarVogais("Ken")

// Função fatorial
func fatorial(x:Int) -> Int {
    return x == 0 ? 1 : x*fatorial(x-1)
}

fatorial(3)
fatorial(4)

// Retorna o dobro de um número decimal
func dobroDecimal(numero:Double) -> Double {
    return numero * 2
}

dobroDecimal(12.2)
dobroDecimal(3.5)
dobroDecimal(3.1416)

// Retorna a média aritmética
func media(v1:Double, _ v2:Double) -> Double {
    return (v1+v2)/2.0
}

media(10.5, 11.5)

// Retorna true se um número é negativo
func negativo(numero: Int) -> Bool{
    return numero < 0
}

negativo(-10)
negativo(10)
negativo(0)

// Retorna o inverso de um número
func inverso(numero n: Int) -> Int {
    return n * -1
}

inverso(numero: 10)
inverso(numero: -28)

//
func numeroEmail(usuario usuario:String, paraCaixa caixa:String) -> Int {
    print("estou analisando a caixa" + caixa)
    return 3
}

numeroEmail(usuario: "Ken", paraCaixa: "inbox")


// Retorna o menor valor de um vetor de Int
func menorNoVetor(listaInteiros:[Int]) -> Int {
    if listaInteiros.isEmpty {
        return 0
    }
    
    var menor:Int = listaInteiros[0]
    for num in listaInteiros.dropFirst(){
        if num < menor {
            menor = num
        }
    }
    return menor
}

menorNoVetor([12,-57,3131,124])
menorNoVetor([-10,3133,45,1,0])


// Retorna se um número é primo
func éPrimo(num:Int) -> Bool {
    
    if num < 0 {
        return éPrimo(inverso(numero: num))
    }
    
    var divisiveis = 0
    for i in 1...(num > 0 ? num : 1){
        if num%i == 0 {
            divisiveis += 1
        }
    }
    return divisiveis == 2
}

éPrimo(-3)
éPrimo(-4)
éPrimo(0)
éPrimo(1)
éPrimo(2)
éPrimo(3)
éPrimo(4)
éPrimo(5)
éPrimo(6)
éPrimo(7)

// Retorna as iniciais de um nome
import Foundation
func iniciais(nome:String) -> [String] {
    
    if nome.isEmpty {
        return []
    }
    
    return nome.componentsSeparatedByString(" ")
        .map{ String($0.characters.first!)}
    
}

print(iniciais("Árthur Ken Aramaki Mota"))

// Retorna última letra de cada palavra de uma frase
func finais(nome:String) -> [String] {
    
    if nome.isEmpty {
        return []
    }
    
    return nome.componentsSeparatedByString(" ")
        .map{ String($0.characters.last)}
    
}

print(finais("Árthur Ken Aramaki Mota"))



// Ou finais ou iniciais
func nameBoundaries(name:String, start: Bool) -> [String] {
    
    if name.isEmpty {
        return []
    }
    
    return name.componentsSeparatedByString(" ")
        .map{
            let chars = $0.characters
            if start {
                return String(chars.first)
            } else {
                return String(chars.last)
            }
    
    }
}

print(nameBoundaries("Árthur Ken Aramaki Mota", start: false))
print(nameBoundaries("Árthur Ken Aramaki Mota", start: true))


// Outra forma de fazer finais ou iniciais
enum BoundaryType{
    case Start
    case End
}

func nameBoundaries2(name:String, type:BoundaryType) -> [String] {
    
    if name.isEmpty {
        return []
    }
    
    return name.componentsSeparatedByString(" ")
        .map{
            let chars = $0.characters
            switch type{
            case .End:
                return String(chars.last)
            case .Start:
                return String(chars.first)
            }
    }
}

print(nameBoundaries2("Luiz Gustavo", type: .Start))
