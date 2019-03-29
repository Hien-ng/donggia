<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/">
        <xsl:choose>
            <xsl:when test="count(/DealerList/DealerGroup) > 0">
                <div class="intro-mangluoi">
                    <xsl:value-of select="/DealerList/ZoneDescription" disable-output-escaping="yes"></xsl:value-of>
                </div>
                <xsl:apply-templates select="/DealerList/DealerGroup"></xsl:apply-templates>
                <div class="clear"></div>
            </xsl:when>
            <xsl:otherwise>
                <div class="wrap-ketqua">
                    <xsl:if test="/DealerList/ResultText != ''">
                        <div class="title-room">
                            <xsl:value-of select="/DealerList/ResultText" disable-output-escaping="yes"></xsl:value-of>
                        </div>
                    </xsl:if>
                    <table>
                        <xsl:apply-templates select="/DealerList/Dealer" mode="search"></xsl:apply-templates>
                    </table>
                </div>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="DealerGroup">
        <div class="col-sm-6 PaddL0">
            <xsl:if test="(position() mod 2) = 0">
                <xsl:attribute name="class">
                    <xsl:text>col-sm-6 PaddR0</xsl:text>
                </xsl:attribute>
            </xsl:if>
            <div class="title-room">
                <xsl:value-of select="ZoneTitle" disable-output-escaping="yes"></xsl:value-of>
            </div>
            <xsl:apply-templates select="Dealer" mode="load"></xsl:apply-templates>
        </div>
    </xsl:template>
    
    <xsl:template match="Dealer" mode="load">
        <div class="item-diadiem">
            <xsl:value-of select="Address" disable-output-escaping="yes"></xsl:value-of>
            <xsl:if test="Phone != '' or Fax != ''">
                <br />
                <xsl:if test="Phone != ''">
                    <xsl:value-of select="/DealerList/PhoneText" disable-output-escaping="yes"></xsl:value-of>: <xsl:value-of select="Phone" disable-output-escaping="yes"></xsl:value-of>
                </xsl:if>
                <xsl:if test="Fax != ''">
                    <xsl:if test="Phone != ''">
                        <xsl:text> - </xsl:text>
                    </xsl:if>
                    <xsl:value-of select="/DealerList/FaxText" disable-output-escaping="yes"></xsl:value-of>: <xsl:value-of select="Fax" disable-output-escaping="yes"></xsl:value-of>
                </xsl:if>
            </xsl:if>
        </div>
    </xsl:template>

    <xsl:template match="Dealer" mode="search">
        <tr>
            <td class="textleft">
                <!--<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>-->
                <xsl:value-of select="Address" disable-output-escaping="yes"></xsl:value-of>
                <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
                <xsl:if test="Phone != '' or Fax != ''">
                    <br />
                    <xsl:if test="Phone != ''">
                        <xsl:value-of select="/DealerList/PhoneText" disable-output-escaping="yes"></xsl:value-of>: <xsl:value-of select="Phone" disable-output-escaping="yes"></xsl:value-of>
                    </xsl:if>
                    <xsl:if test="Fax != ''">
                        <xsl:if test="Phone != ''">
                            <xsl:text> - </xsl:text>
                        </xsl:if>
                        <xsl:value-of select="/DealerList/FaxText" disable-output-escaping="yes"></xsl:value-of>: <xsl:value-of select="Fax" disable-output-escaping="yes"></xsl:value-of>
                    </xsl:if>
                </xsl:if>
            </td>
            <td class="textright">
                <xsl:if test="Map != ''">
                    <a class="amaps fancybox.iframe">
                        <xsl:attribute name="href">
                            <xsl:value-of select="Map"></xsl:value-of>
                        </xsl:attribute>
                        <xsl:value-of select="/DealerList/ViewMapText" disable-output-escaping="yes"></xsl:value-of>
                    </a>
                </xsl:if>
            </td>
        </tr>
        
        <!--<xsl:value-of select="Website" disable-output-escaping="yes"></xsl:value-of>
            <xsl:value-of select="ImageUrl"></xsl:value-of>
            <xsl:value-of select="Map"></xsl:value-of>-->
    </xsl:template>
</xsl:stylesheet>