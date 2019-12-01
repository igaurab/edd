import 'package:edd_by_date_calculator/utils/result.dart';
import 'package:edd_by_date_calculator/utils/converter.dart';

class Processor {
  Processor() {
    converter = Converter();
  }
  initializeProcessor({lastMensturalPeriod, todayDate}) {
    this.lastMensturalPeriod = lastMensturalPeriod;
    this.todayDate = todayDate;
  }

  Converter converter;
  Map<String, dynamic> lastMensturalPeriod;
  Map<String, dynamic> todayDate;

  void passValue() {
    converter.setValue(
      LMPd: lastMensturalPeriod["lmpd"].toInt(),
      LMPm: lastMensturalPeriod["lmpm"].toInt(),
      LMPy: lastMensturalPeriod["lmpy"].toInt(),
      TODAYd: todayDate["today_d"].toInt(),
      TODAYm: todayDate["today_m"].toInt(),
      TODAYy: todayDate["today_y"].toInt(),
    );
  }

  Result getResult() {
    Result result = Result();
    result = converter.calculateResult();
    return result;
  }
}

Processor processor = Processor();

// I/flutter (13714): {lmpy: 98, lmpm: 2, lmpd: 1}
// I/flutter (13714): {today_y: 1994, today_m: 12, today_d: 21}
