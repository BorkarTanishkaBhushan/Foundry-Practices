pragma solidity 0.8.13;

contract Wallet {
    address payable public owner;
    uint256 public balance;

    event Deposit(address account, uint256 amount);

    constructor() payable {
        owner = payable(msg.sender);
    }

    function withdrawEther(uint256 amount) external {
        require(msg.sender == owner, "Only owner can call this function");
        require(amount <= balance, "Amount exceeds balance");
        balance -= amount;
        payable(owner).transfer(amount);
    }

    function setNewOwner(address _owner) external {
        require(msg.sender == owner, "Only owner can call this function");
        owner = payable(_owner);
    }

    receive() external payable {
        emit Deposit(msg.sender, msg.value);
    }

    fallback() external payable {
        emit Deposit(msg.sender, msg.value);
    }
}
