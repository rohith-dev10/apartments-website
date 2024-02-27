CREATE DATABASE SMS_FINAL;

USE SMS_FINAL;


CREATE TABLE APARTMENT_OWNER ( OWNER_CONTACT CHAR(10) PRIMARY KEY , OWNER_NAME VARCHAR(35) ) ;

CREATE TABLE APARTMENT( APARTMENT_ID CHAR(9) PRIMARY KEY , NAME VARCHAR(35) , OWNER_CONTACT CHAR(10), FOREIGN KEY (OWNER_CONTACT) REFERENCES APARTMENT_OWNER ( OWNER_CONTACT) );

CREATE TABLE AVAILABLE_ROOMS ( BHK INT , AVAILABLE_ROOMS INT , APARTMENT_ID CHAR(9) , FOREIGN KEY (APARTMENT_ID) REFERENCES APARTMENT (APARTMENT_ID) , PRIMARY KEY ( BHK , APARTMENT_ID) );

CREATE TABLE RESIDENTS ( REGISTRATION_ID CHAR(9) PRIMARY KEY , PASSWORD VARCHAR(35) , AADHAR_NO CHAR(12) UNIQUE , CONTACT CHAR(10) , NAME VARCHAR(35) , APARTMENT_ID CHAR(9) , ROOM_NO CHAR(4) , FOREIGN KEY ( APARTMENT_ID) REFERENCES APARTMENT (APARTMENT_ID) ) ;

CREATE TABLE RESIDENTS_DOJ ( ROOM_NO CHAR(4) , APARTMENT_ID CHAR(9) , DOJ DATE ,FOREIGN KEY ( APARTMENT_ID) REFERENCES APARTMENT (APARTMENT_ID) , PRIMARY KEY ( ROOM_NO , APARTMENT_ID) );

CREATE TABLE EVENTS ( EVENT_ID CHAR(9) PRIMARY KEY , NAME VARCHAR(35) , BUDGET INT , START_DATE DATETIME , END_DATE DATETIME , LOCATION VARCHAR(35) );

CREATE TABLE VISITORS ( VISITOR_ID CHAR(9) PRIMARY KEY , REGISTRATION_ID CHAR(9) , NAME VARCHAR(35) , CONTACT CHAR(10) , DOV DATETIME , DOL DATETIME , FOREIGN KEY (REGISTRATION_ID) REFERENCES RESIDENTS( REGISTRATION_ID) );

CREATE TABLE STAFF ( STAFF_ID CHAR(9) PRIMARY KEY , NAME VARCHAR(35) , SALARY INT, CONTACT CHAR(10));

CREATE TABLE STAFF_WORKS ( START_TIME TIME , END_TIME TIME , APARTMENT_ID CHAR(9) ,STAFF_ID CHAR(9) , FOREIGN KEY  ( APARTMENT_ID) REFERENCES APARTMENT (APARTMENT_ID) , FOREIGN KEY ( STAFF_ID) REFERENCES STAFF ( STAFF_ID) , PRIMARY KEY ( START_TIME , APARTMENT_ID , STAFF_ID) );

CREATE TABLE RESIDENT_CONDUCTS (EVENT_ID CHAR(9) , REGISTRATION_ID CHAR(9) , FOREIGN KEY (REGISTRATION_ID) REFERENCES RESIDENTS( REGISTRATION_ID) , FOREIGN KEY (EVENT_ID) REFERENCES EVENTS( EVENT_ID) , PRIMARY KEY ( EVENT_ID , REGISTRATION_ID) );

CREATE TABLE ROLE ( POST VARCHAR(35) PRIMARY KEY , REGISTRATION_ID CHAR(9) , FOREIGN KEY (REGISTRATION_ID) REFERENCES RESIDENTS( REGISTRATION_ID) );



INSERT INTO APARTMENT_OWNER VALUES
("6263034076" , "PRADYOT SONI"),
("9342172190" , "ROHITH M"),
("8409253381" , "MD KHALILUL RAHMAN");



INSERT INTO APARTMENT VALUES
("MWAPCV123", "CITY VIEW" , "6263034076"),
("MWAPSW123", "SKY WAY" , "9342172190"),
("MWAPPP123", "PARK PALACE" , "8409253381");



INSERT INTO AVAILABLE_ROOMS VALUES
(2, 34 , "MWAPCV123" ),
(3 , 16 , "MWAPCV123"),
(4 , 31 , "MWAPCV123"),
(2 , 18 , "MWAPSW123"),
(3 , 11 , "MWAPSW123"),
(4 , 29 , "MWAPSW123"),
(2 , 12 , "MWAPPP123"),
(3 , 56 , "MWAPPP123"),
(4 , 13 , "MWAPPP123");



INSERT INTO STAFF VALUES
("MINIWLD01" , "MUKESH KUMAR" , 20000 , "9827654541"),
("MINIWLD02" , "VARUN PATEL" , 17500 , "8529694532"),
("MINIWLD03" , "DEEPAK KUMAR" , 18000 , "7827774181"),
("MINIWLD04" , "RAJU SHARMA" , 15000 , "9997659998"),
("MINIWLD05" , "RAMESH KUMAR" , 16000 , "9866654540"),
("MINIWLD06" , "PAPPU SOLANKI" , 10000 , "8327699522"),
("MINIWLD07" , "SHWETA SAXENA" , 12000 , "7727654577"),
("MINIWLD08" , "NIDHI KUMARI" , 12000 , "6267694886"),
("MINIWLD09" , "ANSH PATEL" , 17500 , "6827000541"),
("MINIWLD10" , "ARIN INGLE" , 10500 , "9479515253"),
("MINIWLD11" , "CHIRAG SHAH " , 19000 , "9100604990"),
("MINIWLD12" , "MOHSIN  KHAN" , 15000 , "9226654441"),
("MINIWLD13" , "MURTAZA AZAM " , 17000 , "9144654883"),
("MINIWLD14" , "MEENA DEVI" , 16000 , "9720694000"),
("MINIWLD15" , " SHRUTI KUMARI" , 15000 , "9827666647");



INSERT INTO STAFF_WORKS VALUES
("07:30:00" , "09:30:00" , "MWAPCV123" , "MINIWLD01" ),
("11:30:00" , "14:00:00" , "MWAPPP123" , "MINIWLD01" ),
("18:00:00" , "19:30:00" , "MWAPSW123" , "MINIWLD01" ),
("07:30:00" , "09:30:00" , "MWAPCV123" , "MINIWLD02" ),
("11:30:00" , "14:30:00" , "MWAPSW123" , "MINIWLD02" ),
("18:30:00" , "19:30:00" , "MWAPPP123" , "MINIWLD02" ),
("07:30:00" , "09:30:00" , "MWAPSW123" , "MINIWLD03" ),
("07:30:00" , "09:30:00" , "MWAPPP123" , "MINIWLD04" ),
("07:30:00" , "09:30:00" , "MWAPCV123" , "MINIWLD05" ),
("07:30:00" , "09:30:00" , "MWAPCV123" , "MINIWLD06" ),
("07:30:00" , "09:30:00" , "MWAPPP123" , "MINIWLD07" ),
("07:30:00" , "09:30:00" , "MWAPSW123" , "MINIWLD08" ),
("07:30:00" , "09:30:00" , "MWAPSW123" , "MINIWLD09" ),
("07:30:00" , "09:30:00" , "MWAPCV123" , "MINIWLD10" ),
("07:30:00" , "09:30:00" , "MWAPPP123" , "MINIWLD11" ),
("11:30:00" , "14:00:00" , "MWAPCV123" , "MINIWLD12" ),
("11:30:00" , "14:00:00" , "MWAPPP123" , "MINIWLD13" ),
("11:30:00" , "14:30:00" , "MWAPSW123" , "MINIWLD14" ),
("11:30:00" , "14:30:00" , "MWAPSW123" , "MINIWLD15" ),
("11:30:00" , "14:30:00" , "MWAPCV123" , "MINIWLD04" ),
("11:30:00" , "14:30:00" , "MWAPSW123" , "MINIWLD05" ),
("11:30:00" , "14:30:00" , "MWAPCV123" , "MINIWLD06" ),
("11:30:00" , "14:30:00" , "MWAPCV123" , "MINIWLD07" ),
("11:30:00" , "14:30:00" , "MWAPPP123" , "MINIWLD08" ),
("18:30:00" , "19:30:00" , "MWAPSW123" , "MINIWLD12" ),
("18:30:00" , "19:30:00" , "MWAPSW123" , "MINIWLD13" ),
("18:30:00" , "19:30:00" , "MWAPCV123" , "MINIWLD11" ),
("18:30:00" , "19:30:00" , "MWAPPP123" , "MINIWLD05" ),
("18:30:00" , "19:30:00" , "MWAPSW123" , "MINIWLD14" ),
("18:30:00" , "19:30:00" , "MWAPCV123" , "MINIWLD15" ),
("18:30:00" , "19:30:00" , "MWAPCV123" , "MINIWLD10" ),
("18:30:00" , "19:30:00" , "MWAPSW123" , "MINIWLD04" ),
("18:30:00" , "19:30:00" , "MWAPPP123" , "MINIWLD03" );



INSERT INTO RESIDENTS VALUES
("202111001","ABHAY MISHRA","111111111111","963258741","ABHAY MISHRA","MWAPCV123","2009"),
("202111002","ABHISHEK GOVIND","111111111112","963258742","ABHISHEK GOVIND","MWAPCV123","2003"),
("202111003","ADITYA KUMAR","111211111111","963258743","ADITYA KUMAR","MWAPCV123","2007"),
("202111004","AKANKSHA","111211111112","963258744","AKANKSHA","MWAPCV123","3001"),
("202111005","AKASH KUMAR SAW","111311111111","963258745","AKASH KUMAR SAW","MWAPCV123","1099"),
("202111006","ANIRUDDHA AJAY KAJAVE","111311111112","963258746","ANIRUDDHA AJAY KAJAVE","MWAPCV123","2006"),
("202111007","ANKITA RANJAN","111411111111","963258747","ANKITA RANJAN","MWAPCV123","3005"),
("202111008","ANNAYA SHARMA","111411111112","963258748","ANNAYA SHARMA","MWAPCV123","3001"),
("202111010","ANUBHAV DUBEY","111511111111","963258749","ANUBHAV DUBEY","MWAPCV123","1072"),
("202111011","APURVA","111511111112","963258750","APURVA","MWAPCV123","3003"),
("202111012","ARKESH CHOUDHURY","111611111111","963258751","ARKESH CHOUDHURY","MWAPCV123","2018"),
("202111013","ASHISH BAIRWA","111611111112","963258752","ASHISH BAIRWA","MWAPCV123","2019"),
("202111014","ASHUTOSH KHATRI","111711111111","963258753","ASHUTOSH KHATRI","MWAPCV123","2008"),
("202111015","AVIN SAXENA","111711111112","963258754","AVIN SAXENA","MWAPCV123","1095"),
("202111016","BALLA BHARATH VENKAT","111811111111","963258755","BALLA BHARATH VENKAT","MWAPCV123","2020"),
("202111017","BANAVATH ANIL NAIK","111811111112","963258756","BANAVATH ANIL NAIK","MWAPCV123","1018"),
("202111018","BANOTH VINAYAK","111911111111","963258757","BANOTH VINAYAK","MWAPCV123","1018"),
("202111019","CHARU CHANDRA JOSHI","111911111112","963258758","CHARU CHANDRA JOSHI","MWAPCV123","2022"),
("202111020","CHINNI JYOTHI PRAKASH","112011111111","963258759","CHINNI JYOTHI PRAKASH","MWAPCV123","1016"),
("202111023","DEEPENDRA RALIYA","112011111112","963258760","DEEPENDRA RALIYA","MWAPCV123","2012"),
("202111024","DEVESH SHARMA","112111111111","963258761","DEVESH SHARMA","MWAPCV123","2012"),
("202111025","DIDHITKUMAR PATEL","112111111112","963258762","DIDHITKUMAR PATEL","MWAPCV123","2011"),
("202111026","DIVAY KANSAL","112211111111","963258763","DIVAY KANSAL","MWAPCV123","2004"),
("202111027","FALANSHU MANGAL","112211111112","963258764","FALANSHU MANGAL","MWAPCV123","1001"),
("202111028","FALGUN SONI","112311111111","963258765","FALGUN SONI","MWAPCV123","2005"),
("202111029","GAURAV TRIPATHI","112311111112","963258766","GAURAV TRIPATHI","MWAPCV123","1075"),
("202111030","GEVARIYA ARPAN BHAVESHBHAI","112411111111","963258767","GEVARIYA ARPAN BHAVESHBHAI","MWAPCV123","2010"),
("202111031","GINIGE MANIKANTA","112411111112","963258768","GINIGE MANIKANTA","MWAPSW123","1016"),
("202111032","GOVIND GARG","112511111111","963258769","GOVIND GARG","MWAPSW123","1093"),
("202111033","GUNAL GUPTA","112511111112","963258770","GUNAL GUPTA","MWAPSW123","1097"),
("202111034","HARSH SHARMA","112611111111","963258771","HARSH SHARMA","MWAPSW123","1077"),
("202111035","HARSH TAUNK","112611111112","963258772","HARSH TAUNK","MWAPSW123","1077"),
("202111036","HEMANT KUMAR YADAV","112711111111","963258773","HEMANT KUMAR YADAV","MWAPSW123","1085"),
("202111037","HIMANSHU","112711111112","963258774","HIMANSHU","MWAPSW123","1085"),
("202111038","HIMANSHU GUPTA","112811111111","963258775","HIMANSHU GUPTA","MWAPSW123","2003"),
("202111039","ISHITA AGARWAL","112811111112","963258776","ISHITA AGARWAL","MWAPSW123","3003"),
("202111040","JAYESH CHAK","112911111111","963258777","JAYESH CHAK","MWAPSW123","2005"),
("202111041","K ANAMITHRA","112911111112","963258778","K ANAMITHRA","MWAPSW123","3009"),
("202111042","KAVATI SAINADHUDU","113011111111","963258779","KAVATI SAINADHUDU","MWAPSW123","2020"),
("202111043","KRITYUK KUMAR","113011111112","963258780","KRITYUK KUMAR","MWAPSW123","2019"),
("202111044","KUDITHI KRISHNA KISHORE","113111111111","963258781","KUDITHI KRISHNA KISHORE","MWAPSW123","1016"),
("202111045","LAVANYA BANSOD","113111111112","963258782","LAVANYA BANSOD","MWAPSW123","3007"),
("202111046","LOPINTI VIJAY VENKATA SIVA SAI","113211111111","963258783","LOPINTI VIJAY VENKATA SIVA SAI","MWAPSW123","1017"),
("202111047","MADATHANAPALLI GUNADEEP NARASIMHA","113211111112","963258784","MADATHANAPALLI GUNADEEP NARASIMHA","MWAPSW123","1017"),
("202111048","MAISAGALLA VENKATESH","113311111111","963258785","MAISAGALLA VENKATESH","MWAPSW123","1015"),
("202111049","MALLA JASWANTH KUMAR","113311111112","963258786","MALLA JASWANTH KUMAR","MWAPSW123","1015"),
("202111050","MANVI SHARMA","113411111111","963258787","MANVI SHARMA","MWAPSW123","3005"),
("202111051","MD ARSHAD","113411111112","963258788","MD ARSHAD","MWAPSW123","1101"),
("202111052","MD KHALILUL RAHMAN","113511111111","963258789","MD KHALILUL RAHMAN","MWAPSW123","1091"),
("202111053","MEGH","113511111112","963258790","MEGH","MWAPSW123","2010"),
("202111054","MOGILI DINESH REDDY","113611111111","963258791","MOGILI DINESH REDDY","MWAPSW123","1019"),
("202111055","NANDINI KUMARI","113611111112","963258792","NANDINI KUMARI","MWAPSW123","3009"),
("202111056","NAVIN KUMAR","113711111111","963258793","NAVIN KUMAR","MWAPSW123","1072"),
("202111057","NAVYANTH KUMAR KASA","113711111112","963258794","NAVYANTH KUMAR KASA","MWAPSW123","1019"),
("202111058","NISARG HEMANTBHAI PATEL","113811111111","963258795","NISARG HEMANTBHAI PATEL","MWAPPP123","2011"),
("202111059","OMKAR MOHANTY","113811111112","963258796","OMKAR MOHANTY","MWAPPP123","1097"),
("202111060","PAPPU KUMAR","113911111111","963258797","PAPPU KUMAR","MWAPPP123","1101"),
("202111061","PARAS RAWAT","113911111112","963258798","PARAS RAWAT","MWAPPP123","2013"),
("202111062","PAWAR PRATHAMESH PRASHANT","114011111111","963258799","PAWAR PRATHAMESH PRASHANT","MWAPPP123","2006"),
("202111063","PHAPALE NILESH SHARAD","114011111112","963258800","PHAPALE NILESH SHARAD","MWAPPP123","2013"),
("202111064","PRACHI GURAV","114111111111","963258801","PRACHI GURAV","MWAPPP123","3009"),
("202111066","PRAJAPATI PARAM BAKULBHAI","114111111112","963258802","PRAJAPATI PARAM BAKULBHAI","MWAPPP123","2015"),
("202111067","PRAKHAR SHUKLA","114211111111","963258803","PRAKHAR SHUKLA","MWAPPP123","2009"),
("202111068","RAJAN YADAV","114211111112","963258804","RAJAN YADAV","MWAPPP123","2014"),
("202111069","RAMAN SHARMA","114311111111","963258805","RAMAN SHARMA","MWAPPP123","1001"),
("202111070","RAYI GNANESWAR KUMAR","114311111112","963258806","RAYI GNANESWAR KUMAR","MWAPPP123","2021"),
("202111074","S PRANAV","114411111111","963258807","S PRANAV","MWAPPP123","2008"),
("202111075","SAHIL SONKAR","114411111112","963258808","SAHIL SONKAR","MWAPPP123","2015"),
("202111076","SAURYA KUMAR GUPTA","114511111111","963258809","SAURYA KUMAR GUPTA","MWAPPP123","1075"),
("202111077","SHIVAM MOHIT","114511111112","963258810","SHIVAM MOHIT","MWAPPP123","2014"),
("202111078","SHRIRAM ASHOK BIRAJDAR","114611111111","963258811","SHRIRAM ASHOK BIRAJDAR","MWAPPP123","2022"),
("202111079","SOLANKI HIRENDRASINGH OM SINGH","114611111112","963258812","SOLANKI HIRENDRASINGH OM SINGH","MWAPPP123","2018"),
("202111080","TEJAS RAJ","114711111111","963258813","TEJAS RAJ","MWAPPP123","2004"),
("202111081","TEJAVATH RAKESH","114711111112","963258814","TEJAVATH RAKESH","MWAPPP123","2019"),
("202111082","TETTABAVI PRANITH KUMAR","114811111111","963258815","TETTABAVI PRANITH KUMAR","MWAPPP123","2024"),
("202111083","UNIK YADAV","114811111112","963258816","UNIK YADAV","MWAPPP123","2017"),
("202111084","UTTAM KUMAR","114911111111","963258817","UTTAM KUMAR","MWAPPP123","1099"),
("202111085","VAISHALI BHAGWANI","114911111112","963258818","VAISHALI BHAGWANI","MWAPPP123","3007"),
("202111086","VATTI YESHWANTH","115011111111","963258819","VATTI YESHWANTH","MWAPPP123","2019"),
("202111087","VEKHANDE VED KASHINATH","115011111112","963258820","VEKHANDE VED KASHINATH","MWAPPP123","1095"),
("202111088","VIJAY MALVIYA","115111111111","963258821","VIJAY MALVIYA","MWAPPP123","2021");



INSERT INTO VISITORS VALUES 
("000000001" , "202111034", "KRATIKA SHARMA" , "8989615333" , "2023/04/27 13:00:00" , "2023/04/29 20:00:00" ),
("000000003" , "202111039", "MANISH AGARWAL" , "9899615299" , "2023/04/29 13:00:00" , "2023/05/03 20:00:00" ),
("000000004" , "202111039", "NEETA AGARWAL" , "8977715377" , "2023/04/29 13:00:00" , "2023/05/03 20:00:00" ),
("000000002" , "202111034", "MAYANK SHARMA" , "7771615332" , "2023/04/27 13:00:00" , "2023/04/29 20:00:00" ),
("000000005" , "202111010", "PRAKASH DUBEY" , "8989615991" , "2023/04/28 15:50:00" , "2023/05/06 09:30:00" ),
("000000006" , "202111055", "SATYANSH KUMAR" , "8779666991" , "2023/05/04 11:40:00" , "2023/05/06 19:30:00" ),
("000000007" , "202111010", "PRAKASH DUBEY" , "8989615991" , "2023/04/05 15:50:00" , "2023/05/06 09:30:00" ),
("000000008" , "202111032", "PRASHANT GARG" , "8989121234" , "2023/04/07 17:45:00" , "2023/05/09 09:20:00" ),
("000000009" , "202111087", "DARSHAN GUPTA" , "7789885772" , "2023/04/08 16:45:00" , "2023/05/09 15:30:00" );


INSERT INTO ROLE VALUES 
("SECRETARY" , "202111005"),
("JOINT SECRETARY" , "202111080" ),
("TREASURER" , "202111026" );


ALTER TABLE EVENTS ADD COLUMN EVENT_DESCRIPTION VARCHAR(1500) ;

INSERT INTO EVENTS VALUES
("MWEVENT01" , "NEW YEAR PARTY" , 2000000 , "2022/12/31 22:00:00" , "2023/01/01 01:00:00" , "MW EVE PARK" , "Miniworld Society welcomed the new year with great excitement and joy as they celebrated the New Year's Eve party on December 31st, 2022.
The party started in the evening and the members of the society were dressed in their best attire. The event had a lively and cheerful atmosphere with decorations, balloons, and lights adding to the festive vibe.
The party was filled with a variety of fun-filled activities, including games, music, and dancing. The society members organized various games and activities that kept everyone engaged and entertained throughout the night. The DJ played a variety of music, including the latest hits and old classics, which kept the guests dancing and grooving to the beats." ),
("MWEVENT02" , "REPUBLIC DAY" , 800000 , "2023/01/26 08:00:00" , "2023/01/01 11:00:00" , "MW EVE HALL" , "Miniworld Society celebrated the 74th Republic Day of India with great enthusiasm and patriotic fervor. The event was held on January 26th, 2023 and brought together members of the society, local school children, and community leaders.
The celebration started with the hoisting of the Indian national flag and the singing of the national anthem. The members of the society and local school children participated in a march past, showcasing their love and respect for the nation.
The event featured a variety of performances that highlighted the rich cultural heritage of India. The performances included patriotic songs, dances, and skits that represented different cultures and regions of India. The society members also organized art and craft exhibitions that showcased their artistic talents." ),
("MWEVENT03" , "VALENTINES PARTY" , 500000 , "2023/02/14 20:30:00" , "2023/02/14 23:00:00" , "CITY VIEW MAIN GROUND" , "Miniworld Society celebrated the day of love, Valentine's Day, with a delightful Valentine's party on February 14th, 2023.
The party was held in the evening and the members of the society were dressed in red and white, the traditional colors of Valentine's Day. The venue was decorated with hearts, flowers, and candles, creating a romantic atmosphere.
The event featured a variety of fun activities and games for the couples and singles. The society members had organized a game of musical chairs for couples, a treasure hunt, and a dance competition, which kept the guests entertained throughout the night." ),
("MWEVENT04" , "HOLI" , 800000 , "2023/03/08 09:00:00" , "2023/03/08 17:00:00" , "MW EVE PARK" , "Miniworld Society celebrated the festival of colors, Holi, with great joy and enthusiasm on March 8th, 2023.
The event started in the morning, and the members of the society were dressed in white, ready to embrace the colors of Holi. The venue was decorated with colorful balloons, streamers, and flowers, creating a festive atmosphere.
The society members had arranged for organic and eco-friendly colors that were safe for everyone to use. The guests enjoyed throwing colors at each other, smearing each other's faces with colorful powder, and dancing to the tunes of the traditional Holi songs." ),
("MWEVENT05" , "EID" , 500000 , "2023/04/21 08:00:00" , "2023/04/21 11:00:00" , "SKY WAY HALL 02" , "Miniworld Society celebrated the festival of Eid with great joy and enthusiasm on  April 21st, 2023.
The event started in the morning, and the members of the society were dressed in traditional attire, ready to celebrate the festival. The venue was decorated with colorful lights, flowers, and banners, creating a festive atmosphere.
The society members had arranged for a special prayer ceremony for Eid, which was attended by all the members of the community. The prayers were followed by a delicious feast, which included traditional dishes like biryani, kebabs, and sheer khurma." ),
("MWEVENT06" , "MW SUMMER CARNIVAL" , 3000000 , "2023/05/08 11:00:00" , "2023/05/09 18:00:00" , "MW EVE PARK" , "Miniworld Society organized a Summer Carnival on May 8th, 2023, which was a fun-filled event for the entire community.
The venue was transformed into a carnival, with colorful decorations and exciting games and activities for people of all ages. There were stalls selling cotton candy, popcorn, and other snacks, as well as games like ring toss, balloon darts, and a dunk tank.
Children enjoyed the bouncy castles, face painting, and temporary tattoos, while adults enjoyed participating in the various games and winning prizes. There was also a photo booth, where guests could capture their memories of the event." ),
("MWEVENT07" , "YOGA DAY" , 200000 , "2022/06/21 05:00:00" , "2022/06/21 10:00:00" , "MW EVE PARK" , "Miniworld Society celebrated International Yoga Day on June 21st, 2022, with a special yoga session for the community.
The event started early in the morning, and the members of the society gathered at the venue, dressed in comfortable clothing for the yoga session. The venue was decorated with colorful yoga mats and flowers, creating a peaceful and serene atmosphere.
The yoga session was conducted by a professional yoga instructor, who led the group through various yoga asanas and breathing exercises. The members of the community participated in the session with great enthusiasm, and the session helped them feel rejuvenated and refreshed." ),
("MWEVENT08" , "INDEPENDENCE DAY" , 600000 , "2022/08/15 08:00:00" , "2022/01/01 01:00:00" , "MW EVE HALL" , "Miniworld Society celebrated India's 76th Independence Day on August 15th, 2022, with great enthusiasm and pride.
The event started early in the morning, and the members of the society gathered at the venue, dressed in traditional attire in the colors of the Indian flag. The venue was decorated with tricolor balloons and flags, creating a festive atmosphere.
The celebration began with the hoisting of the Indian national flag, followed by the national anthem. This was followed by speeches by members of the society, who spoke about the importance of India's independence and the sacrifices made by the freedom fighters." ),
("MWEVENT09" , "JANMASHTMI" , 8000000 , "2022/08/29 22:00:00" , "2022/08/30 01:00:00" , "PARK PLACE MAIN GROUND" , "Miniworld Society celebrated Janmashtami, the birth of Lord Krishna, with great joy and devotion on August 29th, 2022.
The event started in the evening, and the members of the society gathered at the venue, which was beautifully decorated with flowers and rangolis. The venue had a small temple set up, where a beautiful idol of Lord Krishna was placed, adorned with garlands and jewels.
The celebration began with the chanting of bhajans and kirtans in praise of Lord Krishna, which created a devotional atmosphere. The members of the society also performed aarti and offered sweets and fruits to the Lord." ),
("MWEVENT10" , "GANESH CHATURTHI" , 400000 , "2022/09/10 10:00:00" , "2022/09/19 10:00:00" , "MW EVE PARK" , "Miniworld Society celebrated Ganesh Chaturthi, the festival honoring the elephant-headed God, with great devotion and enthusiasm from September 10th to September 19th, 2022.
The event started with the installation of the beautifully crafted idol of Lord Ganesha in a decorated pandal set up by the society members. The venue was adorned with colorful lights and flowers, and the aroma of incense filled the air.
The celebration began with the chanting of mantras and offering of prayers to Lord Ganesha, seeking his blessings for a prosperous and successful life. The members of the society also performed aarti and offered a variety of fruits, sweets, and flowers to the Lord." ),
("MWEVENT11" , "NAVRATRI GARBA" , 4000000 , "2022/10/07 20:00:00" , "2022/10/15 11:30:00" , "MW EVE PARK" , "Miniworld Society celebrated Navratri, the nine-day festival dedicated to the worship of Goddess Durga, with great enthusiasm and zeal from October 7th to October 15th, 2022. The highlight of the festival was the Navratri Garba, a traditional dance form that is performed during the festival.
The society members organized a beautifully decorated Garba venue with colorful lights, flowers, and decorations. The members of the society, dressed in colorful traditional attire, gathered every evening to perform the Garba dance, which was accompanied by lively music and drum beats.
The Garba dance sessions were led by a professional dance instructor who taught the members of the society various Garba steps and techniques. The members of the society danced with great joy and energy, creating a festive and joyful atmosphere." ),
("MWEVENT12" , "WINTER CARNIVAL" , 3000000 , "2022/11/23 10:00:00" , "2022/11/29 17:00:00" , "MW EVE PARK" , "Miniworld Society organized a week long Winter Carnival from November 23th, 2022, to celebrate the festive season with the members of the society. The event was a grand success and brought together the community in a festive and joyful atmosphere.
The carnival was organized at the society clubhouse and featured a variety of fun activities and games for all age groups. The society members set up stalls selling delicious food, hot beverages, and winter wear, including jackets, hats, and gloves.
The highlight of the carnival was the snowman-making competition, where the society members had to create the best snowman using artificial snow. The competition brought out the creative side of the members and was enjoyed by everyone." ),
("MWEVENT13" , "CHRISTMAS" , 100000 , "2022/12/24 19:00:00" , "2023/12/25 23:00:00" , "MW EVE PARK" , "Miniworld Society celebrated Christmas on December 24th, 2022, with great enthusiasm and joy. The event was organized by the society members to bring together the community and celebrate the festival of love and togetherness.
The society clubhouse was beautifully decorated with Christmas trees, lights, and ornaments, creating a festive and joyful atmosphere. The event started with a Christmas carol singing competition, where the members sang their favorite carols, spreading the festive cheer.
The highlight of the event was the visit from Santa Claus, who distributed gifts and sweets to the children of the society. The children were thrilled to meet Santa and receive their gifts, which added to the festive spirit of the event." );


INSERT INTO RESIDENT_CONDUCTS VALUES
("MWEVENT01" , "202111032"),
("MWEVENT01" , "202111034"),
("MWEVENT01" , "202111040"),
("MWEVENT01" , "202111066"),
("MWEVENT01" , "202111080"),
("MWEVENT01" , "202111005"),
("MWEVENT01" , "202111033"),
("MWEVENT02" , "202111029"),
("MWEVENT02" , "202111005"),
("MWEVENT02" , "202111055"),
("MWEVENT02" , "202111012"),
("MWEVENT02" , "202111013"),
("MWEVENT03" , "202111066"),
("MWEVENT03" , "202111080"),
("MWEVENT03" , "202111024"),
("MWEVENT03" , "202111077"),
("MWEVENT04" , "202111075"),
("MWEVENT04" , "202111026"),
("MWEVENT04" , "202111023"),
("MWEVENT04" , "202111039"),
("MWEVENT04" , "202111025"),
("MWEVENT04" , "202111029"),
("MWEVENT04" , "202111063"),
("MWEVENT05" , "202111051"),
("MWEVENT05" , "202111080"),
("MWEVENT05" , "202111005"),
("MWEVENT06" , "202111087"),
("MWEVENT06" , "202111033"),
("MWEVENT06" , "202111032"),
("MWEVENT06" , "202111075"),
("MWEVENT07" , "202111012"),
("MWEVENT07" , "202111035"),
("MWEVENT07" , "202111005"),
("MWEVENT07" , "202111023"),
("MWEVENT07" , "202111011"),
("MWEVENT08" , "202111033"),
("MWEVENT08" , "202111023"),
("MWEVENT08" , "202111032"),
("MWEVENT08" , "202111041"),
("MWEVENT08" , "202111042"),
("MWEVENT09" , "202111083"),
("MWEVENT09" , "202111084"),
("MWEVENT09" , "202111063"),
("MWEVENT09" , "202111034"),
("MWEVENT09" , "202111056"),
("MWEVENT09" , "202111076"),
("MWEVENT10" , "202111026"),
("MWEVENT10" , "202111054"),
("MWEVENT10" , "202111034"),
("MWEVENT10" , "202111029"),
("MWEVENT11" , "202111054"),
("MWEVENT11" , "202111005"),
("MWEVENT11" , "202111050"),
("MWEVENT11" , "202111076"),
("MWEVENT11" , "202111030"),
("MWEVENT11" , "202111006"),
("MWEVENT11" , "202111007"),
("MWEVENT12" , "202111063"),
("MWEVENT12" , "202111082"),
("MWEVENT12" , "202111081"),
("MWEVENT12" , "202111054"),
("MWEVENT12" , "202111013"),
("MWEVENT12" , "202111026"),
("MWEVENT12" , "202111080"),
("MWEVENT12" , "202111024");


INSERT INTO RESIDENTS_DOJ VALUES
("1001","MWAPCV123","2021/04/04"),
("1001","MWAPPP123","2021/05/01"),
("1015","MWAPSW123","2021/03/14"),
("1016","MWAPCV123","2021/04/18"),
("1016","MWAPSW123","2021/05/23"),
("1017","MWAPSW123","2021/04/27"),
("1018","MWAPCV123","2021/04/19"),
("1019","MWAPSW123","2021/04/08"),
("1072","MWAPCV123","2021/05/08"),
("1072","MWAPSW123","2021/03/31"),
("1075","MWAPCV123","2021/03/29"),
("1075","MWAPPP123","2021/05/05"),
("1077","MWAPSW123","2021/03/25"),
("1085","MWAPSW123","2021/04/28"),
("1091","MWAPSW123","2021/06/14"),
("1093","MWAPSW123","2021/06/13"),
("1095","MWAPCV123","2021/03/18"),
("1095","MWAPPP123","2021/04/04"),
("1097","MWAPPP123","2021/06/17"),
("1097","MWAPSW123","2021/03/09"),
("1099","MWAPCV123","2021/04/19"),
("1099","MWAPPP123","2021/05/04"),
("1101","MWAPPP123","2021/03/05"),
("1101","MWAPSW123","2021/11/29"),
("2003","MWAPCV123","2021/08/11"),
("2003","MWAPSW123","2021/10/11"),
("2004","MWAPCV123","2021/09/18"),
("2004","MWAPPP123","2021/04/07"),
("2005","MWAPCV123","2021/08/12"),
("2005","MWAPSW123","2021/01/19"),
("2006","MWAPCV123","2021/04/05"),
("2006","MWAPPP123","2021/06/15"),
("2007","MWAPCV123","2021/02/06"),
("2008","MWAPCV123","2021/07/27"),
("2008","MWAPPP123","2021/04/28"),
("2009","MWAPCV123","2021/09/12"),
("2009","MWAPPP123","2021/08/15"),
("2010","MWAPCV123","2021/09/12"),
("2010","MWAPSW123","2021/03/05"),
("2011","MWAPCV123","2021/04/04"),
("2011","MWAPPP123","2021/06/08"),
("2012","MWAPCV123","2021/09/04"),
("2013","MWAPPP123","2021/06/29"),
("2014","MWAPPP123","2021/08/23"),
("2015","MWAPPP123","2021/06/10"),
("2017","MWAPPP123","2021/04/20"),
("2018","MWAPCV123","2021/07/07"),
("2018","MWAPPP123","2021/06/04"),
("2019","MWAPCV123","2021/08/09"),
("2019","MWAPPP123","2021/04/02"),
("2019","MWAPSW123","2021/08/01"),
("2020","MWAPCV123","2021/05/14"),
("2020","MWAPSW123","2021/08/23"),
("2021","MWAPPP123","2021/07/27"),
("2022","MWAPCV123","2021/05/18"),
("2022","MWAPPP123","2021/06/01"),
("2024","MWAPPP123","2021/09/10"),
("3001","MWAPCV123","2021/11/20"),
("3003","MWAPCV123","2021/10/31"),
("3003","MWAPSW123","2021/10/20"),
("3005","MWAPCV123","2021/10/30"),
("3005","MWAPSW123","2021/11/04"),
("3007","MWAPPP123","2021/12/04"),
("3007","MWAPSW123","2021/09/09"),
("3009","MWAPPP123","2021/06/12"),
("3009","MWAPSW123","2021/07/04");







connection.query(`SELECT PASSWORD FROM RESIDENTS WHERE REGISTRATION_ID= ? ;`,[id], 
connection.query(`SELECT * FROM RESIDENTS, RESIDENTS_DOJ WHERE RESIDENTS.REGISTRATION_ID = ? AND RESIDENTS_DOJ.ROOM_NO = RESIDENTS.ROOM_NO AND RESIDENTS_DOJ.APARTMENT_ID = RESIDENTS.APARTMENT_ID;`,[id],function
connection.query(`SELECT NAME, START_DATE FROM EVENTS, resident_conducts WHERE resident_conducts.REGISTRATION_ID = ? AND resident_conducts.EVENT_ID = EVENTS.EVENT_ID;`,[id],function
connection.query(`SELECT NAME,OWNER_NAME,APARTMENT_ID,APARTMENT.OWNER_CONTACT FROM APARTMENT,APARTMENT_OWNER WHERE APARTMENT.OWNER_CONTACT=APARTMENT_OWNER.OWNER_CONTACT`,function
connection.query(`SELECT BHK,AVAILABLE_ROOMS FROM AVAILABLE_ROOMS WHERE APARTMENT_ID='${result[id]["APARTMENT_ID"]}';`,
connection.query(`SELECT * FROM EVENTS;`,
connection.query("SHOW TABLES;", 
connection.query(`SHOW COLUMNS FROM ${table}`,
connection.query(query?`SELECT COUNT(*) FROM ${table} WHERE ${query} `:`SELECT COUNT(*) FROM ${table} `, 
connection.query(query?`SELECT * FROM ${table} WHERE ${query}`:`SELECT * FROM ${table};`, 
connection.query(`SHOW INDEX FROM ${table} WHERE Key_name = 'PRIMARY';`,
connection.query(`UPDATE ${table} SET ${r}= ? WHERE ${query}`,[v],
connection.query(`SHOW COLUMNS FROM ${table}`,
connection.query(query,
connection.query(`SHOW INDEX FROM ${table} WHERE Key_name = 'PRIMARY';`,
connection.query(`DELETE FROM ${table} WHERE ${query}`,