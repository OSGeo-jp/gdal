#!/usr/bin/env pytest
# -*- coding: utf-8 -*-
###############################################################################
# $Id$
#
# Project:  GDAL/OGR Test Suite
# Purpose:  GTFS driver testing
# Author:   Even Rouault <even dot rouault at spatialys.com>
#
###############################################################################
# Copyright (c) 2023, Even Rouault <even dot rouault at spatialys.com>
#
# Permission is hereby granted, free of charge, to any person obtaining a
# copy of this software and associated documentation files (the "Software"),
# to deal in the Software without restriction, including without limitation
# the rights to use, copy, modify, merge, publish, distribute, sublicense,
# and/or sell copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included
# in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
# OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
# DEALINGS IN THE SOFTWARE.
###############################################################################

import gdaltest
import ogrtest
import pytest

from osgeo import gdal, ogr

pytestmark = pytest.mark.require_driver("GTFS")

###############################################################################


def test_ogr_gtfs_open():

    ds = ogr.Open("data/gtfs/gtfs_extract.zip")
    assert ds
    assert ds.GetLayerCount() == 9
    assert ds.GetLayer(-1) is None
    assert ds.GetLayer(ds.GetLayerCount()) is None

    with pytest.raises(Exception):
        ogr.Open("GTFS:i_do/not/exist")

    ds = ogr.Open("GTFS:data/gtfs/gtfs_extract.zip")
    assert ds
    assert ds.GetLayerCount() == 9

    ds = ogr.Open("GTFS:/vsizip/data/gtfs/gtfs_extract.zip")
    assert ds
    assert ds.GetLayerCount() == 9

    ds = gdal.OpenEx("/vsizip/data/gtfs/gtfs_extract.zip", allowed_drivers=["GTFS"])
    assert ds
    assert ds.GetLayerCount() == 9


###############################################################################


def test_ogr_gtfs_content():

    ds = ogr.Open("data/gtfs/gtfs_extract.zip")
    assert ds

    lyr = ds.GetLayerByName("agency")
    assert lyr
    assert lyr.GetGeomType() == ogr.wkbNone
    assert lyr.GetFeatureCount() == 1
    assert lyr.TestCapability(ogr.OLCStringsAsUTF8) == 1
    f = lyr.GetNextFeature()
    assert f["agency_name"] == "SOLEA"
    f = lyr.GetNextFeature()
    assert f is None

    lyr.SetAttributeFilter("agency_name = 'foo'")
    lyr.ResetReading()
    f = lyr.GetNextFeature()
    assert f is None
    assert lyr.GetFeatureCount() == 0

    lyr.SetAttributeFilter("agency_name = 'SOLEA'")
    lyr.ResetReading()
    f = lyr.GetNextFeature()
    assert f is not None
    assert lyr.GetFeatureCount() == 1

    lyr = ds.GetLayerByName("calendar")
    assert lyr
    assert lyr.GetGeomType() == ogr.wkbNone
    assert lyr.GetFeatureCount() == 1
    f = lyr.GetNextFeature()
    assert f["start_date"] == "2023/01/02"
    f = lyr.GetNextFeature()
    assert f is None

    lyr = ds.GetLayerByName("routes")
    assert lyr
    lyr.SetAttributeFilter("route_type = 3")
    assert lyr.GetFeatureCount() == 30

    lyr = ds.GetLayerByName("stops")
    assert lyr
    assert lyr.GetGeomType() == ogr.wkbPoint
    f = lyr.GetNextFeature()
    assert f["arrival_time"] == "05:37:00"
    assert f.GetGeometryRef().GetX() == 7.280823
    assert f.GetGeometryRef().GetY() == 47.763704

    lyr = ds.GetLayerByName("trips")
    assert lyr
    assert lyr.GetGeomType() == ogr.wkbLineString
    f = lyr.GetNextFeature()
    ogrtest.check_feature_geometry(
        f,
        "LINESTRING (7.280823 47.763704,7.278051 47.762217,7.278683 47.760148,7.284615 47.761364,7.288598 47.762085,7.294455 47.764234,7.29876 47.76529,7.302195 47.766799,7.305963 47.768239,7.311335 47.767369,7.316659 47.765988,7.322163 47.767418,7.321289 47.769864,7.321043 47.771791,7.320588 47.774392,7.316879 47.780407,7.316717 47.784505,7.317776 47.789651,7.320459 47.790293,7.322118 47.791736,7.322808 47.793373,7.315402 47.794368,7.314401 47.796563,7.312746 47.799715,7.311825 47.80344,7.313385 47.805702,7.310937 47.812758,7.312355 47.816876,7.318787 47.816822,7.323296 47.817143,7.328152 47.816142,7.33114 47.81378,7.330735 47.812319,7.331684 47.809187,7.336407 47.809084)",
    )

    lyr = ds.GetLayerByName("shapes_geom")
    assert lyr
    assert lyr.GetGeomType() == ogr.wkbLineString
    assert lyr.GetFeatureCount() == 1
    assert lyr.TestCapability(ogr.OLCStringsAsUTF8) == 1
    f = lyr.GetNextFeature()
    assert f["shape_id"] == "80013"
    ogrtest.check_feature_geometry(
        f,
        "LINESTRING (7.28084 47.763684,7.28073 47.76364,7.28027 47.76342,7.27995 47.76328,7.279869 47.76323,7.2797 47.76315,7.279541 47.76308,7.279491 47.76304,7.278959 47.76272,7.27815 47.76225,7.278059 47.762209,7.278059 47.762209,7.27765 47.76203,7.27773 47.76181,7.27779 47.7612,7.27778 47.76099,7.277791 47.76072,7.27779 47.76033,7.27776 47.76026,7.27777 47.7602,7.277811 47.76017,7.27786 47.76014,7.27796 47.76013,7.278059 47.76014,7.27813 47.76019,7.278231 47.76024,7.27831 47.76026,7.27843 47.76027,7.27859 47.76022,7.278707 47.760176,7.278707 47.760176,7.27883 47.76013,7.27894 47.75998,7.27903 47.75986,7.27914 47.75973,7.279361 47.75948,7.279459 47.75933,7.27958 47.75935,7.27972 47.75936,7.27988 47.75936,7.279851 47.75949,7.27984 47.75961,7.27994 47.75969,7.28009 47.75979,7.280239 47.75987,7.280451 47.75997,7.28104 47.76023,7.28123 47.76032,7.28139 47.7604,7.281491 47.76045,7.281731 47.76056,7.281961 47.76066,7.282129 47.76073,7.28226 47.76078,7.28251 47.76087,7.28279 47.76096,7.2832 47.76109,7.28361 47.76121,7.28371 47.76123,7.284 47.76129,7.284299 47.76135,7.284595 47.761407,7.284595 47.761407,7.284661 47.76142,7.285189 47.76148,7.28589 47.76156,7.28626 47.76159,7.28665 47.76164,7.28699 47.76169,7.287291 47.76174,7.287561 47.76179,7.28784 47.76186,7.2881 47.76193,7.28832 47.762,7.28852 47.76207,7.288588 47.762097,7.288588 47.762097,7.28891 47.76223,7.28908 47.7623,7.28937 47.76243,7.28971 47.76257,7.28987 47.76264,7.29033 47.76284,7.2906 47.76296,7.290801 47.76306,7.29102 47.76318,7.29128 47.76333,7.291469 47.76343,7.291619 47.7635,7.29179 47.76357,7.29199 47.76364,7.29216 47.76369,7.29227 47.76372,7.29353 47.76405,7.29422 47.76423,7.294431 47.764281,7.294431 47.764281,7.29476 47.76436,7.29517 47.76444,7.29603 47.76459,7.296879 47.76475,7.29717 47.76482,7.2978 47.76501,7.29791 47.76504,7.29799 47.76507,7.298721 47.765339,7.298721 47.765339,7.298971 47.76543,7.299079 47.76547,7.29918 47.76551,7.299249 47.76554,7.29929 47.76556,7.29976 47.76579,7.29999 47.7659,7.30067 47.76621,7.30123 47.76646,7.30174 47.76669,7.302156 47.766847,7.302156 47.766847,7.302271 47.76689,7.30339 47.76732,7.30348 47.76736,7.30412 47.76761,7.30419 47.76764,7.30474 47.76785,7.304811 47.76788,7.304971 47.76794,7.30564 47.76818,7.305923 47.768288,7.305923 47.768288,7.30611 47.76836,7.30647 47.76849,7.306791 47.76862,7.30681 47.76858,7.30685 47.76855,7.30692 47.76854,7.306989 47.76855,7.30703 47.76857,7.30707 47.76861,7.30726 47.76851,7.30739 47.76843,7.30743 47.7684,7.30751 47.76834,7.30831 47.76771,7.30846 47.76761,7.30855 47.76756,7.308631 47.76752,7.30871 47.76749,7.3089 47.76746,7.30909 47.76745,7.30942 47.76746,7.30999 47.76747,7.310071 47.76747,7.310301 47.76747,7.31052 47.76746,7.310709 47.76745,7.31084 47.76744,7.311091 47.76742,7.311199 47.76741,7.311341 47.767394,7.311341 47.767394,7.31137 47.76739,7.3116 47.76736,7.311811 47.76733,7.312069 47.76729,7.31226 47.76725,7.3124 47.76721,7.3126 47.76715,7.31279 47.76709,7.313071 47.76699,7.313249 47.76692,7.31366 47.76672,7.313939 47.76656,7.31425 47.76638,7.31448 47.76625,7.3147 47.76615,7.31491 47.76611,7.315131 47.76608,7.31528 47.76607,7.31543 47.76606,7.31606 47.76603,7.31663 47.76601,7.316661 47.766009,7.316661 47.766009,7.316879 47.766,7.31718 47.76599,7.31724 47.76599,7.31742 47.76599,7.317561 47.76599,7.31799 47.76599,7.318081 47.76599,7.31837 47.76601,7.31872 47.76606,7.31911 47.76614,7.31936 47.76622,7.31978 47.76635,7.32014 47.76646,7.32046 47.76656,7.32064 47.76661,7.32113 47.76675,7.32157 47.76686,7.32184 47.76691,7.32202 47.76695,7.32218 47.767,7.3222 47.76704,7.32223 47.76708,7.32223 47.76714,7.32221 47.7672,7.32209 47.767397,7.322102 47.767374,7.322051 47.76746,7.32173 47.76797,7.32167 47.76807,7.32163 47.76814,7.3216 47.7682,7.32157 47.76827,7.32155 47.76834,7.32151 47.76847,7.32147 47.76859,7.32138 47.76892,7.32129 47.76955,7.321232 47.769859,7.321232 47.769859,7.32123 47.76987,7.32119 47.77012,7.32114 47.77028,7.32113 47.77031,7.32111 47.77036,7.32101 47.77044,7.321011 47.77054,7.321 47.77064,7.321 47.77071,7.321 47.77074,7.32099 47.771,7.320962 47.77179,7.320962 47.77179,7.32096 47.77186,7.320949 47.77196,7.32095 47.77205,7.32095 47.77234,7.32095 47.77246,7.32095 47.77257,7.32095 47.77286,7.32094 47.77326,7.32091 47.77342,7.32087 47.77352,7.320829 47.77361,7.32071 47.77389,7.32049 47.774371,7.32049 47.774371,7.32038 47.77461,7.3203 47.77478,7.320199 47.77499,7.320119 47.77514,7.32007 47.77524,7.31995 47.77548,7.319891 47.7756,7.31984 47.77569,7.31957 47.7763,7.319289 47.77684,7.31916 47.77704,7.31904 47.77721,7.31879 47.77751,7.31848 47.77783,7.31781 47.7785,7.31769 47.77863,7.317401 47.77899,7.31732 47.7791,7.317241 47.77921,7.31717 47.77933,7.31711 47.77943,7.31708 47.77949,7.317041 47.77958,7.31699 47.77971,7.31694 47.77986,7.3169 47.78001,7.316869 47.78014,7.31685 47.78026,7.316833 47.780405,7.316833 47.780405,7.31683 47.78043,7.31682 47.78069,7.31681 47.78104,7.31683 47.78226,7.31683 47.78296,7.31683 47.78324,7.316751 47.78398,7.31675 47.78401,7.31672 47.78423,7.316685 47.784503,7.316685 47.784503,7.31665 47.78477,7.31656 47.78537,7.31655 47.78543,7.31639 47.78646,7.31638 47.78653,7.31633 47.78676,7.316311 47.78688,7.31637 47.78704,7.3164 47.78709,7.31644 47.78714,7.31666 47.7874,7.31683 47.78761,7.3169 47.7877,7.31698 47.78779,7.31702 47.78786,7.31707 47.78798,7.31709 47.78808,7.317081 47.78816,7.31704 47.78824,7.316991 47.78832,7.31685 47.78845,7.3165 47.78875,7.31625 47.78895,7.31587 47.78921,7.31579 47.78927,7.31574 47.78932,7.31571 47.78936,7.315689 47.78941,7.31568 47.78947,7.3157 47.78952,7.31609 47.78957,7.31657 47.7896,7.31671 47.78961,7.317089 47.78962,7.31722 47.78963,7.317776 47.789657,7.317776 47.789657,7.31803 47.78967,7.31821 47.78968,7.31871 47.78971,7.31893 47.78973,7.31914 47.78977,7.31927 47.78981,7.319519 47.78991,7.31984 47.79005,7.32009 47.79015,7.3202 47.79021,7.320429 47.790321,7.320429 47.790321,7.32055 47.79038,7.3207 47.79045,7.32095 47.79059,7.321089 47.79068,7.32116 47.79073,7.321299 47.79083,7.32169 47.79112,7.32177 47.79115,7.3218 47.79113,7.321839 47.79112,7.32188 47.79113,7.32191 47.79115,7.321921 47.79118,7.32191 47.79121,7.32188 47.79123,7.32184 47.79124,7.3218 47.79123,7.32186 47.79137,7.322031 47.79163,7.322077 47.791743,7.322077 47.791743,7.32226 47.79218,7.32256 47.79281,7.32274 47.79315,7.322824 47.79337,7.322824 47.79337,7.32288 47.79352,7.322891 47.7938,7.32292 47.79382,7.32294 47.79385,7.32294 47.79388,7.32293 47.79391,7.322911 47.79393,7.322881 47.79394,7.32284 47.79395,7.322791 47.79395,7.32275 47.79394,7.32272 47.79392,7.322699 47.7939,7.32269 47.79387,7.3223 47.79384,7.321799 47.79382,7.32146 47.79382,7.32135 47.79382,7.32117 47.79383,7.32086 47.79385,7.32052 47.79389,7.32027 47.79391,7.32001 47.79391,7.3198 47.79391,7.31815 47.79383,7.316881 47.79375,7.31629 47.79373,7.31604 47.79373,7.315589 47.79373,7.315349 47.79374,7.31532 47.79399,7.315309 47.79412,7.3153 47.79415,7.31528 47.79429,7.315262 47.794349,7.315262 47.794349,7.31522 47.79449,7.315121 47.79476,7.31504 47.79495,7.31492 47.7952,7.3149 47.79525,7.3148 47.79544,7.31444 47.79617,7.31425 47.796526,7.31425 47.796526,7.31419 47.79664,7.31417 47.79668,7.31404 47.79695,7.3139 47.79722,7.31357 47.79789,7.313311 47.7985,7.313051 47.79889,7.31274 47.79947,7.312729 47.7995,7.31267 47.79961,7.312631 47.799688,7.312631 47.799688,7.31251 47.79993,7.31228 47.80041,7.312029 47.80093,7.31197 47.80106,7.31177 47.80147,7.3117 47.80167,7.31166 47.80189,7.31165 47.80207,7.31167 47.80252,7.31167 47.80257,7.31168 47.80261,7.31168 47.80264,7.31169 47.80281,7.3117 47.80313,7.3117 47.8032,7.311708 47.803434,7.311708 47.803434,7.31171 47.80347,7.31171 47.80361,7.31172 47.8038,7.31173 47.80403,7.31178 47.80428,7.31189 47.80441,7.3119 47.80456,7.3119 47.80464,7.31188 47.8047,7.31192 47.80506,7.31196 47.8054,7.312039 47.80544,7.3121 47.80551,7.312359 47.80554,7.31263 47.80559,7.31294 47.80564,7.313131 47.80568,7.313375 47.805726,7.313375 47.805726,7.31345 47.80574,7.31401 47.80583,7.314041 47.80578,7.31409 47.80574,7.314161 47.80571,7.31424 47.80571,7.31431 47.80572,7.314381 47.80575,7.314429 47.80579,7.31446 47.80584,7.31445 47.80589,7.31442 47.80594,7.31437 47.80598,7.3143 47.80601,7.31422 47.80601,7.314149 47.806,7.31408 47.80597,7.31403 47.80593,7.314 47.80588,7.31401 47.80583,7.31345 47.80574,7.313131 47.80568,7.31294 47.80564,7.31263 47.80559,7.312339 47.80564,7.31215 47.80567,7.31212 47.80572,7.31206 47.80578,7.31199 47.80583,7.311909 47.80598,7.31189 47.8061,7.31194 47.80632,7.31196 47.80645,7.31191 47.80657,7.31192 47.80702,7.31191 47.80735,7.31192 47.80755,7.311921 47.8078,7.311919 47.80795,7.31191 47.80825,7.31188 47.8085,7.31183 47.80898,7.31175 47.80943,7.31163 47.80991,7.311471 47.81045,7.31133 47.81091,7.31119 47.81141,7.311069 47.81174,7.310989 47.81199,7.31093 47.81218,7.310831 47.81249,7.310747 47.812728,7.310747 47.812728,7.31065 47.813,7.31038 47.81362,7.310199 47.81403,7.31007 47.81431,7.309859 47.81477,7.30969 47.81509,7.309529 47.81537,7.309401 47.81558,7.308959 47.81628,7.30883 47.81646,7.30916 47.81656,7.30936 47.81662,7.30951 47.81666,7.30971 47.81672,7.31 47.81673,7.31036 47.81675,7.31078 47.81678,7.311231 47.81681,7.31164 47.81684,7.312259 47.81689,7.312351 47.816896,7.312351 47.816896,7.312659 47.81692,7.31288 47.81694,7.312939 47.81694,7.31314 47.81695,7.313371 47.81696,7.313649 47.81695,7.313911 47.81692,7.3141 47.81689,7.31424 47.81686,7.314381 47.81684,7.31457 47.8168,7.31492 47.81673,7.315111 47.8167,7.31539 47.81667,7.315681 47.81665,7.316159 47.81663,7.316531 47.81662,7.31668 47.81662,7.3173 47.81663,7.31764 47.81665,7.31801 47.81669,7.31828 47.81674,7.31857 47.8168,7.318776 47.816844,7.318776 47.816844,7.31889 47.81687,7.31921 47.81693,7.31993 47.81708,7.3203 47.81716,7.32057 47.81721,7.32089 47.81726,7.32114 47.81729,7.321349 47.81731,7.32163 47.81732,7.321859 47.81731,7.322331 47.81728,7.32269 47.81725,7.322881 47.81723,7.32314 47.8172,7.323308 47.817167,7.323308 47.817167,7.323439 47.81714,7.3236 47.81712,7.32378 47.81708,7.32389 47.81704,7.32472 47.81683,7.32502 47.81675,7.32521 47.8167,7.32567 47.81659,7.326 47.81652,7.32627 47.81648,7.326271 47.81646,7.32628 47.81643,7.3263 47.81641,7.326321 47.8164,7.326371 47.81639,7.326409 47.81639,7.32644 47.8164,7.326461 47.81641,7.32648 47.81643,7.32712 47.81634,7.327471 47.81629,7.327639 47.81626,7.328051 47.8162,7.328164 47.816182,7.328164 47.816182,7.32838 47.81615,7.328591 47.81611,7.32881 47.81606,7.32908 47.816,7.32927 47.81595,7.32949 47.8159,7.32974 47.81583,7.330151 47.81571,7.330439 47.81561,7.33066 47.81552,7.33092 47.8154,7.331351 47.81518,7.33161 47.81506,7.33188 47.81495,7.33259 47.81466,7.332869 47.81454,7.33313 47.81441,7.33321 47.81437,7.33327 47.81433,7.33333 47.81428,7.333391 47.81422,7.33347 47.8141,7.333419 47.81408,7.333379 47.81405,7.333349 47.81401,7.33275 47.81395,7.332159 47.81389,7.33153 47.8138,7.331152 47.813745,7.331152 47.813745,7.330289 47.81362,7.33031 47.81355,7.330619 47.81258,7.330707 47.812314,7.330707 47.812314,7.33078 47.8121,7.33096 47.81151,7.33127 47.81056,7.33135 47.81027,7.33138 47.81019,7.33154 47.80967,7.33157 47.80958,7.331712 47.809191,7.331712 47.809191,7.331731 47.80914,7.33231 47.80922,7.332791 47.80929,7.33428 47.8095,7.33453 47.80876,7.33545 47.80889,7.33591 47.80898,7.336401 47.809094)",
    )
    f = lyr.GetNextFeature()
    assert f is None


###############################################################################


def test_ogr_gtfs_test_ogrsf():

    import test_cli_utilities

    if test_cli_utilities.get_test_ogrsf_path() is not None:
        ret = gdaltest.runexternal(
            test_cli_utilities.get_test_ogrsf_path() + " data/gtfs/gtfs_extract.zip"
        )

        assert ret.find("INFO") != -1 and ret.find("ERROR") == -1
