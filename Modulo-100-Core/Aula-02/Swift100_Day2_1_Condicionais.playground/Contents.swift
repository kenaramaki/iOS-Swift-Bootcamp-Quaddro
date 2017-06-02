//: Condicionais

let estáChovendo = true

// IF (se)
if estáChovendo {
    print("É bom levar ☂️") // < control + command + espaço (emojis)
}

// Note que:
// paraenteses na condição é opcional, mas não recomendado
// chaves são obrigatórias

let carroTemCombustível = false

if carroTemCombustível {
    print("Segue viagem!")
}else{
    print("Melhor abastecer.")
}

// Note que>
// Condicionais somentes funcioanam com *booleanos*
// if 0 {... // não funciona
// if nil {... // não funciona


// Encadeamento
// IF - ELSE IF - ELSE

let farol = "verde"

// se farol for vermelho, pare
if farol == "vermelho" {
    print("Pare")
// se farol for amarelo, atenção
}else if farol == "amarelo"{
    print("Atenção")
// para qualquer outro farol, siga
}else{
    print("Siga")
}

/*
 
 == igual
 != diferente
 > maior
 < menor
 >= maior igual
 <= menor igual
 
 */


// mais um exemplo:

let temperatura = 23

if temperatura < 10 {
    print("Está frio.")
} else if temperatura < 20 {
    print ("Está morno.")
} else {
    print("Está quente.")
}


// Operadores &&(e) || (ou)

let somAlto     = true
let passouDas10 = true

// If com AND: compara duas ou mais condições verdadeiras
if somAlto && passouDas10 {
    print("Aí vem multa 💰")
}

// Tabela Verdade do &&
// false && false = false
// true && false = false
// false && true = false
// true && true = true
// ou seja, quero que duas coisasaconteçam ao mesmo tempo


// AND com negativa
let moroNumaCasa = true
if somAlto && passouDas10 && !moroNumaCasa {
    print("Aí vem multa 💰")
}

// IF com OR: uma das duas verdadeiras
let feriado = true
let ferias  = false

if ferias || feriado {
    print("Praia? 🏖")
} else {
    print("Trabalhar! 💻")
}



// Recap
// 1) Considere o valor abaixo
let número = 7

// verifique se é maior que zero
// verifique se ele é par

if número > 0 {
    print("Número maior que zero")
} else {
    print("Número menor que zero")
}

if número%2 == 0 {
    print("É um número par ")
} else {
    print("É um número ímpar")
}

// 2) Considerando o texto abaixo:
let texto = "ah, eu conheço esse lugar! 🏘"

// verifique se tem mais de 3 letras
// verifique se começa com a letra 'a'

let contador = texto.characters.count
if contador > 3 {
    print("Tem mais de 3 letras")
}

if texto.characters.first == "a" || texto.characters.first == "A" {
    print("Primeira leta é \"A\" ou \"a\".")
}


// 3) Já posso aposentar?
// tempo de contribuição mínimo: 15 anos
// idade: é preciso mais de 65 anos para homem, 60 para mulher
let éMulher = false
let tempoDeContribuição = 6
let idade = 28

// tenho que ter mais de 15 anos de contri. e (mulher mais de 60) ou (homem mais de 65)

if tempoDeContribuição > 15 && (éMulher && idade > 60) || (!éMulher && idade > 65) {
    print("Posso aposentar.")
} else {
    print("Não posso aposentar.")
}

/*

// Meu

 if éMulher && tempoDeContribuição >= 15 && idade >= 60 {
    print("Pode aposentar!")
} else if !éMulher && tempoDeContribuição >= 15 && idade >= 65 {
    print("Pode aposentar!")
} else {
    print ("Não pode aposentar.")
}

 */


// Desafio: Passei de ano?
// Considere uma escola, onde cada aluno estuda
// em 3 matérias e tem 4 provas por ano.
// Cada avaliação tem uma nota, de 0 à 10.
//
// De 0 até 5, o aluno é reprovado na matéria.
// Tirando 6 e 7 está de recuperação na matéria.
// Mais de 7 é aprovado na matéria.
//
// Para passar precisar estar aprovado em todas
// matérias ou ter, no máximo, uma recuperação.
//
// Utilize o que aprendeu até agora para modelar:
// Aluno Júlio, com as notas:
// em Cálculo: 3,8,9,7
// em Finanças: 9,9,8,9
// em Redação: 10,10,4,6
//
// Júlio passou?

/*
typealias Matérias = (matéria1:String, matéria2:String, matéria3:String)
typealias Notas = (nota1:Double, nota2:Double, nota3:Double, nota4:Double)
typealias Aluno = (nome:String, matériasAluno:Matérias, notasAluno:Notas)

let julio:Aluno

julio.nome = "Júlio"

*/

let notas:[String:[Double]] = [
    "Cálculo":[3,8,9,7],
    "Finanças":[9,9,8,9],
    "Redação":[10,10,4,6]
]

var aprovado:Int = 0
var recuperacao:Int = 0
var reprovado:Int = 0

for (materia, nota) in notas {
    let soma = nota.reduce(0, combine:+)
    let media = soma/Double(nota.count)
    print( "\(materia): \(media)")
    
    if media >= 7.0 {
        aprovado += 1
    } else if media >= 6.0 {
        recuperacao += 1
    } else {
        reprovado += 1
    }
}

if aprovado >= 3 || (aprovado >= 2 && recuperacao == 1) {
    print("Aprovado")
} else {
    print("Reprovado")
}














