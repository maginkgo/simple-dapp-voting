pragma solidity ^0.4.18;

contract Voting {
    //Diccionario: nombre del candidato (byetes32) => conteo de votos (unit8)
    mapping (bytes32 => uint8) public votesReceived;
    //Array de candidatos
    bytes32[] public candidateList;

    function Voting(bytes32[] candidateNames) public {
        candidateList = candidateNames;
    }

    function totalVotesFor(bytes32 candidate) view public returns (uint8) {
        require(validCandidate(candidate));
        return votesReceived[candidate];
    }

    function voteForCandidate(bytes32 candidate) public {
        require(validCandidate(candidate));
        votesReceived[candidate] += 1;
    }

    function validCandidate(bytes32 candidate) view public returns (bool) {
        for (uint i = 0; i < candidateList.length; i++) {
            if (candidateList[i] == candidate) {
                return true;
            }
        }
        return false;
    }
}