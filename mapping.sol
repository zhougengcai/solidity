pragma solidity ^0.4.0;
contract mappingTest{

    mapping (address => uint) idmapping;
    mapping (uint => string) namemapping;
    uint public  sum = 0;
    // 注册
    function regist(string name) {
        //获取当前合约调用者
        address account = msg.sender;
        sum++;
        //将合约的调用者 地址 与 第几个注册的绑定
        idmapping[account] = sum;
        //将sum与名字绑定
        namemapping[sum] =name;
    }
    //通过地址查询id
    function getByIdaddress (address are) returns (uint) {
      return   idmapping[are];
    }
    //通过id查询名字
    function getNameById (uint id)  returns  (string) {
        return  namemapping[id];
    }
} 