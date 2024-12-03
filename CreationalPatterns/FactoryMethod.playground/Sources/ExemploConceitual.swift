import XCTest

/// O protocolo Criador declara um método fábrica que deve retornar um novo objeto de uma classe Produto.
/// As subclasses de Criador normalmente fornecem uma implementação para esse método.
protocol Criador {

    func factoryMethod() -> Produto

    /// Observe que, apesar do nome, apesar do nome, a principal responsabilidade do Criador não é criar produtos.
    /// Normalmente, ele contém alguma lógica de negócios central que depende de objetos Product, retornados pelo método de fábrica.
    /// Subclasses podem alterar indiretamente essa lógica de negócios ao sobrescrever o método de fábrica e retornar um tipo diferente de produto dele.
    func algumaOperacao() -> String
}

/// Essa extensão implementa o comportamento padrão do Criador.
/// Esse comportamento pode ser sobrescrito em subclasses.
extension Criador {

    func algumaOperacao() -> String {
        // Chama o método fábrica para criar o objeto de Produto.
        let produto = factoryMethod()

        // Agora, use o produto.
        return "Criador: o mesmo código do criador funcionou com" + produto.operacao()
    }
}

/// Criadores Concretos sobrescrevem o método fábrica para mudar o tipo do produto resultante
class CriadorConcreto1: Criador {

    /// Observe que a asssinatura do método ainda usa o tipo abstrato Produto,
    /// Observe que a assinatura do método ainda usa o tipo de produto abstrato, embora o produto concreto seja realmente retornado pelo método.
    /// Dessa forma, o Criador pode permanecer independente das classes de produtos concretos.
    public func factoryMethod() -> Produto {
        return ProdutoConcreto1()
    }
}

class CriadorConcreto2: Criador {

    public func factoryMethod() -> Produto {
        return ProdutoConcreto2()
    }
}

/// O protocolo Produto declara as operações que todos os produtos concretos devem implementar
protocol Produto {

    func operacao() -> String
}

/// Produtos Concretos fornecem várias formas de implementar o protocolo Produto
class ProdutoConcreto1: Produto {

    func operacao() -> String {
        return "{Resultado do ProdutoConcreto1}"
    }
}

class ProdutoConcreto2: Produto {

    func operacao() -> String {
        return "{Resultado do ProdutoConcreto2}"
    }
}

/// O código cliente funciona com uma instância de um Criador Concreto, embora através de seu protocolo base.
/// Enquanto o cliente continuar trabalhando com o criador por meio do protocolo base, você pode passar qualquer subclasse do criador.
class Cliente {
    // ...
    static func algumCodigoCliente(criador: Criador) {
        print("Cliente: Eu não sei qual é a classe do criador, mas eu ainda funciono.\n" + criador.algumaOperacao())
    }
    // ...
}

/// Vamos ver funcionando.
class FactoryMethodConceitual: XCTestCase {

    func testFactoryMethodConceitual() {

        /// A Aplicação escolhe um tipo de criador dependendo da configuração do ambiente.

        print("App: Iniciado com o CriadorConcreto1.")
        Cliente.algumCodigoCliente(criador: CriadorConcreto1())

        print("\nApp: Iniciado com o CriadorConcreto2.")
        Cliente.algumCodigoCliente(criador: CriadorConcreto2())
    }
}
