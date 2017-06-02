//: Variáveis e Constantes

// ~ regrinha ~
// var 'nomeDaVariavel' = 'valor'
// var 'nomeDaVariavel':'tipo' = 'valor'

var meuNome1 = "Ken"
meuNome1 = "Árthur"

// É tipagem forte! ou seja
// isso não funciona: meuNome = 6

// com declaração de tipo
var umNúmeroDaSorte:Int = 13

// Swift é UTF-8
var ações = "OLX"
var 💩 = "Cocô"

// Lista de tipos básicos
var decimalGrande:Double = 3.1416 // Precisão maior, dobro do Float
var decimal:Float = 2.0790

// Inteiros
var inteiro:Int = 4

// especificando tamanhos
Int8.max
Int16.max
Int32.max
Int64.max

// texto / string
var frase:String = "Loremp Ipsum"
var letra:Character = "K"

// Dá pra pegar a lista de characters 
// usando a propriedade 'characters'
frase.characters

for letra in frase.characters {
    print (letra)
}

// Boolean
var flag:Bool = false
var valido = true

//: Constantes

// Igual a var, mas o valor só
// pode ser definido uma vez
let interjeição = "Mas bá, tchê!"

// ou seja, não vai funcionar:
// interjeição = "ôxente!"

// Por exemplo, constantes globais
let PI = 3.1416
let DIA_DO_DESCOBRIMENTO_DO_BRASIL = 22

// Reflexão sobre "ser definido uma só vez"
// veja que interessante:

let tamanho = "G"
let ficaria:String

if tamanho == "G" {
    ficaria = "grande"
}else{
    ficaria = "na medida"
}

// Quick Fix
// Declare as seguintes variáveis
// Pense se deveria ser let/var e o tipo
// - meuNome
// - meuAnoNascimento
// - minhaNacionalidade
// - minhaIdade
// - minhaAltura
// - tenhoCNH

var meuNome:String = "Ken"
let meuAnoNascimento:UInt16 = 1990 // U na frente -> não pode ser negativo
var minhaNacionalidade:String = "Brasileiro"
var minhaIdade:UInt8 = 26
UInt8.max
var minhaAltura:Double = 1.82
var tenhoCNH:Bool =  true
