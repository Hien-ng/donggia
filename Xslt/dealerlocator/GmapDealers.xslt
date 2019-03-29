<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>
  <xsl:template match="/">

    <input type="hidden" id="hdnDealerLocatorSiteId">
      <xsl:attribute name="value">
        <xsl:value-of select="/DealerList/SiteId"></xsl:value-of>
      </xsl:attribute>
    </input>
    <input type="hidden" id="hdnDealerLocatorLanguageId">
      <xsl:attribute name="value">
        <xsl:value-of select="/DealerList/LanguageId"></xsl:value-of>
      </xsl:attribute>
    </input>
    <input type="hidden" id="hdnDealerLocatorZoneGuid" value="">
      <xsl:attribute name="value">
        <xsl:value-of select="/DealerList/ZoneGuid"></xsl:value-of>
      </xsl:attribute>
    </input>
    <input type="hidden" id="hdfDealerLocatorSelectCountry">
      <xsl:attribute name="value">
        <xsl:value-of select="/DealerList/SelectCountryText"></xsl:value-of>
      </xsl:attribute>
    </input>
    <input type="hidden" id="hdfDealerLocatorSelectProvince">
      <xsl:attribute name="value">
        <xsl:value-of select="/DealerList/SelectProvinceText"></xsl:value-of>
      </xsl:attribute>
    </input>
    <input type="hidden" id="hdfDealerLocatorSelectDistrict">
      <xsl:attribute name="value">
        <xsl:value-of select="/DealerList/SelectDistrictText"></xsl:value-of>
      </xsl:attribute>
    </input>
    <input type="hidden" id="hdfDealerLocatorSelectZone">
      <xsl:attribute name="value">
        <xsl:value-of select="/DealerList/SelectZoneText"></xsl:value-of>
      </xsl:attribute>
    </input>
    <input type="hidden" id="hdfDealerLocatorCulture">
      <xsl:attribute name="value">
        <xsl:value-of select="/DealerList/Culture"></xsl:value-of>
      </xsl:attribute>
    </input>
    <div id="super-store-finder" class="system-dealer store-maps clearfix">
      <div id="main_content">
        <div id="clinic-finder" class="relative">
          <div class="system-wrap">
            <div class="search-location findmaps">
              <div class="container">
                <div class="filtermap">
                  <div class="field form_desc" style="display:none;">
                    <!--<label for="ddlCountry">
                      <xsl:value-of select="/DealerList/CountryText"></xsl:value-of>
                    </label>-->
                    <select class="form-select" id="ddlCountry"></select>
                  </div>
                  <div class="field form_desc">
                    <!--<label for="ddlProvince">
                      <xsl:value-of select="/DealerList/ProvinceText"></xsl:value-of>
                    </label>-->
                    <select class="form-select" id="ddlProvince">
                      <option value="">
                        <xsl:value-of select="/DealerList/SelectProvinceText"></xsl:value-of>
                      </option>
                    </select>
                  </div>
                  <div class="field form_desc">
                    <!--<label for="ddlDistrict">
                      <xsl:value-of select="/DealerList/DistrictText"></xsl:value-of>
                    </label>-->
                    <select class="form-select" id="ddlDistrict">
                      <option value="">
                        <xsl:value-of select="/DealerList/SelectDistrictText"></xsl:value-of>
                      </option>
                    </select>
                  </div>
                  <input type="submit" id="edit-submit" class="btn-searchmap">
                    <xsl:attribute name="value">
                      <xsl:value-of select="/DealerList/SearchText"></xsl:value-of>
                    </xsl:attribute>
                  </input>
                </div>
              </div>
              <div class="hidden-xs-up">
                <div class="searh-text">
                  <label>
                    <xsl:value-of select="/DealerList/OrText"></xsl:value-of>
                  </label>
                  <input type="text" maxlength="128" name="address" id="address" size="60" value="" class="form-text" autocomplete="off">
                    <xsl:attribute name="placeholder">
                      <xsl:value-of select="/DealerList/EnterLocationText"></xsl:value-of>
                    </xsl:attribute>
                  </input>
                  <input type="submit" id="edit-submit" class="btn btn-large btn-primary">
                    <xsl:attribute name="value">
                      <xsl:value-of select="/DealerList/SearchText"></xsl:value-of>
                    </xsl:attribute>
                  </input>
                </div>
              </div>
            </div>
          </div>
          <div class="clearfix">
            <div id="map">
              <input type="hidden" id="distance" name="distance" value="1" />
              <div id="map_canvas" class="map_system">
              </div>
            </div>
            <div class="hidden-xs-up">
              <div id="results" class="dealer-list">
                <div id="ajax_msg" class="locate mrb15">
                </div>
                <ul class="noli list_system mrb15" style="display: block;" id="list">
                </ul>
              </div>
              <div id="direction" class="find_address" style="display:none;">
                <div class="row mrb10">
                  <div class="col-sm-2">
                    <strong>
                      <xsl:value-of select="/DealerList/FromText"></xsl:value-of>
                    </strong>
                  </div>
                  <div class="col-sm-10">
                    <input id="origin-direction" name="origin-direction" class="orides-txt" type="text" />
                  </div>
                </div>
                <div class="row mrb20">
                  <div class="col-sm-2">
                    <strong>
                      <xsl:value-of select="/DealerList/ToText"></xsl:value-of>
                    </strong>
                  </div>
                  <div class="col-sm-10">
                    <input id="dest-direction" name="dest-direction" class="orides-txt" type="text" />
                  </div>
                </div>
                <div id="get-dir-button" class="get-dir-button">
                  <input type="submit" id="get-direction" class="btn">
                    <xsl:attribute name="value">
                      <xsl:value-of select="/DealerList/FindText"></xsl:value-of>
                    </xsl:attribute>
                  </input>
                  <a href="javascript:directionBack()">
                    <xsl:value-of select="/DealerList/BackText"></xsl:value-of>
                  </a>
                </div>
              </div>
              <div class="overlay" id="overlay-contact-clinic-form">
                <div class="form-wrapper">
                </div>
              </div>
            </div>
          </div>

        </div>
      </div>
    </div>
  </xsl:template>
</xsl:stylesheet>