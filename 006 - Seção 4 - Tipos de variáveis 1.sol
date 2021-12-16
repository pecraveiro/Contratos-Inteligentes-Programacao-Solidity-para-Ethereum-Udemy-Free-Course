// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.10; // Versão do Solidity

contract GuardaLoteria {

  // Declaração de variáveis
	int8 numero; // de -128 à +127
	bool numeroPar;
	bool numeroImpar;

  constructor(int8 _numero) payable {
	  set(_numero);
	}

    function set(int _numero) public {
	  numero = int8(_numero);
	}

    function get() public view returns (int8 _numero, bool _ePar, bool _eImpar) {
	    return (numero, numeroPar, numeroImpar);
	}
}

