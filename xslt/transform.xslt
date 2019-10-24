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
                <link>
                    <xsl:attribute name="href">../css/cabinet.css</xsl:attribute>
                    <xsl:attribute name="type">text/css</xsl:attribute>
                    <xsl:attribute name="rel">stylesheet</xsl:attribute>
                </link>
                
            </head>

            <script>
                <![CDATA[
                    function openFacture(prenom, nom, actes) {
                        var width  = 500;
                        var height = 300;
                        if(window.innerWidth) {
                            var left = (window.innerWidth-width)/2;
                            var top = (window.innerHeight-height)/2;
                        }
                        else {
                            var left = (document.body.clientWidth-width)/2;
                            var top = (document.body.clientHeight-height)/2;
                        }
                        var factureWindow = window.open('','facture','menubar=yes, scrollbars=yes, top='+top+', left='+left+', width='+width+', height='+height+'');
                        factureText = "Facture pour : " + prenom + " " + nom;
                        factureWindow.document.write(factureText);
                    }
                    ]]>
            </script>
            
            <body>
            <h4 class="infirmier-headline">Bonjour  <xsl:value-of select="//med:infirmier[@id=$intervenantId]/med:nom/text()" /> </h4>
               
            <p class="infirmier-announcement">Aujourd'hui, vous avez <xsl:value-of select="count($visitesDuJour)" /> patients.</p>

                
                <div class="patients">
                    <xsl:apply-templates select="//med:visite[@intervenant=$intervenantId]" />
                </div>
            </body>
            
        </html>
    </xsl:template>
    <xsl:template match="med:visite">
        <div class="patient">
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

            <input>
                <xsl:attribute name="type">button</xsl:attribute>
                <xsl:attribute name="value">Facture</xsl:attribute>
                <xsl:attribute name="onclick">
                    openFacture('<xsl:value-of select="../med:prénom"/>',
                                '<xsl:value-of select="../med:nom"/>',
                                '<xsl:value-of select="med:acte"/>')
                </xsl:attribute>
            </input>
        </div>
    </xsl:template>
    <xsl:template match="act:acte">
        <xsl:value-of  select="text()"/>          
        <br/>
    </xsl:template>
</xsl:stylesheet>