select * from buy

insert into buy values('iPhone','iPhoneX',42232,0,'phone/apple/iPhoneX.jpg',0,8288,'Apple iPhone X (预售)')
insert into buy values('iPhone','iPhone8',42232,0,'phone/apple/iPhone8.jpg',0,5888,'Apple iPhone 8 (A1863) 64GB 金色 移动联通电信4G手机')
insert into buy values('iPhone','iPhone7',42232,0,'phone/apple/iPhone7.jpg',0,4588,'Apple iPhone 7 (A1660) 32G 黑色 移动联通电信4G手机')
insert into buy values('iPhone','iPhoneSE',42232,0,'phone/apple/iPhoneSE.png',0,2499,'Apple iPhone SE (A1723) 16G 深空灰色 移动联通电信4G手机')

insert into buy values('Xiaomi','小米6',42232,0,'phone/xiaomi/m6.jpg',0,2999,'小米6 全网通 6GB+128GB 陶瓷黑尊享版 移动联通电信4G手机 双卡双待')
insert into buy values('Xiaomi','小米5s',42232,0,'phone/xiaomi/m5s.jpg',0,1999,'小米5s 全网通 高配版 3GB内存 64GB ROM 哑光金 移动联通电信4G手机')
insert into buy values('Xiaomi','小米4x',42232,0,'phone/xiaomi/m4x.jpg',0,699,'小米 红米 4X 全网通版 2GB+16GB 香槟金 移动联通电信4G手机')
insert into buy values('Xiaomi','小米max2',42232,0,'phone/xiaomi/mmax2.jpg',0,1699,'小米Max2 全网通 4GB+64GB 金色 移动联通电信4G手机 双卡双待')

insert into buy values('SAMSUNG','三星s8',42232,0,'phone/sumsung/s8.jpg',0,5688,'三星 Galaxy S8（SM-G9500）4GB+64GB 谜夜黑 移动联通电信4G手机 双卡双待')
insert into buy values('SAMSUNG','三星note8',42232,0,'phone/sumsung/n8.jpg',0,7388,'三星 Galaxy Note8（SM-N9500）6GB+128GB 谜夜黑 移动联通电信4G手机 双卡双待')
insert into buy values('SAMSUNG','三星s7edge',42232,0,'phone/sumsung/s7e.jpg',0,2999,'三星 Galaxy S7 edge（G9350）4GB+32GB 珊瑚蓝 移动联通电信4G手机 双卡双待')
insert into buy values('SAMSUNG','三星c7',42232,0,'phone/sumsung/c7.jpg',0,2699,'三星 Galaxy C7 Pro（C7010）4GB+64GB 枫叶金 移动联通电信4G手机 双卡双待')

UPDATE buy SET purl = 'phone/apple/iPhoneX.jpg'
WHERE name = 'iPhoneX'


drop table buy 
