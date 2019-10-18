<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" 
                xmlns:med="http://www.ujf-grenoble.fr/l3miage/medical" version="1.0">
    <xsl:output method="html" />
<xsl:param name="intervenantId">002</xsl:param>
<xsl:variable name="visitesDuJour" select="//med:patient/med:visite[@intervenant=$intervenantId]" />
<xsl:variable name="actes" select="document('actes.xml', /)/act:ngap"/>


<xsl:template match="/">
    <html>
        <head>
            <title>Visites à faire</title>
        </head>
        <body>
            Bonjour <xsl:value-of select="//med:infirmier[@id=$intervenantId]/med:nom/text()" />

            <br/>

            Aujourd'hui, vous avez <xsl:value-of select="count($visitesDuJour)" /> patients.
        </body>
    </html>
</xsl:template>

</xsl:stylesheet>