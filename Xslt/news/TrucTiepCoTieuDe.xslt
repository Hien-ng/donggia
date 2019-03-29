<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <section class="about-page clearfix">
      <h1 class="postname text-xs-center wow fadeInUp">
        <xsl:value-of select="/NewsDetail/ZoneTitle" disable-output-escaping="yes"></xsl:value-of>
      </h1>
      <div class="container">
        <div class="flex flex-wrap">
          <div class="content clearfix">
            <xsl:value-of select="/NewsDetail/FullContent" disable-output-escaping="yes"></xsl:value-of>
          </div>
        </div>
      </div>
    </section>
  </xsl:template>
</xsl:stylesheet>