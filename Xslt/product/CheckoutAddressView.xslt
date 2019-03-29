<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <h4 class="name-cart text-16px">
      <i class="fa fa-map-marker"></i>
      <strong>Địa chỉ giao hàng</strong>
      <a class="edit-cart pull-right">
        <xsl:attribute name="href">
          <xsl:value-of select="/CheckoutAddress/NextPageUrl"></xsl:value-of>
        </xsl:attribute>
        <i class="fa fa-edit"></i>
      </a>
    </h4>
    <div class="sum-cart-address">
      <p class="row">
        <span class="col-xs-5 text-left">
          <xsl:value-of select="/CheckoutAddress/FullNameText"></xsl:value-of>:
        </span>
        <strong class="col-xs-7">
          <xsl:value-of select="/CheckoutAddress/LastName"></xsl:value-of>
          <xsl:text> </xsl:text>
          <xsl:value-of select="/CheckoutAddress/FirstName"></xsl:value-of>
        </strong>
      </p>
      <p class="row">
        <span class="col-xs-5 text-left">
          <xsl:value-of select="/CheckoutAddress/AddressText"></xsl:value-of>:
        </span>
        <span class="col-xs-7">
          <xsl:value-of select="/CheckoutAddress/Address"></xsl:value-of>
          <xsl:text> </xsl:text>
          <xsl:value-of select="/CheckoutAddress/District"></xsl:value-of>
          <xsl:text> </xsl:text>
          <xsl:value-of select="/CheckoutAddress/Province"></xsl:value-of>
        </span>
      </p>
      <p class="row">
        <span class="col-xs-5 text-left">
          <xsl:value-of select="/CheckoutAddress/PhoneText"></xsl:value-of>:
        </span>
        <strong class="col-xs-7">
          <xsl:value-of select="/CheckoutAddress/Phone"></xsl:value-of>
        </strong>
      </p>
      <p class="row">
        <span class="col-xs-5 text-left">
          <xsl:value-of select="/CheckoutAddress/EmailText"></xsl:value-of>:
        </span>
        <strong class="col-xs-7">
          <xsl:value-of select="/CheckoutAddress/Email"></xsl:value-of>
        </strong>
      </p>
    </div>
  </xsl:template>
</xsl:stylesheet>