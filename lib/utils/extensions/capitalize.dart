extension Capitalize on String {
  String capitalize() {
    String subLetters = '';
    int i = 1;
    while (i < this.length) {
      if (this[i] == " ") {
        subLetters += " " + this[i + 1].toUpperCase();
        i++;
      } else
        subLetters += this[i];
      i++;
    }
    return "${this[0].toUpperCase()}" + subLetters;
  }
}
