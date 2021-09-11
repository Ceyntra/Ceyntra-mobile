
class GuidePackageModel{

  String packageName;
  String packageDesc;
  String places;
  var imageURL;
  String language;
  int groupCapacity;

  //Charging
  bool perDay;
  bool perTour;

  double price;
  bool negotiable;

  int guideId;

  GuidePackageModel(
      this.packageName,
      this.packageDesc,
      this.places,
      this.imageURL,
      this.language,
      this.groupCapacity,
      this.perDay,
      this.perTour,
      this.price,
      this.negotiable,
      this.guideId);

  Map<String, dynamic> toJson() =>
      {
        'packageName': packageName,
        'packageDesc': packageDesc,
        'imageURL': imageURL,
        'places' : places,
        'language': language,
        'groupCapacity': groupCapacity,
        'perDay': perDay,
        'perTour': perTour,
        'price': price,
        'negotiable': negotiable,
        'guideId': guideId,
      };

  factory GuidePackageModel.fromJson(Map<String,dynamic> json) {

    //Extract
    List<GuidePackageModel> packages= [];

    return GuidePackageModel(
      json['packageName'],
      json['packageDesc'],
      json['places'],
      json['imageURL'],
      json['language'],
      json['groupCapacity'],
      json['perDay'],
      json['perTour'],
      json['price'],
      json['negotiable'],
      json['guideId'],
    );

  }

  @override
  String toString() {
    return 'GuidePackageModel{packageName: $packageName, packageDesc: $packageDesc, places: $places, imageURL: $imageURL, language: $language, groupCapacity: $groupCapacity, perDay: $perDay, perTour: $perTour, price: $price, negotiable: $negotiable, guideId: $guideId}';
  }
}