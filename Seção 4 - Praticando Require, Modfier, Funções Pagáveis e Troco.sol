pragma solidity ^0.8.10; // Versão do programa na linguagem Solidity

contract GuardaLoteria  {

  // Declaração de variáveis
  uint numeroSorteado;
  address dono;
  uint contadorDeSorteios = 0;
  bool donoRico = false;
  
  constructor(uint numeroInicial) public {
    require (msg.sender.balance > 99.9999999999 ether);
    
    numeroSorteado = numeroInicial;
    dono = msg.sender;
    contadorDeSorteios = 1;
    
    if (msg.sender.balance > 20 ether) {
      donoRico = true;
    }
    else {
      donoRico = false
    }
    
}

   event TrocoEnviado(address pagador, uint troco);
   
   fuction set(uint enviado) public payable comCustoMinimo(1000) {
    numeroSorteado = enviado;
    contadorDeSorteios++; // Incremento
    
    if (msg.value > 1000)
    {
      uint troco = msg.value - 1000;
      msg.sender.transfer(troco);
      emit TrocoEnviado(msg.sender, troco); 
    }
    
    
    modifier comCustoMinimo(uint min) {
      require(msg.value >= min, "Não foi enviado Etjer suficiente.");
      _; // Isso significa para continuar rodando a função
     }

    function get() public view returns (uint) {
      return numeroSorteado;
    }
}

// Uma função 'payable', ela poderá receber Ether. (linha 29)
// Uma função 'view', ela não muda o estado, apenas retorna o valor da variável. (linha 46)
