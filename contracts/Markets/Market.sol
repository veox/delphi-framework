pragma solidity 0.4.11;
import "../Events/Event.sol";
import "../MarketMakers/MarketMaker.sol";


/// @title Abstract market contract - Functions to be implemented by market contracts
contract Market {

    /*
     *  Events
     */
    event MarketFunding(uint funding);
    event MarketClosing();
    event FeeWithdrawal(uint fees);
    event OutcomeTokenPurchase(address indexed buyer, uint8 outcomeTokenIndex, uint outcomeTokenCount, uint cost);
    event OutcomeTokenSale(address indexed seller, uint8 outcomeTokenIndex, uint outcomeTokenCount, uint profit);
    event OutcomeTokenShortSale(address indexed buyer, uint8 outcomeTokenIndex, uint outcomeTokenCount, uint cost);

    /*
     *  State
     */
    address public creator;
    uint public createdAtBlock;
    Event public eventContract;
    MarketMaker public marketMaker;
    uint24 public fee;
    uint public funding;
    int[] public netOutcomeTokensSold;
    Stages public stage;

    enum Stages {
        MarketCreated,
        MarketFunded,
        MarketClosed
    }

    /*
     *  Public functions
     */
    function fund(uint _funding) public;
    function close() public;
    function withdrawFees() public returns (uint);
    function buy(uint8 outcomeTokenIndex, uint outcomeTokenCount, uint maxCost) public returns (uint);
    function sell(uint8 outcomeTokenIndex, uint outcomeTokenCount, uint minProfit) public returns (uint);
    function shortSell(uint8 outcomeTokenIndex, uint outcomeTokenCount, uint minProfit) public returns (uint);
    function calcMarketFee(uint outcomeTokenCost) public constant returns (uint);
}
