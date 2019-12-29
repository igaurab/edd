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

Result result;
