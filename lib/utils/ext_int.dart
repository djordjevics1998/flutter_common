extension FlagExtension on int {
  bool getFlag(int ind) => (this & (1 << ind)) != 0;

  int setFlag(int ind, bool val) {
    int bit = 1 << ind;
    return val ? this | bit : this & ~bit;
  }
}