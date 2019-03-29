<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>
  <xsl:template match="/">
    <section class="container">
      <h2 class="postname">
        <xsl:value-of select="/ZoneList/Title"></xsl:value-of>
      </h2>
      <xsl:apply-templates select="/ZoneList/Zone"></xsl:apply-templates>
    </section>
  </xsl:template>
  <xsl:template match="Zone">
    <div class="faq-list clearfix">
      <h3 class="posttitle">
        <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
      </h3>
      <xsl:apply-templates select="News"></xsl:apply-templates>
    </div>
  </xsl:template>
  <xsl:template match="News">
    <section class="faq-group">
      <div class="faq-title">
        <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
        <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
      </div>
      <div class="faq-content">
        <div class="content">
          <xsl:value-of select="FullContent" disable-output-escaping="yes"></xsl:value-of>
        </div>
      </div>
    </section>
  </xsl:template>
</xsl:stylesheet>