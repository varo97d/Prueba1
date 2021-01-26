pragma solidity >=0.4.22 <0.8.0;

//import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";
//import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Counters.sol";
//import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

import "../node_modules/openzeppelin-solidity/contracts/utils/Counters.sol";
import "../node_modules/openzeppelin-solidity/contracts/token/ERC721/ERC721.sol";
import "../node_modules/openzeppelin-solidity/contracts/access/Ownable.sol";


//SPDX-License-Identifier: GPL-3.0
    // SPDX-License-Identifier: MIT
    // SPDX-License-Identifier: Apache 2.0

contract EcoMove is ERC721, Ownable {
   

    // Evento que recoge los datos del nuevo viaje creado
	event NuevoViaje(uint viajeId, string ciaId, address userAddress, bool eco, string facturaId, uint km, string hashProveedor, string huellaCO2);
	
    // Declara un nuevo tipo de dato completo, será usado para almacenar variables del viaje
	struct Viaje {
        string ciaId;
        address userAddress;
        bool eco;
        string facturaId;
        uint32 km;
		string hashProveedor;
		string huellaCO2;
    }

    address atosAddress = 0xcf9833c6b3DBb19F16De86107D8319156e602614;

using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721("Ecomove_Travel", "ET")  {}

    
  Viaje[] public viajes;


  function registrarViaje(string memory ciaId, address  userAddress, bool eco, string memory facturaId, uint32 km, string memory hashProveedor, string memory huellaCO2 /*string memory tokenURI*/) public returns (uint256) {

        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        uint256 viajeId = viajes.length -1;
        
        
        _mint(atosAddress, newItemId);
        
        //_setTokenURI(newItemId, tokenURI);
        
        emit NuevoViaje(viajeId, ciaId, userAddress, eco, facturaId, km, hashProveedor, huellaCO2);

        return newItemId;
    }

    /*function registrarViaje(string memory ciaId, string memory userAddress, bool eco, string memory facturaId, uint32 km, string memory hashProveedor, string memory huellaCO2) public   {
       viajes.push(Viaje(ciaId, userAddress, eco, facturaId, km, hashProveedor, huellaCO2));
       uint256 viajeId = viajes.length -1;
	    emit NuevoViaje(viajeId, ciaId, userAddress, eco, facturaId, km, hashProveedor, huellaCO2);
    
	 
  }
    
    
    */
    
	
  // Matriz dinámica de estructuras de datos de tipo Viaje

  // Declara variable de estado que asigna el viaje a un usuario
  //mapping (uint => address) public viajeToOwner;
  //mapping (address => uint) ownerViajeCount;
  
  // Crea el viaje con los datos proporcionados
  // Introduce el viaje en la estructura de datos y le asigna un identificador
  // Activa el evento con los datos del viaje creado
  
}