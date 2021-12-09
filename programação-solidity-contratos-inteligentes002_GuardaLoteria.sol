pragma solidity ^0.8.10; // Versão do Solidity, é a versão que vai compilar esse contrato da linguagem para transformar em um BitCode
 
// Nós iremos criar um contrato inteligente que guarda o número da Loteria de forma inviolável na blockchain

// Definição de um contrato e seu nome
contract GuardaLoteria {
    uint numeroSorteado; // Declaramos que esse número sorteado será inteiro sem sinal (uint)

    // Função para interagir com o contrato  
    function set(uint enviado) public {
        numeroSorteado = enviado;
    }

    // Função para interagir com o contrato  
    function get() public view returns (uint) {
        return numeroSorteado;
    }
}

// Variáveis Globais
// 'numSorteado' é uma variável, uma variável é um nome simbólico ou identificador que aponta para um espaçõ de memória que guarda uma informação
// Na linguagem de programação 'Solidity' nós precisamos especificar qual o 'tipo' de informação guardada (variável) - nesse caso -, 'uint' (um número inteiro sem sinal/unsigned integer)
// São as variáveis que vão ficar armazenadas na blockchain, indicando o estado do contrato
// Não são voláteis, quando acaba a interação com o contrato elas continuam armazenadas;
// Qualquer parte do contrato tem acesso a essas variáveis.

// Variáveis Locais
// Apenas existem no escopo da daquela função em que elas estão sendo usadas - por ex: 'uint enviado'
// Não existe dentro de outras funções;
// São voláteis - quando acabar aquela interação com o contrato, elas são perdidas.

// Funções
// As funções são os métodos pelos quais a gente consegue interagir ou criar funcionalidades para o contrato;
// As funções têm um nome identificador por ex: 'set' ou 'get';
// Podem ser públicas (acessíveis por qualquer um);
// Podem ser privadas (acessíveis apenas pelo código do próprio contrato).

// Enviando um valor
// Quando invocamos uma função, usamos parâmetros para enviar valores 'enviado - no código'
// Esses argumentos (os valores dos parâmetros) são voláteis, a não ser que guardemos algo em uma variável global do contrato
// Como por exemplo na linha 11 do código ^

// Retornando um valor
// Uma função pode retornar um valor para que a chamar (linha 15)
// Temos que declarar isso explicitamente quando escrevermos a função
// E explicitamente retornar o que desejamos (linha 16)