// SPDX-License-Identifier: MIT
pragma solidity ^0.4.0;
contract zhongchou {
    struct funder{
        // 捐赠者地址
        address funderAddress;
        //捐赠多少钱
        uint funMoney;
    }
    struct needer{
        address neederAddress;//受益人地址
        uint goal;//目标值
        uint amount;//总数
        uint funderAccount;//捐赠笔数
        mapping  (uint => funder) map;//将捐赠者与受益人绑定
    }
    uint neederAmount;//笔数
    mapping (uint => needer) needMap;//将id与受益人绑定
    function NewNeeder(address _NeederAddress, uint _goal){
        neederAmount++;//收益人id
        needMap[neederAmount] = needer(_NeederAddress,_goal,0,0);//受益人绑定信息
    }
    function contribute (address _address,uint _neederAmuont) payable {
        needer __needer = needMap[_neederAmuont];//创建实例
        __needer.amount += msg.value;//捐赠钱累加
        __needer.funderAccount++;//捐赠者累加
        __needer.map[__needer.funderAccount]=  funder(_address , msg.value);//将捐赠者与受益人绑定
    }
    //满足条件转账
    function isCompelete(uint _neederAmount) {
        needer _needer = needMap[_neederAmount];

        if(_neederAmount >= _needer.goal){
            _needer.neederAddress.transfer(_needer.amount);
        }
    }
    function test () view returns  (uint,uint,uint){
        return (needMap[1].goal,needMap[1].amount,needMap[1].funderAccount);
    }
}