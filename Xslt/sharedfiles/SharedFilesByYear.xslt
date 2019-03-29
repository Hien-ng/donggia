<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <div class="wrap-baocao">
        <xsl:apply-templates select="/FileList/Years"></xsl:apply-templates></div>
    </xsl:template>

    <xsl:template match="Years">
        <div class="item-baocao">
            <div class="col-sm-1 PaddLR0 years">
                <xsl:value-of select="Year"></xsl:value-of>
            </div>
            <div class="col-sm-11 PaddLR0 tablebaocao">
                <table>
                    <xsl:apply-templates select="File"></xsl:apply-templates>
                </table>
            </div>
            <div class="clear"></div>
        </div>
    </xsl:template>
    <xsl:template match="File">
        <tr>
            <td class="textleft">
                <xsl:value-of select="Title"></xsl:value-of>
                <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
            </td>
            <td class="textright">
                <xsl:if test="DownloadUrl != ''">
                    <a target="_blank" title="Download">
                        <!--<xsl:attribute name="title">
                            <xsl:value-of select="Title"></xsl:value-of>
                        </xsl:attribute>-->
                        <xsl:attribute name="href">
                            <xsl:value-of select="DownloadUrl"></xsl:value-of>
                        </xsl:attribute>
                        <img alt="Download">
                            <xsl:attribute name="src">
                                <xsl:value-of select="ImageTypeUrl"></xsl:value-of>
                            </xsl:attribute>
                        </img>
                    </a>
                </xsl:if>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>