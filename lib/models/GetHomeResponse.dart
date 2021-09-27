class GetHomeResponse {
  String ? message;
  int ? code;
  Data ? data;

  GetHomeResponse({this.message, this.code, this.data});

  GetHomeResponse.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    code = json['Code'];
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Message'] = this.message;
    data['Code'] = this.code;
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Categories> ? categories;
  List<Preferences> ? preferences;
  List<Updates>  ? updates;

  Data({this.categories, this.preferences, this.updates});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['Categories'] != null) {
      categories = <Categories>[];
      json['Categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    if (json['Preferences'] != null) {
      preferences = <Preferences>[];
      json['Preferences'].forEach((v) {
        preferences!.add(new Preferences.fromJson(v));
      });
    }
    if (json['Updates'] != null) {
      updates = <Updates>[];
      json['Updates'].forEach((v) {
        updates!.add(new Updates.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['Categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.preferences != null) {
      data['Preferences'] = this.preferences!.map((v) => v.toJson()).toList();
    }
    if (this.updates != null) {
      data['Updates'] = this.updates!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  int ? categoryId;
  String ?name;
  String ?imagePath;

  Categories({this.categoryId, this.name, this.imagePath});

  Categories.fromJson(Map<String, dynamic> json) {
    categoryId = json['CategoryId'];
    name = json['Name'];
    imagePath = json['ImagePath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CategoryId'] = this.categoryId;
    data['Name'] = this.name;
    data['ImagePath'] = this.imagePath;
    return data;
  }
}

class Preferences {
  int ?id;
  String ?name;
  double ? price;
  String ? area;
  double ? rating;
  String ? description;
  String ? picture;
  int ? distance;
  String ? status;

  Preferences(
      {this.id,
        this.name,
        this.price,
        this.area,
        this.rating,
        this.description,
        this.picture,
        this.distance,
        this.status});

  Preferences.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    price = json['Price'];
    area = json['Area'];
    rating = json['Rating'];
    description = json['Description'];
    picture = json['Picture'];
    distance = json['Distance'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Name'] = this.name;
    data['Price'] = this.price;
    data['Area'] = this.area;
    data['Rating'] = this.rating;
    data['Description'] = this.description;
    data['Picture'] = this.picture;
    data['Distance'] = this.distance;
    data['Status'] = this.status;
    return data;
  }
}

class Updates {
  int ? eventId;
  String ? name;
  String ? description;
  String ? address;
  String ? date;
  String ? imagePath;

  Updates(
      {this.eventId,
        this.name,
        this.description,
        this.address,
        this.date,
        this.imagePath});

  Updates.fromJson(Map<String, dynamic> json) {
    eventId = json['EventId'];
    name = json['Name'];
    description = json['Description'];
    address = json['Address'];
    date = json['Date'];
    imagePath = json['ImagePath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['EventId'] = this.eventId;
    data['Name'] = this.name;
    data['Description'] = this.description;
    data['Address'] = this.address;
    data['Date'] = this.date;
    data['ImagePath'] = this.imagePath;
    return data;
  }
}