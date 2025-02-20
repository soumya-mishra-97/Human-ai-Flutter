class ChatModel {
  final String msg;
  final int chatIndex;
  ChatModel({
    required this.msg,
    required this.chatIndex,
  });

  factory ChatModel.fromJson(Map<String, dynamic> map) {
    return ChatModel(
      msg: map["msg"],
      chatIndex: map["chatIndex"]?.toInt(),
    );
  }
}
