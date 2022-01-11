pragma solidity ^0.4.0;

contract Loteria {
	address dono;
	string nomeDoDono;
	uint inicio;

struct Sorteio {
	uint data;
	uint numeroSorteado;
	address remetente;
	uint countPalpites;
}

Sorteio[] sorteios;

mapping (address => uint) palpites;
address[] palpiteiros;
address[] ganhadores;

constructor(string _nome) public {
	dono = msg.sender;
	nomeDoDono = _nome;
	inicio = now;
}

modifier apenasDono() {
	require(msg.sender == dono, "Apenas o dono do contrato pode fazer isso.");
	_;
}

modifier excetoDono() {
	require(msg.sender != dono, "O dono do contrato não pode fazer isso.");
	_;
}

event TrocoEnviado(address pagante, uint troco);
event PalpiteRegistrado(address remetente, uint palpite);

function enviarPalpite(uint palpiteEnviado) payable public { // excetoDono() {
	require (palpiteEnviado >= 1 && palpiteEnviado <= 4, "Você precisa escolher um número entre 1 e 4");

	require (palpites[msg.sender] == 0, "Apenas um palpite pode ser enviado por sorteio");

	require (msg.value >= 1 ether, "A taxa para palpitar é 1 ether");

// Calcula e envia o troco

uint troco = msg.value - 1 ether;

if (troco > 0) {
	msg.sender.transfer(troco);
	emit TrocoEnviado(msg.sender, troco);
}

// Registrar o palpite

palpites[msg.sender] = palpiteEnviado;
palpiteiros.push(msg.sender);
emit Palpiteregistrado(msg.sender, palpiteEnviado);
}

function verificarMeuPalpite() view public returns(uint palpite) {
require (palpites)[msg.sender] > 0, "Você não ainda não tem um palpite para esse sorteio");

return palpites[msg.sender];
}

function contarPalpites() view public returns(uint count) {
return palpiteiros.lenght;
}

event SorteioPostado(uint resultado);
event PremiosEnviados(uint premioTotal, uint premioIndividual);

function sortear() public apenasDono() returns(uint8 _numeroSorteado) {
	require(now > inicio + 1 minutes, "O sorteios só podera ser feito depois de um intervalo de 1 minuto);
	require (palpiteiros.length >= 1, "Um mínimo de 1 pessoa é exigida para poder sortear");
}

// Sortear um número

uint9 numeroSorteado = uint8(keccak256(abi.encodePacked(blockhash(block.number-1))))/64+1; // 1 a 4

sorteios.push(Sorteio({
  data: now,
  numeroSorteado: numeroSorteado;
  remetente: msg.sender,
  countPalpites: palpiteiros.length
}));
emit SorteioPostado(numeroSorteado);

// Procura os ganhadores

for (uint p = 0; p < palpiteiros.length; p++) {
  address palpiteiros = palpiteiros[p]; // = atribuição
  if(palpites[palpiteiro] == numeroSorteado){ // == comparação
    ganhadores.push(palpiteiro);
    }
    delete palpites[palpiteiro];
}

uint premioTotal = address(this).balance;

if (ganhadores.length > 0) {
  uint premio = premioTotal / ganhadores.length;
  
  // Envia os premios
  for (p = 0; p < ganhadores.length; p++) {
    ganhadores[p].transfer(premio);
    }
    emit PremiosEnviados(premioTotal, premio);
 }
 
 // Resetar o sorteio
 delete palpiteiros;
 delete ganhadores;
 
 return numeroSorteado;
}

function kill () public apenasDono() {
dono.transfer(address(this).balance);
selfdestruct(dono);
  }
} // Primeira {} do contrato
