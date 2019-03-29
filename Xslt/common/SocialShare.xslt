<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
      <div class="share-page">
          <a class="btn fb" title="Share On Facebook">
              <xsl:attribute name="href">
                  <xsl:value-of select="/SocialShare/ShareFacebook"></xsl:value-of>
              </xsl:attribute>
          </a>
          <a class="btn tw" title="Share On Twitter">
              <xsl:attribute name="href">
                  <xsl:value-of select="/SocialShare/ShareTwitter"></xsl:value-of>
              </xsl:attribute>
          </a>
          <a class="btn gp" title="Share On Google Plus One">
              <xsl:attribute name="href">
                  <xsl:value-of select="/SocialShare/ShareGooglePlus"></xsl:value-of>
              </xsl:attribute>
          </a>
          <a class="btn pin" title="Share On Pinterest">
              <xsl:attribute name="href">
                  <xsl:value-of select="/SocialShare/SharePinterest"></xsl:value-of>
              </xsl:attribute>
          </a>
          <a class="btn em" title="Share Email">
              <xsl:attribute name="href">
                  <xsl:value-of select="/SocialShare/ShareEmail"></xsl:value-of>
              </xsl:attribute>
          </a>
      </div>
  </xsl:template>

</xsl:stylesheet>