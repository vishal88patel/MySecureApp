
import '../ConstantsFiles/string_constants.dart';

class CommonUtils {


  Future<List> sortAstroListWithPromoteExposureAndAvailableStatus({astroList})async{
    var availableAstroListWithPromote = [];
    var availableAstroListWithoutPromote = [];
    var busyAstroList = [];
    var offlineAstroList = [];
    var finalSortedList = [];

    /// Available Status Astro List
    for (int i = 0; i < astroList.length; i++) {
      if (astroList[i].astrologerStatus ==
          StringConstants.ASTRO_STATUS_AVAILABLE &&
          astroList[i].astrologerPromote ==
              StringConstants.ASTRO_PROMOTE_TRUE) {
        availableAstroListWithPromote.add(astroList[i]);
      } else if (astroList[i].astrologerStatus ==
          StringConstants.ASTRO_STATUS_AVAILABLE &&
          astroList[i].astrologerPromote ==
              StringConstants.ASTRO_PROMOTE_FALSE) {
        availableAstroListWithoutPromote.add(astroList[i]);
      } else if (astroList[i].astrologerStatus ==
          StringConstants.ASTRO_STATUS_BUSY) {
        busyAstroList.add(astroList[i]);
      } else {
        offlineAstroList.add(astroList[i]);
      }
    }

    ///sort available status Astrologer via Exposure
    availableAstroListWithPromote.sort((x, y) => y.astrologerExposure
        .toString()
        .compareTo(x.astrologerExposure.toString()));

    /// add to final sorted list
    finalSortedList.addAll(availableAstroListWithPromote);

    ///sort available status Astrologer via Exposure
    availableAstroListWithoutPromote.sort((x, y) => y.astrologerExposure
        .toString()
        .compareTo(x.astrologerExposure.toString()));

    /// add to final sorted list
    finalSortedList.addAll(availableAstroListWithoutPromote);

    ///sort busy status Astrologer via Exposure and add to final list
    busyAstroList.sort((x, y) => y.astrologerExposure
        .toString()
        .compareTo(x.astrologerExposure.toString()));

    finalSortedList.addAll(busyAstroList);

    /// sort offline status Astrologer via Exposure and add to final list
    offlineAstroList.sort((x, y) => y.astrologerExposure
        .toString()
        .compareTo(x.astrologerExposure.toString()));

    finalSortedList.addAll(offlineAstroList);

    return finalSortedList;
  }

}
