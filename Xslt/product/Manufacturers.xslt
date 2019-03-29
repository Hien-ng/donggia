<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <section class="product-filter clearfix">
      <div class="filter-wrap">
        <div class="ajaxbrandresponse">
          <div class="filter-group clearfix">
            <div class="filter-title">
              <xsl:text>Thương hiệu</xsl:text>
            </div>
            <div class="product-size">
              <xsl:apply-templates select="/ManufacturerList/Manufacturer"></xsl:apply-templates>
            </div>
          </div>
        </div>
      </div>
    </section>
  </xsl:template>

  <xsl:template match="Manufacturer">
    <div class="size">
      <a class="ajaxlink">
        <xsl:if test="IsActiveFilter='true'">
          <xsl:attribute name="class">
            <xsl:text>ajaxlink active</xsl:text>
          </xsl:attribute>
        </xsl:if>
        <xsl:attribute name="href">
          <xsl:value-of select="UrlFilter"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="title">
          <xsl:value-of select="Title"></xsl:value-of>
        </xsl:attribute>
        <xsl:value-of select="Title"></xsl:value-of>
      </a>
    </div>
  </xsl:template>
</xsl:stylesheet>