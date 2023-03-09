class PascalsTriangle {
  List<List<int>> rows(int upTo) {
    List<List<int>> result = [];
    List<int> row = [];
    var index = 0;
    while (upTo > index) {
      if (result.length == 0) {
        row = [1];
      } else {
        final prevRow = result.last;
        var missing = prevRow.length - 1;
        row.clear();
        row.add(1);

        int mid = (prevRow.length + 1 / 2).floor();
        for (int i = 1; i <= missing; i++) {
          if (i < mid)
            row.add(prevRow[i] + prevRow[i - 1]);
          else
            row.add(prevRow[i] + prevRow[i + 1]);
        }
        row.add(1);
      }

      result.add(List.from(row));
      index++;
    }

    return result;
  }
}
