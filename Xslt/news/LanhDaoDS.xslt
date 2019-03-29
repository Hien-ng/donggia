<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <section class="about-ceo clearfix">
      <div class="container">
        <h1 class="postname text-xs-center">
          <xsl:value-of select="/NewsList/ZoneTitle"></xsl:value-of>
        </h1>
        <section class="staff-list clearfix">
          <div class="row flex flex-wrap">
            <div class="group clearfix flex flex-wrap flex-content-center">
              <xsl:apply-templates select="/NewsList/News" mode="First"></xsl:apply-templates>
            </div>
            <div class="group clearfix flex flex-wrap flex-content-center">
              <xsl:apply-templates select="/NewsList/News" mode="Last"></xsl:apply-templates>
            </div>
          </div>
        </section>
      </div>
    </section>
  </xsl:template>

  <xsl:template match="News" mode="First">
    <xsl:if test="position() = 1">
      <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
        <div class="staff-col">
          <figure>
            <div class="staff-img">
              <img>
                <xsl:attribute name="src">
                  <xsl:value-of select="ImageUrl"></xsl:value-of>
                </xsl:attribute>
              </img>
            </div>
            <figcaption>
              <h3 class="staff-name">
                <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
                <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
              </h3>
              <div class="staff-cv">
                <xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
              </div>
            </figcaption>
          </figure>
        </div>
      </div>
    </xsl:if>

  </xsl:template>
  <xsl:template match="News" mode="Last">
    <xsl:if test="position() > 1">
      <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
        <div class="staff-col">
          <figure>
            <div class="staff-img">
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
              <h3 class="staff-name">
                <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
                <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
              </h3>
              <div class="staff-cv">
                <xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
              </div>
            </figcaption>
          </figure>
        </div>
      </div>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>