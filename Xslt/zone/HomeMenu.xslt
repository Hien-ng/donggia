<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <xsl:if test="count(/ZoneList/Zone) > 0">
      <div class="container">
        <section class="row flex flex-wrap">
          <div class="col-xs-12 col-sm-6 col-lg-4 big">
            <xsl:apply-templates select="/ZoneList/Zone" mode="First"></xsl:apply-templates>
          </div>
          <div class="col-xs-12 col-sm-6 col-lg-4 big">
            <xsl:apply-templates select="/ZoneList/Zone" mode="Second"></xsl:apply-templates>
          </div>
          <div class="col-xs-12 col-lg-4">
            <section class="row">
              <xsl:apply-templates select="/ZoneList/Zone" mode="Last"></xsl:apply-templates>
            </section>
          </div>
        </section>
      </div>
    </xsl:if>
  </xsl:template>

  <xsl:template match="Zone" mode="First">
    <xsl:if test="position() = 1">
      <div class="feature-col">
        <figure>
          <img>
            <xsl:attribute name="src">
              <xsl:value-of select="ImageUrl"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="alt">
              <xsl:value-of select="Title"></xsl:value-of>
            </xsl:attribute>
          </img>
          <figcaption>
            <h1 class="feature-name">
              <a>
                <xsl:attribute name="href">
                  <xsl:value-of select="Url"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="target">
                  <xsl:value-of select="Target"></xsl:value-of>
                </xsl:attribute>
                <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
              </a>
            </h1>
            <a class="link">
              <xsl:attribute name="href">
                <xsl:value-of select="Url"></xsl:value-of>
              </xsl:attribute>
              <xsl:attribute name="target">
                <xsl:value-of select="Target"></xsl:value-of>
              </xsl:attribute>
              <span>
                <xsl:value-of select="/ZoneList/MoreText" disable-output-escaping="yes"></xsl:value-of>
              </span>
            </a>
          </figcaption>
        </figure>
      </div>
    </xsl:if>

  </xsl:template>

  <xsl:template match="Zone" mode="Second">
    <xsl:if test="position() = 2">
      <div class="feature-col">
        <figure>
          <img>
            <xsl:attribute name="src">
              <xsl:value-of select="ImageUrl"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="alt">
              <xsl:value-of select="Title"></xsl:value-of>
            </xsl:attribute>
          </img>
          <figcaption>
            <h2 class="feature-name">
              <a>
                <xsl:attribute name="href">
                  <xsl:value-of select="Url"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="target">
                  <xsl:value-of select="Target"></xsl:value-of>
                </xsl:attribute>
                <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
              </a>
            </h2>
            <a class="link">
              <xsl:attribute name="href">
                <xsl:value-of select="Url"></xsl:value-of>
              </xsl:attribute>
              <xsl:attribute name="target">
                <xsl:value-of select="Target"></xsl:value-of>
              </xsl:attribute>
              <span>
                <xsl:value-of select="/ZoneList/MoreText" disable-output-escaping="yes"></xsl:value-of>
              </span>
            </a>
          </figcaption>
        </figure>
      </div>
    </xsl:if>
  </xsl:template>

  <xsl:template match="Zone" mode="Last">
    <xsl:if test="position() > 2">
      <div class="col-xs-12 col-sm-6 col-lg-12">
        <div class="feature-col small">
          <figure>
            <img>
              <xsl:attribute name="src">
                <xsl:value-of select="ImageUrl"></xsl:value-of>
              </xsl:attribute>
              <xsl:attribute name="alt">
                <xsl:value-of select="Title"></xsl:value-of>
              </xsl:attribute>
            </img>
            <figcaption>
              <h2 class="feature-name">
                <a>
                  <xsl:attribute name="href">
                    <xsl:value-of select="Url"></xsl:value-of>
                  </xsl:attribute>
                  <xsl:attribute name="target">
                    <xsl:value-of select="Target"></xsl:value-of>
                  </xsl:attribute>
                  <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
                </a>
              </h2>
              <a class="link">
                <xsl:attribute name="href">
                  <xsl:value-of select="Url"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="target">
                  <xsl:value-of select="Target"></xsl:value-of>
                </xsl:attribute>
                <span>
                  <xsl:value-of select="/ZoneList/MoreText" disable-output-escaping="yes"></xsl:value-of>
                </span>
              </a>
            </figcaption>
          </figure>
        </div>
      </div>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>