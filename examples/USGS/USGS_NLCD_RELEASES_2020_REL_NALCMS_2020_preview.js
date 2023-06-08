// Import the NALCMS collection.
var image = ee.Image('USGS/NLCD_RELEASES/2020_REL/NALCMS/2020');
var visParams = {
  palette: [
    '033e00',  // 1  Temperate or sub-polar needleleaf forest
    '939b71',  // 2  Sub-polar taiga needleleaf forest
    '196d12',  // 3  Tropical or sub-tropical broadleaf evergreen forest
    '1fab01',  // 4  Tropical or sub-tropical broadleaf deciduous forest
    '5b725c',  // 5  Temperate or sub-polar broadleaf deciduous forest
    '6b7d2c',  // 6  Mixed forest
    'b29d29',  // 7  Tropical or sub-tropical shrubland
    'b48833',  // 8  Temperate or sub-polar shrubland
    'e9da5d',  // 9  Tropical or sub-tropical grassland
    'e0cd88',  // 10  Temperate or sub-polar grassland
    'a07451',  // 11  Sub-polar or polar shrubland-lichen-moss
    'bad292',  // 12  Sub-polar or polar grassland-lichen-moss
    '3f8970',  // 13  Sub-polar or polar barren-lichen-moss
    '6ca289',  // 14  Wetland
    'e6ad6a',  // 15  Cropland
    'a9abae',  // 16  Barren land 
    'db2126',  // 17  Urban and built-up
    '4c73a1',  // 18  Water
    'fff7fe',  // 19  Snow and ice
    ],
  min: 1,
  max: 19,
};

var lon = -114;
var lat = 38;

Map.setCenter(lon, lat, 6);

// Degrees in EPSG:3857.
var delta = 10;
// Width and height of the thumbnail image.
var pixels = 256;

// cadetblue
var background = ee.Image.rgb(95, 158, 160).visualize({min: 0, max: 255});

var areaOfInterest = ee.Geometry.Rectangle(
  [lon - delta, lat - delta, lon + delta, lat + delta], null, false);

var imageParams = {
    dimensions: [pixels, pixels],
    region: areaOfInterest,
    crs: 'EPSG:3857',
    format: 'png',
  };

var imageRGB = image.visualize(visParams);
var imageWithBackground = ee.ImageCollection([background, imageRGB]).mosaic();

Map.addLayer(imageWithBackground, {}, 'NALCMS Land Cover');

print(ui.Thumbnail({image: imageWithBackground, params: imageParams}));
