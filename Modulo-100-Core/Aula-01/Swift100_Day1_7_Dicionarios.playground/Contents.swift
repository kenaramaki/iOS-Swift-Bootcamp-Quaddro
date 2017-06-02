//: Dicionários

var rodizio = [
    "SEG":"1 e 2",
    "TER":"3 e 4",
    "QUA":"5 e 6",
    "QUI":"7 e 8",
    "SEX":"9 e 0"
]

// Acesso aos valores
print("Na quinta são as placas: \(rodizio["QUI"]!)")

// Tipagem explícita

var dicionarioUm:Dictionary<String, Int>
var dicionarioDois:[String:Int]

// Alterando ou adicionando
rodizio["DOM"] = "Todas as placas"
print(rodizio)

// Remover
rodizio["DOM"] = nil // 'nil' significa 'nulo'
print(rodizio)

// contagem, chaves e valores
rodizio.count
print(Array(rodizio.keys))
print(Array(rodizio.values))

for(chave,valor) in rodizio{
    print("para \(chave), placas\(valor)")
}

// Quick Fix
// Faça um dicionário com filmes, em que a chave seja o nome do
// filme e o valor seja uma tupla contendo diretor, ano de
// lançamento e avaliação

typealias DadosFilme = (diretor:String,ano:Int)

var filmes:[String:DadosFilme] = [
    "Star Wars: Episode VII The Force Awakens":(diretor: "J.J. Abrams", ano:2016),
    "Star Wars: Episode VI Return of the Jedi":("Richard Marquand", 1983),
    "Star Wars: Episode V The Empire Strikes Back":(diretor: "Irvin Kershner", ano: 1980)
]

print(filmes)

for(chave,valor) in filmes{
    print("Filme: \(chave), Diretor: \(valor.diretor), Ano de Lançamento: \(valor.ano)")
}


