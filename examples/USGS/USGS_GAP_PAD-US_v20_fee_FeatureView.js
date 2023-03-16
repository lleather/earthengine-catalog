var fvLayer = ui.Map.FeatureViewLayer('USGS/GAP/PAD-US/v20/fee_FeatureView');

var visParams = {
  opacity: 1,
  color: {
    property: 'GAP_Sts',
    categories: [
      ['1', 'b1a44e'],
      ['2', '4eb173'],
      ['3', '4e5bb1'],
      ['4', 'b14e8c']
    ]
  }
};

fvLayer.setVisParams(visParams);
fvLayer.setName('Protection status');

Map.setCenter(-100.612, 43.687, 8);
Map.add(fvLayer);
