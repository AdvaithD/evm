// c2.sol - two state variables
pragma solidity ^0.6.7;

contract C {
  uint256 public a;
  uint256 public b;
  
  constructor () public {
    a = 1;
    b = 2;
  }
}
