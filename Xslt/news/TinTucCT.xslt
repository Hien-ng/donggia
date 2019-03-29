<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <div class="container">
      <div class="row flex flex-wrap">
        <div class="col-xs-12 col-lg-8 col-xl-9">
          <section class="news-detail clearfix">
            <h2 class="postname">
              <xsl:value-of select="/NewsDetail/Title"></xsl:value-of>
              <xsl:value-of select="/NewsDetail/EditLink" disable-output-escaping="yes"></xsl:value-of>
            </h2>
            <div class="content">
              <xsl:value-of select="/NewsDetail/FullContent" disable-output-escaping="yes"></xsl:value-of>
            </div>
          </section>
        </div>
        <div class="col-xs-12 col-lg-4 col-xl-3">
          <section class="other-news clearfix">
            <h3 class="posttitle">
              <xsl:value-of select="/NewsDetail/NewsOtherText"></xsl:value-of>
            </h3>
            <ul class="postlist">
              <xsl:apply-templates select="/NewsDetail/NewsOther"></xsl:apply-templates>
            </ul>
          </section>
        </div>
      </div>
    </div>
  </xsl:template>
  <xsl:template match="NewsOther">
    <li>
      <div class="post clearfix">
        <figure>
          <a class="post-img">
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
          <figcaption>
            <h3 class="post-name">
              <a>
                <xsl:attribute name="href">
                  <xsl:value-of select="Url"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="target">
                  <xsl:value-of select="Target"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="title">
                  <xsl:value-of select="Title"></xsl:value-of>
                </xsl:attribute>
                <xsl:value-of select="Title"></xsl:value-of>
              </a>
              <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
            </h3>
          </figcaption>
        </figure>
      </div>
    </li>

  </xsl:template>

</xsl:stylesheet>