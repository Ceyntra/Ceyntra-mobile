
class PackageModel{

  String packageName;
  String packageDesc;
  var imageURL;

  bool withDriver=false;
  bool fuel=false;
  bool fullDayService=false;
  bool ownRoutine=false;
  bool other=false;

  String otherFacility;

  int numberOfPassengers;

  //Charging
  bool perDay;
  bool perKm;

  double price;
  bool negotiable;

  int taxiId;


  PackageModel(
      this.packageName,
      this.packageDesc,
      this.imageURL,
      this.withDriver,
      this.fuel,
      this.fullDayService,
      this.ownRoutine,
      this.other,+
      this.otherFacility,
      this.numberOfPassengers,
      this.perDay,
      this.perKm,
      this.price,
      this.negotiable,
      this.taxiId);

  @override
  String toString() {
    return 'PackageModel{packageName: $packageName, packageDesc: $packageDesc, imageURL: $imageURL, withDriver: $withDriver, fuel: $fuel, fullDayService: $fullDayService, ownRoutine: $ownRoutine, other: $other, otherFacility: $otherFacility, numberOfPassengers: $numberOfPassengers, perDay: $perDay, perKm: $perKm, price: $price, negotiable: $negotiable}';
  }

  Map<String, dynamic> toJson() =>
      {
        'packageName': packageName,
        'packageDesc': packageDesc,
        'imageURL': imageURL,
        'withDriver': withDriver,
        'fuel': fuel,
        'fullDayService': fullDayService,
        'ownRoutine': ownRoutine,
        'other': other,
        'otherFacility': otherFacility,
        'numberOfPassengers': numberOfPassengers,
        'perDay': perDay,
        'perKm': perKm,
        'price': price,
        'negotiable': negotiable,
        'taxiDriverId': taxiId,
      };

}