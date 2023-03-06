class HomerServices {
  checkPar(List streetR, List nameDriver) {
    dynamic ss = 0;
    int aumento = 0;
    int number = 0;
    number = (streetR.length);

    if (number % 2 == 0) {
      final resp = checkNameDrive(nameDriver, 'vocales');
      aumento = factorComun(streetR, nameDriver);
      if (aumento > 1) {
        ss = resp * 1.5;
        ss = ss + (ss * 0.5);
        aumento = 0;

        return ss;
      } else {
        aumento = 0;

        ss = resp * 1.5;
        return ss;
      }
    } else {
      aumento = factorComun(streetR, nameDriver);
      final resp = checkNameDrive(nameDriver, 'consonate');

      if (aumento > 1) {
        ss = resp * 1;
        ss = ss + (ss * 0.5);

        return ss;
      } else {
        ss = resp * 1;

        return ss;
      }
    }
  }

  checkNameDrive(List name, String typeReturn) {
    int vocales = 0;
    int consonate = 0;

    final list = (name);
    for (var i = 0; i < list.length; i++) {
      switch (list[i]) {
        case 'A':
          vocales++;
          break;
        case 'E':
          vocales++;
          break;
        case 'I':
          vocales++;
          break;
        case 'O':
          vocales++;
          break;
        case 'U':
          vocales++;
          break;

        default:
          list[i];
          consonate++;
      }
    }
    if (typeReturn == 'vocales') {
      return vocales;
    } else {
      return consonate;
    }
  }

  orderNumber(dynamic lisNumber) {
    List listFinal = [];

    dynamic mb;
    // for (var element in lisNumber) {
    //   listFinal.add(element['resp']);
    // }
    for (int i = 0; i < lisNumber.length; i++) {
      for (int j = 0; j < lisNumber.length - 1; j++) {
        if (lisNumber[i]['resp'] > lisNumber[j]['resp']) {
          mb = lisNumber[i];
          lisNumber[i] = lisNumber[j];
          lisNumber[j] = mb;
        }
      }
    }
    return lisNumber;
  }

  factorComun(List streetR, List nameDriver) {
    int aumento = 0;
    for (int i = 0; i < streetR.length; i++) {
      if (i < nameDriver.length) {
        if (streetR[i] == nameDriver[i]) {
          // print('tiene aumento ${streetR} $nameDriver');
          aumento++;
        }
      }
    }
    return aumento;
  }
}
