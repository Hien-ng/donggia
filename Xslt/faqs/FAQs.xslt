<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <!--<FAQsList>
    <ModuleTitle>Hỏi đáp</ModuleTitle>
    <PageTitle>Hỏi đáp</PageTitle>
    <SubmitLink>Hỏi đáp</SubmitLink>
    <Culture>vi-VN</Culture>
    <FAQs>
      <Question>Câu hỏi</Question>
      <Answer>Trả lời</Answer>
      <Viewed>0</Viewed>
    </FAQs>
  </FAQsList>-->

  <xsl:template match="/">
    <h1 class="title-page">
      <xsl:value-of select="/FAQsList/ZoneTitle"></xsl:value-of>
    </h1>
    <div class="panel-group" id="accordionse" role="tablist" aria-multiselectable="true">
      <xsl:apply-templates select="/FAQsList/FAQs"></xsl:apply-templates>
    </div>
    <div class="frame-question mrb20">
      <div class="popup-iframe">
        <a rel="nofollow" target="_blank" class="faq-popup faq-link btn btn-primary">
          <xsl:attribute name="title">
            <xsl:value-of select="/FAQsList/SubmitUrl"></xsl:value-of>
          </xsl:attribute>
          <xsl:attribute name="href">
            <xsl:value-of select="/FAQsList/SubmitUrl"></xsl:value-of>
          </xsl:attribute>
          <span>
            <xsl:value-of select="/FAQsList/SubmitTitle"></xsl:value-of>
          </span>
        </a>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="FAQs">
    <div class="panel panel-default">
      <div class="panel-heading" role="tab">
        <xsl:attribute name="id">
          <xsl:text>heading</xsl:text>
          <xsl:value-of select="position()"></xsl:value-of>
        </xsl:attribute>
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordionse" aria-expanded="true">
            <xsl:attribute name="href">
              <xsl:text>#collapse</xsl:text>
              <xsl:value-of select="position()"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="aria-controls">
              <xsl:text>collapse</xsl:text>
              <xsl:value-of select="position()"></xsl:value-of>
            </xsl:attribute>
            <xsl:choose>
              <xsl:when test="position()=1">
                <i class="fa fa-minus-square"></i>
              </xsl:when>
              <xsl:otherwise>
                <i class="fa fa-plus-square"></i>
              </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="Question" disable-output-escaping="yes"></xsl:value-of>
            <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
          </a>
        </h4>
      </div>
      <div class="panel-collapse collapse" role="tabpanel">
        <xsl:if test="position()=1">
          <xsl:attribute name="class">
            <xsl:text>panel-collapse collapse in</xsl:text>
          </xsl:attribute>
        </xsl:if>
        <xsl:attribute name="id">
          <xsl:text>collapse</xsl:text>
          <xsl:value-of select="position()"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="aria-labelledby">
          <xsl:text>heading</xsl:text>
          <xsl:value-of select="position()"></xsl:value-of>
        </xsl:attribute>
        <div class="panel-body">
          <xsl:value-of select="Answer" disable-output-escaping="yes"></xsl:value-of>
        </div>
      </div>
    </div>
  </xsl:template>
</xsl:stylesheet>