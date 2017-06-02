//: Array
// também conhecido como: vetor, coleção

// construção
var pessoas = ["João","Maria","José"]

// tipando explicitamente
let megasena:Array<UInt8> = [12,24,36,48,60,72]
let fibonnaci:[UInt] = [1,1,2,3,5,8,13,21]

// array de tuplas
let muitasTuplas:[(String,Int)]

// acecsso dos valores
pessoas[0]

// alterar os valores
pessoas[1] = "Kratos Santana"

// inserir valores
pessoas.append("Matsumoto") // insere no ifm
pessoas.insert("Ken",atIndex: 0) // no começo

// contando elementos
pessoas.count

// remoções
pessoas.removeLast()
pessoas.removeFirst()

// Drop First: retorna um vetor, desconsiderando o primeiro item
// atenção: o vetor não é alterado
print(pessoas)
pessoas.dropFirst()
print(pessoas)

// inicializar com valores
var refeições = Array(count: 7, repeatedValue: "Bacon")
print(refeições)

// tamanho e vazio
refeições.count
refeições.underestimateCount() // mais rápido, para quando a coleção for muito grande. Para saber mais ou menos o tamanho o array
refeições.isEmpty
refeições.removeAll()
refeições.isEmpty

// Procurar no vetor
pessoas.contains("João")


// Funções de alto nível:
// forEach, filter, map, reduce

var soma:UInt = 0
fibonnaci.forEach{
    print("analisando \($0)")
    soma += $0
}
print(soma)

// filtrando somente os ímpares em fibonnaci
let impares = fibonnaci.filter{
    return $0%2 != 0
}

print(impares)

// dobrando valores de fibonnaci (.map)
let dobrado = fibonnaci.map{
    return $0*2
}

print(dobrado)


// reduce
let reduzir = fibonnaci.reduce(0) {
    return $0 + $1
}

print(reduzir)


// -----------------------------------------------------

// Desafio

// Faça uma  tupla (typealias) para representar uma capital do Sudeste com o nome e a população

// Faça vetor de capitais, adicione as 4 capitais

// 1) Utilizando filter, mostre quais tem mais de 5 milhões de habitantes
// 2) Utilizando map, faça um vetor de string com os nomes das capitais
// 3) utilizando reduce, somar a população das capitais do sudeste

typealias Capital = (
    nome:String,
    populacao:Int
)

var capitaisSudeste:[Capital] = [("São Paulo",11_320_000)]
let minasGerais:Capital = ("Belo Horizonte",1_433_000)
let rioDeJaneiro:Capital = ("Rio de Janeiro",6_320_000)
let espiritoSanto:Capital = ("Vitória",211_520)

capitaisSudeste.append(minasGerais)
capitaisSudeste.append(rioDeJaneiro)
capitaisSudeste.append(espiritoSanto)

print(capitaisSudeste)

// 1)
let maiorque5milhoes = capitaisSudeste.filter{
    return $0.populacao > 5000000
}
print(maiorque5milhoes)

// 2)
let nomeDasCapitais = capitaisSudeste.map{
    return $0.nome
}
print(nomeDasCapitais)

// 3)
let somaDasCapitais = capitaisSudeste.reduce(0){
    return $0 + $1.populacao
}
print(somaDasCapitais)


// -----------------------------------------------------

// Desafio
//: Lista de compras
// 1. Criar tupla produto (nome: String, comprado:Bool) e array listaDeCompras (de Produtos)
// 2. Adicionar produtos
// 3. Listar produtos
// 4. Marcar produtos como comprado
// 5. Listar produtos
// 6. Listar produtos não comprados


typealias Produto = (
    nome:String,
    comprado:Bool
)

var listaDeCompras:[Produto] = []

listaDeCompras.append(("Pão", true))
listaDeCompras.append(("Leite",false))
listaDeCompras.append(("Queijo",true))
listaDeCompras.append(("Presunto",false))

var feijao:Produto = ("Feijão",false)
var arroz:Produto = ("Arroz",true)
listaDeCompras.append(feijao)
listaDeCompras.append(arroz)

print(listaDeCompras.map{
    return $0.nome
    }
)

print("\n")

/*
for produto in listaDeCompras{
    print(produto.nome)
}
 print("\n")
*/

listaDeCompras[1].comprado = true

print(listaDeCompras
    .filter{
        $0.comprado == true
    }.map{
        $0.nome
    }
)

/*
 
for produto in listaDeCompras{
    if produto.comprado == true{
    print(produto.nome)
    }
}
*/

print("\n")

listaDeCompras[1].comprado = false
listaDeCompras[0].comprado = false

print(listaDeCompras
    .filter{
        $0.comprado == true
    }.map{
        $0.nome
    }
)
