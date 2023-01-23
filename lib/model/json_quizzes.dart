class JsonQuizzes {
  List<Myelements>? myelements;

  JsonQuizzes({this.myelements});

  JsonQuizzes.fromJson(Map<String, dynamic> json) {
    if (json['myelements'] != null) {
      myelements = <Myelements>[];
      json['myelements'].forEach((v) {
        myelements!.add(new Myelements.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.myelements != null) {
      data['myelements'] = this.myelements!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Myelements {
  String? name;
  String? appearance;
  double? atomicMass;
  double? boil;
  String? category;
  double? density;
  String? discoveredBy;
  double? melt;
  double? molarHeat;
  String? namedBy;
  int? number;
  int? period;
  String? phase;
  String? source;
  String? bohrModelImage;
  String? bohrModel3d;
  String? spectralImg;
  String? summary;
  String? symbol;
  int? xpos;
  int? ypos;
  List<int>? shells;
  String? electronConfiguration;
  String? electronConfigurationSemantic;
  double? electronAffinity;
  double? electronegativityPauling;
  List<int>? ionizationEnergies;
  String? cpkHex;
  Image? image;

  Myelements(
      {this.name,
        this.appearance,
        this.atomicMass,
        this.boil,
        this.category,
        this.density,
        this.discoveredBy,
        this.melt,
        this.molarHeat,
        this.namedBy,
        this.number,
        this.period,
        this.phase,
        this.source,
        this.bohrModelImage,
        this.bohrModel3d,
        this.spectralImg,
        this.summary,
        this.symbol,
        this.xpos,
        this.ypos,
        this.shells,
        this.electronConfiguration,
        this.electronConfigurationSemantic,
        this.electronAffinity,
        this.electronegativityPauling,
        this.ionizationEnergies,
        this.cpkHex,
        this.image});

  Myelements.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    appearance = json['appearance'];
    atomicMass = json['atomic_mass'];
    boil = json['boil'];
    category = json['category'];
    density = json['density'];
    discoveredBy = json['discovered_by'];
    melt = json['melt'];
    molarHeat = json['molar_heat'];
    namedBy = json['named_by'];
    number = json['number'];
    period = json['period'];
    phase = json['phase'];
    source = json['source'];
    bohrModelImage = json['bohr_model_image'];
    bohrModel3d = json['bohr_model_3d'];
    spectralImg = json['spectral_img'];
    summary = json['summary'];
    symbol = json['symbol'];
    xpos = json['xpos'];
    ypos = json['ypos'];
    shells = json['shells'].cast<int>();
    electronConfiguration = json['electron_configuration'];
    electronConfigurationSemantic = json['electron_configuration_semantic'];
    electronAffinity = json['electron_affinity'];
    electronegativityPauling = json['electronegativity_pauling'];
    ionizationEnergies = json['ionization_energies'].cast<int>();
    cpkHex = json['cpk-hex'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['appearance'] = this.appearance;
    data['atomic_mass'] = this.atomicMass;
    data['boil'] = this.boil;
    data['category'] = this.category;
    data['density'] = this.density;
    data['discovered_by'] = this.discoveredBy;
    data['melt'] = this.melt;
    data['molar_heat'] = this.molarHeat;
    data['named_by'] = this.namedBy;
    data['number'] = this.number;
    data['period'] = this.period;
    data['phase'] = this.phase;
    data['source'] = this.source;
    data['bohr_model_image'] = this.bohrModelImage;
    data['bohr_model_3d'] = this.bohrModel3d;
    data['spectral_img'] = this.spectralImg;
    data['summary'] = this.summary;
    data['symbol'] = this.symbol;
    data['xpos'] = this.xpos;
    data['ypos'] = this.ypos;
    data['shells'] = this.shells;
    data['electron_configuration'] = this.electronConfiguration;
    data['electron_configuration_semantic'] =
        this.electronConfigurationSemantic;
    data['electron_affinity'] = this.electronAffinity;
    data['electronegativity_pauling'] = this.electronegativityPauling;
    data['ionization_energies'] = this.ionizationEnergies;
    data['cpk-hex'] = this.cpkHex;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    return data;
  }
}

class Image {
  String? title;
  String? url;
  String? attribution;

  Image({this.title, this.url, this.attribution});

  Image.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    url = json['url'];
    attribution = json['attribution'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['url'] = this.url;
    data['attribution'] = this.attribution;
    return data;
  }
}