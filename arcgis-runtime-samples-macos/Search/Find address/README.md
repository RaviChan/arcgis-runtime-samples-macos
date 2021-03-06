#Find address

This sample demonstrates how to geocode an address and show it on the map view


##How to use the sample

You can either type in an address (or Point of Interest) or choose an address from the list to show it on the map view. You can get the list by click on the arrow next to the search icon in the search field. The address location is marked with a pin. You can click on the pin to show the address in a callout.


![](image1.png)


##How it works

The sample uses the `geocodeWithSearchText:parameters:completion:` method on the `AGSLocatorTask` to geocode an address. It returns an array of `AGSGeocodeResult` objects in case of success. The first result is displayed on the map view using `AGSGraphicsOverlay`. The attributes returned in the `AGSGeocodeResult` object are used as `title` and `detail` fields for the callout.  To show the callout the sample uses the `showCalloutForGraphic:overlay:tapLocation:animated:` method on `AGSMapView`.



