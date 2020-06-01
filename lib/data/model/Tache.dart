class Tache {
  String name;
  Fields fields;
  String createTime;
  String updateTime;

  Tache({this.name, this.fields, this.createTime, this.updateTime});

  Tache.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    fields =
    json['fields'] != null ? new Fields.fromJson(json['fields']) : null;
    createTime = json['createTime'];
    updateTime = json['updateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.fields != null) {
      data['fields'] = this.fields.toJson();
    }
    data['createTime'] = this.createTime;
    data['updateTime'] = this.updateTime;
    return data;
  }
}

class Fields {
  Titre titre;
  Titre description;
  DateRealisation dateRealisation;
  IsDone isDone;
  Titre urlPhoto;
  Id id;
  DateRealisation dateCreation;

  Fields(
      {this.titre,
        this.description,
        this.dateRealisation,
        this.isDone,
        this.urlPhoto,
        this.id,
        this.dateCreation});

  Fields.fromJson(Map<String, dynamic> json) {
    titre = json['titre'] != null ? new Titre.fromJson(json['titre']) : null;
    description = json['description'] != null
        ? new Titre.fromJson(json['description'])
        : null;
    dateRealisation = json['dateRealisation'] != null
        ? new DateRealisation.fromJson(json['dateRealisation'])
        : null;
    isDone =
    json['isDone'] != null ? new IsDone.fromJson(json['isDone']) : null;
    urlPhoto =
    json['urlPhoto'] != null ? new Titre.fromJson(json['urlPhoto']) : null;
    id = json['id'] != null ? new Id.fromJson(json['id']) : null;
    dateCreation = json['dateCreation'] != null
        ? new DateRealisation.fromJson(json['dateCreation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.titre != null) {
      data['titre'] = this.titre.toJson();
    }
    if (this.description != null) {
      data['description'] = this.description.toJson();
    }
    if (this.dateRealisation != null) {
      data['dateRealisation'] = this.dateRealisation.toJson();
    }
    if (this.isDone != null) {
      data['isDone'] = this.isDone.toJson();
    }
    if (this.urlPhoto != null) {
      data['urlPhoto'] = this.urlPhoto.toJson();
    }
    if (this.id != null) {
      data['id'] = this.id.toJson();
    }
    if (this.dateCreation != null) {
      data['dateCreation'] = this.dateCreation.toJson();
    }
    return data;
  }
}

class Titre {
  String stringValue;

  Titre({this.stringValue});

  Titre.fromJson(Map<String, dynamic> json) {
    stringValue = json['stringValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stringValue'] = this.stringValue;
    return data;
  }
}

class DateRealisation {
  String timestampValue;

  DateRealisation({this.timestampValue});

  DateRealisation.fromJson(Map<String, dynamic> json) {
    timestampValue = json['timestampValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timestampValue'] = this.timestampValue;
    return data;
  }
}

class IsDone {
  bool booleanValue;

  IsDone({this.booleanValue});

  IsDone.fromJson(Map<String, dynamic> json) {
    booleanValue = json['booleanValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['booleanValue'] = this.booleanValue;
    return data;
  }
}

class Id {
  String integerValue;

  Id({this.integerValue});

  Id.fromJson(Map<String, dynamic> json) {
    integerValue = json['integerValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['integerValue'] = this.integerValue;
    return data;
  }
}