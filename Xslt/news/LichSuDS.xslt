<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <div class="about-history clearfix">
      <section class="container">
        <h1 class="postname text-xs-center wow fadeInUp">
          <xsl:value-of select="/NewsList/ZoneTitle"></xsl:value-of>
        </h1>
        <div class="history-wrap clearfix">
          <section class="timeline">
            <xsl:apply-templates select="/NewsList/News" mode="Last"></xsl:apply-templates>
          </section>
          <div class="wow fadeInUp">
            <i class="fa fa-home" aria-hidden="true"></i>
          </div>
          <!--<div class="first-group clearfix">
            <xsl:apply-templates select="/NewsList/News" mode="First"></xsl:apply-templates>
          </div>-->
        </div>
      </section>
    </div>
  </xsl:template>

  <xsl:template match="News" mode="First">
    <xsl:if test="position() = 1">
      <div class="milestone wow fadeInUp">
        <time>
          <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
        </time>
        <div class="timeline-img">
          <img>
            <xsl:attribute name="src">
              <xsl:value-of select="ImageUrl"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="alt">
              <xsl:value-of select="Title"></xsl:value-of>
            </xsl:attribute>
          </img>
        </div>
        <div class="event">
          <div class="content">
            <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
            <xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
          </div>
        </div>
      </div>
    </xsl:if>
  </xsl:template>

  <xsl:template match="News" mode="Last">
    <!--<xsl:if test="position() > 1">-->
      <xsl:if test ="(position() mod 2) = 1">
        <xsl:text disable-output-escaping="yes">&lt;div class='group clearfix' &gt;</xsl:text>
      </xsl:if>
      <xsl:choose>
        <xsl:when test="position() mod 2 = 0">
          <div class="right">
            <div class="milestone wow fadeInUp">
              <time>
                <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>

              </time>
              <div class="timeline-img">
                <img>
                  <xsl:attribute name="src">
                    <xsl:value-of select="ImageUrl"></xsl:value-of>
                  </xsl:attribute>
                  <xsl:attribute name="alt">
                    <xsl:value-of select="Title"></xsl:value-of>
                  </xsl:attribute>
                </img>
              </div>
              <div class="event">
                <div class="content">
                  <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
                  <xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
                </div>
              </div>
            </div>
          </div>
        </xsl:when>
        <xsl:otherwise>
          <div class="left">
            <div class="milestone wow fadeInUp">
              <time>
                <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>

              </time>
              <div class="timeline-img">
                <img>
                  <xsl:attribute name="src">
                    <xsl:value-of select="ImageUrl"></xsl:value-of>
                  </xsl:attribute>
                  <xsl:attribute name="alt">
                    <xsl:value-of select="Title"></xsl:value-of>
                  </xsl:attribute>
                </img>
              </div>
              <div class="event">
                <div class="content">
                  <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
                  <xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
                </div>
              </div>
            </div>
          </div>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:if test ="(position() mod 2) = 0">
        <xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
      </xsl:if>
      <xsl:if test ="position()=last()">
        <xsl:if test ="last() mod 2 != 0">
          <xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
        </xsl:if>
      </xsl:if>
    <!--</xsl:if>-->
  </xsl:template>
</xsl:stylesheet>