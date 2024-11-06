// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AttendanceRegister {
    struct Attendee {
        bool isPresent;
        uint256 timestamp;
    }

    mapping(address => Attendee) public attendance;

    event AttendanceRecorded(address indexed attendee, bool isPresent, uint256 timestamp);

    function recordAttendance(bool _isPresent) public {
        attendance[msg.sender] = Attendee(_isPresent, block.timestamp);
        emit AttendanceRecorded(msg.sender, _isPresent, block.timestamp);
    }

    function checkAttendance(address _attendee) public view returns (bool, uint256) {
        Attendee memory attendee = attendance[_attendee];
        return (attendee.isPresent, attendee.timestamp);
    }
}
