//: Strings

// Imprimindo uma linha de texto
print("Escrevendo uma linha")

// Imprimindo variáveis e constantes
var nome = "John"
print(nome)

let idade = 5
print(idade)

// Misturando texto e número 
// = Interpolação
print("Nome \(nome), Idade: \(idade)")

let primeiro = 8
print("uma conta: \(primeiro) + \(5) = \(primeiro+5)")

// '\' é o caracter de 'escape' (para marcações)
let paragrafo = "linha 1...\nlinha 2"
print(paragrafo)

let tabela = "Items:\nteste\t1novo\t2"
print(tabela)

let utf = "Caf\u{E9}"
print(utf)

let pão = "Pão"

print(utf, pão, separator: "~", terminator: "")

pão.characters.count
pão.uppercaseString
pão.lowercaseString

