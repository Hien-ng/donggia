<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <h1>
      <xsl:value-of select="/VideoList/ModuleTitle"></xsl:value-of>
    </h1>
    <div class="video-wrap">
      <div id="videoPlayer"></div>
      <xsl:apply-templates select="/VideoList/Video"></xsl:apply-templates>
    </div>
  </xsl:template>

  <xsl:template match="Video">
    <div>
      <a>
        <xsl:attribute name="title">
          <xsl:value-of select="Title"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="href">
          <xsl:value-of select="VideoUrl" disable-output-escaping="yes"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="rel">
          <xsl:value-of select="ImageUrl" disable-output-escaping="yes"></xsl:value-of>
        </xsl:attribute>
        <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
      </a>
    </div>
  </xsl:template>
</xsl:stylesheet>