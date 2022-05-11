class Objects {
  List<Results>? results;
  String? error;
  Objects({this.results});



  Objects.withError(String errorMessage) {
    error = errorMessage;
  }
  Objects.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  int? id;
  String? sealNumber;
  String? dataArea;
  String? dateCreated;
  String? object;
  String? user;

  Results(
      {this.id,
        this.sealNumber,
        this.dataArea,
        this.dateCreated,
        this.object,
        this.user});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sealNumber = json['seal_number'];
    dataArea = json['data_area'];
    dateCreated = json['date_created'];
    object = json['object'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['seal_number'] = this.sealNumber;
    data['data_area'] = this.dataArea;
    data['date_created'] = this.dateCreated;
    data['object'] = this.object;
    data['user'] = this.user;
    return data;
  }
}