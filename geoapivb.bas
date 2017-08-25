Attribute VB_Name = "geoapivb"
Function osmWayBinToId(nycBin As String) As String
  Dim strAddress As String
  Dim strQuery As String
  Dim strLatitude As String
  Dim strLongitude As String
  Dim qSetts As String, bbox As String, qOutType As String
  'define XML and HTTP components
  Dim OSMResult As New MSXML2.DOMDocument
  Dim OSMService As New MSXML2.XMLHTTP
  Dim oNodes As MSXML2.IXMLDOMNodeList
  Dim oNode As MSXML2.IXMLDOMNode
  Dim respText As String, targ As String
  Dim coord As String
  Dim startI As Long, endI As Long
  Dim urlStr As String, token As String
  Dim xVar As Variant
  
  strAddress = URLEncode(nycBin)
    
  'Assemble the query string
  urlStr = "https://overpass-api.de/api/interpreter?data="
  'bbox = "(40.721827325334,-74.018325805664,40.778201662455,-73.957986831665);"
  bbox = "[bbox:40.488215202002614,-74.26826477050781,40.93945235244604,-73.5919189453125]"
  qSetts = bbox + "[timeout:25];"
  qOutType = "out meta;"
  
  'strQuery = "(way[""nycdoitt:bin""=""" + nycBin + """]" + bbox + ");" + qOutType
  strQuery = qSetts + "way[""nycdoitt:bin""~""" + nycBin + """];" + qOutType
  strQuery = urlStr + URLEncode(strQuery)
  
  
  'create HTTP request to query URL - make sure to have
  'that last "False" there for synchronous operation
  OSMService.Open "GET", strQuery, False
  OSMService.send
  OSMResult.LoadXML (OSMService.responseText)
  'Set oNodes = OSMResult.getElementsByTagName("way")





  respText = OSMService.responseText
  targ = "<way id="
  startI = InStr(respText, targ) + 9
  endI = InStr(startI + 1, respText, "version") - 1
  coord = Trim(Mid(respText, startI, endI - startI - 1))
  
  
  
  'Debug.Print respText
  
osmWayBinToId = coord
  
End Function









Function osmRelBinToId(nycBin As String) As String
  Dim strAddress As String
  Dim strQuery As String
  Dim strLatitude As String
  Dim strLongitude As String
  Dim qSetts As String, bbox As String, qOutType As String
  'define XML and HTTP components
  Dim OSMResult As New MSXML2.DOMDocument
  Dim OSMService As New MSXML2.XMLHTTP
  Dim oNodes As MSXML2.IXMLDOMNodeList
  Dim oNode As MSXML2.IXMLDOMNode
  Dim respText As String, targ As String
  Dim coord As String
  Dim startI As Long, endI As Long
  Dim urlStr As String, token As String
  Dim xVar As Variant
  
  strAddress = URLEncode(nycBin)
    
  'Assemble the query string
  urlStr = "https://overpass-api.de/api/interpreter?data="
  'bbox = "(40.721827325334,-74.018325805664,40.778201662455,-73.957986831665);"
  bbox = "[bbox:40.488215202002614,-74.26826477050781,40.93945235244604,-73.5919189453125]"
  qSetts = bbox + "[timeout:25];"
  qOutType = "out meta;"
  
  'strQuery = "(way[""nycdoitt:bin""=""" + nycBin + """]" + bbox + ");" + qOutType
  strQuery = qSetts + "rel[""nycdoitt:bin""~""" + nycBin + """];" + qOutType
  strQuery = urlStr + URLEncode(strQuery)
  
  
  'create HTTP request to query URL - make sure to have
  'that last "False" there for synchronous operation
  OSMService.Open "GET", strQuery, False
  OSMService.send
  OSMResult.LoadXML (OSMService.responseText)
  'Set oNodes = OSMResult.getElementsByTagName("way")





  respText = OSMService.responseText
  Debug.Print (respText)
  targ = "<relation id="
  startI = InStr(respText, targ) + 14
  endI = InStr(startI + 1, respText, "version") - 1
  coord = Trim(Mid(respText, startI, endI - startI - 1))
  
  
  
  'Debug.Print respText
  
osmRelBinToId = coord
  
End Function

Function MBGeocode(address As String) As String
  Dim strAddress As String
  Dim strQuery As String
  Dim strLatitude As String
  Dim strLongitude As String
  
  strAddress = URLEncode(address)
  
  Dim urlStr As String, token As String
  
  'Assemble the query string
  urlStr = "https://api.mapbox.com/geocoding/v5/mapbox.places/"
  token = ".json?&access_token=pk.eyJ1IjoiY2FybG9zdnF1ZXphZGEiLCJhIjoiY2owY2Z5NmMxMDNvaTMybW90Z3M1b3hqayJ9.U813cvIXLMOsHjTlpsmWrQ"
  
  strQuery = urlStr + strAddress + token
  
  'define XML and HTTP components
  Dim googleResult As New MSXML2.DOMDocument
  Dim googleService As New MSXML2.XMLHTTP
  Dim oNodes As MSXML2.IXMLDOMNodeList
  Dim oNode As MSXML2.IXMLDOMNode
  'create HTTP request to query URL - make sure to have
  'that last "False" there for synchronous operation
  googleService.Open "GET", strQuery, False
  googleService.send
  googleResult.LoadXML (googleService.responseText)
  Set oNodes = googleResult.getElementsByTagName("geometry")
  
  Dim respText As String, targ As String
  Dim coord As String
  Dim startI As Long, endI As Long
  
  respText = googleService.responseText
  targ = "," + Chr(34) + "center" + Chr(34) + ":"
  startI = InStr(respText, targ) + 11
  endI = InStr(startI + 1, respText, "]")
  coord = Trim(Mid(respText, startI, endI - startI))
  
  'Debug.Print respText
  
MBGeocode = coord
  
End Function






Function GoogleGeocode(address As String) As String
  Dim strAddress As String
  Dim strQuery As String
  Dim strLatitude As String
  Dim strLongitude As String
  strAddress = URLEncode(address)
  'Assemble the query string
  strQuery = "http://maps.googleapis.com/maps/api/geocode/xml?"
  strQuery = strQuery & "address=" & strAddress
  strQuery = strQuery & "&sensor=false"
  'define XML and HTTP components
  Dim googleResult As New MSXML2.DOMDocument
  Dim googleService As New MSXML2.XMLHTTP
  Dim oNodes As MSXML2.IXMLDOMNodeList
  Dim oNode As MSXML2.IXMLDOMNode
  'create HTTP request to query URL - make sure to have
  'that last "False" there for synchronous operation
  googleService.Open "GET", strQuery, False
  googleService.send
  googleResult.LoadXML (googleService.responseText)
  Set oNodes = googleResult.getElementsByTagName("geometry")
  If oNodes.Length = 1 Then
    For Each oNode In oNodes
      strLatitude = oNode.ChildNodes(0).ChildNodes(0).Text
      strLongitude = oNode.ChildNodes(0).ChildNodes(1).Text
      GoogleGeocode = strLatitude & "," & strLongitude
    Next oNode
  Else
    GoogleGeocode = "Not Found (try again, you may have done too many too fast)"
  End If
End Function






Function GoogleRevGeocode(ByVal lat As Variant, ByVal lng As Variant) As String
  Dim strlatlng As String
  Dim strQuery As String
  Dim latlng As String
  
  latlng = CStr(lat) + "," + CStr(lng)
  strlatlng = URLEncode(latlng)
  
  'Assemble the query string
  
  strQuery = "http://maps.googleapis.com/maps/api/geocode/xml?"
  strQuery = strQuery & "latlng=" & strlatlng
  
  'define XML and HTTP components
  Dim googleResult As New MSXML2.DOMDocument
  Dim googleService As New MSXML2.XMLHTTP
  Dim oNodes As MSXML2.IXMLDOMNodeList
  Dim oNode As MSXML2.IXMLDOMNode
  
  'create HTTP request to query URL - make sure to have
  'that last "False" there for synchronous operation
  googleService.Open "GET", strQuery, False
  googleService.send

    googleResult.LoadXML (googleService.responseText)
  Set oNodes = googleResult.getElementsByTagName("formatted_address")

  

  
  If oNodes.Length >= 1 Then


      GoogleRevGeocode = oNodes.Item(1).Text
    
  Else
    GoogleRevGeocode = "Not Found (try again, you may have done too many too fast)"
  End If
End Function






Public Function URLEncode( _
   StringVal As String, _
   Optional SpaceAsPlus As Boolean = False _
) As String
  Dim bytes() As Byte, b As Byte, i As Integer, Space As String

  If SpaceAsPlus Then Space = "+" Else Space = "%20"

  If Len(StringVal) > 0 Then
    With New ADODB.Stream
      .Mode = adModeReadWrite
      .Type = adTypeText
      .Charset = "UTF-8"
      .Open
      .WriteText StringVal
      .Position = 0
      .Type = adTypeBinary
      .Position = 3 ' skip BOM
      bytes = .Read
    End With

    ReDim result(UBound(bytes)) As String

    For i = UBound(bytes) To 0 Step -1
      b = bytes(i)
      Select Case b
        Case 97 To 122, 65 To 90, 48 To 57, 45, 46, 95, 126
          result(i) = Chr(b)
        Case 32
          result(i) = Space
        Case 0 To 15
          result(i) = "%0" & Hex(b)
        Case Else
          result(i) = "%" & Hex(b)
      End Select
    Next i

    URLEncode = Join(result, "")
  End If
End Function












':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
':::                                                                         :::
':::  This routine calculates the distance between two points (given the     :::
':::  latitude/longitude of those points). It is being used to calculate     :::
':::  the distance between two locations using  GeoDataSource(TM) products   :::
':::                                                                         :::
':::  Definitions:                                                           :::
':::    South latitudes are negative, east longitudes are positive           :::
':::                                                                         :::
':::  Passed to function:                                                    :::
':::    lat1, lon1 = Latitude and Longitude of point 1 (in decimal degrees)  :::
':::    lat2, lon2 = Latitude and Longitude of point 2 (in decimal degrees)  :::
':::    unit = the unit you desire for results                               :::
':::           where: 'M' is statute miles (default)                         :::
':::                  'K' is kilometers                                      :::
':::                  'N' is nautical miles                                  :::
':::                                                                         :::
':::  Worldwide cities and other features databases with latitude longitude  :::
':::  are available at http://www.geodatasource.com                          :::
':::                                                                         :::
':::  For enquiries, please contact sales@geodatasource.com                  :::
':::                                                                         :::
':::  Official Web site: http://www.geodatasource.com                        :::
':::                                                                         :::
':::             GeoDataSource.com (C) All Rights Reserved 2017              :::
':::                                                                         :::
':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

Function distance(lat1, lon1, lat2, lon2, unit)
  Dim theta, dist
  theta = lon1 - lon2
  dist = Sin(deg2rad(lat1)) * Sin(deg2rad(lat2)) + Cos(deg2rad(lat1)) * Cos(deg2rad(lat2)) * Cos(deg2rad(theta))
  'response.Write "dist = " & dist & "<br>"
  dist = acos(dist)
  dist = rad2deg(dist)
  'response.Write "dist = " & dist & "<br>"
  distance = dist * 60 * 1.1515
  Select Case UCase(unit)
    Case "K"
      distance = distance * 1.609344
    Case "N"
      distance = distance * 0.8684
  End Select
End Function

'::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
':::  This function get the arccos function using arctan function   :::
'::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Function acos(Rad)
  If Abs(Rad) <> 1 Then
    acos = pi / 2 - Atn(Rad / Sqr(1 - Rad * Rad))
  ElseIf Rad = -1 Then
    acos = pi
  End If
End Function


'::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
':::  This function converts decimal degrees to radians             :::
'::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Function deg2rad(Deg)
    deg2rad = CDbl(Deg * pi / 180)
End Function

'::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
':::  This function converts radians to decimal degrees             :::
'::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Function rad2deg(Rad)
    rad2deg = CDbl(Rad * 180 / pi)
End Function





