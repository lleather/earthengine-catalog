local id = 'COPERNICUS/S1_GRD';
local subdir = 'COPERNICUS';

local ee_const = import 'earthengine_const.libsonnet';
local ee = import 'earthengine.libsonnet';
local spdx = import 'spdx.libsonnet';

local license = spdx.proprietary;

local basename = std.strReplace(id, '/', '_');
local base_filename = basename + '.json';
local self_ee_catalog_url = ee_const.ee_catalog_url + basename;

{
  stac_version: ee_const.stac_version,
  type: ee_const.stac_type.collection,
  stac_extensions: [
    ee_const.ext_eo,
    ee_const.ext_sar,
  ],
  id: id,
  title: 'Sentinel-1 SAR GRD: C-band Synthetic Aperture Radar Ground Range Detected, log scaling',
  'gee:type': ee_const.gee_type.image_collection,
  description: |||
    The Sentinel-1 mission provides data from a dual-polarization
    C-band Synthetic Aperture Radar (SAR) instrument at 5.405GHz (C band).  This collection
    includes the S1 Ground Range Detected (GRD) scenes, processed
    using the Sentinel-1 Toolbox to generate a calibrated, ortho-corrected
    product. The collection is updated daily. New assets are ingested
    within two days after they become available.

    This collection
    contains all of the GRD scenes.  Each scene has one of 3 resolutions
    (10, 25 or 40 meters), 4 band combinations (corresponding to
    scene polarization) and 3 instrument modes.  Use of the collection
    in a mosaic context will likely require filtering down to a homogeneous
    set of bands and parameters.  See
    [this article](https://developers.google.com/earth-engine/sentinel1)
    for details of collection use and preprocessing. Each scene contains
    either 1 or 2 out of 4 possible polarization bands, depending
    on the instrument's polarization settings.  The possible combinations
    are single band VV or HH, and dual band VV+VH and HH+HV:

      1. VV: single co-polarization, vertical transmit/vertical receive
      2. HH: single co-polarization, horizontal transmit/horizontal receive
      3. VV + VH: dual-band cross-polarization, vertical transmit/horizontal
      receive
      4. HH + HV: dual-band cross-polarization, horizontal transmit/vertical
      receive

    Each scene also includes an additional 'angle' band that contains
    the approximate incidence angle from ellipsoid in degrees at every point.
    This band is generated by interpolating the 'incidenceAngle' property
    of the 'geolocationGridPoint' gridded field provided with each asset.

    Each scene was pre-processed with
    [Sentinel-1 Toolbox](https://sentinel.esa.int/web/sentinel/toolboxes/sentinel-1)
    using the following steps:

      1. Thermal noise removal
      2. Radiometric calibration
      3. Terrain correction using SRTM 30 or ASTER DEM for areas greater than
         60 degrees latitude, where SRTM is not available.
    The final terrain-corrected values are converted to decibels via log scaling
    (10*log10(x)).

    For more information about these pre-processing steps, please refer to the
    [Sentinel-1 Pre-processing
    article](https://developers.google.com/earth-engine/sentinel1). For further
    advice on working with Sentinel-1 imagery, see [Guido Lemoine's tutorial on SAR
    basics](https://developers.google.com/earth-engine/tutorials/community/sar-basics)
    and [Mort Canty's tutorial on SAR change
    detection](https://developers.google.com/earth-engine/tutorials/community/detecting-changes-in-sentinel-1-imagery-pt-1).

    This collection is computed on-the-fly. If you want to use the underlying
    collection with raw power values (which is updated faster), see
    COPERNICUS/S1_GRD_FLOAT.
  |||,
  license: license.id,
  links: ee.standardLinks(subdir, id),
  keywords: [
    'backscatter',
    'copernicus',
    'esa',
    'eu',
    'polarization',
    'radar',
    'sar',
    'sentinel',
  ],
  providers: [
    ee.producer_provider('European Union/ESA/Copernicus', 'https://sentinel.esa.int/web/sentinel/user-guides/sentinel-1-sar/'),
    ee.host_provider(self_ee_catalog_url),
  ],
  extent: ee.extent_global('2014-10-03T00:00:00Z', null),
  summaries: {
    'gee:schema': [
      {
        name: 'GRD_Post_Processing_facility_country',
        description: 'Name of the country where the facility is located. This element is configurable within the IPF.',
        type: ee_const.var_type.string,
      },
      {
        name: 'GRD_Post_Processing_facility_name',
        description: |||
          Name of the facility where the processing step was
          performed. This element is configurable within the IPF.
        |||,
        type: ee_const.var_type.string,
      },
      {
        name: 'GRD_Post_Processing_facility_organisation',
        description: 'Name of the organisation responsible for the facility.\nThis element is configurable within the IPF.',
        type: ee_const.var_type.string,
      },
      {
        name: 'GRD_Post_Processing_facility_site',
        description: 'Geographical location of the facility. This element\nis configurable within the IPF.',
        type: ee_const.var_type.string,
      },
      {
        name: 'GRD_Post_Processing_software_name',
        description: 'Name of the software.',
        type: ee_const.var_type.string,
      },
      {
        name: 'GRD_Post_Processing_software_version',
        description: 'Software version identification.',
        type: ee_const.var_type.string,
      },
      {
        name: 'GRD_Post_Processing_start',
        description: 'Processing start time.',
        type: ee_const.var_type.double,
      },
      {
        name: 'GRD_Post_Processing_stop',
        description: 'Processing stop time.',
        type: ee_const.var_type.double,
      },
      {
        name: 'SLC_Processing_facility_country',
        description: 'Name of the country where the facility is located.\nThis element is configurable within the IPF.',
        type: ee_const.var_type.string,
      },
      {
        name: 'SLC_Processing_facility_name',
        description: |||
          Name of the facility where the processing step was
          performed. This element is configurable within the IPF.
        |||,
        type: ee_const.var_type.string,
      },
      {
        name: 'SLC_Processing_facility_organisation',
        description: 'Name of the organisation responsible for the facility.\nThis element is configurable within the IPF.',
        type: ee_const.var_type.string,
      },
      {
        name: 'SLC_Processing_facility_site',
        description: 'Geographical location of the facility. This element is configurable within the IPF.',
        type: ee_const.var_type.string,
      },
      {
        name: 'SLC_Processing_software_name',
        description: 'Name of the software.',
        type: ee_const.var_type.string,
      },
      {
        name: 'SLC_Processing_software_version',
        description: 'Software version identification.',
        type: ee_const.var_type.string,
      },
      {
        name: 'SLC_Processing_start',
        description: 'Processing start time.',
        type: ee_const.var_type.double,
      },
      {
        name: 'SLC_Processing_stop',
        description: 'Processing stop time.',
        type: ee_const.var_type.double,
      },
      {
        name: 'S1TBX_Calibration_Operator_version',
        description: 'Sentinel-1 Toolbox calibration tool version.',
        type: ee_const.var_type.string,
      },
      {
        name: 'S1TBX_SAR_Processing_version',
        description: 'Sentinel-1 Toolbox SAR processing tool version.',
        type: ee_const.var_type.string,
      },
      {
        name: 'SNAP_Graph_Processing_Framework_GPF_version',
        description: 'Sentinel Application Platform (SNAP) version.',
        type: ee_const.var_type.string,
      },
      {
        name: 'startTimeANX',
        description: |||
          Sensing start time of the input data relative to the
          ascending node crossing. This is a count of the time elapsed
          since the orbit ascending node crossing [ms].
        |||,
        type: ee_const.var_type.double,
      },
      {
        name: 'stopTimeANX',
        description: |||
          Sensing stop time of the input data relative to the
          ascending node crossing. This is a count of the time elapsed
          since the orbit ascending node crossing [ms].
        |||,
        type: ee_const.var_type.double,
      },
      {
        name: 'nssdcIdentifier',
        description: |||
          Uniquely identifies the mission according to standards
          defined by the World Data Center for Satellite Information (WDC-SI),
          available [here](https://nssdc.gsfc.nasa.gov/nmc/SpacecraftQuery.jsp).
        |||,
        type: ee_const.var_type.string,
      },
      {
        name: 'familyName',
        description: 'The full mission name. E.g. "SENTINEL-1"',
        type: ee_const.var_type.string,
      },
      {
        name: 'platform_number',
        description: 'The alphanumeric identifier of the platform within the mission.',
        type: ee_const.var_type.string,
      },
      {
        name: 'instrument',
        description: 'Information related to the instrument on the platform to which acquired the data.',
        type: ee_const.var_type.string,
      },
      {
        name: 'instrumentMode',
        description: |||
          IW ([Interferometric Wide Swath](https://sentinel.esa.int/web/sentinel/user-guides/sentinel-1-sar/acquisition-modes/interferometric-wide-swath)),
          EW ([Extra Wide Swath](https://sentinel.esa.int/web/sentinel/user-guides/sentinel-1-sar/acquisition-modes/extra-wide-swath))
          or SM ([Strip Map](https://sentinel.esa.int/web/sentinel/user-guides/sentinel-1-sar/acquisition-modes/stripmap))
        |||,
        type: ee_const.var_type.string,
      },
      {
        name: 'instrumentSwath',
        description: |||
          List of the swaths contained within a product. Most
          products will contain only one swath, except for TOPS SLC products
          which include 3 or 5 swaths.
        |||,
        type: ee_const.var_type.string,
      },
      {
        name: 'orbitNumber_start',
        description: 'Absolute orbit number of the oldest line within the image data.',
        type: ee_const.var_type.double,
      },
      {
        name: 'orbitNumber_stop',
        description: 'Absolute orbit number of the most recent line within the image data.',
        type: ee_const.var_type.double,
      },
      {
        name: 'relativeOrbitNumber_start',
        description: 'Relative orbit number of the oldest line within the image data.',
        type: ee_const.var_type.double,
      },
      {
        name: 'relativeOrbitNumber_stop',
        description: 'Relative orbit number of the most recent line within the image data.',
        type: ee_const.var_type.double,
      },
      {
        name: 'cycleNumber',
        description: 'Absolute sequence number of the mission cycle to which the oldest image data applies.',
        type: ee_const.var_type.double,
      },
      {
        name: 'phaseIdentifier',
        description: 'Id of the mission phase to which the oldest image data applies.',
        type: ee_const.var_type.double,
      },
      {
        name: 'orbitProperties_pass',
        description: |||
          Direction of the orbit ('ASCENDING' or 'DESCENDING')
          for the oldest image data in the product (the start of the product).
        |||,
        type: ee_const.var_type.string,
      },
      {
        name: 'orbitProperties_ascendingNodeTime',
        description: |||
          UTC time of the ascending node of the orbit. This
          element is present for all products except ASAR L2 OCN products
          which are generated from an ASAR L1 input.
        |||,
        type: ee_const.var_type.double,
      },
      {
        name: 'resolution',
        description: 'H for high or M for medium.',
        type: ee_const.var_type.string,
      },
      {
        name: 'resolution_meters',
        description: 'Resolution in meters.',
        type: ee_const.var_type.double,
      },
      {
        name: 'instrumentConfigurationID',
        description: 'The instrument configuration ID (Radar database ID) for this data.',
        type: ee_const.var_type.double,
      },
      {
        name: 'missionDataTakeID',
        description: 'Unique ID of the datatake within the mission.',
        type: ee_const.var_type.double,
      },
      {
        name: 'transmitterReceiverPolarisation',
        description: |||
          Transmit/Receive polarisation for the data. There
          is one element for each Tx/Rx combination: ['VV'], ['HH'],
          ['VV', 'VH'], or ['HH', 'HV'].
        |||,
        type: ee_const.var_type.string_list,
      },
      {
        name: 'productClass',
        description: 'Output product class "A" for Annotation or "S" for Standard.',
        type: ee_const.var_type.string,
      },
      {
        name: 'productClassDescription',
        description: 'Textual description of the output product class.',
        type: ee_const.var_type.string,
      },
      {
        name: 'productComposition',
        description: |||
          The composition type of this product:
          "Individual", "Slice", or "Assembled".
        |||,
        type: ee_const.var_type.string,
      },
      {
        name: 'productType',
        description: 'The product type (correction level) of this product.',
        type: ee_const.var_type.string,
      },
      {
        name: 'productTimelinessCategory',
        description: |||
          Describes the required timeliness of the processing.
          One of: NRT-10m, NRT-1h, NRT-3h, Fast-24h, Off-line, or Reprocessing
        |||,
        type: ee_const.var_type.string,
      },
      {
        name: 'sliceProductFlag',
        description: 'True if this is a slice from a larger product or false if this is a complete product.',
        type: ee_const.var_type.string,
      },
      {
        name: 'segmentStartTime',
        description: |||
          Sensing start time of the segment to which this slice
          belongs. This field is only present if sliceProductFlag = true
        |||,
        type: ee_const.var_type.double,
      },
      {
        name: 'sliceNumber',
        description: |||
          Absolute slice number of this slice starting at 1.
          This field is only present if sliceProductFlag = true.
        |||,
        type: ee_const.var_type.double,
      },
      {
        name: 'totalSlices',
        description: |||
          Total number of slices in the complete data take.
          This field is only present if sliceProductFlag = true.
        |||,
        type: ee_const.var_type.double,
      },
    ],
    constellation: [
      'Sentinel-1',
    ],
    'sar:frequency_band': ['C'],
    'sar:center_frequency': [5.405],
    'sar:resolution_range': [10],
    'sar:resolution_azimuth': [10],
    'sar:instrument_mode': ['EW', 'IW', 'SM'],
    'sar:product_type': ['GRD'],
    'sar:polarizations': ['HH', 'HV', 'VH', 'VV'],
    platform: [
      'Sentinel-1A',
      'Sentinel-1B',
    ],
    instruments: [
      'SAR',
    ],
    'eo:bands': [
      {
        name: 'HH',
        description: 'Single co-polarization, horizontal transmit/horizontal receive',
        gsd: 10.0,
        'gee:units': 'dB',
        'gee:polarization': 'HH',
      },
      {
        name: 'HV',
        description: 'Dual-band cross-polarization, horizontal transmit/vertical receive',
        gsd: 10.0,
        'gee:units': 'dB',
        'gee:polarization': 'HV',
      },
      {
        name: 'VV',
        description: 'Single co-polarization, vertical transmit/vertical receive',
        gsd: 10.0,
        'gee:units': 'dB',
        'gee:polarization': 'VV',
      },
      {
        name: 'VH',
        description: 'Dual-band cross-polarization, vertical transmit/horizontal receive',
        gsd: 10.0,
        'gee:units': 'dB',
        'gee:polarization': 'VH',
      },
      {
        name: 'angle',
        description: 'Approximate incidence angle from ellipsoid',
        'gee:units': 'degrees',
        gsd: 20000,
      },
    ],
    'gee:visualizations': [
      {
        display_name: 'Grayscale',
        lookat: {
          lat: 6.669,
          lon: 46.476,
          zoom: 6,
        },
        image_visualization: {
          band_vis: {
            min: [
              -25.0,
            ],
            max: [
              0.0,
            ],
            bands: [
              'VV',
            ],
          },
        },
      },
    ],
    HH: {
      minimum: -50.0,
      maximum: 1.0,
      'gee:estimated_range': true,
    },
    HV: {
      minimum: -50.0,
      maximum: 1.0,
      'gee:estimated_range': true,
    },
    VV: {
      minimum: -50.0,
      maximum: 1.0,
      'gee:estimated_range': true,
    },
    VH: {
      minimum: -50.0,
      maximum: 1.0,
      'gee:estimated_range': true,
    },
    angle: {
      minimum: 0.0,
      maximum: 90.0,
      'gee:estimated_range': true,
    },
  },
  'gee:interval': {
    type: 'revisit_interval',
    unit: 'day',
    interval: 3,
  },
  'gee:terms_of_use': |||
    The use of Sentinel data is governed by the [Copernicus
    Sentinel Data Terms and Conditions.](https://scihub.copernicus.eu/twiki/pub/SciHubWebPortal/TermsConditions/Sentinel_Data_Terms_and_Conditions.pdf)
  |||,
}
