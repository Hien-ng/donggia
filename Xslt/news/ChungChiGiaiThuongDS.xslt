<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <div class="customer-award clearfix">
      <div class="container">
        <h1 class="postname">
          <xsl:value-of select="/NewsList/ZoneTitle"></xsl:value-of>
        </h1>
        <div class="content">
          <xsl:value-of select="/NewsList/ZoneDescription"></xsl:value-of>
        </div>
        <xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="News">
    <div class="award-group clearfix">
      <h3 class="posttitle">
        <xsl:value-of select="Title"></xsl:value-of>
      </h3>
      <div class="award-list clearfix">
        <div class="row flex flex-wrap">
          <xsl:apply-templates select="NewsImages"></xsl:apply-templates>
        </div>
      </div>
    </div>
  </xsl:template>
  <xsl:template match="NewsImages">
    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
      <figure>
        <div class="award-img">
          <img>
            <xsl:attribute name="src">
              <xsl:value-of select="ImageUrl"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="alt">
              <xsl:value-of select="Title"></xsl:value-of>
            </xsl:attribute>
          </img>
        </div>
        <figcaption>
          <h3 class="award-name">
            <xsl:value-of select="Title"></xsl:value-of>
          </h3>
        </figcaption>
      </figure>
    </div>
  </xsl:template>
</xsl:stylesheet>