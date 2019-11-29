class Converter {
  Converter(
      {this.LMPd, this.LMPm, this.LMPy, this.TODAYd, this.TODAYm, this.TODAYy});

  int LMPy;
  int LMPm;
  int LMPd;

  int TODAYy;
  int TODAYm;
  int TODAYd;

  var TODAYnewd;
  var TODAYnewm;

  var BYDATEd;
  var BYDATEm;

  var NoOfDays;
  var NoOfWeeks;
  var Remainder;

  var EDDd;
  var EDDm;
  var EDDy;
  var LMPnewm;

  Result calculateResult() {
    if (TODAYd < LMPd) {
      TODAYnewd = TODAYd + 30;
      BYDATEd = TODAYnewd - LMPd;
      TODAYnewm = TODAYm - 1;
    } else {
      TODAYnewm = TODAYm;
      BYDATEd = TODAYd - LMPd;
    }

    if (TODAYnewm < LMPm) {
      TODAYnewm = TODAYnewm + 12;
      BYDATEm = TODAYnewm - LMPm;
    } else {
      BYDATEm = TODAYnewm - LMPm;
    }
    NoOfDays = BYDATEm * 30 + BYDATEd;
    NoOfWeeks = (NoOfDays / 7).toInt();
    Remainder = NoOfDays % 7;

    EDDd = LMPd + 7;
    if (EDDd > 30) {
      EDDd = EDDd - 30;
      LMPnewm = LMPm + 1;
    } else {
      LMPnewm = LMPm;
    }

    EDDm = LMPnewm + 9;
    if (EDDm > 12) {
      EDDm = EDDm - 12;
      EDDy = LMPy + 1;
    } else {
      EDDy = LMPy;
    }

    Result result = Result(
        BYDATEd: BYDATEd,
        BYDATEm: BYDATEm,
        EDDd: EDDd,
        EDDm: EDDm,
        EDDy: EDDy,
        NoOfDays: NoOfDays,
        NoOfWeeks: NoOfWeeks,
        Remainder: Remainder);

    return result;
  }
}

class Result {
  Result(
      {this.BYDATEd,
      this.BYDATEm,
      this.EDDd,
      this.EDDm,
      this.EDDy,
      this.NoOfDays,
      this.NoOfWeeks,
      this.Remainder});

  int EDDy;
  int EDDm;
  int EDDd;

  int BYDATEd;
  int BYDATEm;

  int NoOfDays;
  int NoOfWeeks;
  int Remainder;

  void printResult() {
    print("NoOfDays $NoOfDays");
    print("ByDated $BYDATEd");
    print("ByDatem $BYDATEm");
    print("NoOfWeeks $NoOfWeeks");
    print("Remainder $Remainder");
  }
}
// # print ("BYDATE IS", BYDATEm, BYDATEd)

// print ("LMP is ", LMPy, LMPm, LMPd)
// print("Today is ", TODAYy, TODAYm, TODAYd)
// print("No of days is ", NoOfDays)
// print ("BY DAY IS", NoOfWeeks, "weeks and ", Remainder, "days", "[Note: Add 1,3,5 days resp if 1st, 2nd, 3rd trimester to this value]")

// print ("EDD is", EDDy, EDDm, EDDd)

void main() {
  var converter = Converter(
      LMPd: 12, LMPm: 12, LMPy: 2075, TODAYd: 13, TODAYm: 08, TODAYy: 2076);
  Result result = converter.calculateResult();
  result.printResult();
}
