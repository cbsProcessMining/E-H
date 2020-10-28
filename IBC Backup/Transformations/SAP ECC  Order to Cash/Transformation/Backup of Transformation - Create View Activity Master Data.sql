/*DESCRIPTION:
1. Transformation Description:
This transformation creates a table with the following name: _CEL_O2C_ACTIVITY_MASTER_DATA





2. Required Tables:
_CEL_O2C_ACTIVITIES

3. Required Columns:
_CEL_O2C_ACTIVITIES.ACTIVITY_DE
_CEL_O2C_ACTIVITIES.ACTIVITY_EN

4. Columns used for timestamp:
None

5. Parameters used in where clause:
None

6. Parameters used in joins:
None
*/
DROP TABLE IF EXISTS "CEL_O2C_ACTIVITY_MASTER_DATA";

CREATE TABLE "CEL_O2C_ACTIVITY_MASTER_DATA" (
	"ACTIVITY_DE" VARCHAR(200),
    "ACTIVITY_EN" VARCHAR(200),
    "LEVEL" VARCHAR(30),
    "AVG_TIME" INT,
    "TIMESTAMP" VARCHAR(60)
);

INSERT INTO "CEL_O2C_ACTIVITY_MASTER_DATA" VALUES ('Gebe Kredit frei','Pass Credit','Custom',30,'CDHDR.UDATE + CDHDR.UTIME');
INSERT INTO "CEL_O2C_ACTIVITY_MASTER_DATA" VALUES ('Erfasse Warenausgang','Record Goods Issue','Header',5,'VBFA.ERDAT + VBFA.ERZET');
INSERT INTO "CEL_O2C_ACTIVITY_MASTER_DATA" VALUES ('Ändere Werk','Change Plant','Item',30,'CDHDR.UDATE + CDHDR.UTIME');
INSERT INTO "CEL_O2C_ACTIVITY_MASTER_DATA" VALUES ('Gleiche Rechnung aus','Clear Invoice','Custom',10,'BKPF.CPUDT + BKPF.CPUTM');
INSERT INTO "CEL_O2C_ACTIVITY_MASTER_DATA" VALUES ('Storniere Warenausgang','Cancel Goods Issue','Header',10,'VBFA.ERDAT + VBFA.ERZET');
INSERT INTO "CEL_O2C_ACTIVITY_MASTER_DATA" VALUES ('Erstelle sonstiges Rechnungsdokument','Create Intercompany credit memo','Custom',30,'VBRP.ERDAT + VBRP.ERZET');
INSERT INTO "CEL_O2C_ACTIVITY_MASTER_DATA" VALUES ('Ändere Liefersperre','Change Delivery Block','Header',30,'CDHDR.UDATE + CDHDR.UTIME');
INSERT INTO "CEL_O2C_ACTIVITY_MASTER_DATA" VALUES ('Ändere Inco Terms (Teil 2)','Change Inco Terms (Part 2)','Header',60,NULL);
INSERT INTO "CEL_O2C_ACTIVITY_MASTER_DATA" VALUES ('Erstelle sonstiges Rechnungsdokument','Create Debit memo','Custom',30,'VBRP.ERDAT + VBRP.ERZET');
INSERT INTO "CEL_O2C_ACTIVITY_MASTER_DATA" VALUES ('Ändere Inco Terms (Teil 1)','Change Inco Terms (Part 1)','Header',60,NULL);
INSERT INTO "CEL_O2C_ACTIVITY_MASTER_DATA" VALUES ('Erstelle Warensendung','Create Shipment','Custom',30,'LIPS.ERDAT + LIPS.ERZET');
INSERT INTO "CEL_O2C_ACTIVITY_MASTER_DATA" VALUES ('Erstatte Gutschrift','Clear Credit Memo','Custom',30,'BKPF.CPUDT + BKPF.CPUTM');
INSERT INTO "CEL_O2C_ACTIVITY_MASTER_DATA" VALUES ('Ändere Preis','Change Price','Item',30,'CDHDR.UDATE + CDHDR.UTIME');
INSERT INTO "CEL_O2C_ACTIVITY_MASTER_DATA" VALUES ('Ändere Route','Change Route','Item',30,'CDHDR.UDATE + CDHDR.UTIME');
INSERT INTO "CEL_O2C_ACTIVITY_MASTER_DATA" VALUES ('Lege Auftragsposition an','Create Sales Order Item','Item',5,'VBAB.ERDAT + VBAB.ERZET');
INSERT INTO "CEL_O2C_ACTIVITY_MASTER_DATA" VALUES ('Ändere Versandart','Change Shipping Type','Header',60,NULL);
INSERT INTO "CEL_O2C_ACTIVITY_MASTER_DATA" VALUES ('Kommissionierung erstellt','Create Picking','Header',30,'LIKP.KODAT + LIKP.KOUHR');
INSERT INTO "CEL_O2C_ACTIVITY_MASTER_DATA" VALUES ('Lege Bestellung an','Create Purchase Order','Header',5,'VBFA.ERDAT + VBFA.ERZET');
INSERT INTO "CEL_O2C_ACTIVITY_MASTER_DATA" VALUES ('Erstelle sonstiges Rechnungsdokument','Create Credit memo','Custom',30,'VBRP.ERDAT + VBRP.ERZET');
INSERT INTO "CEL_O2C_ACTIVITY_MASTER_DATA" VALUES ('Entferne Absagegrund','Cancel Reason for Rejection','Item',30,'CDHDR.UDATE + CDHDR.UTIME');
INSERT INTO "CEL_O2C_ACTIVITY_MASTER_DATA" VALUES ('Erstelle sonstiges Rechnungsdokument','Create Invoice canceled','Custom',30,'VBRP.ERDAT + VBRP.ERZET');
INSERT INTO "CEL_O2C_ACTIVITY_MASTER_DATA" VALUES ('Erstelle sonstiges Rechnungsdokument','Create Pro forma invoice','Custom',30,'VBRP.ERDAT + VBRP.ERZET');
INSERT INTO "CEL_O2C_ACTIVITY_MASTER_DATA" VALUES ('Setze Liefersperre','Set Delivery Block','Header',60,'CDHDR.UDATE + CDHDR.UTIME');
INSERT INTO "CEL_O2C_ACTIVITY_MASTER_DATA" VALUES (NULL,'Sales Order Released','Custom',30,NULL);
INSERT INTO "CEL_O2C_ACTIVITY_MASTER_DATA" VALUES ('Erstelle sonstiges Rechnungsdokument','Create Intercompany invoice','Custom',30,'VBRP.ERDAT + VBRP.ERZET');
INSERT INTO "CEL_O2C_ACTIVITY_MASTER_DATA" VALUES ('Entferne Liefersperre','Remove Delivery Block','Header',30,'CDHDR.UDATE + CDHDR.UTIME');
INSERT INTO "CEL_O2C_ACTIVITY_MASTER_DATA" VALUES ('Erstelle sonstiges Lieferdokument','Create Returns delivery for order','Custom',30,'LIPS.ERDAT + LIPS.ERZET');
INSERT INTO "CEL_O2C_ACTIVITY_MASTER_DATA" VALUES ('Ändere Materialbereitstellungsdatum','Change Material Availability Date','Custom',30,'CDHDR.UDATE + CDHDR.UTIME');
INSERT INTO "CEL_O2C_ACTIVITY_MASTER_DATA" VALUES ('Setze Absagegrund','Set Reason for Rejection','Item',30,'CDHDR.UDATE + CDHDR.UTIME');
INSERT INTO "CEL_O2C_ACTIVITY_MASTER_DATA" VALUES ('Ändere Angefragtes Lieferdatum','Change Requested Delivery Date','Custom',30,'CDHDR.UDATE + CDHDR.UTIME');
INSERT INTO "CEL_O2C_ACTIVITY_MASTER_DATA" VALUES ('Lege Angebot an','Create Quotation','Header',5,'VBAB.ERDAT + VBAB.ERZET');
INSERT INTO "CEL_O2C_ACTIVITY_MASTER_DATA" VALUES ('Erstelle sonstiges Lieferdokument','Create Delivery','Custom',30,'LIPS.ERDAT + LIPS.ERZET');
INSERT INTO "CEL_O2C_ACTIVITY_MASTER_DATA" VALUES ('Setze Kreditstatus (Sperre)','Set Credit Hold','Custom',30,'CDHDR.UDATE + CDHDR.UTIME');
INSERT INTO "CEL_O2C_ACTIVITY_MASTER_DATA" VALUES ('Entferne Kreditstatus (Sperre)','Release Credit Hold','Custom',30,'CDHDR.UDATE + CDHDR.UTIME');
INSERT INTO "CEL_O2C_ACTIVITY_MASTER_DATA" VALUES ('Ändere Liefermenge','Change Delivery Amount','Item',30,'CDHDR.UDATE + CDHDR.UTIME');
INSERT INTO "CEL_O2C_ACTIVITY_MASTER_DATA" VALUES ('Ändere Materialnummer','Change Material','Item',30,'CDHDR.UDATE + CDHDR.UTIME');
INSERT INTO "CEL_O2C_ACTIVITY_MASTER_DATA" VALUES ('Materialverfügbarkeitsdatum überschritten','Material Availability Date passed','Custom',30,'VBEP.MBDAT + VBEP.MBUHR');
INSERT INTO "CEL_O2C_ACTIVITY_MASTER_DATA" VALUES ('Ändere Bestätigtes Lieferdatum','Change Confirmed Delivery Date','Custom',30,'CDHDR.UDATE + CDHDR.UTIME');
INSERT INTO "CEL_O2C_ACTIVITY_MASTER_DATA" VALUES ('Ändere Absagegrund','Change Reason for Rejection','Item',30,'CDHDR.UDATE + CDHDR.UTIME');
INSERT INTO "CEL_O2C_ACTIVITY_MASTER_DATA" VALUES ('Lege Auftrag an','Create Sales Order','Custom',30,NULL);
INSERT INTO "CEL_O2C_ACTIVITY_MASTER_DATA" VALUES ('Erstelle sonstiges Rechnungsdokument','Create Invoice','Custom',30,'VBRP.ERDAT + VBRP.ERZET');
INSERT INTO "CEL_O2C_ACTIVITY_MASTER_DATA" VALUES ('Ändere Bestätigtes Warenausgangsdatum','Change Confirmed Goods Issue Date','Custom',30,'CDHDR.UDATE + CDHDR.UTIME');
INSERT INTO "CEL_O2C_ACTIVITY_MASTER_DATA" VALUES ('Ändere Angefragte Warenausgangsmenge','Change Requested Quantity','Custom',30,'CDHDR.UDATE + CDHDR.UTIME');
INSERT INTO "CEL_O2C_ACTIVITY_MASTER_DATA" VALUES ('Erfasse Retoureneingang','Record Return Goods Receipt','Custom',30,'VBFA.ERDAT + VBFA.ERZET');
INSERT INTO "CEL_O2C_ACTIVITY_MASTER_DATA" VALUES (NULL,'Quotation Released','Custom',30,NULL);
INSERT INTO "CEL_O2C_ACTIVITY_MASTER_DATA" VALUES ('Ändere Zahlungsbedingungen','Change Payment Terms','Header',60,NULL);
INSERT INTO "CEL_O2C_ACTIVITY_MASTER_DATA" VALUES ('Erstelle sonstiges Rechnungsdokument','Create Credit memo canceled','Custom',30,'VBRP.ERDAT + VBRP.ERZET');
INSERT INTO "CEL_O2C_ACTIVITY_MASTER_DATA" VALUES ('Ändere Angefragtes Warenausgangsdatum','Change Requested Goods Issue Date','Custom',30,'CDHDR.UDATE + CDHDR.UTIME');
INSERT INTO "CEL_O2C_ACTIVITY_MASTER_DATA" VALUES ('Ändere Bestätigte Warenausgangsmenge','Change Confirmed Quantity','Custom',30,'CDHDR.UDATE + CDHDR.UTIME');