
//WeatherObject weatherObjectFromJson(String str) =>
//    WeatherObject.fromJson(json.decode(str));
//
//String weatherObjectToJson(WeatherObject data) => json.encode(data.toJson());

class OpenWeatherForecastObject {
  String cod;
  int message;
  int cnt;
  List<ListElement> list;
  City city;

  OpenWeatherForecastObject({
    this.cod,
    this.message,
    this.cnt,
    this.list,
    this.city,
  });

  factory OpenWeatherForecastObject.fromJson(Map<String, dynamic> json) => OpenWeatherForecastObject(
        cod: json["cod"],
        message: json["message"],
        cnt: json["cnt"],
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x))),
        city: City.fromJson(json["city"]),
      );

  Map<String, dynamic> toJson() => {
        "cod": cod,
        "message": message,
        "cnt": cnt,
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
        "city": city.toJson(),
      };
}

class City {
  int id;
  String name;
  Coord coord;
  String country;
  int population;
  int timezone;
  int sunrise;
  int sunset;

  City({
    this.id,
    this.name,
    this.coord,
    this.country,
    this.population,
    this.timezone,
    this.sunrise,
    this.sunset,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
        coord: Coord.fromJson(json["coord"]),
        country: json["country"],
        population: json["population"],
        timezone: json["timezone"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "coord": coord.toJson(),
        "country": country,
        "population": population,
        "timezone": timezone,
        "sunrise": sunrise,
        "sunset": sunset,
      };
}

class Coord {
  double lat;
  double lon;

  Coord({
    this.lat,
    this.lon,
  });

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
      };
}

class ListElement {
  int dt;
  MainClass main;
  List<Weather> weather;
  Clouds clouds;
  Wind wind;
  Sys sys;
  DateTime dtTxt;
  Rain rain;

  ListElement({
    this.dt,
    this.main,
    this.weather,
    this.clouds,
    this.wind,
    this.sys,
    this.dtTxt,
    this.rain,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        dt: json["dt"],
        main: MainClass.fromJson(json["main"]),
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        clouds: Clouds.fromJson(json["clouds"]),
        wind: Wind.fromJson(json["wind"]),
        sys: Sys.fromJson(json["sys"]),
        dtTxt: DateTime.parse(json["dt_txt"]),
        rain: json["rain"] == null ? null : Rain.fromJson(json["rain"]),
      );

  Map<String, dynamic> toJson() => {
        "dt": dt,
        "main": main.toJson(),
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "clouds": clouds.toJson(),
        "wind": wind.toJson(),
        "sys": sys.toJson(),
        "dt_txt": dtTxt.toIso8601String(),
        "rain": rain == null ? null : rain.toJson(),
      };
}

class Clouds {
  int all;

  Clouds({
    this.all,
  });

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json["all"],
      );

  Map<String, dynamic> toJson() => {
        "all": all,
      };
}

class MainClass {
  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  int pressure;
  int seaLevel;
  int grndLevel;
  int humidity;
  double tempKf;

  MainClass({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.seaLevel,
    this.grndLevel,
    this.humidity,
    this.tempKf,
  });

  factory MainClass.fromJson(Map<String, dynamic> json) => MainClass(
        temp: json["temp"].toDouble(),
        feelsLike: json["feels_like"].toDouble(),
        tempMin: json["temp_min"].toDouble(),
        tempMax: json["temp_max"].toDouble(),
        pressure: json["pressure"],
        seaLevel: json["sea_level"],
        grndLevel: json["grnd_level"],
        humidity: json["humidity"],
        tempKf: json["temp_kf"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "sea_level": seaLevel,
        "grnd_level": grndLevel,
        "humidity": humidity,
        "temp_kf": tempKf,
      };
}

class Rain {
  double the3H;

  Rain({
    this.the3H,
  });

  factory Rain.fromJson(Map<String, dynamic> json) => Rain(
        the3H: json["3h"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "3h": the3H,
      };
}

class Sys {
  Pod pod;

  Sys({
    this.pod,
  });

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        pod: podValues.map[json["pod"]],
      );

  Map<String, dynamic> toJson() => {
        "pod": podValues.reverse[pod],
      };
}

enum Pod { D, N }

final podValues = EnumValues({"d": Pod.D, "n": Pod.N});

class Weather {
  int id;
  MainEnum main;
  String description;
  String icon;

  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"],
        main: mainEnumValues.map[json["main"]],
        description: json["description"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "main": mainEnumValues.reverse[main],
        "description": description,
        "icon": icon,
      };
}

enum Description {
  CLEAR_SKY,
  SCATTERED_CLOUDS,
  FEW_CLOUDS,
  LIGHT_RAIN,
  MODERATE_RAIN,
  BROKEN_CLOUDS
}

final descriptionValues = EnumValues({
  "broken clouds": Description.BROKEN_CLOUDS,
  "clear sky": Description.CLEAR_SKY,
  "few clouds": Description.FEW_CLOUDS,
  "light rain": Description.LIGHT_RAIN,
  "moderate rain": Description.MODERATE_RAIN,
  "scattered clouds": Description.SCATTERED_CLOUDS
});

enum MainEnum { CLEAR, CLOUDS, RAIN }

final mainEnumValues = EnumValues({
  "Clear": MainEnum.CLEAR,
  "Clouds": MainEnum.CLOUDS,
  "Rain": MainEnum.RAIN
});

class Wind {
  double speed;
  int deg;

  Wind({
    this.speed,
    this.deg,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"].toDouble(),
        deg: json["deg"],
      );

  Map<String, dynamic> toJson() => {
        "speed": speed,
        "deg": deg,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}