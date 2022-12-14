CREATE TABLE BULUNUR
(
	siparis_id  VARCHAR(20) NOT NULL,
	sepet_id  VARCHAR(20) NOT NULL
)
;


CREATE UNIQUE INDEX XPKBULUNUR ON BULUNUR
(
	siparis_id,
	sepet_id
)
;


ALTER TABLE BULUNUR
	ADD  PRIMARY KEY (siparis_id,sepet_id)
;


CREATE TABLE EKLENIR
(
	sepet_id  VARCHAR(20) NOT NULL,
	urun_id  int NOT NULL,
	adet  INTEGER NULL
)
;


CREATE UNIQUE INDEX XPKEKLENIR ON EKLENIR
(
	sepet_id,
	urun_id
)
;


ALTER TABLE EKLENIR
	ADD  PRIMARY KEY (sepet_id,urun_id)
;


CREATE TABLE KART
(
	kart_id  VARCHAR(20) NOT NULL,
    kart_no CHAR(16) NOT NULL,
    kart_cvv CHAR(3) NOT NULL,
	kart_isim  VARCHAR(20) NULL
)
;


CREATE UNIQUE INDEX XPKKART ON KART
(
	kart_id
)
;


ALTER TABLE KART
	ADD  PRIMARY KEY (kart_id)
;


CREATE TABLE KULLANICI
(
	kullanici_id  VARCHAR(20) NOT NULL,
	isim  VARCHAR(20) NOT NULL,
	soyisim  VARCHAR(20) NOT NULL,
	email  VARCHAR(20) NULL,
	telno  VARCHAR(20) NULL,
	adres  VARCHAR(20) NULL,
	kullanici_adi  VARCHAR(20) NOT NULL ,
	sifre  VARCHAR(20) NOT NULL,
	admin_mi  INTEGER default 0 NOT NULL
)
;
ALTER TABLE KULLANICI
	ADD  PRIMARY KEY (kullanici_adi)
;

CREATE UNIQUE INDEX XPKKULLANICI ON KULLANICI
(
	kullanici_adi
)
;


CREATE TABLE MAGAZA
(
	magaza_id  VARCHAR(20) NOT NULL,
	isim  VARCHAR(20) NOT NULL,
	detay  VARCHAR(20) NULL,
	kategori  VARCHAR(20) NULL
)
;


CREATE UNIQUE INDEX XPKMAGAZA ON MAGAZA
(
	magaza_id
)
;


ALTER TABLE MAGAZA
	ADD  PRIMARY KEY (magaza_id)
;


CREATE TABLE ODEME
(
	odeme_id  VARCHAR(20) NOT NULL,
	tip  VARCHAR(20) NOT NULL,
	miktar  INTEGER NOT NULL,
	tarih  DATE NOT NULL,
	detay  VARCHAR(20) NULL
)
;


CREATE UNIQUE INDEX XPKODEME ON ODEME
(
	odeme_id
)
;


ALTER TABLE ODEME
	ADD  PRIMARY KEY (odeme_id)
;


CREATE TABLE OLUSTURUR
(
	kullanici_adi  VARCHAR(20) NOT NULL,
	sepet_id  VARCHAR(20) NOT NULL
)
;


CREATE UNIQUE INDEX XPKOLUSTURUR ON OLUSTURUR
(
	kullanici_adi,
	sepet_id
)
;


ALTER TABLE OLUSTURUR
	ADD  PRIMARY KEY (kullanici_adi,sepet_id)
;


CREATE TABLE SAHIPTIR
(
	kullanici_adi  VARCHAR(20) NOT NULL,
	kart_id  VARCHAR(20) NOT NULL
)
;


CREATE UNIQUE INDEX XPKSAHIPTIR ON SAHIPTIR
(
	kullanici_adi,
	kart_id
)
;


ALTER TABLE SAHIPTIR
	ADD  PRIMARY KEY (kullanici_adi,kart_id)
;


CREATE TABLE SATILIR
(
	magaza_id  VARCHAR(20) NOT NULL,
	urun_id  int NOT NULL,
	adet  INTEGER NULL
)
;


CREATE UNIQUE INDEX XPKSATILIR ON SATILIR
(
	magaza_id,
	urun_id
)
;


ALTER TABLE SATILIR
	ADD  PRIMARY KEY (magaza_id,urun_id)
;


CREATE TABLE SEPET
(
	sepet_id  VARCHAR(20) NOT NULL
)
;


CREATE UNIQUE INDEX XPKSEPET ON SEPET
(
	sepet_id
)
;


ALTER TABLE SEPET
	ADD  PRIMARY KEY (sepet_id)
;


CREATE TABLE SIPARIS
(
	siparis_id  VARCHAR(20) NOT NULL,
	detay  VARCHAR(20) NULL
)
;


CREATE UNIQUE INDEX XPKSIPARIS ON SIPARIS
(
	siparis_id
)
;


ALTER TABLE SIPARIS
	ADD  PRIMARY KEY (siparis_id)
;


CREATE TABLE TAMAMLANIR
(
	odeme_id  VARCHAR(20) NOT NULL,
	siparis_id  VARCHAR(20) NOT NULL
)
;


CREATE UNIQUE INDEX XPKTAMAMLANIR ON TAMAMLANIR
(
	odeme_id,
	siparis_id
)
;


ALTER TABLE TAMAMLANIR
	ADD  PRIMARY KEY (odeme_id,siparis_id)
;


CREATE TABLE URUN
(
	urun_id  int NOT NULL auto_increment primary key,
	detay  VARCHAR(256) NULL,
	kategori  VARCHAR(20) NULL,
	fiyat float not null,
	urun_isim VARCHAR(45) NOT NULL,	
	magaza_id VARCHAR(20) NOT NULL
)
;


CREATE UNIQUE INDEX XPKURUN ON URUN
(
	urun_id
)
;



CREATE TABLE VERIR
(
	siparis_id  VARCHAR(20) NOT NULL,
	kullanici_adi  VARCHAR(20) NOT NULL
)
;


CREATE UNIQUE INDEX XPKVERIR ON VERIR
(
	siparis_id,
	kullanici_adi
)
;


ALTER TABLE VERIR
	ADD  PRIMARY KEY (siparis_id,kullanici_adi)
;


CREATE TABLE YAPAR
(
	odeme_id  VARCHAR(20) NOT NULL,
	kullanici_adi  VARCHAR(20) NOT NULL
)
;


CREATE UNIQUE INDEX XPKYAPAR ON YAPAR
(
	odeme_id,
	kullanici_adi
)
;


ALTER TABLE YAPAR
	ADD  PRIMARY KEY (odeme_id,kullanici_adi)
;


CREATE TABLE YAPILIR
(
	odeme_id  VARCHAR(20) NOT NULL,
	kart_id  VARCHAR(20) NOT NULL
)
;


CREATE UNIQUE INDEX XPKYAPILIR ON YAPILIR
(
	odeme_id,
	kart_id
)
;


ALTER TABLE YAPILIR
	ADD  PRIMARY KEY (odeme_id,kart_id)
;


ALTER TABLE BULUNUR
	ADD FOREIGN KEY  (siparis_id) REFERENCES SIPARIS(siparis_id)
    ON DELETE CASCADE ON UPDATE CASCADE
;


ALTER TABLE BULUNUR
	ADD FOREIGN KEY  (sepet_id) REFERENCES SEPET(sepet_id)
    ON DELETE CASCADE ON UPDATE CASCADE
;


ALTER TABLE EKLENIR
	ADD FOREIGN KEY  (sepet_id) REFERENCES SEPET(sepet_id)
    ON DELETE CASCADE ON UPDATE CASCADE 
;


ALTER TABLE EKLENIR
	ADD FOREIGN KEY  (urun_id) REFERENCES URUN(urun_id)
    ON DELETE CASCADE ON UPDATE CASCADE
;


ALTER TABLE OLUSTURUR
	ADD FOREIGN KEY  (kullanici_adi) REFERENCES KULLANICI(kullanici_adi)
    ON DELETE CASCADE ON UPDATE CASCADE
;


ALTER TABLE OLUSTURUR
	ADD FOREIGN KEY  (sepet_id) REFERENCES SEPET(sepet_id)
    ON DELETE CASCADE ON UPDATE CASCADE
;


ALTER TABLE SAHIPTIR
	ADD FOREIGN KEY  (kullanici_adi) REFERENCES KULLANICI(kullanici_adi)
    ON DELETE CASCADE ON UPDATE CASCADE
;


ALTER TABLE SAHIPTIR
	ADD FOREIGN KEY  (kart_id) REFERENCES KART(kart_id)
    ON DELETE CASCADE ON UPDATE CASCADE
;


ALTER TABLE SATILIR
	ADD FOREIGN KEY  (magaza_id) REFERENCES MAGAZA(magaza_id)
    ON DELETE CASCADE ON UPDATE CASCADE
;


ALTER TABLE SATILIR
	ADD FOREIGN KEY  (urun_id) REFERENCES URUN(urun_id)
    ON DELETE CASCADE ON UPDATE CASCADE
;


ALTER TABLE TAMAMLANIR
	ADD FOREIGN KEY  (odeme_id) REFERENCES ODEME(odeme_id)
    ON DELETE CASCADE ON UPDATE CASCADE
;


ALTER TABLE TAMAMLANIR
	ADD FOREIGN KEY  (siparis_id) REFERENCES SIPARIS(siparis_id)
    ON DELETE CASCADE ON UPDATE CASCADE
;


ALTER TABLE VERIR
	ADD FOREIGN KEY  (siparis_id) REFERENCES SIPARIS(siparis_id)
    ON DELETE CASCADE ON UPDATE CASCADE
;


ALTER TABLE VERIR
	ADD FOREIGN KEY  (kullanici_adi) REFERENCES KULLANICI(kullanici_adi)
    ON DELETE CASCADE ON UPDATE CASCADE
;


ALTER TABLE YAPAR
	ADD FOREIGN KEY  (odeme_id) REFERENCES ODEME(odeme_id)
    ON DELETE CASCADE ON UPDATE CASCADE
;


ALTER TABLE YAPAR
	ADD FOREIGN KEY  (kullanici_adi) REFERENCES KULLANICI(kullanici_adi)
    ON DELETE CASCADE ON UPDATE CASCADE
;


ALTER TABLE YAPILIR
	ADD FOREIGN KEY  (odeme_id) REFERENCES ODEME(odeme_id)
    ON DELETE CASCADE ON UPDATE CASCADE
;


ALTER TABLE YAPILIR
	ADD FOREIGN KEY  (kart_id) REFERENCES KART(kart_id)
    ON DELETE CASCADE ON UPDATE CASCADE
;

