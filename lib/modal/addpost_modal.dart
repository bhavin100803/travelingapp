class postmodel {
  String? uid;
  String? titel;
  String? photourl;
  String? description;
  String? userName;
  String? userProfile;
  String? commntPost;
  String? Country;


  postmodel(
      { this.titel, this.uid , this.photourl,  this.description,this.userName,this.userProfile,this.commntPost,this.Country});

  postmodel.fromMap(Map<String, dynamic> map) {
    uid = map["id"];
    titel = map["postTitle"];
    photourl = map["postimg"];
    description = map["postDes"];
    userName = map["userName"];
    userProfile = map["userProfile"];
    commntPost = map["commntPost"];
    Country = map["country"];
  }
  Map<String, dynamic> toMap() {
    return {
      "id": uid,
      "postTitle": titel,
      "postimg": photourl,
      "postDes": description,
      "userName" : userName,
      "userProfile" : userProfile,
      "commntPost" : commntPost,
      "country" : Country,
    };
  }
}
