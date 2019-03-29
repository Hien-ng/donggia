<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <xsl:if test="count(/ProductList/Product)>0">
      <section class="lastview-product clearfix">
        <div class="carttitle">
          <xsl:value-of select="/ProductList/ModuleTitle"></xsl:value-of>
        </div>
        <div class="lastview-slide clearfix">
          <xsl:apply-templates select="/ProductList/Product"></xsl:apply-templates>
        </div>
      </section>
    </xsl:if>
  </xsl:template>


  <xsl:template match="Product">
    <div class="item">
      <a class="productimg">
        <xsl:attribute name="href">
          <xsl:value-of select="Url"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="target">
          <xsl:value-of select="Target"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="title">
          <xsl:value-of select="Title"></xsl:value-of>
        </xsl:attribute>
        <img>
          <xsl:attribute name="src">
            <xsl:value-of select="ImageUrl"></xsl:value-of>
          </xsl:attribute>
          <xsl:attribute name="alt">
            <xsl:value-of select="Title"></xsl:value-of>
          </xsl:attribute>
        </img>
      </a>
    </div>
  </xsl:template>
</xsl:stylesheet>