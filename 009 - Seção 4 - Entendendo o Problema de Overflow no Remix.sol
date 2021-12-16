// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.4.0;

contract GuardaLoteria {
	uint16 numeroSorteado;
	uint numeroSorteadoGrande;
	uint contadorDeSorteios;
	address dono;


	constructor(uint16 numeroInicial) public {
	numeroSorteado = numeroInicial;
	contadorDeSorteios = 65530;
	dono = msg.sender; // Está se referindo a quem fez o deploy no contrato
	}

	function set(uint enviado) public payable {
		numeroSorteadoGrande = enviado;
		numeroSorteado = uint16(enviado);

		require (msg.sender == dono, "Apenas o dono do contrato pode setar");

		require (contadorDeSorteios + 1 > contadorDeSorteios, "Overflow no contador");
		require (numeroSorteadoGrande == numeroSorteadoGrande, "Overflow no número");

		contadorDeSorteios++;
	}

	function get() public view returns (uint _numero, uint numeroSorteadoGrande, uint16 _contador, address _dono, address _contrato, uint _saldo)
	{
		return (numeroSorteado,
				numeroSorteadoGrande,
				contadorDeSorteios,
				dono,
				this,
				address(this).balance);
	}
}
