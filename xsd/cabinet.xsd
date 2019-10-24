<?xml version='1.0' encoding='UTF-8' ?> 
<xsd:schema
    xmlns:xsd="http://www.w3.org/2001/XMLSchema"
    targetNamespace="http://www.ujf-grenoble.fr/l3miage/medical"
    xmlns="http://www.ujf-grenoble.fr/l3miage/medical"
    elementFormDefault="qualified">

    <xsd:element name="cabinet" type="Cabinet"/>

    <xsd:complexType name="Cabinet">
        <xsd:sequence>
            <xsd:element name="nom" type="xsd:string"/>
            <xsd:element name="adresse" type="Adresse"/>
            <xsd:element name="infirmiers" type="Infirmiers"/>
            <xsd:element name="patients" type="Patients"/>
        </xsd:sequence>
    </xsd:complexType>

    <xsd:complexType name="Adresse">
        <xsd:sequence>
            <xsd:element name="étage" type="xsd:int" minOccurs="0"/>
            <xsd:element name="numéro" type="xsd:int" minOccurs="0"/>
            <xsd:element name="rue" type="xsd:string"/>
            <xsd:element name="ville" type="xsd:string"/>
            <xsd:element name="codePostal" type="CodePostal"/>
        </xsd:sequence>
    </xsd:complexType>

   <xsd:simpleType name="date">
        <xsd:restriction base="xsd:date">
        </xsd:restriction>
    </xsd:simpleType>

   <xsd:simpleType name="string">
        <xsd:restriction base="xsd:string">
        </xsd:restriction>
    </xsd:simpleType>

    <xsd:simpleType name="CodePostal">
        <xsd:restriction base="xsd:string">
            <xsd:pattern value="\d{5}"/>
        </xsd:restriction>
    </xsd:simpleType>

    <xsd:complexType name="Infirmiers">
        <xsd:sequence>
            <xsd:element name="infirmier" type="Infirmier" maxOccurs="unbounded"/>
        </xsd:sequence>
    </xsd:complexType>

    <xsd:complexType name="Infirmier">
        <xsd:sequence>
            <xsd:element name="nom" type="xsd:string"/>
            <xsd:element name="prénom" type="xsd:string"/>
            <xsd:element name="photo" type="photo"/>
        </xsd:sequence>
        <xsd:attribute name="id" type="Id"/>
    </xsd:complexType>
    
    <xsd:simpleType name="photo">
        <xsd:restriction base="xsd:string">
            <xsd:pattern value="[a-zéàùîçèêëûô]{1,}((.jpg)|(.png))"/>
        </xsd:restriction>
    </xsd:simpleType>


    <xsd:simpleType name="Id">
        <xsd:restriction base="xsd:string">
            <xsd:pattern value="\d{3}"/>
        </xsd:restriction>
    </xsd:simpleType>

    <xsd:complexType name="Patients">
        <xsd:sequence>
            <xsd:element name="patient" type="Patient" maxOccurs="unbounded"/>
        </xsd:sequence>
    </xsd:complexType>

    <xsd:complexType name="Patient">
        <xsd:sequence>
            <xsd:element name="nom" type="xsd:string"/>
            <xsd:element name="prénom" type="xsd:string"/>
            <xsd:element name="sexe" type="Sexe"/>
            <xsd:element name="naissance" type="xsd:date"/>
            <xsd:element name="numéro" type="Numéro"/>
            <xsd:element name="adresse" type="Adresse"/>
            <xsd:element name="visite" type="Visite" maxOccurs="unbounded"/>
        </xsd:sequence>
    </xsd:complexType>

    <xsd:simpleType name="Sexe">
        <xsd:restriction base="xsd:string">
            <xsd:enumeration  value="M"/>
            <xsd:enumeration  value="F"/>
        </xsd:restriction>
    </xsd:simpleType>

    <xsd:simpleType name="Numéro">
        <xsd:restriction base="xsd:string">
            
            <xsd:pattern value="([1-4]|[7-8])([0-9]{2})((0[1-9])|(1[0-2])|(62)|(63))(((0[1-9])|(1[0-9])|(2[1-9])|([3-9][0-9])|(2A)|(2B))((00[1-9])|(0[1-9][0-9])|([1-9][0-8][0-9])|990)|((9[7-8][0-9])((0[0-9])|([1-8][0-9])|90)))((00[1-9])|(0[1-9][0-9])|([1-9][0-9][0-9]))((0[1-9])|([1-8][0-9])|(9[0-7]))"/>
        </xsd:restriction>
    </xsd:simpleType>

    <xsd:complexType name="Visite">
        <xsd:sequence>
            <xsd:element name="acte" type="Acte" maxOccurs="unbounded"/>
        </xsd:sequence>
        <xsd:attribute name="date" type="xsd:date"/>
        <xsd:attribute name="intervenant" type="Id" use="optional"/>
    </xsd:complexType>

    <xsd:complexType name="Acte">
        <xsd:attribute name="id" type="Id" use="optional"/>
    </xsd:complexType>
</xsd:schema>
