// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./Recycletoken.sol";

contract Recycle {
    uint256 userCount; 
    address private _owner;
    uint256 private levelGap = 10;
    RecycleToken recycleToken;

    event userScored(
        uint userId,
        uint totalScore,
        uint specificAchievementScore,
        string achievementType
    );

    event userAdded(
        uint userId,
        address addr
    );

    struct User {
        uint256 id;
        uint256 totalAchievementScore;
        address addr;
        mapping (string => uint) achievementType;
    }

    mapping(uint256 => User) public users;

    constructor(RecycleToken _recycleToken, address owner_) {
        recycleToken = _recycleToken;
        _owner = owner_;
    }

    function getOwner() external view  returns(address){
        return _owner;
    }

    function checkIfUserExists(address _user) internal view returns(bool){
        for (uint256 i = 0; i < userCount; i++) {
            if (_user == users[i].addr) {
                return false;
            }
        }
        return true;
    }

    function addUser() public {
        require(
            checkIfUserExists(msg.sender),
            "User already exists"
        );

        User storage user = users[userCount];
        user.id = userCount;
        user.totalAchievementScore = 0;
        user.addr = msg.sender;
        emit userAdded(user.id, user.addr);
        userCount++;
    }

    function scored(uint _userId, uint _score, string memory achievementType) public returns (uint){
        require(
            _userId < userCount,
            "User don't exists"
        );
 
        users[_userId].totalAchievementScore += _score; 
        users[_userId].achievementType[achievementType] += _score;


        recycleToken.transferFrom(_owner, users[_userId].addr, _score);

        emit userScored(_userId, users[_userId].totalAchievementScore, users[_userId].achievementType[achievementType], achievementType);
        
        return recycleToken.balanceOf(msg.sender);
    }

    


}
