//: For e While

var almoçoSemanal = Array(count:7, repeatedValue:"Bacon")

// Utilizamos for in para investigar cada 
//item de um vetor
almoçoSemanal[2] = "Temaki"
for almoço in almoçoSemanal {
    print("Hoje almocei \(almoço)")
}

// Acesso e exibindo a posição
for(indice, almoço) in almoçoSemanal.enumerate(){
    print("Dia \(indice) teve \(almoço)")
}

// for com intervalos

for número in 0..<10 {
    print("Número é \(número)")
}

// for com intervalos variáveis
let limite = 5

for número in 0...limite{
    print(número)
}

for número in Array(0...limite).reverse(){
    print("Índice invertido \(número)")
}

// Mini desafio
// Escrever o nome ao contrário
// let nome = "Lino" -> oniL

let nome = "Ken"
var nomeInvertido:String = ""
for letra in nome.characters.reverse(){
    print(letra)
    nomeInvertido += String(letra).lowercaseString // ("\(nomeInvertido)\(letra)")
}

var letras = Array(nomeInvertido.characters)
letras[0] = Character(String(letras[0]).uppercaseString)
let nomePimps = String(letras)

print("\(nome) invertido é \(nomePimps)")



// WHILE
// similar ao for, para quando a 'parada' não é conhecida
var valor = 0
while valor < 5 {
    valor += 1
    print("valor: \(valor)")
}

// Mesmo que While, mas executa ao menos uma vez antes de verificar a condição
repeat{
    valor -= 1
    print("valor: \(valor)")
} while valor > 0


// Recap

// Contar de 1 a 10, incluindo o 10
for number in 1...10 {
    print(number)
}
print("\n")

// Contar números pares de 1 até 10
for number in 1...10{
    if number%2 == 0{
        print(number)
    }
}
print("\n")
    // ou
for i in 1...10 where i%2 == 0 {
    print("contando \(i)")
}
print("\n")

// Contar regressivamente de 10 até 0
for number in (0...10).reverse(){
    print(number)
}
print("\n")

// Contar regressivamente os ímpares de 10 até -10
for number in (-10...10).reverse(){
    if number%2 != 0 {
        print(number)
    }
}
print("\n")

    // ou

for i in (-10...10).reverse() where i%2 != 0 {
    print("contando reverso ímpares \(i)")
}
print("\n")

// Inverter um texto
print(String("Isto é um texto".characters.reverse()))
print("\n")

// Mostrar somente as vogais de um texto
var texto = "Isso aqui é outro texto"
var apenasVogais = ""

for letra in texto.characters{
    switch letra {
        case "a","e","i","o","u","A","E","I","O","U":
        apenasVogais += String(letra)
    default:
        break
    }
}
print(apenasVogais)
print("\n")


for char in "paralelepipedo".characters{
    switch char {
        case "a","e","i","o","u":
            print(char,terminator:"-")
    default: break
    }
}






















