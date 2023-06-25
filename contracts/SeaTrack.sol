// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import {IWorldID} from "./interfaces/IWorldID.sol";

contract SeaTrack {
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

    mapping(address => User) public users;

    modifier onlyAdminOrUser() {
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

    function createUser(uint role, IWorldID worldcoin_id) public onlyVerified onlyAdmin onlyNotDisabled {
        users[address(worldcoin_id)] = User(role, false, false, worldcoin_id, new address[](0), new bytes[](0), IWorldID(msg.sender), false, false);
    }

    function createAdmin(uint role, IWorldID worldcoin_id, bool global) public onlyVerified onlyGlobalAdmin {
        users[address(worldcoin_id)] = User(role, !global, global, worldcoin_id, new address[](0), new bytes[](0), IWorldID(msg.sender), false, false);
    }

    function verify(address signal, uint256 root, uint256 nullifierHash, uint256[8] calldata proof) public {
        require(worldId.verifyProof(root, 1, abi.encodePacked(signal), nullifierHash, 1, proof), "Verification failed");
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

    function addCID(address user, bytes memory cid) public onlyVerified onlyApprovedAddress(user) onlyNotDisabled {
        users[user].approved_cids.push(cid);
    }

    function addAddress(address user, address addr) public onlyVerified onlyAdminOrUser onlyNotDisabled(user) {
        users[user].approved_addresses.push(addr);
    }

    function removeAddress(address addr) public onlyVerified onlyAdminOrUser onlyNotDisabled(user) {
        uint index;
        bool found = false;

        for (uint i = 0; i < users[message.sender].approved_addresses.length; i++) {
            if (users[message.sender].approved_addresses[i] == addr) {
                index = i;
                found = true;
                break;
            }
        }

        require(found, "Address not found");

        for (uint i = index; i < users[message.sender].approved_addresses.length - 1; i++) {
            users[message.sender].approved_addresses[i] = users[message.sender].approved_addresses[i + 1];
        }

        users[user].approved_addresses.pop();
    }

    function editUser(address user, uint role, IWorldID worldcoin_id) public onlyVerified onlyAdmin onlyNotDisabled(user) {
        if (users[user].local_admin) {
            require(users[user].admin == users[messager.sender].worldcoin_id, "Local admins cannot edit users they did not create");
        }

        User storage u = users[user];
        u.role = role;
        u.worldcoin_id = worldcoin_id;
        u.verified = false;
    }
}