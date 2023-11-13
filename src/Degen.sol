// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
import "lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

/*

Your task is to create a ERC20 token and deploy it on the Avalanche network for Degen Gaming.
 The smart contract should have the following functionality:
Minting new tokens: The platform should be able to create new tokens and distribute them to players as rewards. Only the owner can mint tokens.
Transferring tokens: Players should be able to transfer their tokens to others.
Redeeming tokens: Players should be able to redeem their tokens for items in the in-game store.
Checking token balance: Players should be able to check their token balance at any time.
Burning tokens: Anyone should be able to burn tokens, that they own, that are no longer needed.
*/
contract DegenToken is ERC20{
    uint public redeemId;
    address public owner;

    struct Redeemer {
        address owner;
        string name;
        uint256 amount;
    }
    constructor() ERC20("Degen", "DGN") {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not Owner");
        _;
    }

    mapping(uint => Redeemer) public redeem;

    function createRedeem(string memory _name, uint256 _amount) external {
           redeemId++;
        Redeemer storage item = redeem[redeemId];
        item.owner = msg.sender;
        item.name = _name;
        item.amount = _amount;
        redeem[redeemId] = item;
    }

    function mint(address to, uint amount) public onlyOwner {
        _mint(to, amount);
    }
    function decimals() override public pure returns (uint8) {
        return 0;
    }
    function getBalance() external view returns(uint256) {
        return this.balanceOf(msg.sender);
    }
    function transferTokens(address _receiver, uint256 _value) external{
        require(balanceOf(msg.sender)>= _value, "You do not have Degen tokens");
        _transfer(msg.sender, _receiver, _value);
    }
    function burnTokens(uint amount) external {
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        _burn(msg.sender, amount); 
    }
    function redeemToken(uint8 redeemID_) external {
        require(redeemID_ <= redeemId, "ID not found");
        transfer(redeem[redeemID_].owner, redeem[redeemID_].amount);
        redeem[redeemID_].owner = msg.sender;
    }
    function viewRedeemOwner(uint8 redeemID_) public view returns (address) {
        return redeem[redeemID_].owner;
    }

    function showRedeem(uint id_) public view returns (Redeemer memory) {
        return redeem[id_];
    }
    
}
