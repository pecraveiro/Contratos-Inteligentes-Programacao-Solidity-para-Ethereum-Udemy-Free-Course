pragma solidity ^0.4.0;

contract GuardaLoteria {
	// Definição de variáveis de estado
	address dono; // O endereço de uma carteira
	uint numeroSorteado = 0; // Um número inteiro sem sinal ''sorteado''
	uint contadorDeSorteios = 0; 

	uint[] numerosSorteados; // Array

	constructor(uint numeroInicial) public payable comCustoMinimo(1000) {
	dono = msg.sender;
	set(numeroInicial);
}

event TrocoEnviado(address pagador, int troco);

function set(uint enviado) public payable comCustoMinimo(1000) {

numeroSorteado = enviado;
contadorDeSorteios++; //Incrementar em 1 vez (++)
numerosSorteados.push(enviado); // Push - coloque no final da lista

	if (msg.value > 1000){
	uint troco = msg.value - 1000;
	msg.sender.transfer(troco);
	emit TrocoEnviado(msg.sender, troco);
	}
}
	modifier comCustoMinimo(uint min) {
	require(msg.value >= min, "Não foi enviado Ether suficiente.");
	_;
}

	function get() public view returns (
	address _donoDoContrato,
	uint _ultimoNumeroSorteado,
	uint _contadorDeSorteios,
	uint _saldEmWei,
	uint[] _todosNumerosSorteados ) {
		uint ultimo = numerosSorteados[contratoDeSorteios-1];
		return (dono, ultimo, contadorDeSorteios, address(this).balance, numerosSorteados); 
}

function kill () public {
	require (msg.sender == dono);
	selfdesctruct(dono);
}
}
