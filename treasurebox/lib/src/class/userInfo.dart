class userInfo {
  String? userName = '홍길동';
  String? userID = 'userID';
  int myPlace = 0;
  int aroundPlace = 0;

  userInfo(String name, String id) {
    userName = name;
    userID = id;
  }

  userInfo.fromMap(Map<String, String> userInfo)
      : userName = userInfo['name'],
        userID = userInfo['id'];

  void printInfo() {
    print("Name: $userName, ID: $userID");
  }
}
