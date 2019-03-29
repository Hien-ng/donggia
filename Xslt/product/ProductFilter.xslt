<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <section class="product-filter clearfix">
      <div class="filter-wrap">
        <div class="ajaxfilterresponse">
          <xsl:apply-templates select="/ProductFilter/Group"></xsl:apply-templates>
        </div>
        <div class="filter-group clearfix">
          <div class="filter-title">
            <xsl:text>Khoảng giá</xsl:text>
          </div>
          <div class="filter-range">
            <div id="slider-range"></div>
            <div class="price-range">
              <xsl:text>Giá từ</xsl:text>
              <div class="sliderValue min-input" data-index="0"></div>
              <xsl:text>đến</xsl:text>
              <div class="sliderValue max-input" data-index="1"></div>
            </div>
            <div class="hidden">
              <a class="urlwithoutprice">
                <xsl:attribute name="href">
                  <xsl:value-of select="/ProductFilter/UrlWithoutPrice"></xsl:value-of>
                </xsl:attribute>
              </a>
              <a class="urlwithprice">
                <xsl:attribute name="href">
                  <xsl:value-of select="/ProductFilter/UrlWithPrice"></xsl:value-of>
                </xsl:attribute>
              </a>
              <a class="pricemin">
                <xsl:value-of select="/ProductFilter/PriceMin"></xsl:value-of>
              </a>
              <a class="pricemax">
                <xsl:value-of select="/ProductFilter/PriceMax"></xsl:value-of>
              </a>
            </div>
          </div>
        </div>
      </div>
    </section>
  </xsl:template>

  <xsl:template match="Group">
    <div class="filter-group clearfix">
      <div class="filter-title">
        <xsl:value-of select="Title"></xsl:value-of>
      </div>
      <xsl:choose>
        <xsl:when test="FieldType='1'">
          <div class="color-picker">
            <xsl:apply-templates select="Option" mode="Color"></xsl:apply-templates>
          </div>
        </xsl:when>
        <xsl:otherwise>
          <div class="product-size">
            <xsl:apply-templates select="Option" mode="Default"></xsl:apply-templates>
          </div>
        </xsl:otherwise>
      </xsl:choose>
    </div>
  </xsl:template>

  <xsl:template match="Option" mode="Color">
    <div class="color">
      <a class="ajaxlink">
        <xsl:if test="IsActive='true'">
          <xsl:attribute name="class">
            <xsl:text>ajaxlink active</xsl:text>
          </xsl:attribute>
        </xsl:if>
        <xsl:attribute name="href">
          <xsl:value-of select="Url"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="title">
          <xsl:value-of select="Title"></xsl:value-of>
        </xsl:attribute>
        <div class="color-img">
          <xsl:if test="Color!=''">
            <xsl:attribute name="style">
              <xsl:text>background-color:</xsl:text>
              <xsl:value-of select="Color"></xsl:value-of>
            </xsl:attribute>
          </xsl:if>
        </div>
        <div class="color-name">
          <xsl:value-of select="Title"></xsl:value-of>
        </div>
      </a>
    </div>
  </xsl:template>
  <xsl:template match="Option" mode="Default">
    <div class="size">
      <a class="ajaxlink">
        <xsl:if test="IsActive='true'">
          <xsl:attribute name="class">
            <xsl:text>ajaxlink active</xsl:text>
          </xsl:attribute>
        </xsl:if>
        <xsl:attribute name="href">
          <xsl:value-of select="Url"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="title">
          <xsl:value-of select="Title"></xsl:value-of>
        </xsl:attribute>
        <xsl:value-of select="Title"></xsl:value-of>
      </a>
    </div>
  </xsl:template>

</xsl:stylesheet>