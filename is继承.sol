pragma solidity ^0.4.0;

contract father{
      uint public name=123;
      function dahan() returns (string) {
          return  'xiao';
      }
      
}
contract son is father{
    uint name=123132;
    function get()  returns (uint){
        return  name;
    }
     function dahan2() returns (string) {
          return  'da';
      }
}