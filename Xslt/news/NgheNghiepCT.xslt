<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <div class="container">
      <div class="col-xs-12 col-lg-8 col-xl-9">
        <section class="career-detail clearfix">
          <h2 class="postname">
            <xsl:value-of select="/NewsDetail/Title"></xsl:value-of>
            <xsl:value-of select="/NewsDetail/EditLink" disable-output-escaping="yes"></xsl:value-of>
          </h2>
          <div class="content">
            <xsl:value-of select="/NewsDetail/FullContent" disable-output-escaping="yes"></xsl:value-of>
          </div>
          <a class="hvr-sweep-to-right btn-apply">
            <xsl:attribute name="href">
              <xsl:value-of select="/NewsDetail/ApplyUrl" disable-output-escaping="yes"/>
            </xsl:attribute>
            <xsl:value-of select="/NewsDetail/Apply"></xsl:value-of>
          </a>
          <div class="career-frame">
            <xsl:attribute name="id">
              <xsl:text>careerfr</xsl:text>
              <xsl:value-of select="position()"/>
            </xsl:attribute>
            <iframe class="frame" frameborder="0" width="100%" height="480px">
              <xsl:attribute name="src">
                <xsl:value-of select="ApplyUrl" disable-output-escaping="yes"/>
              </xsl:attribute>
            </iframe>
          </div>
        </section>
      </div>
      <div class="col-xs-12 col-lg-4 col-xl-3">
        <section class="other-job clearfix">
          <h3 class="posttitle">
            <xsl:value-of select="/NewsDetail/NewsOtherText"></xsl:value-of>
          </h3>
          <ul class="joblist">
            <xsl:apply-templates select="/NewsDetail/NewsOther"></xsl:apply-templates>
          </ul>
        </section>
      </div>
    </div>
  </xsl:template>
  <xsl:template match="NewsOther">
    <li>
      <time>
        <xsl:value-of select="FileUrl" disable-output-escaping="yes"></xsl:value-of>
      </time>
      <div class="jobname">
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
      </div>
    </li>
  </xsl:template>
</xsl:stylesheet>