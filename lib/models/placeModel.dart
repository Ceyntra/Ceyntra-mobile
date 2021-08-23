class PlaceModel {
  int placeId;
  String placeName;
  String description;
  double latitude;
  double longitude;
  int placeAddedUserId;
  double rating;
  int numberOfVotes;
  String photo;

  PlaceModel(
      {this.placeId,
      this.placeName,
      this.description,
      this.latitude,
      this.longitude,
      this.placeAddedUserId,
      this.rating,
      this.numberOfVotes,
      this.photo});

  PlaceModel.fromJson(Map<String, dynamic> json) {
    placeId = json['place_id'];
    placeName = json['place_name'];
    description = json['description'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    placeAddedUserId = json['place_added_user_id'];
    rating = json['rating'];
    numberOfVotes = json['number_of_votes'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['place_id'] = this.placeId;
    data['place_name'] = this.placeName;
    data['description'] = this.description;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['place_added_user_id'] = this.placeAddedUserId;
    data['rating'] = this.rating;
    data['number_of_votes'] = this.numberOfVotes;
    data['photo'] = this.photo;
    return data;
  }
}
