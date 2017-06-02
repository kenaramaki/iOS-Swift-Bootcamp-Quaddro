//: Classes
// Classes são a junção de variáveis e métodos, criando
// um molde de que se pode tirar réplicas indefinidamente
// Exemplo: um gato tem cor, mike é branco
//          | classe    | objeto da classe |

class Anotação {
    var nota:String = ""
    var dia:Int     = 0
    var mes:Int     = 0
    var ano:Int     = 0
    
    init(nota:String, dia:Int, mes:Int, ano:Int){
        self.dia    = dia
        self.mes    = mes
        self.ano    = ano
        self.nota   = nota
    }
    
    func descrição() -> String {
        return "\(self.dia)/\(self.mes): \(self.nota)"
    }
    
    func duplicar(novo:String) -> Anotação{
        return Anotação(nota: novo, dia: self.dia, mes: self.mes, ano: self.ano)
    }
}

let natal = Anotação(nota: "Lembrar de comprar panettone", dia: 25, mes: 12, ano: 2016)

print (natal.nota)
print(natal.descrição())

natal.nota = "É feriado!"
print(natal.nota)

var feriado = Anotação(nota: "Independência", dia: 7, mes: 9, ano: 2016)
print(feriado.descrição())
feriado = natal             // ponteiro
print(feriado.descrição())


let diaDoVoo = natal.duplicar("Voo agendado para às 15h")

// Variáveis com tipos sendo classes
// Atenção: nomes de classes sempre com a primeira letra maiúscula
class Agenda {
    let dono:String
    var anotações:[Anotação]
    
    init(dono:String){
        self.dono       = dono
        self.anotações  = []
    }
    
    func notasDoMes(mes:Int, ano:Int) -> () {
        //
        //
        //
    }
    
}

let minhaAgenda = Agenda(dono: "Ken")
minhaAgenda.anotações.append(natal)


// Quick fix: Faça um método na agenda que mostre 
// todas as anotações de um dado mês
// exemplo: minhaAgenda.notasDoMes(12, 2016)

