// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import {ByteHasher} from "./lib/ByteHasher.sol";
import {IWorldID} from "./interfaces/IWorldID.sol";

contract SeaTrack {
    using ByteHasher for bytes;

    struct User {
        uint role;
        bool local_admin;
        bool global_admin;
        IWorldID worldcoin_id;
        address[] approved_addresses;
        bytes[] approved_cids;
        IWorldID admin;
        bool disabled;
        bool verified;
    }

    IWorldID public worldId;

    constructor(IWorldID _worldId) {
        worldId = _worldId;
    }

    mapping(address => User) public users;

    modifier onlyAdminOrUser(address user) {
        require(users[msg.sender].global_admin || users[msg.sender].local_admin || msg.sender == user, "Not authorized");
        _;
    }

    modifier onlyAdmin() {
        require(users[msg.sender].global_admin || users[msg.sender].local_admin, "Not authorized");
        _;
    }

    modifier onlyGlobalAdmin() {
        require(users[msg.sender].global_admin, "Not authorized");
        _;
    }

    modifier onlyVerified {
        require(users[msg.sender].verified, "Not verified");
        _;
    }

    modifier onlyApprovedAddress(address user) {
        require(isApprovedAddress(user, msg.sender), "Not authorized");
        _;
    }

    function isApprovedAddress(address user, address addr) public view returns(bool) {
        User storage u = users[user];
        for (uint i = 0; i < u.approved_addresses.length; i++) {
            if (u.approved_addresses[i] == addr) {
                return true;
            }
        }
        return false;
    }

    modifier onlyNotDisabled(address user) {
        require(!users[user].disabled, "User is disabled");
        _;
    }

    function createUser(uint role, IWorldID worldcoin_id) public onlyVerified onlyAdmin onlyNotDisabled(msg.sender) {
        users[address(worldcoin_id)] = User(role, false, false, worldcoin_id, new address[](0), new bytes[](0), IWorldID(msg.sender), false, false);
    }

    function createAdmin(uint role, IWorldID worldcoin_id, bool global) public onlyVerified onlyGlobalAdmin onlyNotDisabled(msg.sender) {
        users[address(worldcoin_id)] = User(role, !global, global, worldcoin_id, new address[](0), new bytes[](0), IWorldID(msg.sender), false, false);
    }

    function verify(
        address signal,
        uint256 root,
        uint256 nullifierHash,
        uint256[8] calldata proof
    ) public {
        require(!users[msg.sender].verified, "User already verified");
        
        // Convert signal from address to uint256 using ByteHasher
        uint256 signalAsUint = abi.encodePacked(signal).hashToField();
        
        worldId.verifyProof(
            root,
            1,
            signalAsUint,
            nullifierHash,
            1,
            proof
        );
        
        users[msg.sender].verified = true;
    }

    function disableUser(address user) public onlyVerified onlyAdmin onlyNotDisabled(user) {
        require(!(users[user].global_admin && users[msg.sender].local_admin), "Local admins cannot disable global admins");
        users[user].disabled = true;
    }

    function disableSelf() public onlyVerified onlyAdmin {
        users[msg.sender].disabled = true;
    }

    function enableUser(address user) public onlyVerified onlyGlobalAdmin {
        users[user].disabled = false;
    }

    function addCIDApproved(address user, bytes memory cid) public onlyVerified onlyApprovedAddress(user) onlyNotDisabled(user) {
        users[user].approved_cids.push(cid);
    }

    function addCID(address user, bytes memory cid) public onlyVerified onlyAdminOrUser(user) onlyNotDisabled(user) {
        if (users[user].local_admin) {
            require(users[user].admin == users[msg.sender].worldcoin_id, "Local admins cannot edit users they did not create");
        }

        users[user].approved_cids.push(cid);
    }

    function addAddress(address user, address addr) public onlyVerified onlyAdminOrUser(user) onlyNotDisabled(msg.sender) {
        if (users[user].local_admin) {
            require(users[user].admin == users[msg.sender].worldcoin_id, "Local admins cannot edit users they did not create");
        }
        
        users[msg.sender].approved_addresses.push(addr);
    }

    function removeAddress(address user, address addr) public onlyVerified onlyAdminOrUser(user) onlyNotDisabled(msg.sender) {
        if (users[user].local_admin) {
            require(users[user].admin == users[msg.sender].worldcoin_id, "Local admins cannot edit users they did not create");
        }

        uint index;
        bool found = false;

        for (uint i = 0; i < users[msg.sender].approved_addresses.length; i++) {
            if (users[msg.sender].approved_addresses[i] == addr) {
                index = i;
                found = true;
                break;
            }
        }

        require(found, "Address not found");

        for (uint i = index; i < users[msg.sender].approved_addresses.length - 1; i++) {
            users[msg.sender].approved_addresses[i] = users[msg.sender].approved_addresses[i + 1];
        }

        users[msg.sender].approved_addresses.pop();
    }

    function editUser(address user, uint role, IWorldID worldcoin_id) public onlyVerified onlyAdmin onlyNotDisabled(user) {
        if (users[user].local_admin) {
            require(users[user].admin == users[msg.sender].worldcoin_id, "Local admins cannot edit users they did not create");
        }

        User storage u = users[user];
        u.role = role;
        u.worldcoin_id = worldcoin_id;
        u.verified = false;
    }
}