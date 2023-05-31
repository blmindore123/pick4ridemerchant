class GetAllCars {
  GetAllCars({
    required this.success,
    required this.message,
    required this.data,
  });
  late final bool success;
  late final String message;
  late final List<Data> data;

  GetAllCars.fromJson(Map<String, dynamic> json){
    success = json['success'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['message'] = message;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.merchantId,
    required this.vehicleCategory,
    required this.rideCategory,
    required this.vehicleType,
    required this.securityDeposit,
    required this.brandModel,
    required this.noOfDoors,
    required this.noOfLuggageSpace,
    required this.airCondition,
    required this.gearType,
    required this.fuelType,
    required this.noOfSeats,
    required this.vehicleNo,
    required this.insuranceExpiryDate,
    required this.price,
    required this.description,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.images,
  });
  late final int id;
  late final int merchantId;
  late final VehicleCategory vehicleCategory;
  late final RideCategory rideCategory;
  late final String vehicleType;
  late final String securityDeposit;
  late final String brandModel;
  late final int noOfDoors;
  late final int noOfLuggageSpace;
  late final String airCondition;
  late final String gearType;
  late final String fuelType;
  late final int noOfSeats;
  late final String vehicleNo;
  late final String insuranceExpiryDate;
  late final int price;
  late final String description;
  late final String status;
  late final String createdAt;
  late final String updatedAt;
  late final List<Images> images;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    merchantId = json['merchant_id'];
    vehicleCategory = VehicleCategory.fromJson(json['vehicle_category']);
    rideCategory = RideCategory.fromJson(json['ride_category']);
    vehicleType = json['vehicle_type'];
    securityDeposit = json['security_deposit'];
    brandModel = json['brand_model'];
    noOfDoors = json['no_of_doors'];
    noOfLuggageSpace = json['no_of_luggage_space'];
    airCondition = json['air_condition'];
    gearType = json['gear_type'];
    fuelType = json['fuel_type'];
    noOfSeats = json['no_of_seats'];
    vehicleNo = json['vehicle_no'];
    insuranceExpiryDate = json['insurance_expiry_date'];
    price = json['price'];
    description = json['description'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    images = List.from(json['images']).map((e)=>Images.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['merchant_id'] = merchantId;
    _data['vehicle_category'] = vehicleCategory.toJson();
    _data['ride_category'] = rideCategory.toJson();
    _data['vehicle_type'] = vehicleType;
    _data['security_deposit'] = securityDeposit;
    _data['brand_model'] = brandModel;
    _data['no_of_doors'] = noOfDoors;
    _data['no_of_luggage_space'] = noOfLuggageSpace;
    _data['air_condition'] = airCondition;
    _data['gear_type'] = gearType;
    _data['fuel_type'] = fuelType;
    _data['no_of_seats'] = noOfSeats;
    _data['vehicle_no'] = vehicleNo;
    _data['insurance_expiry_date'] = insuranceExpiryDate;
    _data['price'] = price;
    _data['description'] = description;
    _data['status'] = status;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['images'] = images.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class VehicleCategory {
  VehicleCategory({
    required this.id,
    required this.name,
    required this.imageUrl,
  });
  late final int id;
  late final String name;
  late final String imageUrl;

  VehicleCategory.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['image_url'] = imageUrl;
    return _data;
  }
}

class RideCategory {
  RideCategory({
    required this.id,
    required this.name,
    required this.imageUrl,
  });
  late final int id;
  late final String name;
  late final String imageUrl;

  RideCategory.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['image_url'] = imageUrl;
    return _data;
  }
}

class Images {
  Images({
    required this.id,
    required this.vehicleId,
    required this.image,
    required this.type,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.imageUrl,
  });
  late final int id;
  late final int vehicleId;
  late final String image;
  late final String type;
  late final String status;
  late final String createdAt;
  late final String updatedAt;
  late final String imageUrl;

  Images.fromJson(Map<String, dynamic> json){
    id = json['id'];
    vehicleId = json['vehicle_id'];
    image = json['image'];
    type = json['type'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['vehicle_id'] = vehicleId;
    _data['image'] = image;
    _data['type'] = type;
    _data['status'] = status;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['image_url'] = imageUrl;
    return _data;
  }
}