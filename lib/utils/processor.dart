import 'package:edd_by_date_calculator/utils/result.dart';
import 'package:edd_by_date_calculator/utils/converter.dart';

class Processor {
  Processor() {
    converter = Converter();
  }
  void initializeProcessor({lastMensturalPeriod, todayDate}) {
    this.lastMensturalPeriod = lastMensturalPeriod;
    this.todayDate = todayDate;
  }

  Converter converter;
  Map<String, dynamic> lastMensturalPeriod;
  Map<String, dynamic> todayDate;

  void passValue() {
    converter.setValue(
      LMPd: int.parse(lastMensturalPeriod["lmpd"]),
      LMPm: int.parse(lastMensturalPeriod["lmpm"]),
      LMPy: int.parse(lastMensturalPeriod["lmpy"]),
      TODAYd: int.parse(todayDate["today_d"]),
      TODAYm: int.parse(todayDate["today_m"]),
      TODAYy: int.parse(todayDate["today_y"]),
    );
  }

  Result getResult() {
    result = converter.calculateResult();
    return result;
  }
}

Processor processor = Processor();

// I/flutter (13714): {lmpy: 98, lmpm: 2, lmpd: 1}
// I/flutter (13714): {today_y: 1994, today_m: 12, today_d: 21}
