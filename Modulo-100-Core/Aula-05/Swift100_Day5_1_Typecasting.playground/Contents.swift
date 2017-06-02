//: Typecasting
// Swift é fortemente tipado, por isso precisamos
// várias vezes coverter tipos de objetos

class Funcionário {
    
    var nome:String
    var salário:Float
    
    init(nome nomeDaPessoa:String, salarioInício:Float){
        nome = nomeDaPessoa
        salário = salarioInício
    }
    
}

class Senior : Funcionário {
    var plr:Float = 2.5
}

class Diretor : Senior {
    var bonus:Float = 50_000
}

// Typecasting com IF

func éUmDiretor(umFuncionario:Funcionário) -> Bool {
    
    // notação para construir uma constante trocando tipo
    // se eu conseguir construir um Diretor trocando o tipo:
    if let umDiretor = umFuncionario as? Diretor {
        print("É um diretor, com bonus de \(umDiretor.bonus)")
    }
    
    // 'is' para checagem  !!!!!!!!!!!
    // 'as' paa converter  !!!!!!!!!!!
    
    if umFuncionario is Diretor {
        return true
    }else{
        return false
    }
}

éUmDiretor(Diretor(nome: "Carlos", salarioInício: 18_000))
éUmDiretor(Funcionário(nome: "Alberto", salarioInício: 1_200))



// typecasting com switch

let funcionários = [
    Diretor(nome: "Pedro", salarioInício: 14_000),
    Senior(nome: "Carol", salarioInício: 8_200),
    Senior(nome: "Miguel", salarioInício: 8_200),
    Funcionário(nome: "Patrícia", salarioInício: 4_600)
]

func salarioDeFevereiro(umFuncionario:Funcionário) -> Float {
    
    switch umFuncionario {
    
    case let umDiretor as Diretor:
        return umDiretor.salário + umDiretor.plr * umDiretor.salário + umDiretor.bonus
        
    case let umSenior as Senior:
        return umSenior.salário + umSenior.plr * umSenior.salário
        
    default:
        return umFuncionario.salário
    }
}


for funcionario in funcionários {
    let salario = salarioDeFevereiro(funcionario)
    print("O salário de fevereiro do(a) \(funcionario.nome) é \(salario)")
}
