contract VerifySignature {
    address owner;

    function VerifySignature() {
        owner = msg.sender;
    }

    function priv() returns(bytes32) {
        return 0xeab5f6141b4c66877f178f8b87c804d380af6d5404edc249d2c388dbcc542977;
    }

    function r() returns(bytes32) {
        return 0x0b7effb7704f726bc64139753dc2d0a3929af2309dd2930ad7a722f5b214cf6e;
    }

    function s() returns(bytes32) {
        return 0x73a461ce418e9e483f13a98c0cba5cddf07f647ea1d6ba2e88d494dfcd411c9c;
    }

    function v() returns(uint8) {
        return 32;  //equal to 0x20
    }

    function v2() returns(uint8) {
        return v()-4;   //bitcoin signature use v that is +4 see reddit comment https://www.reddit.com/r/ethereum/comments/3gmbkx/how_do_i_verify_a_bitcoinsigned_message_in_an/ctzopoz
    }

    function hashToSign() returns(bytes32) {
        return 0x58e2f335bbd6f2b0da93eae19342e7309654fbfeed9a214a1e5d835ac09cc226;
    }

    function expectedAddress() returns(address) {
        return 0x31031df1d95a84fc21e80922ccdf83971f3e755b;
    }

    function isValid() returns(bool) {   //this returns true!!!
        return expectedAddress()==testECRecover();
    }

    function testECRecover() returns(address) {
        return ecrecover(
            hashToSign(),
            v2(),
            r() ,
            s()
            );
    }

    function kill(){
        if (msg.sender == owner) suicide(msg.sender);
    }
}
