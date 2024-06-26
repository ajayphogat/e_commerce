import 'cart_model.dart';

class CheckOutModel {
  bool? status;
  Result? result;

  CheckOutModel({this.status, this.result});

  CheckOutModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  List<Cart>? cart;
  String? taxvalue;
  String? subtotal;
  String? totalamount;
  String? shippingcost;
  Addresss? addresss;

  Result(
      {this.cart,
        this.taxvalue,
        this.subtotal,
        this.totalamount,
        this.shippingcost,
        this.addresss});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['cart'] != null) {
      cart = <Cart>[];
      json['cart'].forEach((v) {
        cart!.add(new Cart.fromJson(v));
      });
    }
    taxvalue = json['taxvalue'].toString();
    subtotal = json['subtotal'].toString();
    totalamount = json['totalamount'].toString();
    shippingcost = json['shippingcost'].toString();
    addresss = json['addresss'] != null
        ? new Addresss.fromJson(json['addresss'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cart != null) {
      data['cart'] = this.cart!.map((v) => v.toJson()).toList();
    }
    data['taxvalue'] = this.taxvalue;
    data['subtotal'] = this.subtotal;
    data['totalamount'] = this.totalamount;
    data['shippingcost'] = this.shippingcost;
    if (this.addresss != null) {
      data['addresss'] = this.addresss!.toJson();
    }
    return data;
  }
}

class Cart {
  int? id;
  String? name;
  String? slug;
  String? shortDescription;
  String? description;
  String? manufacturerDetails;
  String? regularPrice;
  String? salePrice;
  String? sKU;
  String? stockStatus;
  int? featured;
  String? quantity;
  String? image;
  String? images;
  int? categoryId;
  int? subcategoryId;
  int? subsubcategoryId;
  int? medtypeId;
  int? parentId;
  String? createdAt;
  String? updatedAt;
  int? brandId;
  String? breedId;
  int? isBaby;
  int? isChild;
  int? isYoung;
  int? status;
  int? addBy;
  int? taxId;
  int? freecancellation;
  String? discountValue;
  String? varaintDetail;
  String? flavourId;
  String? veg;
  String? qty;
  Taxslab? taxslab;

  Cart(
      {this.id,
        this.name,
        this.slug,
        this.shortDescription,
        this.description,
        this.manufacturerDetails,
        this.regularPrice,
        this.salePrice,
        this.sKU,
        this.stockStatus,
        this.featured,
        this.quantity,
        this.image,
        this.images,
        this.categoryId,
        this.subcategoryId,
        this.subsubcategoryId,
        this.medtypeId,
        this.parentId,
        this.createdAt,
        this.updatedAt,
        this.brandId,
        this.breedId,
        this.isBaby,
        this.isChild,
        this.isYoung,
        this.status,
        this.addBy,
        this.taxId,
        this.freecancellation,
        this.discountValue,
        this.varaintDetail,
        this.flavourId,
        this.veg,
        this.qty,
        this.taxslab});

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    shortDescription = json['short_description'];
    description = json['description'];
    manufacturerDetails = json['manufacturer_details'];
    regularPrice = json['regular_price'];
    salePrice = json['sale_price'];
    sKU = json['SKU'];
    stockStatus = json['stock_status'];
    featured = json['featured'];
    quantity = json['quantity'].toString();
    image = json['image'];
    images = json['images'];
    categoryId = json['category_id'];
    subcategoryId = json['subcategory_id'];
    subsubcategoryId = json['subsubcategory_id'];
    medtypeId = json['medtype_id'];
    parentId = json['parent_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    brandId = json['brand_id'];
    breedId = json['breed_id'];
    isBaby = json['is_baby'];
    isChild = json['is_child'];
    isYoung = json['is_young'];
    status = json['status'];
    addBy = json['add_by'];
    taxId = json['tax_id'];
    freecancellation = json['freecancellation'];
    discountValue = json['discount_value'];
    varaintDetail = json['varaint_detail'].toString();
    flavourId = json['flavour_id'].toString();
    veg = json['veg'].toString();
    qty = json['qty'].toString();
    taxslab =
    json['taxslab'] != null ? new Taxslab.fromJson(json['taxslab']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['short_description'] = this.shortDescription;
    data['description'] = this.description;
    data['manufacturer_details'] = this.manufacturerDetails;
    data['regular_price'] = this.regularPrice;
    data['sale_price'] = this.salePrice;
    data['SKU'] = this.sKU;
    data['stock_status'] = this.stockStatus;
    data['featured'] = this.featured;
    data['quantity'] = this.quantity;
    data['image'] = this.image;
    data['images'] = this.images;
    data['category_id'] = this.categoryId;
    data['subcategory_id'] = this.subcategoryId;
    data['subsubcategory_id'] = this.subsubcategoryId;
    data['medtype_id'] = this.medtypeId;
    data['parent_id'] = this.parentId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['brand_id'] = this.brandId;
    data['breed_id'] = this.breedId;
    data['is_baby'] = this.isBaby;
    data['is_child'] = this.isChild;
    data['is_young'] = this.isYoung;
    data['status'] = this.status;
    data['add_by'] = this.addBy;
    data['tax_id'] = this.taxId;
    data['freecancellation'] = this.freecancellation;
    data['discount_value'] = this.discountValue;
    data['varaint_detail'] = this.varaintDetail;
    data['flavour_id'] = this.flavourId;
    data['veg'] = this.veg;
    data['qty'] = this.qty;
    if (this.taxslab != null) {
      data['taxslab'] = this.taxslab!.toJson();
    }
    return data;
  }
}

class Taxslab {
  int? id;
  String? taxName;
  String? type;
  String? value;
  int? status;
  String? createdAt;
  String? updatedAt;

  Taxslab(
      {this.id,
        this.taxName,
        this.type,
        this.value,
        this.status,
        this.createdAt,
        this.updatedAt});

  Taxslab.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    taxName = json['tax_name'];
    type = json['type'];
    value = json['value'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tax_name'] = this.taxName;
    data['type'] = this.type;
    data['value'] = this.value;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Addresss {
  int? id;
  int? userId;
  String? name;
  String? mobile;
  String? mobileOptional;
  String? line1;
  String? line2;
  String? landmark;
  int? countryId;
  int? stateId;
  int? cityId;
  String? zipcode;
  String? addressType;
  int? defaultAddress;
  String? createdAt;
  String? updatedAt;
  Countries? country;
  City? city;
  State? state;

  Addresss(
      {this.id,
        this.userId,
        this.name,
        this.mobile,
        this.mobileOptional,
        this.line1,
        this.line2,
        this.landmark,
        this.countryId,
        this.stateId,
        this.cityId,
        this.zipcode,
        this.addressType,
        this.defaultAddress,
        this.createdAt,
        this.updatedAt,
        this.country,
        this.city,
        this.state});

  Addresss.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    mobile = json['mobile'];
    mobileOptional = json['mobile_optional'];
    line1 = json['line1'];
    line2 = json['line2'];
    landmark = json['landmark'];
    countryId = json['country_id'];
    stateId = json['state_id'];
    cityId = json['city_id'];
    zipcode = json['zipcode'];
    addressType = json['address_type'];
    defaultAddress = json['default_address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    country =
    json['country'] != null ? new Countries.fromJson(json['country']) : null;
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    state = json['state'] != null ? new State.fromJson(json['state']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['mobile_optional'] = this.mobileOptional;
    data['line1'] = this.line1;
    data['line2'] = this.line2;
    data['landmark'] = this.landmark;
    data['country_id'] = this.countryId;
    data['state_id'] = this.stateId;
    data['city_id'] = this.cityId;
    data['zipcode'] = this.zipcode;
    data['address_type'] = this.addressType;
    data['default_address'] = this.defaultAddress;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    if (this.state != null) {
      data['state'] = this.state!.toJson();
    }
    return data;
  }
}

class Countries {
  int? id;
  String? name;
  String? iso3;
  String? numericCode;
  String? iso2;
  String? phonecode;
  String? capital;
  String? currency;
  String? currencyName;
  String? currencySymbol;
  String? tld;
  String? native;
  String? region;
  int? regionId;
  String? subregion;
  int? subregionId;
  String? nationality;
  String? timezones;
  String? translations;
  String? latitude;
  String? longitude;
  String? emoji;
  String? emojiU;
  String? createdAt;
  String? updatedAt;
  int? flag;
  String? wikiDataId;

  Countries(
      {this.id,
        this.name,
        this.iso3,
        this.numericCode,
        this.iso2,
        this.phonecode,
        this.capital,
        this.currency,
        this.currencyName,
        this.currencySymbol,
        this.tld,
        this.native,
        this.region,
        this.regionId,
        this.subregion,
        this.subregionId,
        this.nationality,
        this.timezones,
        this.translations,
        this.latitude,
        this.longitude,
        this.emoji,
        this.emojiU,
        this.createdAt,
        this.updatedAt,
        this.flag,
        this.wikiDataId});

  Countries.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    iso3 = json['iso3'];
    numericCode = json['numeric_code'];
    iso2 = json['iso2'];
    phonecode = json['phonecode'];
    capital = json['capital'];
    currency = json['currency'];
    currencyName = json['currency_name'];
    currencySymbol = json['currency_symbol'];
    tld = json['tld'];
    native = json['native'];
    region = json['region'];
    regionId = json['region_id'];
    subregion = json['subregion'];
    subregionId = json['subregion_id'];
    nationality = json['nationality'];
    timezones = json['timezones'];
    translations = json['translations'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    emoji = json['emoji'];
    emojiU = json['emojiU'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    flag = json['flag'];
    wikiDataId = json['wikiDataId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['iso3'] = this.iso3;
    data['numeric_code'] = this.numericCode;
    data['iso2'] = this.iso2;
    data['phonecode'] = this.phonecode;
    data['capital'] = this.capital;
    data['currency'] = this.currency;
    data['currency_name'] = this.currencyName;
    data['currency_symbol'] = this.currencySymbol;
    data['tld'] = this.tld;
    data['native'] = this.native;
    data['region'] = this.region;
    data['region_id'] = this.regionId;
    data['subregion'] = this.subregion;
    data['subregion_id'] = this.subregionId;
    data['nationality'] = this.nationality;
    data['timezones'] = this.timezones;
    data['translations'] = this.translations;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['emoji'] = this.emoji;
    data['emojiU'] = this.emojiU;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['flag'] = this.flag;
    data['wikiDataId'] = this.wikiDataId;
    return data;
  }
}

class City {
  int? id;
  String? name;
  int? stateId;
  String? stateCode;
  int? countryId;
  String? countryCode;
  String? latitude;
  String? longitude;
  String? createdAt;
  String? updatedAt;
  int? flag;
  String? wikiDataId;

  City(
      {this.id,
        this.name,
        this.stateId,
        this.stateCode,
        this.countryId,
        this.countryCode,
        this.latitude,
        this.longitude,
        this.createdAt,
        this.updatedAt,
        this.flag,
        this.wikiDataId});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    stateId = json['state_id'];
    stateCode = json['state_code'];
    countryId = json['country_id'];
    countryCode = json['country_code'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    flag = json['flag'];
    wikiDataId = json['wikiDataId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['state_id'] = this.stateId;
    data['state_code'] = this.stateCode;
    data['country_id'] = this.countryId;
    data['country_code'] = this.countryCode;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['flag'] = this.flag;
    data['wikiDataId'] = this.wikiDataId;
    return data;
  }
}

class State {
  int? id;
  String? name;
  int? countryId;
  String? countryCode;
  String? fipsCode;
  String? iso2;
  String? type;
  String? latitude;
  String? longitude;
  String? createdAt;
  String? updatedAt;
  int? flag;
  String? wikiDataId;

  State(
      {this.id,
        this.name,
        this.countryId,
        this.countryCode,
        this.fipsCode,
        this.iso2,
        this.type,
        this.latitude,
        this.longitude,
        this.createdAt,
        this.updatedAt,
        this.flag,
        this.wikiDataId});

  State.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    countryId = json['country_id'];
    countryCode = json['country_code'];
    fipsCode = json['fips_code'];
    iso2 = json['iso2'];
    type = json['type'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    flag = json['flag'];
    wikiDataId = json['wikiDataId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['country_id'] = this.countryId;
    data['country_code'] = this.countryCode;
    data['fips_code'] = this.fipsCode;
    data['iso2'] = this.iso2;
    data['type'] = this.type;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['flag'] = this.flag;
    data['wikiDataId'] = this.wikiDataId;
    return data;
  }
}