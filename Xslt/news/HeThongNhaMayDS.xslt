<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <section class="customer-page clearfix">
      <div class="container">
        <h1 class="postname">
          <xsl:value-of select="/NewsList/ZoneTitle"></xsl:value-of>
        </h1>
        <xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
      </div>
    </section>
  </xsl:template>

  <xsl:template match="News">
    <div class="place-group clearfix">
      <section class="row flex flex-wrap">
        <div class="col-xs-12">
          <section class="content">
            <h2 class="posttitle">
              <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
              <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
            </h2>
             <xsl:value-of select="ID"></xsl:value-of>
            <xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
          </section>
        </div>
        <div class="col-xs-12">
          <ul role="tablist" class="nav nav-tabs">
            <li class="nav-item">
              <a data-toggle="tab" role="tab" class="nav-link active">
                <xsl:attribute name="href">
                   <!--<xsl:value-of select="NewsID"></xsl:value-of>-->                  
                  <xsl:text>#img</xsl:text>
                <xsl:value-of select="position()"></xsl:value-of>
                </xsl:attribute>
                <xsl:value-of select="/NewsList/ImagesTitle" disable-output-escaping="yes"></xsl:value-of>
              </a>
            </li>
            <li class="nav-item">
              <a data-toggle="tab" role="tab" class="nav-link">
                <xsl:attribute name="href">
                  <!--<xsl:value-of select="NewsID"></xsl:value-of>-->                  
                  <xsl:text>#view</xsl:text>
                <xsl:value-of select="position()"></xsl:value-of>
                </xsl:attribute>
                <xsl:value-of select="/NewsList/ViewTitle" disable-output-escaping="yes"></xsl:value-of>
              </a>
            </li>
          </ul>
          <div class="tab-content">
            <xsl:if test="count(NewsImages) > 1">
              <section role="tabpanel" class="tab-pane active">
                <xsl:attribute name="id">
                   <!--<xsl:value-of select="NewsID"></xsl:value-of>-->
                  <xsl:text>img</xsl:text>
                  <xsl:value-of select="position()"></xsl:value-of>                  
                </xsl:attribute>
                <div class="company-slideshow clearfix">
                  <section class="slide-wrap clearfix">
                    <div class="control">
                      <section class="img-prev">
                        <xsl:attribute name="id">
                          <xsl:text>prev</xsl:text>
                          <xsl:value-of select="position()"></xsl:value-of>
                        </xsl:attribute>
                      </section>
                      <section class="img-next">
                        <xsl:attribute name="id">
                          <xsl:text>next</xsl:text>
                          <xsl:value-of select="position()"></xsl:value-of>
                        </xsl:attribute>
                      </section>
                      <section class="company-slide">
                        <xsl:attribute name="id">
                          <xsl:text>slide</xsl:text>
                          <xsl:value-of select="position()"></xsl:value-of>
                        </xsl:attribute>
                        <xsl:apply-templates select="NewsImages" mode="Big"></xsl:apply-templates>
                      </section>
                      <section class="company-nav">
                        <xsl:attribute name="id">
                          <xsl:text>nav</xsl:text>
                          <xsl:value-of select="position()"></xsl:value-of>
                        </xsl:attribute>
                        <xsl:apply-templates select="NewsImages" mode="Small"></xsl:apply-templates>
                      </section>
                    </div>
                  </section>
                </div>
              </section>
              <section role="tabpanel" class="tab-pane">
                <xsl:attribute name="id">
                  <!--<xsl:value-of select="NewsID"></xsl:value-of>-->                 
                  <xsl:text>view</xsl:text>
                 <xsl:value-of select="position()"></xsl:value-of>
                </xsl:attribute>
                <xsl:value-of select="FullContent" disable-output-escaping="yes"></xsl:value-of>
              </section>
            </xsl:if>
          </div>
        </div>
      </section>
    </div>
  </xsl:template>
  <xsl:template match="NewsImages" mode="Big">
    <div class="item">
      <a href="javascript:void(0)" class="fancybox">
        <img>
          <xsl:attribute name="src">
            <xsl:value-of select="ImageUrl"></xsl:value-of>
          </xsl:attribute>
          <xsl:attribute name="alt">
            <xsl:value-of select="Title"></xsl:value-of>
          </xsl:attribute>
        </img>
      </a>
    </div>
  </xsl:template>
  <xsl:template match="NewsImages" mode="Small">
    <div class="item">
      <img>
        <xsl:attribute name="src">
          <xsl:value-of select="ImageUrl"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="alt">
          <xsl:value-of select="Title"></xsl:value-of>
        </xsl:attribute>
      </img>
    </div>
  </xsl:template>
</xsl:stylesheet>