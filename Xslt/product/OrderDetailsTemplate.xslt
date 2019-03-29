<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <table style="width: 100%; border-collapse: collapse; border-spacing: 0px;">
      <thead>
        <tr style="border: 1px solid #001530; background: #001530;">
          <th style="border: 1px solid #e6e6e6; text-align: center; color: #ffffff; font-size: 14px; font-weight: 500; text-transform: uppercase; height: 32px; width: 40%; background: none 0% 0% repeat scroll #00aeef;">Sản phẩm</th>
          <th style="border: 1px solid #e6e6e6; text-align: center; color: #ffffff; font-size: 14px; font-weight: 500; text-transform: uppercase; height: 32px; width: 20%; background: none 0% 0% repeat scroll #00aeef;">Đơn giá</th>
          <th style="border: 1px solid #e6e6e6; text-align: center; color: #ffffff; font-size: 14px; font-weight: 500; text-transform: uppercase; height: 32px; width: 20%; background: none 0% 0% repeat scroll #00aeef;">Số lượng</th>
          <th style="border: 1px solid #e6e6e6; text-align: center; color: #ffffff; font-size: 14px; font-weight: 500; text-transform: uppercase; height: 32px; width: 20%; background: none 0% 0% repeat scroll #00aeef;">Thành tiền</th>
        </tr>
      </thead>
      <tbody>
        <xsl:apply-templates select="/OrderDetails/OrderItems"></xsl:apply-templates>
      </tbody>
      <tfoot>
        <tr>
          <td colspan="4" style="width: 100%; text-align: right; background-color: #e5e5e5; padding: 5px 0;">
            <span style="line-height: 1.42857; width: 200px; display: inline-block;">Tổng giá trị sản phẩm: </span>
            <span style="line-height: 1.42857; width: 150px; display: inline-block; margin-right: 10px;">
              <xsl:value-of select="/OrderDetails/OrderSubTotal"></xsl:value-of>
            </span>
          </td>
        </tr>
        <tr>
          <td colspan="4" style="width: 100%; text-align: right; background-color: #e5e5e5; padding: 5px 0;">
            <span style="line-height: 1.42857; width: 200px; display: inline-block;">Phí vận chuyển: </span>
            <span style="line-height: 1.42857; width: 150px; display: inline-block; margin-right: 10px;">
              <xsl:value-of select="/OrderDetails/ShippingFee"></xsl:value-of>
            </span>
          </td>
        </tr>
        <tr>
          <td colspan="4" style="width: 100%; text-align: right; background-color: #e5e5e5; padding: 5px 0;">
            <span style="line-height: 1.42857; width: 200px; display: inline-block;">Giảm giá: </span>
            <span style="line-height: 1.42857; width: 150px; display: inline-block; margin-right: 10px;">
              <xsl:value-of select="/OrderDetails/OrderDiscount"></xsl:value-of>
            </span>
          </td>
        </tr>
        <tr>
          <td colspan="4" style="width: 100%; font-weight: bold; text-align: right; background-color: #c9c4cc; padding: 10px 0;">
            <span style="line-height: 1.42857; width: 200px; display: inline-block;">Tổng giá trị đơn hàng: </span>
            <span style="line-height: 1.42857; width: 150px; display: inline-block; margin-right: 10px;">
              <xsl:value-of select="/OrderDetails/OrderTotal"></xsl:value-of>
            </span>
          </td>
        </tr>
      </tfoot>
    </table>
  </xsl:template>

  <xsl:template match="OrderItems">
    <tr>
      <td style='text-align:left; background:#e5e5e5; padding: 5px; font-weight: 700;'>
        <xsl:value-of select="Title"></xsl:value-of>
        <xsl:apply-templates select="Attributes"></xsl:apply-templates>
      </td>
      <td style='text-align:center; background:#e5e5e5; padding: 5px;'>
        <xsl:value-of select="Price"></xsl:value-of>
      </td>
      <td style='text-align:center; background:#e5e5e5; padding: 5px;'>
        <xsl:value-of select="Quantity"></xsl:value-of>
      </td>
      <td style='text-align:right; background:#e5e5e5; padding: 5px 10px 0 0;'>
        <xsl:value-of select="ItemTotal"></xsl:value-of>
      </td>
    </tr>
  </xsl:template>

  <xsl:template match="Attributes">
    <div class="option">
      <span class="title" style='font-size: 14px; color: #333;'>
        <xsl:value-of select="Title"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </span>
      <span class="value" style='font-size: 14px; color: #333;'>
        <xsl:apply-templates select="Options"></xsl:apply-templates>
      </span>
    </div>
  </xsl:template>
  <xsl:template match="Options">
    <xsl:value-of select="Title"></xsl:value-of>
  </xsl:template>

</xsl:stylesheet>