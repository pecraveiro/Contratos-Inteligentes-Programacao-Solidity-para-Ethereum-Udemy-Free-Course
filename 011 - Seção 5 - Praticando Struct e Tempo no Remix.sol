pragma solidity ^0.4.0;

contract GuardaLoteria {
	// Variável Global
	address dono; // Endereço -  Dono do contrato

	struct Sorteio {
	// Elementos
	uint data;
	uint numeroSorteado;
	address remetente;
}
	// Array / Lista / Vetor
	Sorteio[] sorteios;

	constructor(uint numeroInicial) public {
	dono = msg.sender;
	set(numeroInicial);	
}

	function set(uint enviado) public {
	
	sorteios.push(Sorteio({
		data: now,
		numeroSorteado: enviado,
		remetente: msg.sender}));
}
// Talvez esteja faltando uma } aq

function get() public view returns (
	address _donoDoContrato,
	uint _sandoEmWei,
	uint _ultimoSorteado,
	address _ultimoRemetente
) {
	Sorteio memory ultimo = sorteios[sorteios.length-1];
	return (
		dono,
		address(this).balance,
		ultimo.numeroSorteado,
		ultimo.remetente
		);
}


function kill () public {
	require(msg.sender == dono);
	selfdestruct(dono);
}
}
