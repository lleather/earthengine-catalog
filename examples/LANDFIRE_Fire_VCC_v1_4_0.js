var dataset = ee.ImageCollection('LANDFIRE/Fire/VCC/v1_4_0');

var visualization = {
  bands: ['VCC'],
};

Map.setCenter(-121.671, 40.699, 5);

Map.addLayer(dataset, visualization, 'VCC');
