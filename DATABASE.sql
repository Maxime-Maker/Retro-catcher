
--! Creation de la base de donnée.
CREATE DATABASE Retro_Catcher;


--! Gestion des roles et conditions pour les tables.
CREATE TYPE user_role AS ENUM ('admin', 'user');
CREATE TYPE type_console AS ENUM('home','handheld');

--! Creation de la table Users.
CREATE TABLE users(
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
password VARCHAR(255) NOT NULL,
  CHECK (char_length(name) >= 3 AND char_length(name) <= 50),
  CHECK (char_length(password) >= 6),
  role user_role NOT NULL DEFAULT 'user'
);

--!Creation de la table consoles.
CREATE TABLE consoles(
    console_id SERIAL PRIMARY KEY,
    name_console VARCHAR(50) NOT NULL,
    brand VARCHAR(50) NOT NULL,
    release_date DATE,
   type_console VARCHAR(50),
    about VARCHAR,
    url_image VARCHAR(250)
    
);

--! Creation table favoris

CREATE TABLE favoris(
    favoris_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    console_id INT REFERENCES consoles(console_id)
);


--!Commande pour l'insertion de données sql dans la tables Consoles.
    INSERT INTO consoles(name_console,brand,release_date,type_console,about,url_image)
VALUES
('Goldstar/LG 3DO','3DO','1993/10/3','home_console','Le modèle de Goldstar ressemble beaucoup aux dessins et schémas qui étaient présentés par 3DO lors de la genèse de leur machine.
C est donc une machine assez grosse, avec un lecteur de CD à tiroir.','images/3DO/Home Console/3-Gold.png'),
('Sanyo 3DO','3DO','1993/10/3','home_console','La Panasonic 3DO Interactive Multiplayer était une console de jeu vidéo lancée en 1993, qui avait pour objectif de concurrencer les consoles de jeu de Sega et Nintendo. Cette console était produite par la société japonaise Panasonic, en partenariat avec plusieurs autres entreprises, telles que Goldstar et Sanyo.','images/3DO/Home Console/3-Sanyo.png'),
('Atari Lynx','Atari','1989/10/11','handheld','L Atari Lynx fut la seule console portable d Atari et la première portable avec un écran LCD couleur. Elle est sortie en 1989, la même année que le Game Boy (original monochrome) de Nintendo.','images/Atari/Handheld/A - Atari Lynx.png'),
('Atari C-XXX','Atari','1977/10/14','Home Console','L Atari 2600 est lancée en octobre 1977 au prix de 199 USD (de l époque), livrée avec une paire de joysticks et le jeu Combat3. C est la troisième console à cartouches, après la Channel F de Fairchild et la RCA Studio II, commercialisée un an plus tôt (les précédentes consoles du marché intègrent un ou plusieurs jeux sans la possibilité d en adjoindre d autres). À l origine, le nom de la console est Atari VCS, pour Video Computer System. Le nom Atari 2600 est utilisé pour la première fois en 1982 lors de la sortie de l Atari 5200. Avec entre 25 et 40 millions d unités vendues, l Atari 2600 est la console la plus populaire de sa génération2. Le succès est historique, marquant l avènement d un marché de masse pour le jeu vidéo. La console rapporte beaucoup d argent à la société Atari jusqu en 1983 et la crise du marché du jeu vidéo aux États-Unis. Vendue principalement aux États-Unis et en Europe, elle est produite jusqu en 1991, ce qui constitue un record de longévité sur les marchés occidentaux.','images/Atari/Home Console/A - Atari 2600.png'),
('Atari 5200','Atari','1982/01/01','Home Console','L Atari 5200 est une console de jeux vidéo de deuxième génération produite par Atari sortie en 1982 uniquement aux États-Unis. Elle est créée dans le but de concurrencer les consoles ColecoVision et Intellivision qui à cette époque sont les plus puissantes et les moins chères du marché.
L Atari 5200 n est jamais sortie en France car sa grande sœur l Atari 2600, sortie en 1977 aux États-Unis, ne sort en Europe qu en septembre 1981 alors que la 5200 est déjà en phase de conception pour les États-Unis pour 1982. Le trop faible temps de présence de la 2600 en France, avec près d une génération de retard sur les États-Unis, ajouté au fait que la 5200 fut un échec commercial aux États-Unis contrairement à la Atari 2600, n incite pas Atari à sortir sa 5200 en France, qui attend alors 1990 avec l Atari 7800 pour revenir sur le vieux continent.
La console se veut innovante à l époque grâce à ses quatre ports manettes de série, et son tiroir de rangement pour ces dernières. Ces éléments ne seront toutefois pas suffisant et la console sera un échec commercial.','images/Atari/Home Console/A - Atari 5200.png'),
('Atari 7800','Atari','1986/06/23','Home Console','L Atari 7800 est une console de jeux vidéo 8-bit de troisième génération, conçue et commercialisée par le constructeur américain Atari. Elle est sortie début 1986 aux États-Unis, puis dans le courant de l année au Japon et seulement en 1991 en France.

Succédant à l Atari 5200, l Atari 7800 sort comme concurrente à la Nintendo Entertainment System (NES) et à la Sega Master System pendant l ère des consoles de jeux vidéo de troisième génération. Toutefois, la console ne rivalisera jamais réellement avec ses concurrentes.','images/Atari/Home Console/A - Atari 7800.png'),

('Atari 5200','Atari','1982/01/01','Home Console','L Atari 5200 est une console de jeux vidéo de deuxième génération produite par Atari sortie en 1982 uniquement aux États-Unis. Elle est créée dans le but de concurrencer les consoles ColecoVision et Intellivision qui à cette époque sont les plus puissantes et les moins chères du marché.
L Atari 5200 n est jamais sortie en France car sa grande sœur l Atari 2600, sortie en 1977 aux États-Unis, ne sort en Europe qu en septembre 1981 alors que la 5200 est déjà en phase de conception pour les États-Unis pour 1982. Le trop faible temps de présence de la 2600 en France, avec près d une génération de retard sur les États-Unis, ajouté au fait que la 5200 fut un échec commercial aux États-Unis contrairement à la Atari 2600, n incite pas Atari à sortir sa 5200 en France, qui attend alors 1990 avec l Atari 7800 pour revenir sur le vieux continent.
La console se veut innovante à l époque grâce à ses quatre ports manettes de série, et son tiroir de rangement pour ces dernières. Ces éléments ne seront toutefois pas suffisant et la console sera un échec commercial.','images/Atari/Home Console/A - Atari 5200.png'),

('Atari XEGS','Atari','1987/01/23','Home Console','L Atari XE Video Game System (Atari XEGS) est une console de jeux vidéo commercialisée par Atari Corporation en 1987. Elle est basée sur l architecture de l ordinateur 8-bit Atari 65XE et compatible avec la gamme de logiciels et jeux pour ordinateurs 8-bit d Atari. La console est bien-sûr capable d agir en tant que console de jeux, mais aussi en tant qu ordinateur personnel via le branchement d un clavier de la gamme Atari XEGS. En mode ordinateur personnel, l Atari XEGS peut utiliser la majorité des périphériques commercialisés pour la gamme des ordinateurs 8-bit d Atari. La console a été commercialisée en version standard comprenant la console et un joystick et en version deluxe avec en plus un clavier et un pistolet optique','images/Atari/Home Console/A - Atari Xegs.png'),
('Atari Jaguar','Atari','1993/11/23','Home Console','La Jaguar est une console de jeux vidéo de salon à cartouches datant de 1993, disposant d une ludothèque limitée, et qui n a pas connu un grand succès malgré sa technologie innovante. C est l avant-dernière console produite par Atari Corporation','images/Atari/Home Console/A - Atari Jaguar.png'),
('Atari Jaguar CD','Atari','1994/01/01','Home Console','Le Jaguar CD est un périphérique pour la Jaguar d Atari, permettant la lecture de CD-ROM.','images/Atari/Home Console/A - Atari Jaguar CD.png'),

('Atari Jaguar','Atari','1993/11/23','Home Console','La Jaguar est une console de jeux vidéo de salon à cartouches datant de 1993, disposant d une ludothèque limitée, et qui n a pas connu un grand succès malgré sa technologie innovante. C est l avant-dernière console produite par Atari Corporation','images/Atari/Home Console/A - Atari Jaguar.png'),

('RX 78','Bandia','1983/01/01','Home Console','
Il s agit d un ordinateur personnel créé par Bandai en 1983 et qui sortit sous le nom de Gundam RX-78, le nom "Gundam" provient du célèbre manga du même nom.
Cet ordinateur disposait de 2 slots cartouche au dos du système. Un slot était souvent utilisé par le langage de programmation BS Basic et l autre pour les cartouches d extension (pour connecter une imprimante par exemple).
La cartouche BS-Basic était équipée de connecteurs pour brancher un magnétophone sur le RX-78.','images/Bandai/Home Console/B - RX78.png'),

('Playdia','Bandai','1994/09/23','Home Console','
La Playdia est une console de jeux vidéo 8 bits créée par la société Bandai et sortie en 1994 uniquement au Japon.

Les jeux, basés sur les licences de Bandai, reposent sur des vidéos interactives. Son unique contrôleur infrarouge se range directement dans la façade de la console. Conçue spécialement pour les enfants, grâce à ses commandes plus que simples, ce fut la seule console de salon de Bandai. Les critiques de l époque évoquent une qualité vidéo exceptionnelle (pour l époque) mais une interactivité très limitée. Le prix lors du lancement approchait les 300 $ américains.','images/Bandai/Home Console/B - Play.png'),

('Pippin','Bandai','1996/03/28','Home Console','
La Pipp!n ou Pippin (également appelée Bandai Pippin ou Bandai Pipp!n) est une console de jeux vidéo conçue par Apple et commercialisée en 19962 par Bandai. Apple ayant opté pour une technologie ouverte, elle fut construite par différentes entreprises. La principale fut Bandai, qui en vendit près de 45 000. Bandai arrête l exploitation de la Pipp!n en mars 1997.

Elle innovait en étant constituée d éléments matériels et logiciels provenant de la micro-informatique. L idée était de créer un ordinateur destiné aux jeux vidéo, mais possédant quelques caractéristiques d un ordinateur de bureau, dont la navigation sur internet.','images/Bandai/Home Console/B - Pipin.png'),

('LCD Solarpower','Bandai','1990/01/01','Handheld','
Jeu LCD "La Grande Évasion" (Breakout) - Bandai Electronics.

Fonctionne à l énergie solaire.','images/Bandai/Handheld/BHH - Solar.png'),
('WonderSwan','Bandai','1999/03/04','Handheld','
La WonderSwan est une console de jeux vidéo portable, créée par Koto Laboratory — fondé par Gunpei Yokoi — et vendue par Bandai. Console de sixième génération, elle sort en 1999 et sera remplacée les années suivantes par la WonderSwan Color et la SwanCrystal avant de disparaitre du marché en 2003.

Équipé d un processeur 16 bits, elle se positionne comme une alternative à la Game Boy Color et la Neo-Geo Pocket sorties la même année.','images/Bandai/Handheld/BHH - WonderSwan.png'),

('SwanCrystal','Bandai','2002/07/09','Handheld','
On ne peut pas vraiment parler de nouvelle console, mais plutôt d une version plus évoluée. En effet, la Swan Crystal, par rapport à sa grande sœur la Wonderswan Color, ne propose que peu de nouveautés. La première est sans conteste la présence d un écran TFT, c est-à-dire à matrice active, bien plus sympathique que la matrice passive de la Wonderswan Color. Au passage, la molette de réglage du contraste a disparu, mais elle ne manque que très peu, l écran étant assez lisible. Il ne faut tout de même pas trop en demander puisque ce dernier n est pas rétro éclairé. Par contre, aucune amélioration technique n a eu lieu, le processeur reste le même, de même que les capacités sonores ou la quantité de mémoire vive.
','images/Bandai/Handheld/BHH - WonderSwan Crystal.png'),

('PV-1000','Bandai','1983/10/01','Home Console','
La PV-1000  est une console de jeux vidéo à cartouches produite par Casio et sortie au Japon en 1983.

La PV-1000 est alimentée par un microprocesseur Z80A, et dispose de 2 KB de mémoire vive, dont 1 KB consacré à son générateur de caractères. Elle offre une définition de 256 x 192 pixels en huit couleurs. La console est sortie en même temps qu un ordinateur connu sous le nom de PV-2000, qui est compatible avec les contrôleurs de la PV-1000 mais pas avec ses jeux. La même année, Casio a sorti deux autres consoles, le PV-7 et le PV-16, deux ordinateurs MSX. La PV-1000 était vendue 14 800 yens à sa sortie.

Casio échoue à atteindre une part de marché significative. Il est dit que[pas clair] la console a été retirée des rayons après seulement quelques semaines, ce qui en fait une machine extrêmement rare
','images/Casio/Home Console/C - PV.png'),

('Loopy','Casio','1995/10/19','Home Console','
La Casio Loopy , sous-titrée « My Seal Computer SV-100 », est une console de jeux vidéo à cartouches produite par Casio et sortie uniquement au Japon. Sortie en octobre 19951, le marketing ciblait principalement les joueuses, ce qui la rendait unique en ce sens.

La console contient une imprimante couleur thermique pouvant être utilisée pour créer des autocollants à partir de captures d écran de jeu. Un accessoire optionnel, appelé Magical Shop, permet à la console de pouvoir utiliser des périphériques externes (tels que les magnétoscopes ou des lecteurs de DVD) afin d obtenir des images d eux, d ajouter du texte, et de créer des autocollants à partir de ces dispositifs. En incluant le Magical Shop, qui intègre son propre logiciel, la ludothèque de la Loopy contient 11 titres2. La console dispose d un port de manette compatible avec un contrôleur de jeu standard ou avec une souris (vendue séparément).
','images/Casio/Home Console/C - Loopy.png'),

('Intellivison','Mattel','1979/01/01','Home Console','
L Intellivision, mot-valise formé à partir de Intelligent Television, a été développé par la division électronique de Mattel, une filiale formée spécialement pour le développement des jeux électroniques1. La mise en marché expérimentale de la console a eu lieu à Fresno en Californie en 1979 avec au total quatre jeux disponibles1. Elle sortit dans l ensemble des États-Unis en 1980 au prix de 299 $ et avec le jeu Las Vegas Poker & Blackjack fourni en standard.
','images/Mattel/Home Console/M - Instel.png'),

('Aquarius','Mattel','1983/01/01','Home Console','
Aquarius est un ordinateur personnel produit par Mattel Electronics en 1983.

Il était équipé d un processeur Zilog Z80, de 4 kio de RAM extensible jusqu à 52 k et disposait d un interpréteur BASIC en ROM1. Il pouvait recevoir un écran et un lecteur de cassettes spécifiques, une extension de ports permettant de brancher deux manettes. Peu après son lancement, Mattel annonçait l arrivée d accessoires supplémentaires : un modem 300 baud, un lecteur de disquette et un module de contrôle X-10 dédié à la domotique2.

Il existe un modèle Aquarius II3. doté de 20 ko de RAM4.
','images/Mattel/Home Console/M - Aqua.png'),

('Mattel Electronics','Mattel','1977/01/01','Handheld','
Mattel Electronics est un jeu électronique de poche sorti en 1977 et produit par Mattel. Il s agit du premier produit d une longue série de jeux Mattel Electronics. Auto Race est considéré comme le premier jeu électronique entièrement numérique, n intégrant pas de composants mécaniques autres que l interrupteur et les contrôleurs1.
','images/Mattel/Handheld/M - Electroc.png'),

('HyperScan','Mattel','2006/01/01','Handheld','
L HyperScan est une console de jeux vidéo développée et produite par Mattel, sortie en 20061. Elle utilise la radio-identification (RFID) couplée avec la technologie du jeu vidéo traditionnel.

L HyperScan n a pas suscité un grand intérêt. Très vite après sa sortie, elle prit le chemin des solderies1. La fabrication de la console est arrêtée peu de temps après.
','images/Mattel/Handheld/M - Hyper.png'),

('Xbox','microsoft','2002/03/14','Home Console','
La Xbox de Microsoft est une console de jeux vidéo sortie aux États-Unis le 15 novembre 2001. Microsoft fait ses premiers pas dans ce secteur, après avoir collaboré avec Sega pour porter Windows CE sur Dreamcast, et après avoir développé depuis plusieurs années des jeux Microsoft Game Studios et des accessoires de jeux vidéo SideWinder pour les PC sous Windows.

La différence avec un PC est qu une Xbox ne peut à l origine exécuter que des programmes Xbox provenant d un média au format propriétaire Microsoft sur DVD, format qui n est lisible que par le lecteur DVD de la Xbox.
','images/Microsoft/Home Console/MS - Xbox.png'),

('Xbox 360','microsoft','2005/12/02','Home Console','
La Xbox 360 est une console de jeux vidéo développée par Microsoft, en coopération avec IBM, ATI Technologies, Samsung et SiS. Elle succède à la Xbox, et elle concurrence, dans la lignée des consoles de jeux vidéo de septième génération, la Wii de Nintendo et la PlayStation 3 de Sony.

En date du 23 avril 2016, les chiffres donnent 85,80 millions d exemplaires vendus à travers le monde.
','images/Microsoft/Home Console/MS - 360.png'),

('Xbox One','microsoft','2013/11/22','Home Console','
La Xbox One est une console de jeux vidéo de huitième génération développée par Microsoft. Dévoilée le 21 mai 2013, elle succède à la Xbox 360 et se place en concurrence frontale avec la PlayStation 4 de Sony, et plus indirectement avec la Wii U puis la Switch de Nintendo. Elle est disponible le 22 novembre 2013 dans treize pays et en septembre 2014 dans vingt-six autres pays. D abord uniquement commercialisée avec Kinect, Microsoft propose la console seule à partir du 9 juin 2014.
','images/Microsoft/Home Console/MS - One.png'),

('Xbox One X','microsoft','2017/11/07','Home Console','
Pour résumer et éclaircir : le processeur sera 30% plus rapide que celui de la XBOX ONE. La carte graphique sera 4.6 fois plus puissante que celle de la XBOX ONE. La One X a aussi beaucoup plus de mémoire RAM pour les jeux, et de bien meilleure qualité, ce qui autorise les 60 fps en 4K. Sur le papier, cette nouvelle console est un monstre de puissance, bien au-dessus du reste.
','images/Microsoft/Home Console/MS - One X.png'),

('TurboGrafx-16','Nec','1987/10/30','Home Console','
La PC-Engine , connue sous le nom TurboGrafx-16 en Amérique du Nord, est une console de jeux vidéo 8 bits fabriquée par NEC et commercialisée à partir de 1987 au Japon. En dehors de son pays natal et du territoire nord-américain, la gamme de consoles a connu une existence relativement confidentielle, car peu ou pas distribuée.

En avance sur son temps, la PC-Engine possède un processeur central 8 bits et un processeur graphique 16 bits, ainsi elle est considérée comme une console de quatrième génération. Conçue pour être modulaire et évolutive, c est aussi la première console de jeux de l histoire à utiliser dès décembre 1988, le support des CD-ROMs, grâce à un lecteur en option. Après le premier modèle d origine, elle fut déclinée dans de nombreuses versions pour finir par accepter quatre formats de jeux différents : HuCard, CD-ROM², Super CD-ROM² et Arcade CD-ROM².
','images/NEC/Home Console/N - Turbo.png'),

('TurboDuo','Nec','1993/05/01','Home Console','
La TurboDuo est une console de jeux vidéo de quatrième génération développée par NEC Home Electronics et Hudson Soft pour le marché nord-américain. Le TurboDuo a été testé sur le marché à Los Angeles en octobre 1992, avant un déploiement national en mai 1993.
','images/NEC/Home Console/N - TurboDuo.png'),


('TurboDuo','Nec','1993/05/01','Home Console','
La PC-FX  est une console de jeux vidéo 32 bits, développée par NEC. Elle est commercialisée à partir du 23 décembre 1994, soit quelques semaines après la PlayStation de Sony et un mois après la Sega Saturn. Pensée pour succéder à la PC-Engine et à la SuperGrafX, ses jeux sont au format CD-ROM.
','images/NEC/Home Console/N - PCFX.png'),


('Neo-Geo','Neo','1990/04/26','Home Console','
La Neo-Geo, appelée aussi Neo Geo Advanced Entertainment System, est une console de jeu vidéo sortie en 1990 à la location et en 1991 à la vente.

Conçue par la société japonaise SNK, elle a la particularité d être, d un point de vue technique, strictement identique au système d arcade Neo-Geo MVS, avec lequel elle partage une ludothèque commune. La console est connue pour sa ludothèque de jeu d arcade 2D de qualité, dont une grande partie sont des jeux de combat, ainsi que pour son prix très élevé et par sa très grande longévité. Au vu de son prix et de ses caractéristiques par rapport aux consoles concurrentes de la même époque, elle est considérée par certains observateurs comme la « Rolls Royce » des consoles1.
','images/NEC/Home Console/NeoGeoAes.png'),

('Neo-Geo CD','Neo','1994/09/09','Home Console','
La Neo-Geo CD  est une console de jeux vidéo lancée le 9 septembre 1994 au Japon par SNK. Elle est basée sur l architecture de la Neo-Geo AES et Neo-Geo MVS, mais utilise des CD-ROM à la place des cartouches, ceci dans le but de réduire le prix de vente des jeux.
','images/NEC/Home Console/NeoGeoCd.png'),

('Sega SG X000','Sega','1983/07/15','Home Console','
La SG-1000 ( Sega Game 1000 ) est donc la toute première console de jeu vidéo fabriquée par Sega. Elle fût lancée le 15 Juillet 1983 au Japon, soit le même jour que la Famicom ! Son prix de lancement était de 15 000 Yens. Sega s assure d avoir une ludothèque attirante dès le début grâce à la réputation de ses hits d arcade. Ainsi sortent des jeux comme Monaco GP ou bien encore Congo Bongo. Au total douze jeux sont disponibles dès le début.

Au niveau des spécifications, techniques, elles sont similaires à celles de la Coleco Vision de CBS sortie un an auparavant sur le marché américain. En effet Sega a utilisé un processeur principal fabriqué par NEC, le 780C, qui n est autre qu un clone du Zilog Z80 utilisé sur la Coleco Vision .
','images/Sega/Home Console/S - SG X000.png'),

('Sega Master System','Sega','1985/10/20','Home Console','
La Master System  ou Sega Master System (aussi abrégé SMS) est une console de jeux vidéo de troisième génération, conçue et commercialisée par le constructeur japonais Sega Enterprises, Ltd. Elle sort en 1985, sous le nom Sega Mark III au Japon. La console est redessinée et rebaptisée Master System avant son lancement en 1986 en Amérique du Nord. Elle sort sous ce nom sur la plupart des autres territoires, dont l Europe en 1986 et le Brésil en 1987. Le modèle remanié de la Master System sort également en 1987 au Japon.
','images/Sega/Home Console/S  - MS.png'),

('Sega Genesis Mega Drive','Sega','1988/10/29','Home Console','
La Master System  ou Sega Master System (aussi abrégé SMS) est une console de jeux vidéo de troisième génération, conçue et commercialisée par le constructeur japonais Sega Enterprises, Ltd. Elle sort en 1985, sous le nom Sega Mark III au Japon. La console est redessinée et rebaptisée Master System avant son lancement en 1986 en Amérique du Nord. Elle sort sous ce nom sur la plupart des autres territoires, dont l Europe en 1986 et le Brésil en 1987. Le modèle remanié de la Master System sort également en 1987 au Japon.
','images/Sega/Home Console/S - MD.png'),

('Sega 32X','Sega','1994/11/21','Home Console','
La 32X, également appelée Super 32X au Japon, Sega Genesis 32X en Amérique du Nord, Sega Mega Drive 32X dans la région PAL et Sega Mega 32X au Brésil, est une extension de la Mega Drive, console de jeux vidéo de quatrième génération du constructeur japonais Sega. Développée sous le nom de code Mars, celle-ci permet d augmenter la puissance de la Mega Drive en la transformant en un système 32 bits et sert ainsi de console de transition en attendant la sortie de la Saturn. La 32X utilise indépendamment de la Mega Drive ses propres cartouches de jeu et dispose d une ludothèque de quarante jeux vidéo.
','images/Sega/Home Console/S - 32x.png'),


('Sega Saturn','Sega','1994/11/21','Home Console','
La Saturn ou Sega Saturn  est une console de jeux vidéo de cinquième génération commercialisée par Sega. Quatrième console de salon conçue par l entreprise japonaise, succédant à la Mega Drive, elle sort le 22 novembre 1994 au Japon, le 11 mai 1995 en Amérique du Nord et le 8 juillet 1995 en Europe. La Saturn est dotée d une architecture intégrant huit processeurs, dont deux microprocesseurs, deux processeurs graphiques et deux dédiés à l audio. Ses jeux sont édités au format CD-ROM et sa ludothèque se compose de nombreux jeux issus de l arcade, ainsi que de titres originaux.
','images/Sega/Home Console/S - Saturn.png'),

('Sega Saturn','Sega','1999/10/14','Home Console','
La Dreamcast  est une console de jeux vidéo développée par Sega, et le successeur de la Saturn. Commercialisée dès novembre 1998 au Japon, elle est la première console de sixième génération présente sur le marché, avant ses concurrentes — la PlayStation 2 de Sony, la Xbox de Microsoft et la GameCube de Nintendo. Son nom est composé des mots dream (rêve) et cast (de broadcast : diffuser). Elle a été connue pendant son développement sous les noms Blackbelt, Dural et Katana.
','images/Sega/Home Console/S - DC.png'),


('Game Gear','Sega','1990/10/06','Home Console','
Au niveau matériel, la Game Gear se rapproche tant de sa grande sœur la Master System (dont elle est l adaptation en console portable avec quelques différences), que sa ludothèque est composée en grande partie de conversions de jeux faits pour cette dernière avec pour seule différence notable la résolution, plus faible afin d être adaptée à l écran de la console portable.
','images/Sega/Handheld/S - GG.png'),


('Pico','Sega','1993/06/26','Handheld','
La Kids Computer Pico , ou Sega Pico, est une console de jeux vidéo éducative conçue par Sega et sortie en juin 1993 au Japon, puis en 1994 en Amérique du Nord et en Europe.
','images/Sega/Handheld/S - Pico.png'),



('Magnavox Odyssey','Philips Magnavox','1972/09/01','Home Console','
La Magnavox Odyssey est une console de jeux vidéo de la première génération commercialisée par Magnavox en septembre 1972 aux États-Unis, puis en 1973 dans le reste du monde. Elle se présente sous la forme d une boîte blanche avec un système de cartes de jeu, contenant des circuits numériques équipés de composants discrets, et qui se connecte à un téléviseur. L Odyssey peut afficher simultanément trois points carrés distincts à l écran, en monochrome noir et blanc, et permet un comportement différent pour chacun des points en fonction du jeu. 
','images/Philips Magnavox/Home Console/M - Odyssey.png'),


('Philips Odyssey','Philips Magnavox','1977/09/01','Home Console','
La console dédiée Philips Odyssey 2001 est commercialisée par Philips en Europe en 197711. Elle est globalement identique à  Magnavox Odyssey 400, mais est basée sur la puce National Semiconductor MM-57105 permettant de jouer à Tennis, Hockey et Smash en couleur, avec du son joué sur la télévision et propose des manettes avec boutons12.
','images/Philips Magnavox/Home Console/M - POdyssey.png'),


('Philips Odyssey','Philips Magnavox','1977/09/01','Home Console','
La console dédiée Philips Odyssey 2001 est commercialisée par Philips en Europe en 197711. Elle est globalement identique à  Magnavox Odyssey 400, mais est basée sur la puce National Semiconductor MM-57105 permettant de jouer à Tennis, Hockey et Smash en couleur, avec du son joué sur la télévision et propose des manettes avec boutons12.
','images/Philips Magnavox/Home Console/M - POdyssey.png'),

(' VideoPac','Philips Magnavox','1979/09/01','Home Console','
Le Videopac est une console de jeux vidéo conçue par Magnavox, fabriquée par Philips et commercialisée à la fin des années 1970 et au début des années 1980 sous les marques Philips, Radiola-Radiotechnique, Schneider, Siera, Magnavox, Brandt, Continental Edison et Saba.
','images/Philips Magnavox/Home Console/M - Odyssey 2.png'),

(' CD-i','Philips Magnavox','1991/01/01','Home Console','
Le CD-i, sigle de Compact Disc Interactif, est une console de jeux vidéo et lecteur multimédia conçu par Philips, Sony et Matsushita pour imposer un nouveau standard « multimédia », concept très en vogue depuis le début de l année 1991.
','images/Philips Magnavox/Home Console/M - P CDi.png'),

(' Playstation','Sony','1994/12/03','Home Console','
La PlayStation  est une console de jeux vidéo de cinquième génération, produite par Sony Computer Entertainment à partir de 1994. La PlayStation originale fut la première machine de la gamme PlayStation.
Le 18 mai 2004, soit près de dix ans après son lancement, Sony annonce avoir distribué 100 millions de consoles dans le monde et plus de 962 millions de jeux PlayStation.
','images/Sony/Home Console/S - PS1.png'),

(' Playstation 2','Sony','2000/03/04','Home Console','
La PlayStation 2 a succédé à la PlayStation dans la gamme du même nom. Elle a connu un succès immédiat avec un million d exemplaires vendus en quelques jours au Japon. La PlayStation 2 atteint un total de 150 millions d exemplaires expédiés en date du 31 janvier 2011,ce qui en fait la console de salon la plus vendue de l histoire des jeux vidéo. Sony affirme qu il existe 10 828 titres de jeu vidéo disponibles sur la console et que 1,52 milliard d exemplaires de ces titres ont été vendus depuis le lancement de la console. Durant la fin de l année 2009, alors que la console est commercialisée depuis près d une décennie, Sony explique que la PlayStation 2 restera sur le marché tant qu il y aura des acheteurs pour ses jeux . 
','images/Sony/Home Console/S - PS2.png'),

(' Playstation 2 Slim','Sony','2004/01/01','Home Console','
La PlayStation 2 a succédé à la PlayStation dans la gamme du même nom. Elle a connu un succès immédiat avec un million d exemplaires vendus en quelques jours au Japon. La PlayStation 2 atteint un total de 150 millions d exemplaires expédiés en date du 31 janvier 2011,ce qui en fait la console de salon la plus vendue de l histoire des jeux vidéo. Sony affirme qu il existe 10 828 titres de jeu vidéo disponibles sur la console et que 1,52 milliard d exemplaires de ces titres ont été vendus depuis le lancement de la console. Durant la fin de l année 2009, alors que la console est commercialisée depuis près d une décennie, Sony explique que la PlayStation 2 restera sur le marché tant qu il y aura des acheteurs pour ses jeux . 
','images/Sony/Home Console/S - PS2 L.png'),


(' Sony Psx','Sony','2003/12/13','Home Console','
C est un appareil vendu en tant qu enregistreur vidéo numérique et centre multimédia élaboré par Sony, pouvant faire office de console de jeux vidéo basée sur la PlayStation 2.

C est une PS2 améliorée (à l aspect inédit), comportant un graveur de DVD, un tuner Télé intégré et un disque dur de 160 Go et ainsi que 250 Go pour les dernières versions.

Elle est vendue au Japon 79 800 yens soit environ 615 €.
','images/Sony/Home Console/S - DESR.png'),

(' PlayStation 3','Sony','2006/11/11','Home Console','
Conçue comme un centre de divertissement numérique, la PlayStation 3 s inscrit dans l ère de la télévision à haute définition en intégrant un lecteur Blu-ray et une connectique HDMI. La console dispose d un disque dur, d un navigateur Web et fait office de media center en supportant différents types de format multimédia. Elle propose une connectivité étendue avec la PlayStation Portable par Wi-Fi. 
','images/Sony/Home Console/S - PS3.png'),

(' PlayStation 3 Slim ','Sony','2009/08/24','Home Console','
Le modèle 120 Go est un nouveau modèle annoncé par Sony le 24 août 2009 lors du salon gamescom de Cologne. La nouvelle PlayStation 3 (PS3 CECH-2000) est 32 % plus petite, 36 % plus légère et consomme 34 % d énergie en moins, tout en possédant les mêmes caractéristiques que les anciens modèles, d où son appellation semi-officielle de PlayStation 3 / PS3 « Slim »
','images/Sony/Home Console/S - PS3S.png'),


(' PlayStation 3  Super Slim ','Sony','2012/09/19','Home Console','
Cette nouvelle version de la console (qui remplace à terme le modèle "Slim" précédent) se caractérise par une diminution de la taille et un poids encore inférieur au modèle "Slim" (lancé en 2009) et présente quelques spécificités et nouveautés comme l introduction des disques (CD, DVD et Blu-ray) qui se fait désormais par le dessus de la console 
','images/Sony/Home Console/S - PS3SS.png'),

(' PlayStation TV ','Sony','2013/11/14','Home Console','
La PlayStation TV (appelée en Asie PlayStation Vita TV ou PS Vita TV) est une microconsole, et une variante non-portable de la console portable PlayStation Vita
','images/Sony/Home Console/S - PSTV.png'),


(' PlayStation 4 ','Sony','2013/11/15','Home Console','
La PlayStation 4 (abrégée officiellement PS4) est une console de jeux vidéo de salon de huitième génération développée par Sony Computer Entertainment. Présentée le 20 février 2013, elle succède à la PlayStation 3 et se place en concurrence avec la Xbox One de Microsoft et la Wii U puis la Switch de Nintendo.
','images/Sony/Home Console/S - PS4.png'),


(' PlayStation 4 Slim','Sony','2016/01/01','Home Console','
La PlayStation 4 (abrégée officiellement PS4)Elle se distingue du modèle original par un nouvel aspect : le concept général du « double parallélépipède » est maintenu, mais ils sont de tailles différentes, avec l inférieur plus gros que le supérieur. Sur l aspect technique, elle possède des configurations similaires par rapport à la PS4 Fat avec cependant des améliorations du Wi-Fi (de 802.11 b/g/n à 802.11 a/b/g/n/ac), du Bluetooth (de 2.1 à 4.0) ainsi que des connectiques USB (de 3.0 à 3.1). Elle dispose également d une taille et d un poids réduits par rapport aux modèles précédents ainsi que de diverses modifications, l une des plus marquantes étant la disparition de la prise S/PDIF-TOSLINK, la sortie optique. Cette nouvelle version est proposée avec un disque dur de 500 Go (sortie le 16 septembre) ou de 1 To (commercialisation le 28 septembre 2016)
','images/Sony/Home Console/S - PS4S.png'),



(' PlayStation 4 Pro','Sony','2016/11/10','Home Console','
Le 10 novembre 2016, Sony lance une version plus puissante de la PS4, nommée officiellement PS4 Pro, permettant la compatibilité de certains jeux avec le format Ultra HD, ainsi qu une exécution plus fluide de certains jeux par rapport aux PS4 « non-Pro ».
','images/Sony/Home Console/S - PS4 Pro.png'),

(' PlayStation 5','Sony','2020/11/12','Home Console','
La PlayStation 5 (abrégée officiellement PS5) est la console de jeux vidéo de salon de neuvième génération développée par Sony Interactive Entertainment.
','images/Sony/Home Console/sem-titulo_14-removebg-preview.png'),


(' PSP','Sony','2004/12/12','Handheld','
Elle marque un tournant dans l histoire des consoles portables, car elle propose une qualité d image et des capacités générales approchant celles de la PlayStation 2, une console de salon.

La PlayStation Portable permet de jouer à des jeux vidéo, de regarder des vidéos et des images, d écouter de la musique et offre la possibilité de naviguer sur Internet. Son système de connexion sans fil Wi-Fi permet de faire communiquer jusqu à seize machines en même temps les unes avec les autres, grâce à la fonction de « mise en réseau ad hoc ».
','images/Sony/Handheld/SHH - PSP.png'),

(' PSP GO','Sony','2009/10/01','Handheld','
La PlayStation Portable Go ne comporte pas le lecteur UMD (Universal Media Disc) des anciens modèles mais peut stocker jusqu à 16 Go de jeux et de données sur sa mémoire flash interne. Elle supporte également le Bluetooth en plus du Wi-Fi et accepte désormais le format Micro (M2) des cartes mémoire Memory Stick, ce format n est pas compatible avec les anciens modèles de la PSP.
','images/Sony/Handheld/SHH - PSP GO.png'),


(' Playstation Vita','Sony','2011/12/17','Handheld','
 Elle succède à la PlayStation Portable et aux différentes déclinaisons qui en découlent. Ses concurrents principaux sont la Nintendo 3DS de Nintendo et le marché du smartphone.
','images/Sony/Handheld/SHH - PSP VITA.png'),



(' Game&Watch','Nintendo','1980/04/28','Handheld','
 Les Game and Watch sont des jeux électroniques de poche, ancêtre de la console de jeux portables, produits par la société Nintendo de 1980 à 1991, ils font également office de montres et de réveils.
','images/Nintendo/Handheld/NHH - Game&Watch.png'),

(' Game Boy','Nintendo','1989/04/21','Handheld','
 Malgré la sortie de consoles portables techniquement plus avancées, la Game Boy connaît un franc succès. Les modèles Game Boy et Game Boy Color totalisent 118,6 millions d exemplaires vendus à travers le monde. Dès sa sortie aux États-Unis, plus d un million d exemplaires sont vendus en quelques semaines. La production de la console portable s est achevée en 2003.
','images/Sony/Nintendo/NHH - NHH - GB.png'),

(' Game Boy Pocket','Nintendo','1996/07/21','Handheld','
Cette console diffère très peu de la Game Boy, sauf sa taille réduite de 30 %. L écran a été très légèrement agrandi et a perdu son aspect verdâtre. L autonomie est passée à 10 heures pour 2 piles LR03 (contre 4 LR6 pour la Game Boy originale). Les premiers modèles de Game Boy Pocket étaient dépourvus de voyant indiquant le niveau de batterie de la console.
','images/Nintendo/Handheld/NHH - GBP.png'),

(' Game Boy Light','Nintendo','1998/04/14','Handheld','
il apporte à la Game Boy Pocket ce qui lui manquait le plus : une bonne lisibilité, grâce à un rétro-éclairage de bonne facture avec lequel il devient possible de jouer dans le noir. Le traditionnel interrupteur « on-off » (marche-arrêt) est doté d une troisième position, la fameuse position « Light », qui permet d activer ou couper le rétro-éclairage sans redémarrer la console ,l autonomie des 2 piles LR06 variant de 12 heures lumière allumée, jusqu à 20 h lumière éteinte. Pour le reste cette console diffère très peu du Game Boy Pocket, sauf une taille légèrement plus élevée.
','images/Nintendo/Handheld/NHH - GBL.png'),


(' Game & Watch Mini Classics','Nintendo','1998/01/01','Handheld','
Les Nintendo Mini Classics sont des consoles de jeux portables de troisième génération à cristaux liquide créés en 1998 sous licence Nintendo. Ils sont affiliés à une série à part entière de Game and Watch, 12 ans après la création des Crystal Screen.
','images/Nintendo/Handheld/NHH - G&W M C.png'),


(' Game Boy Color','Nintendo','1998/11/23','Handheld','
Commercialisée le 23 novembre 1998 en Europe, la Game Boy Color (couramment référencée par GBC) propose un écran couleur pour une forme légèrement plus grande que la Game Boy Pocket, et double la cadence du processeur et sa quantité de mémoire pour atteindre les 8 MHz et 32 ko. Toutes les cartouches de jeux Game Boy sont lues. Les couleurs à utiliser sont sélectionnables, ce qui a permis de raviver la commercialisation de la gamme existante des jeux Game Boy, et ainsi de proposer sensiblement plus de titres que ses concurrents directs. Technologiquement, cette console a été comparée à la NES des années 1980.
','images/Nintendo/Handheld/NHH - GBC.png'),


(' Game Boy Advance','Nintendo','2001/06/01','Handheld','
La Game Boy Advance, possède un processeur ARM 32 bits cadencé à 16,8 MHz, couplé avec un processeur Z80 permettant de supporter les cartouches de jeux des premières Game Boy. C est techniquement une console équivalente à la Super Nintendo. Ce qui permet des améliorations aux jeux anciens comme Super Mario Bros. 2 et aux nouveaux titres comme Mario Kart: Super Circuit, F-Zero: Maximum Velocity et Kuru Kuru Kururin.
','images/Nintendo/Handheld/NHH - GBA.png'),

(' Nintendo Switch Lite','Nintendo','2011/02/26','Handheld','
Dédié au jeu portable La console pour les joueurs sur le pouceLa console Nintendo Switch Lite est spécialement créée pour le jeu portable  vous pouvez donc jouer à vos jeux favoris n importe où.Compacte et légère Avec son design léger et fin, la console est prête pour la route quand vous l êtes.Manettes intégrées Les manettes sont intégrées dans la console pour le jeu portable, et sur le côté gauche on retrouve une manette+.Jeux compatibles La console Nintendo Switch Lite est compatible avec la librairie de jeux Nintendo...
','images/Nintendo/Handheld/NHH - Switch Lite.png'),

(' Color TV GAME','Nintendo','1977/06/01','Home Console','
Les Color TV-Game  sont les premières consoles de salon de Nintendo. Il en existe cinq versions, sorties uniquement au Japon.
','images/Nintendo/Home Console/N - TV Game.png'),


(' Color TV GAME','Nintendo','1977/06/01','Home Console','
À sa sortie au Japon, la Family Computer se vend à 500 000 exemplaires en deux mois. Son succès vient de sa supériorité technique par rapport à la concurrence et de son prix de 14 800 yens, deux fois moins chère que la moyenne des autres consoles présentes sur le marché japonais en 1983.
','images/Nintendo/Home Console/N - Famicom.png'),


(' NES','Nintendo','1983/07/15','Home Console','
La console connut un succès mondial, ce qui aida à redynamiser l industrie du jeu vidéo après le krach du jeu vidéo de 1983, et ce qui fixa les normes pour les consoles suivantes, du game design aux procédures de gestion. Il s agit de la 13e console de jeux vidéo la plus vendue avec 61,91 millions d unités vendues. Super Mario Bros. est le jeu le plus vendu sur la console ; son succès fut tel que ce jeu justifiait bien souvent l achat de la console à lui tout seul, devenant ainsi un killer game.
','images/Nintendo/Home Console/nes.png'),


(' Nintendo 64','Nintendo','1996/06/23','Home Console','
la Nintendo 64 a plusieurs particularités : c est une console « 64-bits » contrairement à ses principales concurrentes dites « 32-bits » (hormis l Atari Jaguar sortie trois ans auparavant) ; l entreprise a préféré le support cartouche, plus rentable pour Nintendo mais plus contraignant pour le développement et plus cher que le support CD proposé par ses concurrents ; elle innove en instaurant un stick analogique sur sa manette qui se révèlera indispensable pour les jeux en 3D temps réel ; elle est aussi la première console à disposer en série de quatre ports manettes pour les jeux multijoueurs.
','images/Nintendo/Home Console/N - N64.png'),

(' GameCube','Nintendo','2001/09/14','Home Console','
C est en 1998 que l on entend parler pour la première fois de la GameCube. À l époque, un nouveau développeur de jeux vidéo, Retro Studios basé à Austin au Texas, annonce la signature d un contrat d exclusivité avec Nintendo afin de produire des jeux (les futurs Metroid Prime) non pas sur la Nintendo 64 mais sur la console devant lui succéder.
','images/Nintendo/Home Console/N - GameCube.png'),

(' Wii','Nintendo','2006/11/19','Home Console','
Elle a comme particularité d utiliser un accéléromètre capable de détecter la position, l orientation et les mouvements dans l espace de sa manette, la Télécommande Wii. La première version de la console propose également une rétrocompatiblité avec les jeux GameCube.
La Wii a marqué un tournant dans l histoire du jeu vidéo en ouvrant ce loisir à un public plus large, ciblant ainsi l ensemble de la société, ce qui explique en partie son succès. La console de salon s est écoulée à 101,63 millions d exemplaires, ce qui en fait la console la plus vendue de sa génération.
','images/Nintendo/Home Console/N - Wii.png'),

(' Switch','Nintendo','2017/03/03','Home Console','
La Nintendo Switch  est une console de jeux vidéo produite par Nintendo, succédant à la Wii U. Elle est la première console hybride de la firme, pouvant faire office aussi bien de console de salon que de console portable. Elle est sortie mondialement le 3 mars 2017. Elle se place en concurrence indirecte avec la Xbox One de Microsoft et la PlayStation 4 de Sony, puis leurs successeurs respectifs Xbox Series et PlayStation 5, ou le Steam Deck qui est aussi une console hybride concurrente.
','images/Nintendo/Home Console/N - Switch.png');

