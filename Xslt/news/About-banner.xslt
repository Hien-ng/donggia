<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<xsl:apply-templates select="/ZoneList/Zone"></xsl:apply-templates>
	</xsl:template>

	<xsl:template match="Zone">
		<xsl:if test="position() = 1">
			<section class="dg-about-banner">
				<div class="container">
					<div class="row">
						<xsl:apply-templates select="News" mode="Zone-News1"></xsl:apply-templates>
					</div>
				</div>
			</section>
		</xsl:if>
		<xsl:if test="position() = 2">
			<section class="dg-about-team">
				<div class="container">
					<h2><xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of></h2>
					<p><xsl:value-of select="Description" disable-output-escaping="yes"></xsl:value-of></p>
					<div class="row">
						<xsl:apply-templates select="News" mode="Zone-News2"></xsl:apply-templates>
					</div>
				</div>
			</section>
		</xsl:if>
	</xsl:template>


	<xsl:template match="News" mode="Zone-News1">
		<div class="col col-xl-6 bg-about-item">
			<h2>
				<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
			</h2>
			<h4>
				<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
			</h4>
			<br></br>
			<xsl:value-of select="FullContent" disable-output-escaping="yes"></xsl:value-of>
		</div>
		<div class="col col-xl-6 bg-about-item">
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<xsl:apply-templates select="NewsImages"></xsl:apply-templates>

				</div>
				<xsl:if test="count(NewsImages)>0">
					<div class="swiper-nav">
						<div class="swiper-prev"><em class="lnr lnr-arrow-left"></em></div>
						<div class="swiper-next"><em class="lnr lnr-arrow-right"></em></div>
					</div>
				</xsl:if>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="News" mode="Zone-News2">
		<xsl:if test="position()=1">
			<div class="col col-lg-6 dg-team-item">
				<img> 
					<xsl:attribute name="src">
						<xsl:value-of select="ImageUrl"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="alt">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
				</img>
			</div>
			<div class="col col-lg-6 dg-team-item"> 
				<div class="conten"> 
					<div class="name">
						<h4><xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of></h4>
						<h5><xsl:value-of select="SubTitle" disable-output-escaping="yes"></xsl:value-of></h5>
					</div><br/>
					<xsl:value-of select="FullContent" disable-output-escaping="yes"></xsl:value-of>
				</div>
			</div>
		</xsl:if>
		<xsl:if test="position()=2">
			<div class="col col-lg-6 dg-team-item">
				<img> 
					<xsl:attribute name="src">
						<xsl:value-of select="ImageUrl"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="alt">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
				</img>
			</div>
			<div class="col col-lg-6 dg-team-item"> 
				<div class="conten"> 
					<div class="name">
						<h4><xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of></h4>
						<h5><xsl:value-of select="SubTitle" disable-output-escaping="yes"></xsl:value-of></h5>
					</div><br/>
					<xsl:value-of select="FullContent" disable-output-escaping="yes"></xsl:value-of>
				</div>
			</div>
		</xsl:if>
		<xsl:if test="position()=3">

			<xsl:text disable-output-escaping="yes">&lt;div class=&quot;row&quot;&gt;</xsl:text>
		</xsl:if>
		<xsl:if test="position()>2">
			<div class="col-6 col-lg-3 dg-team-item">
					<div class="img">
						<img>
							<xsl:attribute name="src">
								<xsl:value-of select="ImageUrl"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="alt">
								<xsl:value-of select="Title"></xsl:value-of>
							</xsl:attribute>
						</img>
						<div class="team">
							<h4><xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of></h4>
							<h5><xsl:value-of select="SubTitle" disable-output-escaping="yes"></xsl:value-of></h5>
						</div>
					</div>
				</div>
		</xsl:if>
		<xsl:if test="position()=last()">

			<xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
		</xsl:if>
	</xsl:template>


	<xsl:template match="NewsImages">
		<div class="swiper-slide">
			<div class="img">
				<img>
					<xsl:attribute name="src">
						<xsl:value-of select="ImageUrl"></xsl:value-of>
					</xsl:attribute>
				</img>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>