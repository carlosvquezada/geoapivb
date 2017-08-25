# geoapivb

**VBA module containing geocoding functions using various web API's**
- code in this module references the Microsoft XML 3.0 library
- any workbooks implementing this module require a reference to msxmk3.dll

**Functions inlcuded in module:**
- *GoogleGeocode*
  returns coordinates from a street address via the Google Maps API

- *GoogleRevGeocode*
  returns an address from a pair of coordinates via the Google Maps API

- *MBGeocode*
  returns coordinates from a street address via the Mapbox Geocoding API

- *osmRelBinToId*
  returns the OSM ID of a way tagged nycdoitt:bin= with the specified value 
  
- *osmWayBinToId*
  returns the OSM ID of a relation tagged nycdoitt:bin= with the specified value 

- *distance* 
  returns the distance between two sets of coordinates 
