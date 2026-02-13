// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ResistanceRegistry {

    struct Record {
        string genomeHash;
        string ipfsCID;
        string resistanceInfo;
        uint256 timestamp;
        address uploader;
    }

    Record[] public records;

    function addRecord(
        string memory _genomeHash,
        string memory _ipfsCID,
        string memory _resistanceInfo
    ) public {
        records.push(Record({
            genomeHash: _genomeHash,
            ipfsCID: _ipfsCID,
            resistanceInfo: _resistanceInfo,
            timestamp: block.timestamp,
            uploader: msg.sender
        }));
    }

    function getRecord(uint256 index)
        public
        view
        returns (
            string memory,
            string memory,
            string memory,
            uint256,
            address
        )
    {
        Record memory r = records[index];
        return (
            r.genomeHash,
            r.ipfsCID,
            r.resistanceInfo,
            r.timestamp,
            r.uploader
        );
    }
}