<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes" />

    <!--Begin Gallery-->
    <xsl:template match="/">
        <h2>
            <xsl:value-of select="/NewsList/ZoneTitle"></xsl:value-of>
        </h2>
        <p>Please Choose a colour to see The whole range</p>
        <div class="row">
            <xsl:if test="count(/NewsList/News) > 0">
                <xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
            </xsl:if>
        </div>
    </xsl:template>

    <xsl:template match="News">
        <div class="col-6 col-lg-4 colection-item">
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
                <div class="img">
                    <img>
                    <xsl:attribute name="src">
                        <xsl:value-of select="ImageUrl"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name="alt">
                        <xsl:value-of select="Title"></xsl:value-of>
                    </xsl:attribute>
                    </img>
                </div>
                <h3>
                    <xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
                </h3>
                <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
            </a>
        </div>
    </xsl:template>

</xsl:stylesheet>