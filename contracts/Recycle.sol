// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./Recycletoken.sol";

contract Recycle {
    uint256 userCount; 
    uint256 private levelGap = 10;
    RecycleToken recycleToken;

    event userScored(
        uint userId,
        uint totalScore,
        uint specificAchievementScore,
        string achievementType
    );

    struct User {
        uint256 id;
        uint256 totalAchievementScore;
        address addr;
        mapping (string => uint) achievementType;
    }

    mapping(uint256 => User) public users;

    constructor(RecycleToken _recycleToken) {
        recycleToken = _recycleToken;
    }

    function addUser() public {
        User storage user = users[userCount];
        user.id = userCount;
        user.totalAchievementScore = 0;
        user.addr = msg.sender;
        userCount++;
    }

    function scored(uint _userId, uint _score, string memory achievementType) public returns (uint){
        require(
            _userId < userCount,
            "User don't exists"
        );
 
        users[_userId].totalAchievementScore += _score; 
        users[_userId].achievementType[achievementType] += _score;
        // recycleToken.transfer(users[_userId].addr, 1);

        emit userScored(_userId, users[_userId].totalAchievementScore, users[_userId].achievementType[achievementType], achievementType);
        
        return recycleToken.balanceOf(msg.sender);
    }


}
