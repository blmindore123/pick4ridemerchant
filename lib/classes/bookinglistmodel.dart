class BookingListModel {
  BookingListModel({
    required this.success,
    required this.message,
    required this.data,
  });
  late final bool success;
  late final String message;
  late final List<Data> data;

  BookingListModel.fromJson(Map<String, dynamic> json){
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
    required this.customerId,
    required this.vehicleId,
    required this.merchantId,
    required this.pickupDate,
    required this.dropOffDate,
    this.pickupPoint,
    this.dropOffPoint,
    this.pickupLatitude,
    this.pickupLongitude,
    this.dropOffLatitude,
    this.dropOffLongitude,
    this.promocodeId,
    this.offerCode,
    this.offerType,
    this.offerAmount,
    required this.bookingAmount,
    required this.discountAmount,
    required this.finalBookingAmount,
    required this.paidAmount,
    required this.bookingStatus,
    this.cancelReason,
    required this.createdAt,
    required this.updatedAt,
    required this.customer,
    required this.vehicle,
  });
  late final int id;
  late final int customerId;
  late final int vehicleId;
  late final int merchantId;
  late final String pickupDate;
  late final String dropOffDate;
  late final String? pickupPoint;
  late final String? dropOffPoint;
  late final double? pickupLatitude;
  late final double? pickupLongitude;
  late final double? dropOffLatitude;
  late final double? dropOffLongitude;
  late final Null promocodeId;
  late final Null offerCode;
  late final Null offerType;
  late final Null offerAmount;
  late final int bookingAmount;
  late final int discountAmount;
  late final int finalBookingAmount;
  late final int paidAmount;
  late final String bookingStatus;
  late final Null cancelReason;
  late final String createdAt;
  late final String updatedAt;
  late final Customer customer;
  late final Vehicle vehicle;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    customerId = json['customer_id'];
    vehicleId = json['vehicle_id'];
    merchantId = json['merchant_id'];
    pickupDate = json['pickup_date'];
    dropOffDate = json['drop_off_date'];
    pickupPoint = null;
    dropOffPoint = null;
    pickupLatitude = null;
    pickupLongitude = null;
    dropOffLatitude = null;
    dropOffLongitude = null;
    promocodeId = null;
    offerCode = null;
    offerType = null;
    offerAmount = null;
    bookingAmount = json['booking_amount'];
    discountAmount = json['discount_amount'];
    finalBookingAmount = json['final_booking_amount'];
    paidAmount = json['paid_amount'];
    bookingStatus = json['booking_status'];
    cancelReason = null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    customer = Customer.fromJson(json['customer']);
    vehicle = Vehicle.fromJson(json['vehicle']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['customer_id'] = customerId;
    _data['vehicle_id'] = vehicleId;
    _data['merchant_id'] = merchantId;
    _data['pickup_date'] = pickupDate;
    _data['drop_off_date'] = dropOffDate;
    _data['pickup_point'] = pickupPoint;
    _data['drop_off_point'] = dropOffPoint;
    _data['pickup_latitude'] = pickupLatitude;
    _data['pickup_longitude'] = pickupLongitude;
    _data['drop_off_latitude'] = dropOffLatitude;
    _data['drop_off_longitude'] = dropOffLongitude;
    _data['promocode_id'] = promocodeId;
    _data['offer_code'] = offerCode;
    _data['offer_type'] = offerType;
    _data['offer_amount'] = offerAmount;
    _data['booking_amount'] = bookingAmount;
    _data['discount_amount'] = discountAmount;
    _data['final_booking_amount'] = finalBookingAmount;
    _data['paid_amount'] = paidAmount;
    _data['booking_status'] = bookingStatus;
    _data['cancel_reason'] = cancelReason;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['customer'] = customer.toJson();
    _data['vehicle'] = vehicle.toJson();
    return _data;
  }
}

class Customer {
  Customer({
    required this.id,
    required this.role,
    this.subadminType,
    required this.firstName,
    this.lastName,
    required this.email,
    required this.countryCode,
    required this.phoneNumber,
    this.image,
    required this.status,
    required this.profileStatus,
    required this.mobileVerified,
    required this.emailVerified,
    this.address,
    this.latitude,
    this.longitude,
    required this.createdAt,
    required this.updatedAt,
    required this.imageUrl,
    required this.fullName,
  });
  late final int id;
  late final String role;
  late final Null subadminType;
  late final String firstName;
  late final Null lastName;
  late final String email;
  late final String countryCode;
  late final String phoneNumber;
  late final Null image;
  late final String status;
  late final String profileStatus;
  late final int mobileVerified;
  late final int emailVerified;
  late final Null address;
  late final Null latitude;
  late final Null longitude;
  late final String createdAt;
  late final String updatedAt;
  late final String imageUrl;
  late final String fullName;

  Customer.fromJson(Map<String, dynamic> json){
    id = json['id'];
    role = json['role'];
    subadminType = null;
    firstName = json['first_name'];
    lastName = null;
    email = json['email'];
    countryCode = json['country_code'];
    phoneNumber = json['phone_number'];
    image = null;
    status = json['status'];
    profileStatus = json['profile_status'];
    mobileVerified = json['mobile_verified'];
    emailVerified = json['email_verified'];
    address = null;
    latitude = null;
    longitude = null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imageUrl = json['image_url'];
    fullName = json['full_name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['role'] = role;
    _data['subadmin_type'] = subadminType;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['email'] = email;
    _data['country_code'] = countryCode;
    _data['phone_number'] = phoneNumber;
    _data['image'] = image;
    _data['status'] = status;
    _data['profile_status'] = profileStatus;
    _data['mobile_verified'] = mobileVerified;
    _data['email_verified'] = emailVerified;
    _data['address'] = address;
    _data['latitude'] = latitude;
    _data['longitude'] = longitude;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['image_url'] = imageUrl;
    _data['full_name'] = fullName;
    return _data;
  }
}

class Vehicle {
  Vehicle({
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
    required this.priceInKm,
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
  late final String priceInKm;
  late final String description;
  late final String status;
  late final String createdAt;
  late final String updatedAt;
  late final List<Images> images;

  Vehicle.fromJson(Map<String, dynamic> json){
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
    priceInKm = json['price_in_km'];
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
    _data['price_in_km'] = priceInKm;
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
    required this.image,
    required this.imageUrl,
  });
  late final int id;
  late final String name;
  late final String image;
  late final String imageUrl;

  VehicleCategory.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    image = json['image'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['image'] = image;
    _data['image_url'] = imageUrl;
    return _data;
  }
}

class RideCategory {
  RideCategory({
    required this.id,
    required this.name,
    required this.image,
    required this.imageUrl,
  });
  late final int id;
  late final String name;
  late final String image;
  late final String imageUrl;

  RideCategory.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    image = json['image'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['image'] = image;
    _data['image_url'] = imageUrl;
    return _data;
  }
}

class Images {
  Images({
    required this.id,
    required this.vehicleId,
    this.image,
    required this.type,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.imageUrl,
  });
  late final int id;
  late final int vehicleId;
  late final String? image;
  late final String type;
  late final String status;
  late final String createdAt;
  late final String updatedAt;
  late final String imageUrl;

  Images.fromJson(Map<String, dynamic> json){
    id = json['id'];
    vehicleId = json['vehicle_id'];
    image = null;
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