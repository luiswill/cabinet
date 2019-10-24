<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" 
                xmlns:med="http://www.ujf-grenoble.fr/l3miage/medical"
                xmlns:act="http://www.ujf-grenoble.fr/l3miage/actes" version="1.0">
                
    <xsl:output method="html" />
    <xsl:param name="intervenantId">001</xsl:param>
    <xsl:variable name="visitesDuJour" select="//med:patient/med:visite[@intervenant=$intervenantId]" />
    <xsl:variable name="ngap" select="document('../xml/actes.xml', /)/act:ngap"/>


    <xsl:template match="/">
        <html>
            <head>
                <title>Visites à faire</title>
                
            </head>
            <body>
                Bonjour <xsl:value-of select="//med:infirmier[@id=$intervenantId]/med:nom/text()" />

                <br/>

                Aujourd'hui, vous avez <xsl:value-of select="count($visitesDuJour)" /> patients.
                <xsl:apply-templates select="//med:visite[@intervenant=$intervenantId]" />
            </body>
        </html>
    </xsl:template>
    <xsl:template match="med:visite">
        <p>Nom : <xsl:value-of  select="../med:nom/text()"/></p>
        <p>Adresse : <xsl:value-of  select="../med:adresse/med:numéro/text()"/>, 
            <xsl:value-of  select="../med:adresse/med:rue/text()"/>
            <br/>
            <xsl:value-of  select="../med:adresse/med:codePostal/text()"/>
            <br/>
            <xsl:value-of  select="../med:adresse/med:ville/text()"/> 
        </p> 
        
        <h3>Soins à effectuer :</h3>
        <xsl:variable name="id" select="med:acte/@id"/>
        <xsl:apply-templates select="$ngap/act:actes/act:acte[@id=$id]"/>
    </xsl:template>
    <xsl:template match="act:acte">
        <xsl:value-of  select="text()"/>          
        <br/>
    </xsl:template>
</xsl:stylesheet>