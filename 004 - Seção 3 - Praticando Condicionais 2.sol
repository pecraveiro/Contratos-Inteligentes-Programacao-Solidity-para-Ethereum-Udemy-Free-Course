// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.10; // Versão do programa, versão do solidity

contract GuardaLoteria {
	// Criação de variáveis
	uint numeroSorteado; // uint - número inteiro sem sinal
	address dono; // Dono do contrato, essa variável é um endereço de carteira
	uint contadorDeSorteios = 0; // uint - é um número inteiro sem sinal
	bool donoRico = false; // Essa variável irá guardar um valor - verdadeiro ou falso

	constructor(uint numeroInicial) public { 
	require(msg.sender.balance > 99.9999999999 ether); // Olhar a tabela do WEI
	
	numeroSorteado = numeroInicial;
	dono = msg.sender;
	contadorDeSorteios = 1;

	if (msg.sender.balance > 20 ether) { // Se o saldo dessa pessoa for maior que 20 ether, o dono é rico.
        donoRico = true;
    	}
	
	else {
		donoRico = false;
		}
	}

	function set(uint enviado) public {
	numeroSorteado = enviado;
	contadorDeSorteios++;
	}

	function get() public view returns (uint) {
        return numeroSorteado;
	}

	function getContador() public view returns (uint) {
	return contadorDeSorteios;
	}

	function getDono() public view returns (address) {
	return dono;
	}

	function getRico() public view returns (bool) {
	return donoRico;
	}	 
}

// Uma função view, não modifica o estado do contrato;
// 'require' - ele só vai executar caso o 'requerimento' for verdadeiro;
// o 'constructor' só roda quando o contrato esta sendo enviado / ou está sendo feito o deploy para a rede ethereum;
// msg.sender é quem está enviando o contrato pela primeira vez na rede;
// balance é o saldo da conta, nesse caso se o saldo for menor não conseguiremos fazer o deploy;
// deploy na tradução significa - estender/implantar/abrir.
