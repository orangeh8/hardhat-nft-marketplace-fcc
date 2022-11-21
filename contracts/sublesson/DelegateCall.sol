// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract A {
    address public msgsender;

    function callFunc() public {
        msgsender = msg.sender;
    }
}

contract B {
    address public msgsender;
    address public a;

    constructor(address _a) {
        a = _a;
    }

    function call_a_func() public {
        (bool isOK, bytes memory result) = a.call(abi.encodeWithSignature("callFunc()"));

        require(isOK, "call faild");
    }

    /**
        通过 delegatecall 调用，设置 B 为当前的
     */
    function delegatecall_a_func() public {
        (bool isOK, bytes memory result) = a.delegatecall(abi.encodeWithSignature("callFunc()"));

        require(isOK, "call faild");
    }
}
