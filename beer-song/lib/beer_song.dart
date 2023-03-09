class BeerSong {
  List<String> recite(int currentBottle, int take) {
    List<String> res = [];
    while (take > 0) {
      switch (currentBottle) {
        case 0:
          res.add(
              "No more bottles of beer on the wall, no more bottles of beer");
          res.add(
              "Go to the store and buy some more, 99 bottles of beer on the wall.");
          break;
        case 1:
          res.add("1 bottle of beer on the wall, 1 bottle of beer.");
          res.add(
              "Take it down and pass it around, no more bottles of beer on the wall.");
          break;
        default:
          res.add(
              "$currentBottle bottles of beer on the wall, $currentBottle bottles of beer.");
          res.add(
              "Take one down and pass it around, ${currentBottle - 1} ${currentBottle - 1 == 1 ? 'bottle' : 'bottles'} of beer on the wall.");
          break;
      }
      take--;
      currentBottle--;
    }
    return res;
  }
}
