class Room 
{
  final String id;
   final String roomName;
   final String roomOwner;
    final String roomStatus;
    final String gameType;
   


  Room({
    required this.id,
    required this.roomName,
    required this.roomOwner,
    required this.roomStatus,
    required this.gameType,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'],
      roomName: json['roomName'],
      roomOwner: json['roomOwner'],
      roomStatus: json['roomStatus'],
      gameType: json['gameType'],
    );
  }

}