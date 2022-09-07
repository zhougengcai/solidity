pragma solidity ^0.4.0;
contract payTest {
    function pay () payable  {

    }
    //获取当前多少比特币
    function getBalance ()view  returns  (uint) {
        return this.balance;
    }
    // 涉及到支付功能必须要写
    function () payable {

    }
    // 转账
    function transfer () payable  {
        this.transfer(msg.value);
    }
}