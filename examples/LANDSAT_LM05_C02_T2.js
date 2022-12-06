var dataset = ee.ImageCollection('LANDSAT/LM05/C02/T2')
                  .filterDate('1985-01-01', '1989-12-31');
var nearInfrared321 = dataset.select(['B3', 'B2', 'B1']);
var nearInfrared321Vis = {};
Map.setCenter(6.746, 46.529, 6);
Map.addLayer(nearInfrared321, nearInfrared321Vis, 'Near Infrared (321)');
