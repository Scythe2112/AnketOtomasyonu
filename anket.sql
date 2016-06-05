-- phpMyAdmin SQL Dump
-- version 2.10.3
-- http://www.phpmyadmin.net
-- 
-- Anamakine: localhost
-- Üretim Zamanı: 05 Ocak 2014 saat 17:08:44
-- Sunucu sürümü: 5.0.51
-- PHP Sürümü: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- Veritabanı: `anket`
-- 

-- --------------------------------------------------------

-- 
-- Tablo yapısı: `anket_anahat`
-- 

CREATE TABLE `anket_anahat` (
  `anket_id` int(11) NOT NULL auto_increment,
  `uye_id` int(11) NOT NULL,
  `tarih` varchar(45) collate utf8_unicode_ci NOT NULL,
  `durum` int(11) NOT NULL,
  `anket_ad` varchar(127) collate utf8_unicode_ci NOT NULL,
  `anket_aciklama` varchar(511) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`anket_id`),
  KEY `kullanici_id` (`uye_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=19 ;

-- 
-- Tablo döküm verisi `anket_anahat`
-- 

INSERT INTO `anket_anahat` VALUES (3, 8, '17/12/2013', 1, 'Şu an yayında olan en iyi dizi sizce hangisi?', 'Yok');
INSERT INTO `anket_anahat` VALUES (6, 8, '18/12/2013', 1, 'Hangi takımı tutuyorsunuz?', 'ddafaf afwada');
INSERT INTO `anket_anahat` VALUES (9, 8, '16/12/2013', 1, 'Türk futbol tarihinin gelmiş geçmiş en başarılı oyuncusu sizce kimdir?', 'dadaw dawdawd ');
INSERT INTO `anket_anahat` VALUES (12, 8, '18/12/2013', 1, 'Sizce en iyi komedyen hangisi?', 'dawdwad adawd aw d');
INSERT INTO `anket_anahat` VALUES (15, 8, '15/12/2013', 1, 'Küçükken size sorulan ne olmak istersin sorusuna ne cevap verirdiniz?', 'dawdawd awdaw dwa');
INSERT INTO `anket_anahat` VALUES (18, 10, '05/01/2014', 1, 'Uefa Şampiyonlar Ligi şampiyonu kim olur?', 'awdawda afefa awdawdawd');

-- --------------------------------------------------------

-- 
-- Tablo yapısı: `anket_icerik`
-- 

CREATE TABLE `anket_icerik` (
  `anket_icerik_id` int(11) NOT NULL auto_increment,
  `anket_id` int(11) NOT NULL,
  `soru_id` int(11) NOT NULL,
  PRIMARY KEY  (`anket_icerik_id`),
  KEY `anket_id` (`anket_id`),
  KEY `soru_id` (`soru_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

-- 
-- Tablo döküm verisi `anket_icerik`
-- 

INSERT INTO `anket_icerik` VALUES (3, 3, 3);
INSERT INTO `anket_icerik` VALUES (4, 3, 6);
INSERT INTO `anket_icerik` VALUES (5, 6, 9);
INSERT INTO `anket_icerik` VALUES (6, 9, 12);
INSERT INTO `anket_icerik` VALUES (7, 12, 15);
INSERT INTO `anket_icerik` VALUES (8, 15, 18);
INSERT INTO `anket_icerik` VALUES (9, 18, 21);

-- --------------------------------------------------------

-- 
-- Tablo yapısı: `cevap`
-- 

CREATE TABLE `cevap` (
  `cevap` varchar(45) collate utf8_unicode_ci NOT NULL,
  `cevap_resim` varchar(45) collate utf8_unicode_ci default NULL,
  `soru_tur` int(11) NOT NULL,
  `soru_id` int(11) NOT NULL,
  `cevap_id` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`cevap_id`),
  KEY `soru_tur` (`soru_tur`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=63 ;

-- 
-- Tablo döküm verisi `cevap`
-- 

INSERT INTO `cevap` VALUES ('Muhteşem Yüzyıl', '', 1, 3, 21);
INSERT INTO `cevap` VALUES ('Deliyürek', '', 1, 3, 19);
INSERT INTO `cevap` VALUES ('Aşk-ı Memnu', '', 1, 3, 20);
INSERT INTO `cevap` VALUES ('Leyla İle Mecnun', '', 1, 3, 18);
INSERT INTO `cevap` VALUES ('Ben de Özledim', '', 1, 3, 17);
INSERT INTO `cevap` VALUES ('Kurtlar Vadisi Pusu', '', 1, 3, 15);
INSERT INTO `cevap` VALUES ('Karadayı', '', 1, 3, 16);
INSERT INTO `cevap` VALUES ('Dila Hanım', '', 1, 3, 22);
INSERT INTO `cevap` VALUES ('Ali Atay', '', 1, 6, 23);
INSERT INTO `cevap` VALUES ('Kenan İmirzalioğlu', '', 1, 6, 24);
INSERT INTO `cevap` VALUES ('Burak Özcivit', '', 1, 6, 25);
INSERT INTO `cevap` VALUES ('Halit Ergenç', '', 1, 6, 26);
INSERT INTO `cevap` VALUES ('Necati Şaşmaz', '', 1, 6, 27);
INSERT INTO `cevap` VALUES ('Mehmet Günsür', '', 1, 6, 28);
INSERT INTO `cevap` VALUES ('Beşiktaş', '', 1, 9, 29);
INSERT INTO `cevap` VALUES ('Galatasaray', '', 1, 9, 30);
INSERT INTO `cevap` VALUES ('Fenerbahçe', '', 1, 9, 31);
INSERT INTO `cevap` VALUES ('Trabzonspor', '', 1, 9, 32);
INSERT INTO `cevap` VALUES ('Bursaspor', '', 1, 9, 33);
INSERT INTO `cevap` VALUES ('Diğer', '', 1, 9, 34);
INSERT INTO `cevap` VALUES ('Metin Oktay', '', 1, 12, 35);
INSERT INTO `cevap` VALUES ('Lefter Küçükandoryanis', '', 1, 12, 36);
INSERT INTO `cevap` VALUES ('Hakkı Yeten', '', 1, 12, 37);
INSERT INTO `cevap` VALUES ('Hakan Şükür', '', 1, 12, 38);
INSERT INTO `cevap` VALUES ('Sergen Yalçın', '', 1, 12, 39);
INSERT INTO `cevap` VALUES ('Aykut Kocaman', '', 1, 12, 40);
INSERT INTO `cevap` VALUES ('Cem Yılmaz', '', 1, 15, 41);
INSERT INTO `cevap` VALUES ('Yılmaz Erdoğan', '', 1, 15, 42);
INSERT INTO `cevap` VALUES ('Eser Yenenler', '', 1, 15, 43);
INSERT INTO `cevap` VALUES ('Tolga Çevik', '', 1, 15, 44);
INSERT INTO `cevap` VALUES ('Ata Demirer', '', 1, 15, 45);
INSERT INTO `cevap` VALUES ('Astronot', '', 1, 18, 46);
INSERT INTO `cevap` VALUES ('Öğretmen', '', 1, 18, 47);
INSERT INTO `cevap` VALUES ('Doktor', '', 1, 18, 48);
INSERT INTO `cevap` VALUES ('Hemşire', '', 1, 18, 49);
INSERT INTO `cevap` VALUES ('Mühendis', '', 1, 18, 50);
INSERT INTO `cevap` VALUES ('Anne', '', 1, 18, 51);
INSERT INTO `cevap` VALUES ('Baba', '', 1, 18, 52);
INSERT INTO `cevap` VALUES ('Kaptan', '', 1, 18, 53);
INSERT INTO `cevap` VALUES ('Pilot', '', 1, 18, 54);
INSERT INTO `cevap` VALUES ('Barcelona', '', 1, 21, 55);
INSERT INTO `cevap` VALUES ('Real Madrid', '', 1, 21, 56);
INSERT INTO `cevap` VALUES ('Galatasaray', '', 1, 21, 57);
INSERT INTO `cevap` VALUES ('Chelsea', '', 1, 21, 58);
INSERT INTO `cevap` VALUES ('Milan', '', 1, 21, 59);
INSERT INTO `cevap` VALUES ('Bayern Münih', '', 1, 21, 60);
INSERT INTO `cevap` VALUES ('Borussia Dortmund', '', 1, 21, 61);
INSERT INTO `cevap` VALUES ('Arsenal', '', 1, 21, 62);

-- --------------------------------------------------------

-- 
-- Tablo yapısı: `soru`
-- 

CREATE TABLE `soru` (
  `soru_id` int(11) NOT NULL,
  `soru` varchar(156) collate utf8_unicode_ci NOT NULL,
  `soru_resim` varchar(45) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`soru_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Tablo döküm verisi `soru`
-- 

INSERT INTO `soru` VALUES (6, 'En iyi Erkek Oyuncu ?', '');
INSERT INTO `soru` VALUES (3, 'Size Göre Şuan En iyi dizi Hangisi ?', '');
INSERT INTO `soru` VALUES (9, 'Hangi takımı tutuyorsunuz?', '');
INSERT INTO `soru` VALUES (12, 'Türk futbol tarihinin gelmiş geçmiş en başarılı oyuncusu sizce kimdir?', '');
INSERT INTO `soru` VALUES (15, 'Sizce en iyi komedyen hangisi?', '');
INSERT INTO `soru` VALUES (18, 'Küçükken size sorulan ne olmak istersin sorusuna ne cevap verirdiniz?', '');
INSERT INTO `soru` VALUES (21, 'Uefa Şampiyonlar Ligi şampiyonu kim olur?', '');

-- --------------------------------------------------------

-- 
-- Tablo yapısı: `soru_turu`
-- 

CREATE TABLE `soru_turu` (
  `soru_turu_id` int(11) NOT NULL,
  `tur_ad` varchar(45) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`soru_turu_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Tablo döküm verisi `soru_turu`
-- 


-- --------------------------------------------------------

-- 
-- Tablo yapısı: `uye`
-- 

CREATE TABLE `uye` (
  `uye_id` int(11) NOT NULL auto_increment,
  `uye_ad` varchar(45) collate utf8_unicode_ci NOT NULL,
  `uye_soyad` varchar(45) collate utf8_unicode_ci NOT NULL,
  `uye_sifre` varchar(45) collate utf8_unicode_ci NOT NULL,
  `uye_eposta` varchar(45) collate utf8_unicode_ci NOT NULL,
  `uye_sehir` varchar(25) collate utf8_unicode_ci default NULL,
  `uye_yas` int(3) default NULL,
  `uye_yetki` int(2) NOT NULL,
  `uye_cinsiyet` varchar(10) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`uye_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=21 ;

-- 
-- Tablo döküm verisi `uye`
-- 

INSERT INTO `uye` VALUES (11, 'meltem', 'ozel', '123456', 'meltem', '', 19, 1, 'Bayan');
INSERT INTO `uye` VALUES (10, 'mehmet', 'bakir', '123456', 'mehmet', 'Erzincan', 20, 2, 'Bay');
INSERT INTO `uye` VALUES (9, 'yusuf', 'ugurlu', '123456', 'yusuf', '', 20, 1, 'Bay');
INSERT INTO `uye` VALUES (8, 'ayse', 'yesari', '123456', 'ayse', 'Adana', 20, 2, 'Bayan');
INSERT INTO `uye` VALUES (6, 'nurettin', 'toparli', '123456', 'nurettin', 'mardin', 22, 3, 'Bay');
INSERT INTO `uye` VALUES (17, 'yusuf', 'ugurlu', '123456', 'viranyusuf63@gmail.com', 'Şanlıurfa', 20, 2, 'Bay');
INSERT INTO `uye` VALUES (19, 'Nurettin', 'Toparli', '123456', 'nurettintoparli@hotmail.com', 'Mardin', 21, 1, 'Bay');
INSERT INTO `uye` VALUES (20, 'Mustafa', 'Karatas', 'mka1881', 'mustafakaratas92@hotmail.com', 'Adana', 21, 2, 'Bay');

-- --------------------------------------------------------

-- 
-- Tablo yapısı: `uye_aktif`
-- 

CREATE TABLE `uye_aktif` (
  `uye_id` int(11) NOT NULL auto_increment,
  `uye_email` varchar(128) collate utf8_unicode_ci NOT NULL,
  `uye_sifre` varchar(19) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`uye_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

-- 
-- Tablo döküm verisi `uye_aktif`
-- 


-- --------------------------------------------------------

-- 
-- Tablo yapısı: `uye_cevap`
-- 

CREATE TABLE `uye_cevap` (
  `uye_cevap_id` int(11) NOT NULL auto_increment,
  `uye_id` int(11) NOT NULL,
  `anket_id` int(11) NOT NULL,
  `soru_id` int(11) NOT NULL,
  `cevap_id` int(11) NOT NULL,
  `soru_tur` int(11) NOT NULL,
  PRIMARY KEY  (`uye_cevap_id`),
  KEY `uye_id` (`uye_id`),
  KEY `anket_id` (`anket_id`),
  KEY `soru_id` (`soru_id`),
  KEY `cevap_id` (`cevap_id`),
  KEY `soru_tur` (`soru_tur`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=49 ;

-- 
-- Tablo döküm verisi `uye_cevap`
-- 

INSERT INTO `uye_cevap` VALUES (48, 8, 3, 6, 23, 1);
INSERT INTO `uye_cevap` VALUES (47, 8, 3, 3, 18, 1);

-- --------------------------------------------------------

-- 
-- Tablo yapısı: `uye_sonuc`
-- 

CREATE TABLE `uye_sonuc` (
  `uye_sonuc_id` int(11) NOT NULL auto_increment,
  `uye_id` int(11) NOT NULL,
  `anket_id` int(11) NOT NULL,
  `giris_zaman` varchar(45) collate utf8_unicode_ci NOT NULL,
  `giris_ip` varchar(45) collate utf8_unicode_ci default NULL,
  `anket_begeni` smallint(2) default NULL,
  PRIMARY KEY  (`uye_sonuc_id`),
  KEY `uye_id` (`uye_id`),
  KEY `anket_id` (`anket_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=55 ;

-- 
-- Tablo döküm verisi `uye_sonuc`
-- 

INSERT INTO `uye_sonuc` VALUES (54, 8, 3, '0/0/2013', '127.0.0.1', NULL);

-- --------------------------------------------------------

-- 
-- Tablo yapısı: `yorum`
-- 

CREATE TABLE `yorum` (
  `yorum_id` int(11) NOT NULL auto_increment,
  `anket_id` int(11) NOT NULL,
  `uye_id` int(11) NOT NULL,
  `yorum` varchar(512) collate utf8_unicode_ci NOT NULL,
  `yorum_durum` int(2) NOT NULL,
  PRIMARY KEY  (`yorum_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=18 ;

-- 
-- Tablo döküm verisi `yorum`
-- 

INSERT INTO `yorum` VALUES (17, 12, 10, 'Ata Demirer <3', 1);
INSERT INTO `yorum` VALUES (16, 15, 8, 'Tabiki Doktor :)', 1);
INSERT INTO `yorum` VALUES (15, 12, 8, 'tabiki Tolga Çevik şçğı :)', 1);
