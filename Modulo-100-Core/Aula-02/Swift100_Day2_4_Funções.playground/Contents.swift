//: Funções

// func <nome> (<nome_parm>:<tipo>,...) -> <retorno
//      <corpo>
//}

func falarBomDia(){
    print("Bom dia!")
}

falarBomDia()
falarBomDia()

// Função com parâmetro
func falarBoaTarde(nome:String){
    print("Boa tarde, \(nome)")
}

falarBoaTarde("Mary")
falarBoaTarde("Jane")

// Função com retorno
func boaNoite(nome:String) -> String {
    return "Boa noite, \(nome)"
}

var saudação = boaNoite("Jeremias")
print("Como se diz: \(saudação)")
saudação = boaNoite("Catarina")
print("Como se diz: \(saudação)")

print(boaNoite("Joseph"))


// Funções somente com retorno
func diaDoBanho() -> String{
    return "Sábado"
}

print("Qual é o dia do banho? É \(diaDoBanho())")


// Quick Fix: Faça uma função que diga 'oi' por um
// determinado número de vezes, ou seja, 
// receber um parâmetro Int chamado 'vezes'

func repitaOi(vezes:Int){
    for _ in 1...vezes {
        print("Oi! ", terminator:"")
    }
}

repitaOi(4)

// Faça uma função que retorna verdadeiro ou falso se um 
// nome é bem grande (maior que 10 letras)
// exemnplo: éUmNomeGrande("Lino") retorna false

func éUmNomeGrande(nome:String) -> Bool {
    return nome.characters.count > 10
}

éUmNomeGrande("Schweisteiger")
éUmNomeGrande("Ken")


// Funções com múltiplos parâmetros
func avaliarImóvel(metros:Int, vagas:Int, lazer:Bool) -> Int {
    var valor = 5000 * metros
    valor += vagas * 5000
    valor += lazer ? 15000 : 0
    return valor
}

let aptoPadrão = avaliarImóvel(80, vagas: 2, lazer: true)
print("Este móvel com 80m, 2 vagas custa: \(aptoPadrão)")

let kitnet = avaliarImóvel(30, vagas: 0, lazer: false)
print("Este móvel com 30m, sem vagas custa: \(kitnet)")


// Funções com múltiplos retornos

//typealias Error = (code: Int, status:String)
// func erroParaPáginaNãoEncontrada() -> Error {
// return (400, "Not Found")
// }


func erroParaPáginaNãoEncontrada() -> (code:Int, status:String) {
    return (400, "Not Found")
}

print(erroParaPáginaNãoEncontrada().status)

// Outra maneira de construir:
let (códigoDeErro, mensagem) = erroParaPáginaNãoEncontrada()
print(mensagem)
print(códigoDeErro)


// Quick Fix

// Fazer uma função que diz se o nome é maior que o sobrenome
// Ou seja, receber parâmetros 'nome', 'sobrenome'.
// Retornar booleano, true se o nome for maior

// verificaSeNomeMaior ("Luiz", "Gustavo") // retorna false
// verificaSeNomeMaior ("Alexandre", "Gomes") // retorna true

func verificaSeNomeMaior (nome:String, sobrenome:String) -> Bool {
    return nome.characters.count > sobrenome.characters.count
}

verificaSeNomeMaior("Ken", sobrenome: "Aramaki")
verificaSeNomeMaior("Thiago", sobrenome: "Mota")
verificaSeNomeMaior("Luiz", sobrenome: "Gustavo")
verificaSeNomeMaior("Alexandre", sobrenome: "Gomes")


// Parâmetro com valor padrão

func contagemRegressiva(valor:Int = 10) {
    for numero in Array(1...valor).reverse(){
        print("Contando: \(numero)")
    }
}

contagemRegressiva(2)
contagemRegressiva()


// Enviando parâmetros mutáveis

func dobrar(inout valor:Int){
    valor = valor * 2
}

var dez = 10
dobrar(&dez)
print(dez)


// Nomeando parâmetros

// por padrão, no Swift 2.2, temos:
// 1) primeiro parâmetro é omitido na chamada
// 2) seguintes são visualizados
// mas podemos alterar isso quando criamos nossas funções

func triplicar (numero valor:Int) -> Int { // numero: nome pra fora, valor: nome pra dentro
    return valor * 3
}

triplicar(numero: 4)


func multiplicar(numero valor:Int, por multiplicando:Int) -> Int {
    return valor * multiplicando
}

multiplicar(numero: 10, por: 3)



// Remover o nome dos parâmetros
func soma(v1:Int,_ v2:Int) -> Int {
    return v1 + v2
}

soma(10, 4)


// 1) Faça uma função que conta quantas vogais há num texto

func quantasVogais (texto:String) -> Int {
    var contador = 0
    for i in texto.characters {
        switch i {
            case "a","e","i","o","u","A","E","I","O","U":
                contador += 1
            default:
                break
        }
    }
    return contador
}

quantasVogais("Texto para teste")

// 2) Retorna o dobro de um número com casas decimais

func dobro(numero: Double) -> Double {
    return numero * 2
}

dobro(4)

// 3) Retorna a média aritmética entre 2 valores reais

func mediaAritimetica(valor1:Double,_ valor2:Double) -> Double {
    return (valor1+valor2)/2
}

mediaAritimetica(2, 3)

// 4) Retorna true se um número é negativo

func numeroNegativo(numero:Double) -> Bool {
    return numero < 0
}

numeroNegativo(-10)
numeroNegativo(8)

// 5) Retorna o inverso de um número (2, recebe -2. -3, recebe 3)
func inversoDeUmNumero(numero:Double) -> Double {
    return numero * -1
}

inversoDeUmNumero(10)
inversoDeUmNumero(-1)

// 6) Retorna o menor valor de um vetor de Int
func menorValor(vetor:[Int]) -> Int {
    var menor = Int.max
    for i in vetor {
        if i < menor {
            menor = i
        }
    }
    return menor
}

menorValor([15,9,-10,4,-22])

// 7) Retorna se o número é primo

func éPrimo(numero:Int) -> String{
    if numero==1 || numero==0 {
        return "O número \(numero) não é primo"
    }else{
    
        var contador = 0
        for i in 1...numero {
            if numero%i == 0 {
                contador += 1
            }
        }
        if contador>2{
            return "O número \(numero) não é primo"
        }else {
            return "O número \(numero) é primo"
        }
    }
}

éPrimo(0)
éPrimo(1)
éPrimo(2)
éPrimo(3)
éPrimo(4)
éPrimo(5)
éPrimo(6)
éPrimo(7)
éPrimo(8)
éPrimo(9)
éPrimo(10)
éPrimo(11)
éPrimo(12)
éPrimo(13)

éPrimo(31)

// 8) Retorna as inicias de um nome (ex: "Luiz Gustavo Lino", recebe "LGL")

var x = "teste"
x.characters.first
x.characters.last


let nome = ["Árthur", "Ken", "Aramaki", "Mota"]
for i in nome {
    print(i.characters.first!, terminator: "")
}

//func iniciais(nomeCompleto:String) -> String{
    

//}

print("\n")

// 9) Retorna a última letra de cada palavra de uma frase
let frase = ["Isto", "aqui", "é", "uma", "frase."]
for i in frase {
    print(i.characters.last!, terminator:"")
}


let istoÉUmaFrase = "Isto é uma frase".characters.map{String($0)}
print (istoÉUmaFrase)


