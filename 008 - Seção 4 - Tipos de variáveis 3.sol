// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.4.10; // Versão do Solidity

contract GuardaLoteria {

  // Declaração de variáveis
	int8 numero; // de -128 à +127
	bool numeroPar;
	bool numeroImpar;

  constructor(int256 _numero) public payable {
	  set(_numero);
	}

    function set(int256 _numero) public {
    require(_numero == int8(_numero), "O Valor não cabe na variável global");
	  numero = int8(_numero);

    numeroPar = numero % 2 == 0; // % - Resto da divisão
    numeroImpar = !numeroPar;
	}

    function get() public view returns (int8 _numero, bool _ePar, bool _eImpar) {
	    return (numero, numeroPar, numeroImpar);
	}
}
