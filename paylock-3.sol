pragma solidity ^0.6.1;
contract payment{
    enum State{Working, Completed, Done_1, Delay, Done_2, Forfeit}
    struct Data {
        State st;
        int256 disc;    
    }
    Data data;
    constructor() public {
        data.st = State.Working;
        data.disc = 0;
    }
    
    function signal() external {
        require( data.st == State.Working );
        data.st = State.Completed;
        data.disc = 10;
    }
    
    function collect_1_Y() external {
        require( data.st == State.Completed );
        data.st = State.Done_1;
        data.disc = 10;
    }
    
    function collect_1_N() external {
        require( data.st == State.Completed );
        data.st = State.Delay;
        data.disc = 5;
    }
    
    function collect_2_Y() external {
        require( data.st == State.Delay );
        data.st = State.Done_2;
        data.disc = 5;
    }
    
    function collect_2_N() external {
        require( data.st == State.Delay );
        data.st = State.Forfeit;
        data.disc = 0;
    }

}

