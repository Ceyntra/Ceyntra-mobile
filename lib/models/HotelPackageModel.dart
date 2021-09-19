
class HotelPackageModel{

  int packageId;
  String packageName;
  String packageDesc;
  var imageURL;

  bool withAC=false;
  bool swimPool=false;
  bool meal=false;
  bool other=false;

  String otherFacility;

  int roomCapacity;

  //Charging
  bool perDay;
  bool packageCharge;

  double price;
  bool negotiable;

  int hotelId;


  HotelPackageModel(
      this.packageId,
      this.packageName,
      this.packageDesc,
      this.imageURL,
      this.withAC,
      this.swimPool,
      this.meal,
      this.other,
      this.otherFacility,
      this.roomCapacity,
      this.perDay,
      this.packageCharge,
      this.price,
      this.negotiable,
      this.hotelId);


  @override
  String toString() {
    return 'HotelPackageModel{packageName: $packageName, packageDesc: $packageDesc, imageURL: $imageURL, withAC: $withAC, swimPool: $swimPool, meal: $meal, other: $other, otherFacility: $otherFacility, roomCapacity: $roomCapacity, perDay: $perDay, packageCharge: $packageCharge, price: $price, negotiable: $negotiable, hotelId: $hotelId}';
  }

  Map<String, dynamic> toJson() =>
      {
        'packageId':packageId,
        'packageName': packageName,
        'packageDesc': packageDesc,
        'imageURL': imageURL,
        'withAC': withAC,
        'swimPool': swimPool,
        'meal': meal,
        'other': other,
        'otherFacility': otherFacility,
        'roomCapacity': roomCapacity,
        'perDay': perDay,
        'packageCharge': packageCharge,
        'price': price,
        'negotiable': negotiable,
        'hotelId': hotelId,
      };

  factory HotelPackageModel.fromJson(Map<String,dynamic> json) {

    //Extract
    List<HotelPackageModel> packages= [];

    return HotelPackageModel(
      json['packageId'],
      json['packageName'],
      json['packageDesc'],
      json['imageURL'],
      json['withAC'],
      json['swimPool'],
      json['meal'],
      json['other'],
      json['otherFacility'],
      json['roomCapacity'],
      json['perDay'],
      json['perKm'],
      json['price'],
      json['negotiable'],
      json['hotelId'],
    );

  }

}