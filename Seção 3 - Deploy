// SPDX-License-Identifier: GPL-3.0
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
