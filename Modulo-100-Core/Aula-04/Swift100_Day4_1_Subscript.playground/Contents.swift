//: Subscript
// Um subscript é um acesso via 'chave' a uma informação dentro do nosso
// objeto! Podemos, por exemplo, aplicar essa técnicar para processar algo
// em tempo real sem perder a facilidade de uso

class Dobrador{
    subscript(valor:Int) -> Int {
        return valor * 2
    }
}


let meuDobrador = Dobrador()
print(meuDobrador[4])


// Mais um exemplo de subscript

typealias Colaborador = (nome:String, setor:String)

class Empresa {
   
    var colaboradores:[Colaborador] = []
    
    func empregar(candidato:Colaborador){
        colaboradores.append(candidato)
    }
    
    subscript(setorProcurado:String) -> [Colaborador] {
        return colaboradores.filter{ $0.setor == setorProcurado}
    }
    
}

let quaddro = Empresa()
let lino:Colaborador = ("Luiz Gustavo", "professor")
let dede:Colaborador = ("Dede","professor")
let Hemerson:Colaborador = ("Hemerson", "secretaria")

quaddro.empregar(lino)
quaddro.empregar(Hemerson)
quaddro.empregar(dede)

print(quaddro["professor"])
print(quaddro["secretaria"])


// Por que isso ajuda?
// antigamente em obj-c você acessava um elemento de vetor assim:
// > [vetor ObjectAtIndex:0]
// agora em Swift, e outras linguagens, podemos fazer:
// > vetor[0]



// Mais um exemplo:

class Endereço {
    
    let nome:String
    let rua:String
    let numero:Int
    
    init(nome:String, rua:String, numero:Int){
        self.nome   = nome
        self.rua    = rua
        self.numero = numero
    }
    
}



class Mapa {
    
    var endereços:[Endereço] = []
    
    
    
    func incluirEndereço(noveEndereço:Endereço){
        endereços.append(noveEndereço)
    }
    
    subscript(rua:String, numero:Int) -> String {
        
        get{
        
            for endereço in endereços {
                // Busca endereço nessa rua e número
                if endereço.numero == numero && endereço.rua == rua {
                    return endereço.nome
                }
            }
        
            return "Nenhum local foi encontrado"
        }
        set{
            endereços.append(
                Endereço(nome: newValue, rua: rua, numero: numero)
            )
        }
    }
    
    subscript(rua:String) -> [String] {
        // Filtra todos os endereços dessa rua
        // e depoi mapeia o nome de cada um
        return endereços.filter{ $0.rua == rua}.map{$0.nome}
    }
    
}


let meuBairro = Mapa()
meuBairro.incluirEndereço(
    Endereço(nome: "Kiss FM", rua: "Avenida Paulista", numero: 2200)
)

meuBairro.incluirEndereço(
    Endereço(nome: "Conjunto Nacional", rua: "Avenida Paulista", numero: 2073)
)

meuBairro.incluirEndereço(
    Endereço(nome: "Starbucks", rua: "Alameda Santos", numero: 1054)
)

print(meuBairro["Avenida Paulista", 2073])
print(meuBairro["Avenida Paulista"])

print("-----------------------------------")

meuBairro["Avenida Paulista", 90] = "Lan House"
print(meuBairro["Avenida Paulista"])










