<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes"/>

  <!--<FeedList>
    <ModuleTitle></ModuleTitle>
    <ZoneTitle></ZoneTitle>
    <Feed>
      <Message></Message>
      <CreatedTime></CreatedTime>
      <Url></Url>
    </Feed>
  </FeedList>-->

  <xsl:template match="/">
    <h4>
      <xsl:value-of select="/FeedList/ModuleTitle"></xsl:value-of>
    </h4>
    <div class="lasted">
      <xsl:apply-templates select="/FeedList/Feed"></xsl:apply-templates>
    </div>
  </xsl:template>

  <xsl:template match="Feed">
    <div class="media">
      <div class="media-left">
        <i class="fa fa-facebook fa-2x"></i>
      </div>
      <div class="media-body">
        <a class="media-heading">
          <xsl:attribute name="href">
            <xsl:value-of select="Url"></xsl:value-of>
          </xsl:attribute>
          <xsl:value-of select="Message" disable-output-escaping="yes"></xsl:value-of>
        </a>
        <time>
          <xsl:value-of select="CreatedTime" disable-output-escaping="yes"></xsl:value-of>
        </time>
      </div>
    </div>
  </xsl:template>
</xsl:stylesheet>