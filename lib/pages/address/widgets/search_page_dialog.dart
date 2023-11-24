import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:food_delivery/data/controller/location_controller.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/src/places.dart';

class SearchPageDialog extends StatelessWidget {
  final GoogleMapController googleMapController;
  const SearchPageDialog({super.key, required this.googleMapController});

  @override
  Widget build(BuildContext context) {
    final searchTextController = TextEditingController();
    return Container(
      padding: EdgeInsets.all(Dimension.width10),
      alignment: Alignment.topCenter,
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: SizedBox(
          width: Dimension.deviceWidth,
          child: TypeAheadField(
              textFieldConfiguration: TextFieldConfiguration(
                controller: searchTextController,
                textInputAction: TextInputAction.search,
                autofocus: true,
                textCapitalization: TextCapitalization.words,
                keyboardType: TextInputType.streetAddress,
                decoration: InputDecoration(
                  hintText: 'search location',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(style: BorderStyle.none, width: 0),
                  ),
                  hintStyle: Theme.of(context)
                      .textTheme
                      .headline2
                      ?.copyWith(
                      color: Theme.of(context).disabledColor,
                      fontSize: Dimension.font20 - 4)
                ),
              ),
              suggestionsCallback: (pattern) async {
                return await Get.find<LocationController>()
                    .searchLocation(context, pattern);
              },
              itemBuilder: (context, Prediction item) {
                return Padding(
                  padding: EdgeInsets.all(Dimension.width10),
                  child: Row(
                    children: [
                      Icon(Icons.location_on),
                      Expanded(
                        child: Text(
                          item.description ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              ?.copyWith(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.color,
                                  fontSize: Dimension.font20 - 4),
                        ),
                      ),
                    ],
                  ),
                );
              },
              onSuggestionSelected: (Prediction suggestion)  {
                 Get.find<LocationController>()
                    .setLocationData(suggestion.placeId??'', suggestion.description??'',googleMapController);
                 Get.back();
              }),
        ),
      ),
    );
  }
}
