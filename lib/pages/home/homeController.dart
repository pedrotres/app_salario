class HomeController {
  static final HomeController controller = HomeController._();
  HomeController._();

  calculaINSS(double salario) {
    if (salario <= 1100) {
      return (salario * 7.5) / 100;
    } else if (salario >= 1100.01 && salario <= 2203.48) {
      return (salario * 9) / 100;
    } else if (salario >= 2203.49 && salario <= 3305.22) {
      return (salario * 12) / 100;
    } else if (salario >= 3305.23 && salario <= 6433.57) {
      return (salario * 14) / 100;
    }
  }

  calcularIRRF(double salario) {
    if (salario <= 1903.98) {
      return 0;
    } else if (salario >= 1903.99 && salario <= 2826.65) {
      return ((salario * 7.50) / 100) - 142.80;
    } else if (salario >= 2826.65 && salario <= 3751.05) {
      return ((salario * 15) / 100) - 354.80;
    } else if (salario >= 3751.06 && salario <= 4664.68) {
      return ((salario * 22.5) / 100) - 636.13;
    } else if (salario > 4664.68) {
      return ((salario * 27.5) / 100) - 869.36;
    }
  }
}
