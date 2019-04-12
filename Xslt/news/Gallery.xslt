<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<div class="gallery">
			<div class="container">
				<h2 class="main-title">
					<xsl:value-of select="/NewsList/ModuleTitle"></xsl:value-of>
				</h2>
				<div class="grid">
					<div class="grid-sizer">
						<xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
					</div>
				</div>
				<xsl:if test="/NewsList/NextPageUrl != ''">
				<div class="viewmore">
					<a>
					<xsl:attribute name="href">
					<xsl:value-of select="/NewsList/NextPageUrl"></xsl:value-of>
					</xsl:attribute>
						<span>
							<xsl:value-of select="/NewsList/ViewMore"></xsl:value-of>
						</span>
						<span class="lnr lnr-arrow-down"></span>
					</a>
				</div></xsl:if>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="News">
		<a class="grid-item">
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
			<div class="noidung">
				<p>
					<xsl:value-of select="Title"></xsl:value-of>
				</p>
			</div>
		</a>
	</xsl:template>

</xsl:stylesheet>