var coll = ee.ImageCollection('FAO/WAPOR/2/L1_T_D');
var image = coll.first();
Map.setCenter(17.5, 20, 3);
Map.addLayer(image, {min: 0, max: 50});
