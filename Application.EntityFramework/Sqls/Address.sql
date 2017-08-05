/*
Navicat SQL Server Data Transfer

Source Server         : localhost
Source Server Version : 110000
Source Host           : localhost:1433
Source Database       : Shop
Source Schema         : dbo

Target Server Type    : SQL Server
Target Server Version : 110000
File Encoding         : 65001

Date: 2017-07-16 18:22:22
*/


-- ----------------------------
-- Table structure for Addresses
-- ----------------------------


GO
DBCC CHECKIDENT(N'[dbo].[Addresses]', RESEED, 5000)
GO

-- ----------------------------
-- Records of Addresses
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Addresses] ON
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1', N'中国', N'中国', null, N'0', N'0', N'0', N'Zhong Guo', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2', N'110000', N'北京市', N'1', N'1', N'0', N'0', N'Beijing Shi', N'BJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3', N'120000', N'天津市', N'1', N'1', N'0', N'0', N'Tianjin Shi', N'TJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'4', N'130000', N'河北省', N'1', N'1', N'0', N'0', N'Hebei Sheng', N'HE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'5', N'140000', N'山西省', N'1', N'1', N'0', N'0', N'Shanxi Sheng', N'SX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'6', N'150000', N'内蒙古自治区', N'1', N'1', N'0', N'0', N'Nei Mongol Zizhiqu', N'NM')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'7', N'210000', N'辽宁省', N'1', N'1', N'0', N'0', N'Liaoning Sheng', N'LN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'8', N'220000', N'吉林省', N'1', N'1', N'0', N'0', N'Jilin Sheng', N'JL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'9', N'230000', N'黑龙江省', N'1', N'1', N'0', N'0', N'Heilongjiang Sheng', N'HL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'10', N'310000', N'上海市', N'1', N'1', N'0', N'0', N'Shanghai Shi', N'SH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'11', N'320000', N'江苏省', N'1', N'1', N'0', N'0', N'Jiangsu Sheng', N'JS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'12', N'330000', N'浙江省', N'1', N'1', N'0', N'0', N'Zhejiang Sheng', N'ZJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'13', N'340000', N'安徽省', N'1', N'1', N'0', N'0', N'Anhui Sheng', N'AH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'14', N'350000', N'福建省', N'1', N'1', N'0', N'0', N'Fujian Sheng', N'FJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'15', N'360000', N'江西省', N'1', N'1', N'0', N'0', N'Jiangxi Sheng', N'JX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'16', N'370000', N'山东省', N'1', N'1', N'0', N'0', N'Shandong Sheng', N'SD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'17', N'410000', N'河南省', N'1', N'1', N'0', N'0', N'Henan Sheng', N'HA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'18', N'420000', N'湖北省', N'1', N'1', N'0', N'0', N'Hubei Sheng', N'HB')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'19', N'430000', N'湖南省', N'1', N'1', N'0', N'0', N'Hunan Sheng', N'HN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'20', N'440000', N'广东省', N'1', N'1', N'0', N'0', N'Guangdong Sheng', N'GD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'21', N'450000', N'广西壮族自治区', N'1', N'1', N'0', N'0', N'Guangxi Zhuangzu Zizhiqu', N'GX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'22', N'460000', N'海南省', N'1', N'1', N'0', N'0', N'Hainan Sheng', N'HI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'23', N'500000', N'重庆市', N'1', N'1', N'0', N'0', N'Chongqing Shi', N'CQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'24', N'510000', N'四川省', N'1', N'1', N'0', N'0', N'Sichuan Sheng', N'SC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'25', N'520000', N'贵州省', N'1', N'1', N'0', N'0', N'Guizhou Sheng', N'GZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'26', N'530000', N'云南省', N'1', N'1', N'0', N'0', N'Yunnan Sheng', N'YN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'27', N'540000', N'西藏自治区', N'1', N'1', N'0', N'0', N'Xizang Zizhiqu', N'XZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'28', N'610000', N'陕西省', N'1', N'1', N'0', N'0', N'Shanxi Sheng', N'SN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'29', N'620000', N'甘肃省', N'1', N'1', N'0', N'0', N'Gansu Sheng', N'GS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'30', N'630000', N'青海省', N'1', N'1', N'0', N'0', N'Qinghai Sheng', N'QH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'31', N'640000', N'宁夏回族自治区', N'1', N'1', N'0', N'0', N'Ningxia Huizu Zizhiqu', N'NX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'32', N'650000', N'新疆维吾尔自治区', N'1', N'1', N'0', N'0', N'Xinjiang Uygur Zizhiqu', N'XJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'33', N'110100', N'市辖区', N'2', N'2', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'34', N'110200', N'县', N'2', N'2', N'0', N'0', N'Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'35', N'120100', N'市辖区', N'3', N'2', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'36', N'120200', N'县', N'3', N'2', N'0', N'0', N'Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'37', N'130100', N'石家庄市', N'4', N'2', N'0', N'0', N'Shijiazhuang Shi', N'SJW')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'38', N'130200', N'唐山市', N'4', N'2', N'0', N'0', N'Tangshan Shi', N'TGS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'39', N'130300', N'秦皇岛市', N'4', N'2', N'0', N'0', N'Qinhuangdao Shi', N'SHP')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'40', N'130400', N'邯郸市', N'4', N'2', N'0', N'0', N'Handan Shi', N'HDS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'41', N'130500', N'邢台市', N'4', N'2', N'0', N'0', N'Xingtai Shi', N'XTS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'42', N'130600', N'保定市', N'4', N'2', N'0', N'0', N'Baoding Shi', N'BDS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'43', N'130700', N'张家口市', N'4', N'2', N'0', N'0', N'Zhangjiakou Shi', N'ZJK')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'44', N'130800', N'承德市', N'4', N'2', N'0', N'0', N'Chengde Shi', N'CDS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'45', N'130900', N'沧州市', N'4', N'2', N'0', N'0', N'Cangzhou Shi', N'CGZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'46', N'131000', N'廊坊市', N'4', N'2', N'0', N'0', N'Langfang Shi', N'LFS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'47', N'131100', N'衡水市', N'4', N'2', N'0', N'0', N'Hengshui Shi', N'HGS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'48', N'140100', N'太原市', N'5', N'2', N'0', N'0', N'Taiyuan Shi', N'TYN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'49', N'140200', N'大同市', N'5', N'2', N'0', N'0', N'Datong Shi', N'DTG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'50', N'140300', N'阳泉市', N'5', N'2', N'0', N'0', N'Yangquan Shi', N'YQS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'51', N'140400', N'长治市', N'5', N'2', N'0', N'0', N'Changzhi Shi', N'CZS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'52', N'140500', N'晋城市', N'5', N'2', N'0', N'0', N'Jincheng Shi', N'JCG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'53', N'140600', N'朔州市', N'5', N'2', N'0', N'0', N'Shuozhou Shi', N'SZJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'54', N'140700', N'晋中市', N'5', N'2', N'0', N'0', N'Jinzhong Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'55', N'140800', N'运城市', N'5', N'2', N'0', N'0', N'Yuncheng Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'56', N'140900', N'忻州市', N'5', N'2', N'0', N'0', N'Xinzhou Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'57', N'141000', N'临汾市', N'5', N'2', N'0', N'0', N'Linfen Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'58', N'141100', N'吕梁市', N'5', N'2', N'0', N'0', N'Lvliang Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'59', N'150100', N'呼和浩特市', N'6', N'2', N'0', N'0', N'Hohhot Shi', N'Hhht')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'60', N'150200', N'包头市', N'6', N'2', N'0', N'0', N'Baotou Shi', N'BTS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'61', N'150300', N'乌海市', N'6', N'2', N'0', N'0', N'Wuhai Shi', N'WHM')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'62', N'150400', N'赤峰市', N'6', N'2', N'0', N'0', N'Chifeng (Ulanhad)Shi', N'CFS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'63', N'150500', N'通辽市', N'6', N'2', N'0', N'0', N'Tongliao Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'64', N'150600', N'鄂尔多斯市', N'6', N'2', N'0', N'0', N'Eerduosi Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'65', N'150700', N'呼伦贝尔市', N'6', N'2', N'0', N'0', N'Hulunbeier Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'66', N'150800', N'巴彦淖尔市', N'6', N'2', N'0', N'0', N'Bayannaoer Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'67', N'150900', N'乌兰察布市', N'6', N'2', N'0', N'0', N'Wulanchabu Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'68', N'152200', N'兴安盟', N'6', N'2', N'0', N'0', N'Hinggan Meng', N'HIN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'69', N'152500', N'锡林郭勒盟', N'6', N'2', N'0', N'0', N'Xilin Gol Meng', N'X')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'70', N'152900', N'阿拉善盟', N'6', N'2', N'0', N'0', N'Alxa Meng', N'ALM')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'71', N'210100', N'沈阳市', N'7', N'2', N'0', N'0', N'Shenyang Shi', N'SHE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'72', N'210200', N'大连市', N'7', N'2', N'0', N'0', N'Dalian Shi', N'DLC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'73', N'210300', N'鞍山市', N'7', N'2', N'0', N'0', N'AnShan Shi', N'ASN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'74', N'210400', N'抚顺市', N'7', N'2', N'0', N'0', N'Fushun Shi', N'FSN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'75', N'210500', N'本溪市', N'7', N'2', N'0', N'0', N'Benxi Shi', N'BXS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'76', N'210600', N'丹东市', N'7', N'2', N'0', N'0', N'Dandong Shi', N'DDG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'77', N'210700', N'锦州市', N'7', N'2', N'0', N'0', N'Jinzhou Shi', N'JNZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'78', N'210800', N'营口市', N'7', N'2', N'0', N'0', N'Yingkou Shi', N'YIK')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'79', N'210900', N'阜新市', N'7', N'2', N'0', N'0', N'Fuxin Shi', N'FXS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'80', N'211000', N'辽阳市', N'7', N'2', N'0', N'0', N'Liaoyang Shi', N'LYL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'81', N'211100', N'盘锦市', N'7', N'2', N'0', N'0', N'Panjin Shi', N'PJS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'82', N'211200', N'铁岭市', N'7', N'2', N'0', N'0', N'Tieling Shi', N'TLS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'83', N'211300', N'朝阳市', N'7', N'2', N'0', N'0', N'Chaoyang Shi', N'CYS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'84', N'211400', N'葫芦岛市', N'7', N'2', N'0', N'0', N'Huludao Shi', N'HLD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'85', N'220100', N'长春市', N'8', N'2', N'0', N'0', N'Changchun Shi', N'CGQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'86', N'220200', N'吉林市', N'8', N'2', N'0', N'0', N'Jilin Shi', N'JLS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'87', N'220300', N'四平市', N'8', N'2', N'0', N'0', N'Siping Shi', N'SPS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'88', N'220400', N'辽源市', N'8', N'2', N'0', N'0', N'Liaoyuan Shi', N'LYH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'89', N'220500', N'通化市', N'8', N'2', N'0', N'0', N'Tonghua Shi', N'THS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'90', N'220600', N'白山市', N'8', N'2', N'0', N'0', N'Baishan Shi', N'BSN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'91', N'220700', N'松原市', N'8', N'2', N'0', N'0', N'Songyuan Shi', N'SYU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'92', N'220800', N'白城市', N'8', N'2', N'0', N'0', N'Baicheng Shi', N'BCS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'93', N'222400', N'延边朝鲜族自治州', N'8', N'2', N'0', N'0', N'Yanbian Chosenzu Zizhizhou', N'YBZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'94', N'230100', N'哈尔滨市', N'9', N'2', N'0', N'0', N'Harbin Shi', N'HRB')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'95', N'230200', N'齐齐哈尔市', N'9', N'2', N'0', N'0', N'Qiqihar Shi', N'NDG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'96', N'230300', N'鸡西市', N'9', N'2', N'0', N'0', N'Jixi Shi', N'JXI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'97', N'230400', N'鹤岗市', N'9', N'2', N'0', N'0', N'Hegang Shi', N'HEG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'98', N'230500', N'双鸭山市', N'9', N'2', N'0', N'0', N'Shuangyashan Shi', N'SYS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'99', N'230600', N'大庆市', N'9', N'2', N'0', N'0', N'Daqing Shi', N'DQG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'100', N'230700', N'伊春市', N'9', N'2', N'0', N'0', N'Yichun Shi', N'YCH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'101', N'230800', N'佳木斯市', N'9', N'2', N'0', N'0', N'Jiamusi Shi', N'JMU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'102', N'230900', N'七台河市', N'9', N'2', N'0', N'0', N'Qitaihe Shi', N'QTH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'103', N'231000', N'牡丹江市', N'9', N'2', N'0', N'0', N'Mudanjiang Shi', N'MDG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'104', N'231100', N'黑河市', N'9', N'2', N'0', N'0', N'Heihe Shi', N'HEK')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'105', N'231200', N'绥化市', N'9', N'2', N'0', N'0', N'Suihua Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'106', N'232700', N'大兴安岭地区', N'9', N'2', N'0', N'0', N'Da Hinggan Ling Diqu', N'DHL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'107', N'310100', N'市辖区', N'10', N'2', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'108', N'310200', N'县', N'10', N'2', N'0', N'0', N'Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'109', N'320100', N'南京市', N'11', N'2', N'0', N'0', N'Nanjing Shi', N'NKG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'110', N'320200', N'无锡市', N'11', N'2', N'0', N'0', N'Wuxi Shi', N'WUX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'111', N'320300', N'徐州市', N'11', N'2', N'0', N'0', N'Xuzhou Shi', N'XUZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'112', N'320400', N'常州市', N'11', N'2', N'0', N'0', N'Changzhou Shi', N'CZX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'113', N'320500', N'苏州市', N'11', N'2', N'0', N'0', N'Suzhou Shi', N'SZH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'114', N'320600', N'南通市', N'11', N'2', N'0', N'0', N'Nantong Shi', N'NTG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'115', N'320700', N'连云港市', N'11', N'2', N'0', N'0', N'Lianyungang Shi', N'LYG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'116', N'320800', N'淮安市', N'11', N'2', N'0', N'0', N'Huai,an Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'117', N'320900', N'盐城市', N'11', N'2', N'0', N'0', N'Yancheng Shi', N'YCK')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'118', N'321000', N'扬州市', N'11', N'2', N'0', N'0', N'Yangzhou Shi', N'YZH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'119', N'321100', N'镇江市', N'11', N'2', N'0', N'0', N'Zhenjiang Shi', N'ZHE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'120', N'321200', N'泰州市', N'11', N'2', N'0', N'0', N'Taizhou Shi', N'TZS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'121', N'321300', N'宿迁市', N'11', N'2', N'0', N'0', N'Suqian Shi', N'SUQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'122', N'330100', N'杭州市', N'12', N'2', N'0', N'0', N'Hangzhou Shi', N'HGH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'123', N'330200', N'宁波市', N'12', N'2', N'0', N'0', N'Ningbo Shi', N'NGB')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'124', N'330300', N'温州市', N'12', N'2', N'0', N'0', N'Wenzhou Shi', N'WNZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'125', N'330400', N'嘉兴市', N'12', N'2', N'0', N'0', N'Jiaxing Shi', N'JIX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'126', N'330500', N'湖州市', N'12', N'2', N'0', N'0', N'Huzhou Shi', N'HZH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'127', N'330600', N'绍兴市', N'12', N'2', N'0', N'0', N'Shaoxing Shi', N'SXG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'128', N'330700', N'金华市', N'12', N'2', N'0', N'0', N'Jinhua Shi', N'JHA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'129', N'330800', N'衢州市', N'12', N'2', N'0', N'0', N'Quzhou Shi', N'QUZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'130', N'330900', N'舟山市', N'12', N'2', N'0', N'0', N'Zhoushan Shi', N'ZOS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'131', N'331000', N'台州市', N'12', N'2', N'0', N'0', N'Taizhou Shi', N'TZZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'132', N'331100', N'丽水市', N'12', N'2', N'0', N'0', N'Lishui Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'133', N'340100', N'合肥市', N'13', N'2', N'0', N'0', N'Hefei Shi', N'HFE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'134', N'340200', N'芜湖市', N'13', N'2', N'0', N'0', N'Wuhu Shi', N'WHI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'135', N'340300', N'蚌埠市', N'13', N'2', N'0', N'0', N'Bengbu Shi', N'BBU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'136', N'340400', N'淮南市', N'13', N'2', N'0', N'0', N'Huainan Shi', N'HNS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'137', N'340500', N'马鞍山市', N'13', N'2', N'0', N'0', N'Ma,anshan Shi', N'MAA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'138', N'340600', N'淮北市', N'13', N'2', N'0', N'0', N'Huaibei Shi', N'HBE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'139', N'340700', N'铜陵市', N'13', N'2', N'0', N'0', N'Tongling Shi', N'TOL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'140', N'340800', N'安庆市', N'13', N'2', N'0', N'0', N'Anqing Shi', N'AQG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'141', N'341000', N'黄山市', N'13', N'2', N'0', N'0', N'Huangshan Shi', N'HSN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'142', N'341100', N'滁州市', N'13', N'2', N'0', N'0', N'Chuzhou Shi', N'CUZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'143', N'341200', N'阜阳市', N'13', N'2', N'0', N'0', N'Fuyang Shi', N'FYS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'144', N'341300', N'宿州市', N'13', N'2', N'0', N'0', N'Suzhou Shi', N'SUZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'145', N'341400', N'巢湖市', N'13', N'2', N'0', N'0', N'Chaohu Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'146', N'341500', N'六安市', N'13', N'2', N'0', N'0', N'Liu,an Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'147', N'341600', N'亳州市', N'13', N'2', N'0', N'0', N'Bozhou Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'148', N'341700', N'池州市', N'13', N'2', N'0', N'0', N'Chizhou Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'149', N'341800', N'宣城市', N'13', N'2', N'0', N'0', N'Xuancheng Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'150', N'350100', N'福州市', N'14', N'2', N'0', N'0', N'Fuzhou Shi', N'FOC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'151', N'350200', N'厦门市', N'14', N'2', N'0', N'0', N'Xiamen Shi', N'XMN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'152', N'350300', N'莆田市', N'14', N'2', N'0', N'0', N'Putian Shi', N'PUT')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'153', N'350400', N'三明市', N'14', N'2', N'0', N'0', N'Sanming Shi', N'SMS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'154', N'350500', N'泉州市', N'14', N'2', N'0', N'0', N'Quanzhou Shi', N'QZJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'155', N'350600', N'漳州市', N'14', N'2', N'0', N'0', N'Zhangzhou Shi', N'ZZU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'156', N'350700', N'南平市', N'14', N'2', N'0', N'0', N'Nanping Shi', N'NPS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'157', N'350800', N'龙岩市', N'14', N'2', N'0', N'0', N'Longyan Shi', N'LYF')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'158', N'350900', N'宁德市', N'14', N'2', N'0', N'0', N'Ningde Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'159', N'360100', N'南昌市', N'15', N'2', N'0', N'0', N'Nanchang Shi', N'KHN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'160', N'360200', N'景德镇市', N'15', N'2', N'0', N'0', N'Jingdezhen Shi', N'JDZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'161', N'360300', N'萍乡市', N'15', N'2', N'0', N'0', N'Pingxiang Shi', N'PXS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'162', N'360400', N'九江市', N'15', N'2', N'0', N'0', N'Jiujiang Shi', N'JIU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'163', N'360500', N'新余市', N'15', N'2', N'0', N'0', N'Xinyu Shi', N'XYU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'164', N'360600', N'鹰潭市', N'15', N'2', N'0', N'0', N'Yingtan Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'165', N'360700', N'赣州市', N'15', N'2', N'0', N'0', N'Ganzhou Shi', N'GZH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'166', N'360800', N'吉安市', N'15', N'2', N'0', N'0', N'Ji,an Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'167', N'360900', N'宜春市', N'15', N'2', N'0', N'0', N'Yichun Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'168', N'361000', N'抚州市', N'15', N'2', N'0', N'0', N'Wuzhou Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'169', N'361100', N'上饶市', N'15', N'2', N'0', N'0', N'Shangrao Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'170', N'370100', N'济南市', N'16', N'2', N'0', N'0', N'Jinan Shi', N'TNA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'171', N'370200', N'青岛市', N'16', N'2', N'0', N'0', N'Qingdao Shi', N'TAO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'172', N'370300', N'淄博市', N'16', N'2', N'0', N'0', N'Zibo Shi', N'ZBO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'173', N'370400', N'枣庄市', N'16', N'2', N'0', N'0', N'Zaozhuang Shi', N'ZZG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'174', N'370500', N'东营市', N'16', N'2', N'0', N'0', N'Dongying Shi', N'DYG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'175', N'370600', N'烟台市', N'16', N'2', N'0', N'0', N'Yantai Shi', N'YNT')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'176', N'370700', N'潍坊市', N'16', N'2', N'0', N'0', N'Weifang Shi', N'WEF')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'177', N'370800', N'济宁市', N'16', N'2', N'0', N'0', N'Jining Shi', N'JNG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'178', N'370900', N'泰安市', N'16', N'2', N'0', N'0', N'Tai,an Shi', N'TAI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'179', N'371000', N'威海市', N'16', N'2', N'0', N'0', N'Weihai Shi', N'WEH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'180', N'371100', N'日照市', N'16', N'2', N'0', N'0', N'Rizhao Shi', N'RZH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'181', N'371200', N'莱芜市', N'16', N'2', N'0', N'0', N'Laiwu Shi', N'LWS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'182', N'371300', N'临沂市', N'16', N'2', N'0', N'0', N'Linyi Shi', N'LYI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'183', N'371400', N'德州市', N'16', N'2', N'0', N'0', N'Dezhou Shi', N'DZS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'184', N'371500', N'聊城市', N'16', N'2', N'0', N'0', N'Liaocheng Shi', N'LCH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'185', N'371600', N'滨州市', N'16', N'2', N'0', N'0', N'Binzhou Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'186', N'371700', N'菏泽市', N'16', N'2', N'0', N'0', N'Heze Shi', N'HZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'187', N'410100', N'郑州市', N'17', N'2', N'0', N'0', N'Zhengzhou Shi', N'C')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'188', N'410200', N'开封市', N'17', N'2', N'0', N'0', N'Kaifeng Shi', N'KFS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'189', N'410300', N'洛阳市', N'17', N'2', N'0', N'0', N'Luoyang Shi', N'LYA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'190', N'410400', N'平顶山市', N'17', N'2', N'0', N'0', N'Pingdingshan Shi', N'PDS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'191', N'410500', N'安阳市', N'17', N'2', N'0', N'0', N'Anyang Shi', N'AYS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'192', N'410600', N'鹤壁市', N'17', N'2', N'0', N'0', N'Hebi Shi', N'HBS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'193', N'410700', N'新乡市', N'17', N'2', N'0', N'0', N'Xinxiang Shi', N'XXS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'194', N'410800', N'焦作市', N'17', N'2', N'0', N'0', N'Jiaozuo Shi', N'JZY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'195', N'410900', N'濮阳市', N'17', N'2', N'0', N'0', N'Puyang Shi', N'PYS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'196', N'411000', N'许昌市', N'17', N'2', N'0', N'0', N'Xuchang Shi', N'XCS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'197', N'411100', N'漯河市', N'17', N'2', N'0', N'0', N'Luohe Shi', N'LHS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'198', N'411200', N'三门峡市', N'17', N'2', N'0', N'0', N'Sanmenxia Shi', N'SMX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'199', N'411300', N'南阳市', N'17', N'2', N'0', N'0', N'Nanyang Shi', N'NYS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'200', N'411400', N'商丘市', N'17', N'2', N'0', N'0', N'Shangqiu Shi', N'SQS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'201', N'411500', N'信阳市', N'17', N'2', N'0', N'0', N'Xinyang Shi', N'XYG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'202', N'411600', N'周口市', N'17', N'2', N'0', N'0', N'Zhoukou Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'203', N'411700', N'驻马店市', N'17', N'2', N'0', N'0', N'Zhumadian Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'204', N'420100', N'武汉市', N'18', N'2', N'0', N'0', N'Wuhan Shi', N'WUH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'205', N'420200', N'黄石市', N'18', N'2', N'0', N'0', N'Huangshi Shi', N'HIS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'206', N'420300', N'十堰市', N'18', N'2', N'0', N'0', N'Shiyan Shi', N'SYE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'207', N'420500', N'宜昌市', N'18', N'2', N'0', N'0', N'Yichang Shi', N'YCO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'208', N'420600', N'襄樊市', N'18', N'2', N'0', N'0', N'Xiangfan Shi', N'XFN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'209', N'420700', N'鄂州市', N'18', N'2', N'0', N'0', N'Ezhou Shi', N'EZS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'210', N'420800', N'荆门市', N'18', N'2', N'0', N'0', N'Jingmen Shi', N'JMS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'211', N'420900', N'孝感市', N'18', N'2', N'0', N'0', N'Xiaogan Shi', N'XGE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'212', N'421000', N'荆州市', N'18', N'2', N'0', N'0', N'Jingzhou Shi', N'JGZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'213', N'421100', N'黄冈市', N'18', N'2', N'0', N'0', N'Huanggang Shi', N'HE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'214', N'421200', N'咸宁市', N'18', N'2', N'0', N'0', N'Xianning Xian', N'XNS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'215', N'421300', N'随州市', N'18', N'2', N'0', N'0', N'Suizhou Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'216', N'422800', N'恩施土家族苗族自治州', N'18', N'2', N'0', N'0', N'Enshi Tujiazu Miaozu Zizhizhou', N'ESH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'217', N'429000', N'省直辖县级行政区划', N'18', N'2', N'0', N'0', N'shengzhixiaxianjixingzhengquhua', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'218', N'430100', N'长沙市', N'19', N'2', N'0', N'0', N'Changsha Shi', N'CSX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'219', N'430200', N'株洲市', N'19', N'2', N'0', N'0', N'Zhuzhou Shi', N'ZZS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'220', N'430300', N'湘潭市', N'19', N'2', N'0', N'0', N'Xiangtan Shi', N'XGT')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'221', N'430400', N'衡阳市', N'19', N'2', N'0', N'0', N'Hengyang Shi', N'HNY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'222', N'430500', N'邵阳市', N'19', N'2', N'0', N'0', N'Shaoyang Shi', N'SYR')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'223', N'430600', N'岳阳市', N'19', N'2', N'0', N'0', N'Yueyang Shi', N'YYG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'224', N'430700', N'常德市', N'19', N'2', N'0', N'0', N'Changde Shi', N'CDE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'225', N'430800', N'张家界市', N'19', N'2', N'0', N'0', N'Zhangjiajie Shi', N'ZJJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'226', N'430900', N'益阳市', N'19', N'2', N'0', N'0', N'Yiyang Shi', N'YYS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'227', N'431000', N'郴州市', N'19', N'2', N'0', N'0', N'Chenzhou Shi', N'CNZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'228', N'431100', N'永州市', N'19', N'2', N'0', N'0', N'Yongzhou Shi', N'YZS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'229', N'431200', N'怀化市', N'19', N'2', N'0', N'0', N'Huaihua Shi', N'HHS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'230', N'431300', N'娄底市', N'19', N'2', N'0', N'0', N'Loudi Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'231', N'433100', N'湘西土家族苗族自治州', N'19', N'2', N'0', N'0', N'Xiangxi Tujiazu Miaozu Zizhizhou', N'XXZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'232', N'440100', N'广州市', N'20', N'2', N'0', N'0', N'Guangzhou Shi', N'CAN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'233', N'440200', N'韶关市', N'20', N'2', N'0', N'0', N'Shaoguan Shi', N'HSC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'234', N'440300', N'深圳市', N'20', N'2', N'0', N'0', N'Shenzhen Shi', N'SZX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'235', N'440400', N'珠海市', N'20', N'2', N'0', N'0', N'Zhuhai Shi', N'ZUH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'236', N'440500', N'汕头市', N'20', N'2', N'0', N'0', N'Shantou Shi', N'SWA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'237', N'440600', N'佛山市', N'20', N'2', N'0', N'0', N'Foshan Shi', N'FOS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'238', N'440700', N'江门市', N'20', N'2', N'0', N'0', N'Jiangmen Shi', N'JMN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'239', N'440800', N'湛江市', N'20', N'2', N'0', N'0', N'Zhanjiang Shi', N'ZHA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'240', N'440900', N'茂名市', N'20', N'2', N'0', N'0', N'Maoming Shi', N'MMI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'241', N'441200', N'肇庆市', N'20', N'2', N'0', N'0', N'Zhaoqing Shi', N'ZQG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'242', N'441300', N'惠州市', N'20', N'2', N'0', N'0', N'Huizhou Shi', N'HUI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'243', N'441400', N'梅州市', N'20', N'2', N'0', N'0', N'Meizhou Shi', N'MXZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'244', N'441500', N'汕尾市', N'20', N'2', N'0', N'0', N'Shanwei Shi', N'SWE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'245', N'441600', N'河源市', N'20', N'2', N'0', N'0', N'Heyuan Shi', N'HEY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'246', N'441700', N'阳江市', N'20', N'2', N'0', N'0', N'Yangjiang Shi', N'YJI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'247', N'441800', N'清远市', N'20', N'2', N'0', N'0', N'Qingyuan Shi', N'QYN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'248', N'441900', N'东莞市', N'20', N'2', N'0', N'0', N'Dongguan Shi', N'DGG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'249', N'442000', N'中山市', N'20', N'2', N'0', N'0', N'Zhongshan Shi', N'ZSN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'250', N'445100', N'潮州市', N'20', N'2', N'0', N'0', N'Chaozhou Shi', N'CZY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'251', N'445200', N'揭阳市', N'20', N'2', N'0', N'0', N'Jieyang Shi', N'JIY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'252', N'445300', N'云浮市', N'20', N'2', N'0', N'0', N'Yunfu Shi', N'YFS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'253', N'450100', N'南宁市', N'21', N'2', N'0', N'0', N'Nanning Shi', N'NNG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'254', N'450200', N'柳州市', N'21', N'2', N'0', N'0', N'Liuzhou Shi', N'LZH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'255', N'450300', N'桂林市', N'21', N'2', N'0', N'0', N'Guilin Shi', N'KWL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'256', N'450400', N'梧州市', N'21', N'2', N'0', N'0', N'Wuzhou Shi', N'WUZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'257', N'450500', N'北海市', N'21', N'2', N'0', N'0', N'Beihai Shi', N'BHY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'258', N'450600', N'防城港市', N'21', N'2', N'0', N'0', N'Fangchenggang Shi', N'FAN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'259', N'450700', N'钦州市', N'21', N'2', N'0', N'0', N'Qinzhou Shi', N'QZH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'260', N'450800', N'贵港市', N'21', N'2', N'0', N'0', N'Guigang Shi', N'GUG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'261', N'450900', N'玉林市', N'21', N'2', N'0', N'0', N'Yulin Shi', N'YUL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'262', N'451000', N'百色市', N'21', N'2', N'0', N'0', N'Baise Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'263', N'451100', N'贺州市', N'21', N'2', N'0', N'0', N'Hezhou Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'264', N'451200', N'河池市', N'21', N'2', N'0', N'0', N'Hechi Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'265', N'451300', N'来宾市', N'21', N'2', N'0', N'0', N'Laibin Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'266', N'451400', N'崇左市', N'21', N'2', N'0', N'0', N'Chongzuo Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'267', N'460100', N'海口市', N'22', N'2', N'0', N'0', N'Haikou Shi', N'HAK')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'268', N'460200', N'三亚市', N'22', N'2', N'0', N'0', N'Sanya Shi', N'SYX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'269', N'469000', N'省直辖县级行政区划', N'22', N'2', N'0', N'0', N'shengzhixiaxianjixingzhengquhua', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'270', N'500100', N'市辖区', N'23', N'2', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'271', N'500200', N'县', N'23', N'2', N'0', N'0', N'Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'273', N'510100', N'成都市', N'24', N'2', N'0', N'0', N'Chengdu Shi', N'CTU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'274', N'510300', N'自贡市', N'24', N'2', N'0', N'0', N'Zigong Shi', N'ZGS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'275', N'510400', N'攀枝花市', N'24', N'2', N'0', N'0', N'Panzhihua Shi', N'PZH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'276', N'510500', N'泸州市', N'24', N'2', N'0', N'0', N'Luzhou Shi', N'LUZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'277', N'510600', N'德阳市', N'24', N'2', N'0', N'0', N'Deyang Shi', N'DEY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'278', N'510700', N'绵阳市', N'24', N'2', N'0', N'0', N'Mianyang Shi', N'MYG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'279', N'510800', N'广元市', N'24', N'2', N'0', N'0', N'Guangyuan Shi', N'GYC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'280', N'510900', N'遂宁市', N'24', N'2', N'0', N'0', N'Suining Shi', N'SNS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'281', N'511000', N'内江市', N'24', N'2', N'0', N'0', N'Neijiang Shi', N'NJS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'282', N'511100', N'乐山市', N'24', N'2', N'0', N'0', N'Leshan Shi', N'LES')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'283', N'511300', N'南充市', N'24', N'2', N'0', N'0', N'Nanchong Shi', N'NCO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'284', N'511400', N'眉山市', N'24', N'2', N'0', N'0', N'Meishan Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'285', N'511500', N'宜宾市', N'24', N'2', N'0', N'0', N'Yibin Shi', N'YBS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'286', N'511600', N'广安市', N'24', N'2', N'0', N'0', N'Guang,an Shi', N'GAC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'287', N'511700', N'达州市', N'24', N'2', N'0', N'0', N'Dazhou Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'288', N'511800', N'雅安市', N'24', N'2', N'0', N'0', N'Ya,an Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'289', N'511900', N'巴中市', N'24', N'2', N'0', N'0', N'Bazhong Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'290', N'512000', N'资阳市', N'24', N'2', N'0', N'0', N'Ziyang Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'291', N'513200', N'阿坝藏族羌族自治州', N'24', N'2', N'0', N'0', N'Aba(Ngawa) Zangzu Qiangzu Zizhizhou', N'ABA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'292', N'513300', N'甘孜藏族自治州', N'24', N'2', N'0', N'0', N'Garze Zangzu Zizhizhou', N'GAZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'293', N'513400', N'凉山彝族自治州', N'24', N'2', N'0', N'0', N'Liangshan Yizu Zizhizhou', N'LSY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'294', N'520100', N'贵阳市', N'25', N'2', N'0', N'0', N'Guiyang Shi', N'KWE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'295', N'520200', N'六盘水市', N'25', N'2', N'0', N'0', N'Liupanshui Shi', N'LPS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'296', N'520300', N'遵义市', N'25', N'2', N'0', N'0', N'Zunyi Shi', N'ZNY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'297', N'520400', N'安顺市', N'25', N'2', N'0', N'0', N'Anshun Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'298', N'522200', N'铜仁地区', N'25', N'2', N'0', N'0', N'Tongren Diqu', N'TRD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'299', N'522300', N'黔西南布依族苗族自治州', N'25', N'2', N'0', N'0', N'Qianxinan Buyeizu Zizhizhou', N'QXZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'300', N'522400', N'毕节地区', N'25', N'2', N'0', N'0', N'Bijie Diqu', N'BJD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'301', N'522600', N'黔东南苗族侗族自治州', N'25', N'2', N'0', N'0', N'Qiandongnan Miaozu Dongzu Zizhizhou', N'QND')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'302', N'522700', N'黔南布依族苗族自治州', N'25', N'2', N'0', N'0', N'Qiannan Buyeizu Miaozu Zizhizhou', N'QNZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'303', N'530100', N'昆明市', N'26', N'2', N'0', N'0', N'Kunming Shi', N'KMG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'304', N'530300', N'曲靖市', N'26', N'2', N'0', N'0', N'Qujing Shi', N'QJS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'305', N'530400', N'玉溪市', N'26', N'2', N'0', N'0', N'Yuxi Shi', N'YXS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'306', N'530500', N'保山市', N'26', N'2', N'0', N'0', N'Baoshan Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'307', N'530600', N'昭通市', N'26', N'2', N'0', N'0', N'Zhaotong Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'308', N'530700', N'丽江市', N'26', N'2', N'0', N'0', N'Lijiang Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'309', N'530800', N'普洱市', N'26', N'2', N'0', N'0', N'Simao Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'310', N'530900', N'临沧市', N'26', N'2', N'0', N'0', N'Lincang Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'311', N'532300', N'楚雄彝族自治州', N'26', N'2', N'0', N'0', N'Chuxiong Yizu Zizhizhou', N'CXD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'312', N'532500', N'红河哈尼族彝族自治州', N'26', N'2', N'0', N'0', N'Honghe Hanizu Yizu Zizhizhou', N'HHZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'313', N'532600', N'文山壮族苗族自治州', N'26', N'2', N'0', N'0', N'Wenshan Zhuangzu Miaozu Zizhizhou', N'WSZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'314', N'532800', N'西双版纳傣族自治州', N'26', N'2', N'0', N'0', N'Xishuangbanna Daizu Zizhizhou', N'XSB')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'315', N'532900', N'大理白族自治州', N'26', N'2', N'0', N'0', N'Dali Baizu Zizhizhou', N'DLZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'316', N'533100', N'德宏傣族景颇族自治州', N'26', N'2', N'0', N'0', N'Dehong Daizu Jingpozu Zizhizhou', N'DHG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'317', N'533300', N'怒江傈僳族自治州', N'26', N'2', N'0', N'0', N'Nujiang Lisuzu Zizhizhou', N'NUJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'318', N'533400', N'迪庆藏族自治州', N'26', N'2', N'0', N'0', N'Deqen Zangzu Zizhizhou', N'DEZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'319', N'540100', N'拉萨市', N'27', N'2', N'0', N'0', N'Lhasa Shi', N'LXA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'320', N'542100', N'昌都地区', N'27', N'2', N'0', N'0', N'Qamdo Diqu', N'QAD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'321', N'542200', N'山南地区', N'27', N'2', N'0', N'0', N'Shannan Diqu', N'SND')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'322', N'542300', N'日喀则地区', N'27', N'2', N'0', N'0', N'Xigaze Diqu', N'XID')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'323', N'542400', N'那曲地区', N'27', N'2', N'0', N'0', N'Nagqu Diqu', N'NAD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'324', N'542500', N'阿里地区', N'27', N'2', N'0', N'0', N'Ngari Diqu', N'NGD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'325', N'542600', N'林芝地区', N'27', N'2', N'0', N'0', N'Nyingchi Diqu', N'NYD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'326', N'610100', N'西安市', N'28', N'2', N'0', N'0', N'Xi,an Shi', N'SIA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'327', N'610200', N'铜川市', N'28', N'2', N'0', N'0', N'Tongchuan Shi', N'TCN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'328', N'610300', N'宝鸡市', N'28', N'2', N'0', N'0', N'Baoji Shi', N'BJI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'329', N'610400', N'咸阳市', N'28', N'2', N'0', N'0', N'Xianyang Shi', N'XYS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'330', N'610500', N'渭南市', N'28', N'2', N'0', N'0', N'Weinan Shi', N'WNA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'331', N'610600', N'延安市', N'28', N'2', N'0', N'0', N'Yan,an Shi', N'YNA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'332', N'610700', N'汉中市', N'28', N'2', N'0', N'0', N'Hanzhong Shi', N'HZJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'333', N'610800', N'榆林市', N'28', N'2', N'0', N'0', N'Yulin Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'334', N'610900', N'安康市', N'28', N'2', N'0', N'0', N'Ankang Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'335', N'611000', N'商洛市', N'28', N'2', N'0', N'0', N'Shangluo Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'336', N'620100', N'兰州市', N'29', N'2', N'0', N'0', N'Lanzhou Shi', N'LHW')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'337', N'620200', N'嘉峪关市', N'29', N'2', N'0', N'0', N'Jiayuguan Shi', N'JYG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'338', N'620300', N'金昌市', N'29', N'2', N'0', N'0', N'Jinchang Shi', N'JCS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'339', N'620400', N'白银市', N'29', N'2', N'0', N'0', N'Baiyin Shi', N'BYS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'340', N'620500', N'天水市', N'29', N'2', N'0', N'0', N'Tianshui Shi', N'TSU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'341', N'620600', N'武威市', N'29', N'2', N'0', N'0', N'Wuwei Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'342', N'620700', N'张掖市', N'29', N'2', N'0', N'0', N'Zhangye Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'343', N'620800', N'平凉市', N'29', N'2', N'0', N'0', N'Pingliang Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'344', N'620900', N'酒泉市', N'29', N'2', N'0', N'0', N'Jiuquan Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'345', N'621000', N'庆阳市', N'29', N'2', N'0', N'0', N'Qingyang Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'346', N'621100', N'定西市', N'29', N'2', N'0', N'0', N'Dingxi Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'347', N'621200', N'陇南市', N'29', N'2', N'0', N'0', N'Longnan Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'348', N'622900', N'临夏回族自治州', N'29', N'2', N'0', N'0', N'Linxia Huizu Zizhizhou', N'LXH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'349', N'623000', N'甘南藏族自治州', N'29', N'2', N'0', N'0', N'Gannan Zangzu Zizhizhou', N'GNZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'350', N'630100', N'西宁市', N'30', N'2', N'0', N'0', N'Xining Shi', N'XNN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'351', N'632100', N'海东地区', N'30', N'2', N'0', N'0', N'Haidong Diqu', N'HDD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'352', N'632200', N'海北藏族自治州', N'30', N'2', N'0', N'0', N'Haibei Zangzu Zizhizhou', N'HBZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'353', N'632300', N'黄南藏族自治州', N'30', N'2', N'0', N'0', N'Huangnan Zangzu Zizhizhou', N'HNZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'354', N'632500', N'海南藏族自治州', N'30', N'2', N'0', N'0', N'Hainan Zangzu Zizhizhou', N'HNN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'355', N'632600', N'果洛藏族自治州', N'30', N'2', N'0', N'0', N'Golog Zangzu Zizhizhou', N'L')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'356', N'632700', N'玉树藏族自治州', N'30', N'2', N'0', N'0', N'Yushu Zangzu Zizhizhou', N'YSZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'357', N'632800', N'海西蒙古族藏族自治州', N'30', N'2', N'0', N'0', N'Haixi Mongolzu Zangzu Zizhizhou', N'HXZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'358', N'640100', N'银川市', N'31', N'2', N'0', N'0', N'Yinchuan Shi', N'INC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'359', N'640200', N'石嘴山市', N'31', N'2', N'0', N'0', N'Shizuishan Shi', N'SZS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'360', N'640300', N'吴忠市', N'31', N'2', N'0', N'0', N'Wuzhong Shi', N'WZS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'361', N'640400', N'固原市', N'31', N'2', N'0', N'0', N'Guyuan Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'362', N'640500', N'中卫市', N'31', N'2', N'0', N'0', N'Zhongwei Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'363', N'650100', N'乌鲁木齐市', N'32', N'2', N'0', N'0', N'Urumqi Shi', N'URC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'364', N'650200', N'克拉玛依市', N'32', N'2', N'0', N'0', N'Karamay Shi', N'KAR')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'365', N'652100', N'吐鲁番地区', N'32', N'2', N'0', N'0', N'Turpan Diqu', N'TUD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'366', N'652200', N'哈密地区', N'32', N'2', N'0', N'0', N'Hami(kumul) Diqu', N'HMD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'367', N'652300', N'昌吉回族自治州', N'32', N'2', N'0', N'0', N'Changji Huizu Zizhizhou', N'CJZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'368', N'652700', N'博尔塔拉蒙古自治州', N'32', N'2', N'0', N'0', N'Bortala Monglo Zizhizhou', N'BOR')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'369', N'652800', N'巴音郭楞蒙古自治州', N'32', N'2', N'0', N'0', N'bayinguolengmengguzizhizhou', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'370', N'652900', N'阿克苏地区', N'32', N'2', N'0', N'0', N'Aksu Diqu', N'AKD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'371', N'653000', N'克孜勒苏柯尔克孜自治州', N'32', N'2', N'0', N'0', N'Kizilsu Kirgiz Zizhizhou', N'KIZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'372', N'653100', N'喀什地区', N'32', N'2', N'0', N'0', N'Kashi(Kaxgar) Diqu', N'KSI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'373', N'653200', N'和田地区', N'32', N'2', N'0', N'0', N'Hotan Diqu', N'HOD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'374', N'654000', N'伊犁哈萨克自治州', N'32', N'2', N'0', N'0', N'Ili Kazak Zizhizhou', N'ILD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'375', N'654200', N'塔城地区', N'32', N'2', N'0', N'0', N'Tacheng(Qoqek) Diqu', N'TCD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'376', N'654300', N'阿勒泰地区', N'32', N'2', N'0', N'0', N'Altay Diqu', N'ALD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'377', N'659000', N'自治区直辖县级行政区划', N'32', N'2', N'0', N'0', N'zizhiquzhixiaxianjixingzhengquhua', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'378', N'110101', N'东城区', N'33', N'3', N'0', N'0', N'Dongcheng Qu', N'DCQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'379', N'110102', N'西城区', N'33', N'3', N'0', N'0', N'Xicheng Qu', N'XCQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'382', N'110105', N'朝阳区', N'33', N'3', N'0', N'0', N'Chaoyang Qu', N'CYQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'383', N'110106', N'丰台区', N'33', N'3', N'0', N'0', N'Fengtai Qu', N'FTQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'384', N'110107', N'石景山区', N'33', N'3', N'0', N'0', N'Shijingshan Qu', N'SJS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'385', N'110108', N'海淀区', N'33', N'3', N'0', N'0', N'Haidian Qu', N'HDN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'386', N'110109', N'门头沟区', N'33', N'3', N'0', N'0', N'Mentougou Qu', N'MTG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'387', N'110111', N'房山区', N'33', N'3', N'0', N'0', N'Fangshan Qu', N'FSQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'388', N'110112', N'通州区', N'33', N'3', N'0', N'0', N'Tongzhou Qu', N'TZQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'389', N'110113', N'顺义区', N'33', N'3', N'0', N'0', N'Shunyi Qu', N'SYI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'390', N'110114', N'昌平区', N'33', N'3', N'0', N'0', N'Changping Qu', N'CP Q')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'391', N'110115', N'大兴区', N'33', N'3', N'0', N'0', N'Daxing Qu', N'DX Q')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'392', N'110116', N'怀柔区', N'33', N'3', N'0', N'0', N'Huairou Qu', N'HR Q')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'393', N'110117', N'平谷区', N'33', N'3', N'0', N'0', N'Pinggu Qu', N'PG Q')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'394', N'110228', N'密云县', N'34', N'3', N'0', N'0', N'Miyun Xian', N'MYN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'395', N'110229', N'延庆县', N'34', N'3', N'0', N'0', N'Yanqing Xian', N'YQX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'396', N'120101', N'和平区', N'35', N'3', N'0', N'0', N'Heping Qu', N'HPG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'397', N'120102', N'河东区', N'35', N'3', N'0', N'0', N'Hedong Qu', N'HDQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'398', N'120103', N'河西区', N'35', N'3', N'0', N'0', N'Hexi Qu', N'HXQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'399', N'120104', N'南开区', N'35', N'3', N'0', N'0', N'Nankai Qu', N'NKQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'400', N'120105', N'河北区', N'35', N'3', N'0', N'0', N'Hebei Qu', N'HBQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'401', N'120106', N'红桥区', N'35', N'3', N'0', N'0', N'Hongqiao Qu', N'HQO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'404', N'120116', N'滨海新区', N'35', N'3', N'0', N'0', N'Dagang Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'405', N'120110', N'东丽区', N'35', N'3', N'0', N'0', N'Dongli Qu', N'DLI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'406', N'120111', N'西青区', N'35', N'3', N'0', N'0', N'Xiqing Qu', N'XQG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'407', N'120112', N'津南区', N'35', N'3', N'0', N'0', N'Jinnan Qu', N'JNQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'408', N'120113', N'北辰区', N'35', N'3', N'0', N'0', N'Beichen Qu', N'BCQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'409', N'120114', N'武清区', N'35', N'3', N'0', N'0', N'Wuqing Qu', N'WQ Q')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'410', N'120115', N'宝坻区', N'35', N'3', N'0', N'0', N'Baodi Qu', N'BDI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'411', N'120221', N'宁河县', N'36', N'3', N'0', N'0', N'Ninghe Xian', N'NHE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'412', N'120223', N'静海县', N'36', N'3', N'0', N'0', N'Jinghai Xian', N'JHT')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'413', N'120225', N'蓟县', N'36', N'3', N'0', N'0', N'Ji Xian', N'JIT')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'414', N'130101', N'市辖区', N'37', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'415', N'130102', N'长安区', N'37', N'3', N'0', N'0', N'Chang,an Qu', N'CAQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'416', N'130103', N'桥东区', N'37', N'3', N'0', N'0', N'Qiaodong Qu', N'QDQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'417', N'130104', N'桥西区', N'37', N'3', N'0', N'0', N'Qiaoxi Qu', N'QXQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'418', N'130105', N'新华区', N'37', N'3', N'0', N'0', N'Xinhua Qu', N'XHK')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'419', N'130107', N'井陉矿区', N'37', N'3', N'0', N'0', N'Jingxing Kuangqu', N'JXK')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'420', N'130108', N'裕华区', N'37', N'3', N'0', N'0', N'Yuhua Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'421', N'130121', N'井陉县', N'37', N'3', N'0', N'0', N'Jingxing Xian', N'JXJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'422', N'130123', N'正定县', N'37', N'3', N'0', N'0', N'Zhengding Xian', N'ZDJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'423', N'130124', N'栾城县', N'37', N'3', N'0', N'0', N'Luancheng Xian', N'LCG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'424', N'130125', N'行唐县', N'37', N'3', N'0', N'0', N'Xingtang Xian', N'XTG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'425', N'130126', N'灵寿县', N'37', N'3', N'0', N'0', N'Lingshou Xian', N'LSO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'426', N'130127', N'高邑县', N'37', N'3', N'0', N'0', N'Gaoyi Xian', N'GYJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'427', N'130128', N'深泽县', N'37', N'3', N'0', N'0', N'Shenze Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'428', N'130129', N'赞皇县', N'37', N'3', N'0', N'0', N'Zanhuang Xian', N'ZHG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'429', N'130130', N'无极县', N'37', N'3', N'0', N'0', N'Wuji Xian', N'WJI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'430', N'130131', N'平山县', N'37', N'3', N'0', N'0', N'Pingshan Xian', N'PSH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'431', N'130132', N'元氏县', N'37', N'3', N'0', N'0', N'Yuanshi Xian', N'YSI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'432', N'130133', N'赵县', N'37', N'3', N'0', N'0', N'Zhao Xian', N'ZAO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'433', N'130181', N'辛集市', N'37', N'3', N'0', N'0', N'Xinji Shi', N'XJS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'434', N'130182', N'藁城市', N'37', N'3', N'0', N'0', N'Gaocheng Shi', N'GCS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'435', N'130183', N'晋州市', N'37', N'3', N'0', N'0', N'Jinzhou Shi', N'JZJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'436', N'130184', N'新乐市', N'37', N'3', N'0', N'0', N'Xinle Shi', N'XLE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'437', N'130185', N'鹿泉市', N'37', N'3', N'0', N'0', N'Luquan Shi', N'LUQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'438', N'130201', N'市辖区', N'38', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'439', N'130202', N'路南区', N'38', N'3', N'0', N'0', N'Lunan Qu', N'LNB')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'440', N'130203', N'路北区', N'38', N'3', N'0', N'0', N'Lubei Qu', N'LBQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'441', N'130204', N'古冶区', N'38', N'3', N'0', N'0', N'Guye Qu', N'GYE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'442', N'130205', N'开平区', N'38', N'3', N'0', N'0', N'Kaiping Qu', N'KPQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'443', N'130207', N'丰南区', N'38', N'3', N'0', N'0', N'Fengnan Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'444', N'130208', N'丰润区', N'38', N'3', N'0', N'0', N'Fengrun Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'445', N'130223', N'滦县', N'38', N'3', N'0', N'0', N'Luan Xian', N'LUA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'446', N'130224', N'滦南县', N'38', N'3', N'0', N'0', N'Luannan Xian', N'LNJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'447', N'130225', N'乐亭县', N'38', N'3', N'0', N'0', N'Leting Xian', N'LTJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'448', N'130227', N'迁西县', N'38', N'3', N'0', N'0', N'Qianxi Xian', N'QXX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'449', N'130229', N'玉田县', N'38', N'3', N'0', N'0', N'Yutian Xian', N'YTJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'450', N'130230', N'唐海县', N'38', N'3', N'0', N'0', N'Tanghai Xian', N'THA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'451', N'130281', N'遵化市', N'38', N'3', N'0', N'0', N'Zunhua Shi', N'ZNH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'452', N'130283', N'迁安市', N'38', N'3', N'0', N'0', N'Qian,an Shi', N'QAS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'453', N'130301', N'市辖区', N'39', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'454', N'130302', N'海港区', N'39', N'3', N'0', N'0', N'Haigang Qu', N'HGG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'455', N'130303', N'山海关区', N'39', N'3', N'0', N'0', N'Shanhaiguan Qu', N'SHG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'456', N'130304', N'北戴河区', N'39', N'3', N'0', N'0', N'Beidaihe Qu', N'BDH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'457', N'130321', N'青龙满族自治县', N'39', N'3', N'0', N'0', N'Qinglong Manzu Zizhixian', N'QLM')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'458', N'130322', N'昌黎县', N'39', N'3', N'0', N'0', N'Changli Xian', N'CGL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'459', N'130323', N'抚宁县', N'39', N'3', N'0', N'0', N'Funing Xian', N'FUN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'460', N'130324', N'卢龙县', N'39', N'3', N'0', N'0', N'Lulong Xian', N'LLG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'461', N'130401', N'市辖区', N'40', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'462', N'130402', N'邯山区', N'40', N'3', N'0', N'0', N'Hanshan Qu', N'HHD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'463', N'130403', N'丛台区', N'40', N'3', N'0', N'0', N'Congtai Qu', N'CTQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'464', N'130404', N'复兴区', N'40', N'3', N'0', N'0', N'Fuxing Qu', N'FXQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'465', N'130406', N'峰峰矿区', N'40', N'3', N'0', N'0', N'Fengfeng Kuangqu', N'FFK')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'466', N'130421', N'邯郸县', N'40', N'3', N'0', N'0', N'Handan Xian', N'HDX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'467', N'130423', N'临漳县', N'40', N'3', N'0', N'0', N'Linzhang Xian', N'LNZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'468', N'130424', N'成安县', N'40', N'3', N'0', N'0', N'Cheng,an Xian', N'CAJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'469', N'130425', N'大名县', N'40', N'3', N'0', N'0', N'Daming Xian', N'DMX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'470', N'130426', N'涉县', N'40', N'3', N'0', N'0', N'She Xian', N'SEJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'471', N'130427', N'磁县', N'40', N'3', N'0', N'0', N'Ci Xian', N'CIX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'472', N'130428', N'肥乡县', N'40', N'3', N'0', N'0', N'Feixiang Xian', N'FXJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'473', N'130429', N'永年县', N'40', N'3', N'0', N'0', N'Yongnian Xian', N'YON')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'474', N'130430', N'邱县', N'40', N'3', N'0', N'0', N'Qiu Xian', N'QIU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'475', N'130431', N'鸡泽县', N'40', N'3', N'0', N'0', N'Jize Xian', N'JZE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'476', N'130432', N'广平县', N'40', N'3', N'0', N'0', N'Guangping Xian', N'GPX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'477', N'130433', N'馆陶县', N'40', N'3', N'0', N'0', N'Guantao Xian', N'GTO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'478', N'130434', N'魏县', N'40', N'3', N'0', N'0', N'Wei Xian', N'WEI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'479', N'130435', N'曲周县', N'40', N'3', N'0', N'0', N'Quzhou Xian', N'QZX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'480', N'130481', N'武安市', N'40', N'3', N'0', N'0', N'Wu,an Shi', N'WUA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'481', N'130501', N'市辖区', N'41', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'482', N'130502', N'桥东区', N'41', N'3', N'0', N'0', N'Qiaodong Qu', N'QDG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'483', N'130503', N'桥西区', N'41', N'3', N'0', N'0', N'Qiaoxi Qu', N'QXT')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'484', N'130521', N'邢台县', N'41', N'3', N'0', N'0', N'Xingtai Xian', N'XTJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'485', N'130522', N'临城县', N'41', N'3', N'0', N'0', N'Lincheng Xian', N'LNC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'486', N'130523', N'内丘县', N'41', N'3', N'0', N'0', N'Neiqiu Xian', N'NQU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'487', N'130524', N'柏乡县', N'41', N'3', N'0', N'0', N'Baixiang Xian', N'BXG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'488', N'130525', N'隆尧县', N'41', N'3', N'0', N'0', N'Longyao Xian', N'LYO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'489', N'130526', N'任县', N'41', N'3', N'0', N'0', N'Ren Xian', N'REN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'490', N'130527', N'南和县', N'41', N'3', N'0', N'0', N'Nanhe Xian', N'NHX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'491', N'130528', N'宁晋县', N'41', N'3', N'0', N'0', N'Ningjin Xian', N'NJN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'492', N'130529', N'巨鹿县', N'41', N'3', N'0', N'0', N'Julu Xian', N'JLU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'493', N'130530', N'新河县', N'41', N'3', N'0', N'0', N'Xinhe Xian', N'XHJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'494', N'130531', N'广宗县', N'41', N'3', N'0', N'0', N'Guangzong Xian', N'GZJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'495', N'130532', N'平乡县', N'41', N'3', N'0', N'0', N'Pingxiang Xian', N'PXX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'496', N'130533', N'威县', N'41', N'3', N'0', N'0', N'Wei Xian', N'WEX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'497', N'130534', N'清河县', N'41', N'3', N'0', N'0', N'Qinghe Xian', N'QHE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'498', N'130535', N'临西县', N'41', N'3', N'0', N'0', N'Linxi Xian', N'LXI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'499', N'130581', N'南宫市', N'41', N'3', N'0', N'0', N'Nangong Shi', N'N')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'500', N'130582', N'沙河市', N'41', N'3', N'0', N'0', N'Shahe Shi', N'SHS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'501', N'130601', N'市辖区', N'42', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'503', N'130603', N'北市区', N'42', N'3', N'0', N'0', N'Beishi Qu', N'BSI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'504', N'130604', N'南市区', N'42', N'3', N'0', N'0', N'Nanshi Qu', N'NSB')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'505', N'130621', N'满城县', N'42', N'3', N'0', N'0', N'Mancheng Xian', N'MCE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'506', N'130622', N'清苑县', N'42', N'3', N'0', N'0', N'Qingyuan Xian', N'QYJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'507', N'130623', N'涞水县', N'42', N'3', N'0', N'0', N'Laishui Xian', N'LSM')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'508', N'130624', N'阜平县', N'42', N'3', N'0', N'0', N'Fuping Xian', N'FUP')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'509', N'130625', N'徐水县', N'42', N'3', N'0', N'0', N'Xushui Xian', N'XSJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'510', N'130626', N'定兴县', N'42', N'3', N'0', N'0', N'Dingxing Xian', N'DXG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'511', N'130627', N'唐县', N'42', N'3', N'0', N'0', N'Tang Xian', N'TAG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'512', N'130628', N'高阳县', N'42', N'3', N'0', N'0', N'Gaoyang Xian', N'GAY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'513', N'130629', N'容城县', N'42', N'3', N'0', N'0', N'Rongcheng Xian', N'RCX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'514', N'130630', N'涞源县', N'42', N'3', N'0', N'0', N'Laiyuan Xian', N'LIY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'515', N'130631', N'望都县', N'42', N'3', N'0', N'0', N'Wangdu Xian', N'WDU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'516', N'130632', N'安新县', N'42', N'3', N'0', N'0', N'Anxin Xian', N'AXX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'517', N'130633', N'易县', N'42', N'3', N'0', N'0', N'Yi Xian', N'YII')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'518', N'130634', N'曲阳县', N'42', N'3', N'0', N'0', N'Quyang Xian', N'QUY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'519', N'130635', N'蠡县', N'42', N'3', N'0', N'0', N'Li Xian', N'LXJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'520', N'130636', N'顺平县', N'42', N'3', N'0', N'0', N'Shunping Xian', N'SPI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'521', N'130637', N'博野县', N'42', N'3', N'0', N'0', N'Boye Xian', N'BYE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'522', N'130638', N'雄县', N'42', N'3', N'0', N'0', N'Xiong Xian', N'XOX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'523', N'130681', N'涿州市', N'42', N'3', N'0', N'0', N'Zhuozhou Shi', N'ZZO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'524', N'130682', N'定州市', N'42', N'3', N'0', N'0', N'Dingzhou Shi', N'DZO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'525', N'130683', N'安国市', N'42', N'3', N'0', N'0', N'Anguo Shi', N'A')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'526', N'130684', N'高碑店市', N'42', N'3', N'0', N'0', N'Gaobeidian Shi', N'GBD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'527', N'130701', N'市辖区', N'43', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'528', N'130702', N'桥东区', N'43', N'3', N'0', N'0', N'Qiaodong Qu', N'QDZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'529', N'130703', N'桥西区', N'43', N'3', N'0', N'0', N'Qiaoxi Qu', N'QXI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'530', N'130705', N'宣化区', N'43', N'3', N'0', N'0', N'Xuanhua Qu', N'XHZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'531', N'130706', N'下花园区', N'43', N'3', N'0', N'0', N'Xiahuayuan Qu', N'XHY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'532', N'130721', N'宣化县', N'43', N'3', N'0', N'0', N'Xuanhua Xian', N'XHX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'533', N'130722', N'张北县', N'43', N'3', N'0', N'0', N'Zhangbei Xian', N'ZGB')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'534', N'130723', N'康保县', N'43', N'3', N'0', N'0', N'Kangbao Xian', N'KBO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'535', N'130724', N'沽源县', N'43', N'3', N'0', N'0', N'Guyuan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'536', N'130725', N'尚义县', N'43', N'3', N'0', N'0', N'Shangyi Xian', N'SYK')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'537', N'130726', N'蔚县', N'43', N'3', N'0', N'0', N'Yu Xian', N'YXJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'538', N'130727', N'阳原县', N'43', N'3', N'0', N'0', N'Yangyuan Xian', N'YYN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'539', N'130728', N'怀安县', N'43', N'3', N'0', N'0', N'Huai,an Xian', N'HAX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'540', N'130729', N'万全县', N'43', N'3', N'0', N'0', N'Wanquan Xian', N'WQN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'541', N'130730', N'怀来县', N'43', N'3', N'0', N'0', N'Huailai Xian', N'HLA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'542', N'130731', N'涿鹿县', N'43', N'3', N'0', N'0', N'Zhuolu Xian', N'ZLU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'543', N'130732', N'赤城县', N'43', N'3', N'0', N'0', N'Chicheng Xian', N'CCX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'544', N'130733', N'崇礼县', N'43', N'3', N'0', N'0', N'Chongli Xian', N'COL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'545', N'130801', N'市辖区', N'44', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'546', N'130802', N'双桥区', N'44', N'3', N'0', N'0', N'Shuangqiao Qu', N'SQO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'547', N'130803', N'双滦区', N'44', N'3', N'0', N'0', N'Shuangluan Qu', N'SLQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'548', N'130804', N'鹰手营子矿区', N'44', N'3', N'0', N'0', N'Yingshouyingzi Kuangqu', N'YSY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'549', N'130821', N'承德县', N'44', N'3', N'0', N'0', N'Chengde Xian', N'CDX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'550', N'130822', N'兴隆县', N'44', N'3', N'0', N'0', N'Xinglong Xian', N'XLJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'551', N'130823', N'平泉县', N'44', N'3', N'0', N'0', N'Pingquan Xian', N'PQN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'552', N'130824', N'滦平县', N'44', N'3', N'0', N'0', N'Luanping Xian', N'LUP')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'553', N'130825', N'隆化县', N'44', N'3', N'0', N'0', N'Longhua Xian', N'LHJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'554', N'130826', N'丰宁满族自治县', N'44', N'3', N'0', N'0', N'Fengning Manzu Zizhixian', N'FNJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'555', N'130827', N'宽城满族自治县', N'44', N'3', N'0', N'0', N'Kuancheng Manzu Zizhixian', N'KCX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'556', N'130828', N'围场满族蒙古族自治县', N'44', N'3', N'0', N'0', N'Weichang Manzu Menggolzu Zizhixian', N'WCJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'557', N'130901', N'市辖区', N'45', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'558', N'130902', N'新华区', N'45', N'3', N'0', N'0', N'Xinhua Qu', N'XHF')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'559', N'130903', N'运河区', N'45', N'3', N'0', N'0', N'Yunhe Qu', N'YHC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'560', N'130921', N'沧县', N'45', N'3', N'0', N'0', N'Cang Xian', N'CAG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'561', N'130922', N'青县', N'45', N'3', N'0', N'0', N'Qing Xian', N'QIG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'562', N'130923', N'东光县', N'45', N'3', N'0', N'0', N'Dongguang Xian', N'DGU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'563', N'130924', N'海兴县', N'45', N'3', N'0', N'0', N'Haixing Xian', N'HXG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'564', N'130925', N'盐山县', N'45', N'3', N'0', N'0', N'Yanshan Xian', N'YNS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'565', N'130926', N'肃宁县', N'45', N'3', N'0', N'0', N'Suning Xian', N'SNG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'566', N'130927', N'南皮县', N'45', N'3', N'0', N'0', N'Nanpi Xian', N'NPI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'567', N'130928', N'吴桥县', N'45', N'3', N'0', N'0', N'Wuqiao Xian', N'WUQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'568', N'130929', N'献县', N'45', N'3', N'0', N'0', N'Xian Xian', N'XXN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'569', N'130930', N'孟村回族自治县', N'45', N'3', N'0', N'0', N'Mengcun Huizu Zizhixian', N'MCN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'570', N'130981', N'泊头市', N'45', N'3', N'0', N'0', N'Botou Shi', N'BOT')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'571', N'130982', N'任丘市', N'45', N'3', N'0', N'0', N'Renqiu Shi', N'RQS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'572', N'130983', N'黄骅市', N'45', N'3', N'0', N'0', N'Huanghua Shi', N'HHJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'573', N'130984', N'河间市', N'45', N'3', N'0', N'0', N'Hejian Shi', N'HJN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'574', N'131001', N'市辖区', N'46', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'575', N'131002', N'安次区', N'46', N'3', N'0', N'0', N'Anci Qu', N'ACI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'576', N'131003', N'广阳区', N'46', N'3', N'0', N'0', N'Guangyang Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'577', N'131022', N'固安县', N'46', N'3', N'0', N'0', N'Gu,an Xian', N'GUA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'578', N'131023', N'永清县', N'46', N'3', N'0', N'0', N'Yongqing Xian', N'YQG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'579', N'131024', N'香河县', N'46', N'3', N'0', N'0', N'Xianghe Xian', N'XGH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'580', N'131025', N'大城县', N'46', N'3', N'0', N'0', N'Dacheng Xian', N'DCJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'581', N'131026', N'文安县', N'46', N'3', N'0', N'0', N'Wen,an Xian', N'WEA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'582', N'131028', N'大厂回族自治县', N'46', N'3', N'0', N'0', N'Dachang Huizu Zizhixian', N'DCG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'583', N'131081', N'霸州市', N'46', N'3', N'0', N'0', N'Bazhou Shi', N'BZO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'584', N'131082', N'三河市', N'46', N'3', N'0', N'0', N'Sanhe Shi', N'SNH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'585', N'131101', N'市辖区', N'47', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'586', N'131102', N'桃城区', N'47', N'3', N'0', N'0', N'Taocheng Qu', N'TOC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'587', N'131121', N'枣强县', N'47', N'3', N'0', N'0', N'Zaoqiang Xian', N'ZQJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'588', N'131122', N'武邑县', N'47', N'3', N'0', N'0', N'Wuyi Xian', N'WYI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'589', N'131123', N'武强县', N'47', N'3', N'0', N'0', N'Wuqiang Xian', N'WQG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'590', N'131124', N'饶阳县', N'47', N'3', N'0', N'0', N'Raoyang Xian', N'RYG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'591', N'131125', N'安平县', N'47', N'3', N'0', N'0', N'Anping Xian', N'APG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'592', N'131126', N'故城县', N'47', N'3', N'0', N'0', N'Gucheng Xian', N'GCE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'593', N'131127', N'景县', N'47', N'3', N'0', N'0', N'Jing Xian', N'JIG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'594', N'131128', N'阜城县', N'47', N'3', N'0', N'0', N'Fucheng Xian', N'FCE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'595', N'131181', N'冀州市', N'47', N'3', N'0', N'0', N'Jizhou Shi', N'JIZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'596', N'131182', N'深州市', N'47', N'3', N'0', N'0', N'Shenzhou Shi', N'SNZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'597', N'140101', N'市辖区', N'48', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'598', N'140105', N'小店区', N'48', N'3', N'0', N'0', N'Xiaodian Qu', N'XDQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'599', N'140106', N'迎泽区', N'48', N'3', N'0', N'0', N'Yingze Qu', N'YZT')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'600', N'140107', N'杏花岭区', N'48', N'3', N'0', N'0', N'Xinghualing Qu', N'XHL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'601', N'140108', N'尖草坪区', N'48', N'3', N'0', N'0', N'Jiancaoping Qu', N'JCP')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'602', N'140109', N'万柏林区', N'48', N'3', N'0', N'0', N'Wanbailin Qu', N'WBL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'603', N'140110', N'晋源区', N'48', N'3', N'0', N'0', N'Jinyuan Qu', N'JYM')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'604', N'140121', N'清徐县', N'48', N'3', N'0', N'0', N'Qingxu Xian', N'QXU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'605', N'140122', N'阳曲县', N'48', N'3', N'0', N'0', N'Yangqu Xian', N'YGQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'606', N'140123', N'娄烦县', N'48', N'3', N'0', N'0', N'Loufan Xian', N'LFA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'607', N'140181', N'古交市', N'48', N'3', N'0', N'0', N'Gujiao Shi', N'GUJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'608', N'140201', N'市辖区', N'49', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'609', N'140202', N'城区', N'49', N'3', N'0', N'0', N'Chengqu', N'CQD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'610', N'140203', N'矿区', N'49', N'3', N'0', N'0', N'Kuangqu', N'KQD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'611', N'140211', N'南郊区', N'49', N'3', N'0', N'0', N'Nanjiao Qu', N'NJQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'612', N'140212', N'新荣区', N'49', N'3', N'0', N'0', N'Xinrong Qu', N'XRQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'613', N'140221', N'阳高县', N'49', N'3', N'0', N'0', N'Yanggao Xian', N'Y')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'614', N'140222', N'天镇县', N'49', N'3', N'0', N'0', N'Tianzhen Xian', N'TZE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'615', N'140223', N'广灵县', N'49', N'3', N'0', N'0', N'Guangling Xian', N'GLJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'616', N'140224', N'灵丘县', N'49', N'3', N'0', N'0', N'Lingqiu Xian', N'LQX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'617', N'140225', N'浑源县', N'49', N'3', N'0', N'0', N'Hunyuan Xian', N'HYM')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'618', N'140226', N'左云县', N'49', N'3', N'0', N'0', N'Zuoyun Xian', N'ZUY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'619', N'140227', N'大同县', N'49', N'3', N'0', N'0', N'Datong Xian', N'DTX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'620', N'140301', N'市辖区', N'50', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'621', N'140302', N'城区', N'50', N'3', N'0', N'0', N'Chengqu', N'CQU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'622', N'140303', N'矿区', N'50', N'3', N'0', N'0', N'Kuangqu', N'KQY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'623', N'140311', N'郊区', N'50', N'3', N'0', N'0', N'Jiaoqu', N'JQY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'624', N'140321', N'平定县', N'50', N'3', N'0', N'0', N'Pingding Xian', N'PDG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'625', N'140322', N'盂县', N'50', N'3', N'0', N'0', N'Yu Xian', N'YUX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'626', N'140401', N'市辖区', N'51', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'627', N'140402', N'城区', N'51', N'3', N'0', N'0', N'Chengqu', N'CQC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'628', N'140411', N'郊区', N'51', N'3', N'0', N'0', N'Jiaoqu', N'JQZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'629', N'140421', N'长治县', N'51', N'3', N'0', N'0', N'Changzhi Xian', N'CZI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'630', N'140423', N'襄垣县', N'51', N'3', N'0', N'0', N'Xiangyuan Xian', N'XYJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'631', N'140424', N'屯留县', N'51', N'3', N'0', N'0', N'Tunliu Xian', N'TNL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'632', N'140425', N'平顺县', N'51', N'3', N'0', N'0', N'Pingshun Xian', N'PSX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'633', N'140426', N'黎城县', N'51', N'3', N'0', N'0', N'Licheng Xian', N'LIC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'634', N'140427', N'壶关县', N'51', N'3', N'0', N'0', N'Huguan Xian', N'HGN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'635', N'140428', N'长子县', N'51', N'3', N'0', N'0', N'Zhangzi Xian', N'ZHZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'636', N'140429', N'武乡县', N'51', N'3', N'0', N'0', N'Wuxiang Xian', N'WXG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'637', N'140430', N'沁县', N'51', N'3', N'0', N'0', N'Qin Xian', N'QIN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'638', N'140431', N'沁源县', N'51', N'3', N'0', N'0', N'Qinyuan Xian', N'QYU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'639', N'140481', N'潞城市', N'51', N'3', N'0', N'0', N'Lucheng Shi', N'LCS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'640', N'140501', N'市辖区', N'52', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'641', N'140502', N'城区', N'52', N'3', N'0', N'0', N'Chengqu', N'CQJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'642', N'140521', N'沁水县', N'52', N'3', N'0', N'0', N'Qinshui Xian', N'QSI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'643', N'140522', N'阳城县', N'52', N'3', N'0', N'0', N'Yangcheng Xian', N'YGC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'644', N'140524', N'陵川县', N'52', N'3', N'0', N'0', N'Lingchuan Xian', N'LGC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'645', N'140525', N'泽州县', N'52', N'3', N'0', N'0', N'Zezhou Xian', N'ZEZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'646', N'140581', N'高平市', N'52', N'3', N'0', N'0', N'Gaoping Shi', N'GPG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'647', N'140601', N'市辖区', N'53', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'648', N'140602', N'朔城区', N'53', N'3', N'0', N'0', N'Shuocheng Qu', N'SCH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'649', N'140603', N'平鲁区', N'53', N'3', N'0', N'0', N'Pinglu Qu', N'PLU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'650', N'140621', N'山阴县', N'53', N'3', N'0', N'0', N'Shanyin Xian', N'SYP')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'651', N'140622', N'应县', N'53', N'3', N'0', N'0', N'Ying Xian', N'YIG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'652', N'140623', N'右玉县', N'53', N'3', N'0', N'0', N'Youyu Xian', N'YOY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'653', N'140624', N'怀仁县', N'53', N'3', N'0', N'0', N'Huairen Xian', N'HRN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'654', N'140701', N'市辖区', N'54', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'655', N'140702', N'榆次区', N'54', N'3', N'0', N'0', N'Yuci Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'656', N'140721', N'榆社县', N'54', N'3', N'0', N'0', N'Yushe Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'657', N'140722', N'左权县', N'54', N'3', N'0', N'0', N'Zuoquan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'658', N'140723', N'和顺县', N'54', N'3', N'0', N'0', N'Heshun Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'659', N'140724', N'昔阳县', N'54', N'3', N'0', N'0', N'Xiyang Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'660', N'140725', N'寿阳县', N'54', N'3', N'0', N'0', N'Shouyang Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'661', N'140726', N'太谷县', N'54', N'3', N'0', N'0', N'Taigu Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'662', N'140727', N'祁县', N'54', N'3', N'0', N'0', N'Qi Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'663', N'140728', N'平遥县', N'54', N'3', N'0', N'0', N'Pingyao Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'664', N'140729', N'灵石县', N'54', N'3', N'0', N'0', N'Lingshi Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'665', N'140781', N'介休市', N'54', N'3', N'0', N'0', N'Jiexiu Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'666', N'140801', N'市辖区', N'55', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'667', N'140802', N'盐湖区', N'55', N'3', N'0', N'0', N'Yanhu Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'668', N'140821', N'临猗县', N'55', N'3', N'0', N'0', N'Linyi Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'669', N'140822', N'万荣县', N'55', N'3', N'0', N'0', N'Wanrong Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'670', N'140823', N'闻喜县', N'55', N'3', N'0', N'0', N'Wenxi Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'671', N'140824', N'稷山县', N'55', N'3', N'0', N'0', N'Jishan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'672', N'140825', N'新绛县', N'55', N'3', N'0', N'0', N'Xinjiang Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'673', N'140826', N'绛县', N'55', N'3', N'0', N'0', N'Jiang Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'674', N'140827', N'垣曲县', N'55', N'3', N'0', N'0', N'Yuanqu Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'675', N'140828', N'夏县', N'55', N'3', N'0', N'0', N'Xia Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'676', N'140829', N'平陆县', N'55', N'3', N'0', N'0', N'Pinglu Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'677', N'140830', N'芮城县', N'55', N'3', N'0', N'0', N'Ruicheng Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'678', N'140881', N'永济市', N'55', N'3', N'0', N'0', N'Yongji Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'679', N'140882', N'河津市', N'55', N'3', N'0', N'0', N'Hejin Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'680', N'140901', N'市辖区', N'56', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'681', N'140902', N'忻府区', N'56', N'3', N'0', N'0', N'Xinfu Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'682', N'140921', N'定襄县', N'56', N'3', N'0', N'0', N'Dingxiang Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'683', N'140922', N'五台县', N'56', N'3', N'0', N'0', N'Wutai Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'684', N'140923', N'代县', N'56', N'3', N'0', N'0', N'Dai Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'685', N'140924', N'繁峙县', N'56', N'3', N'0', N'0', N'Fanshi Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'686', N'140925', N'宁武县', N'56', N'3', N'0', N'0', N'Ningwu Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'687', N'140926', N'静乐县', N'56', N'3', N'0', N'0', N'Jingle Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'688', N'140927', N'神池县', N'56', N'3', N'0', N'0', N'Shenchi Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'689', N'140928', N'五寨县', N'56', N'3', N'0', N'0', N'Wuzhai Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'690', N'140929', N'岢岚县', N'56', N'3', N'0', N'0', N'Kelan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'691', N'140930', N'河曲县', N'56', N'3', N'0', N'0', N'Hequ Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'692', N'140931', N'保德县', N'56', N'3', N'0', N'0', N'Baode Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'693', N'140932', N'偏关县', N'56', N'3', N'0', N'0', N'Pianguan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'694', N'140981', N'原平市', N'56', N'3', N'0', N'0', N'Yuanping Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'695', N'141001', N'市辖区', N'57', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'696', N'141002', N'尧都区', N'57', N'3', N'0', N'0', N'Yaodu Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'697', N'141021', N'曲沃县', N'57', N'3', N'0', N'0', N'Quwo Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'698', N'141022', N'翼城县', N'57', N'3', N'0', N'0', N'Yicheng Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'699', N'141023', N'襄汾县', N'57', N'3', N'0', N'0', N'Xiangfen Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'700', N'141024', N'洪洞县', N'57', N'3', N'0', N'0', N'Hongtong Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'701', N'141025', N'古县', N'57', N'3', N'0', N'0', N'Gu Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'702', N'141026', N'安泽县', N'57', N'3', N'0', N'0', N'Anze Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'703', N'141027', N'浮山县', N'57', N'3', N'0', N'0', N'Fushan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'704', N'141028', N'吉县', N'57', N'3', N'0', N'0', N'Ji Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'705', N'141029', N'乡宁县', N'57', N'3', N'0', N'0', N'Xiangning Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'706', N'141030', N'大宁县', N'57', N'3', N'0', N'0', N'Daning Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'707', N'141031', N'隰县', N'57', N'3', N'0', N'0', N'Xi Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'708', N'141032', N'永和县', N'57', N'3', N'0', N'0', N'Yonghe Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'709', N'141033', N'蒲县', N'57', N'3', N'0', N'0', N'Pu Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'710', N'141034', N'汾西县', N'57', N'3', N'0', N'0', N'Fenxi Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'711', N'141081', N'侯马市', N'57', N'3', N'0', N'0', N'Houma Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'712', N'141082', N'霍州市', N'57', N'3', N'0', N'0', N'Huozhou Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'713', N'141101', N'市辖区', N'58', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'714', N'141102', N'离石区', N'58', N'3', N'0', N'0', N'Lishi Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'715', N'141121', N'文水县', N'58', N'3', N'0', N'0', N'Wenshui Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'716', N'141122', N'交城县', N'58', N'3', N'0', N'0', N'Jiaocheng Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'717', N'141123', N'兴县', N'58', N'3', N'0', N'0', N'Xing Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'718', N'141124', N'临县', N'58', N'3', N'0', N'0', N'Lin Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'719', N'141125', N'柳林县', N'58', N'3', N'0', N'0', N'Liulin Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'720', N'141126', N'石楼县', N'58', N'3', N'0', N'0', N'Shilou Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'721', N'141127', N'岚县', N'58', N'3', N'0', N'0', N'Lan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'722', N'141128', N'方山县', N'58', N'3', N'0', N'0', N'Fangshan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'723', N'141129', N'中阳县', N'58', N'3', N'0', N'0', N'Zhongyang Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'724', N'141130', N'交口县', N'58', N'3', N'0', N'0', N'Jiaokou Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'725', N'141181', N'孝义市', N'58', N'3', N'0', N'0', N'Xiaoyi Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'726', N'141182', N'汾阳市', N'58', N'3', N'0', N'0', N'Fenyang Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'727', N'150101', N'市辖区', N'59', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'728', N'150102', N'新城区', N'59', N'3', N'0', N'0', N'Xincheng Qu', N'XCN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'729', N'150103', N'回民区', N'59', N'3', N'0', N'0', N'Huimin Qu', N'HMQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'730', N'150104', N'玉泉区', N'59', N'3', N'0', N'0', N'Yuquan Qu', N'YQN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'731', N'150105', N'赛罕区', N'59', N'3', N'0', N'0', N'Saihan Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'732', N'150121', N'土默特左旗', N'59', N'3', N'0', N'0', N'Tumd Zuoqi', N'TUZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'733', N'150122', N'托克托县', N'59', N'3', N'0', N'0', N'Togtoh Xian', N'TOG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'734', N'150123', N'和林格尔县', N'59', N'3', N'0', N'0', N'Horinger Xian', N'HOR')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'735', N'150124', N'清水河县', N'59', N'3', N'0', N'0', N'Qingshuihe Xian', N'QSH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'736', N'150125', N'武川县', N'59', N'3', N'0', N'0', N'Wuchuan Xian', N'WCX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'737', N'150201', N'市辖区', N'60', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'738', N'150202', N'东河区', N'60', N'3', N'0', N'0', N'Donghe Qu', N'DHE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'739', N'150203', N'昆都仑区', N'60', N'3', N'0', N'0', N'Kundulun Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'740', N'150204', N'青山区', N'60', N'3', N'0', N'0', N'Qingshan Qu', N'QSB')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'741', N'150205', N'石拐区', N'60', N'3', N'0', N'0', N'Shiguai Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'742', N'150206', N'白云鄂博矿区', N'60', N'3', N'0', N'0', N'Baiyun Kuangqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'743', N'150207', N'九原区', N'60', N'3', N'0', N'0', N'Jiuyuan Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'744', N'150221', N'土默特右旗', N'60', N'3', N'0', N'0', N'Tumd Youqi', N'TUY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'745', N'150222', N'固阳县', N'60', N'3', N'0', N'0', N'Guyang Xian', N'GYM')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'746', N'150223', N'达尔罕茂明安联合旗', N'60', N'3', N'0', N'0', N'Darhan Muminggan Lianheqi', N'DML')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'747', N'150301', N'市辖区', N'61', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'748', N'150302', N'海勃湾区', N'61', N'3', N'0', N'0', N'Haibowan Qu', N'HBW')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'749', N'150303', N'海南区', N'61', N'3', N'0', N'0', N'Hainan Qu', N'HNU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'750', N'150304', N'乌达区', N'61', N'3', N'0', N'0', N'Ud Qu', N'UDQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'751', N'150401', N'市辖区', N'62', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'752', N'150402', N'红山区', N'62', N'3', N'0', N'0', N'Hongshan Qu', N'HSZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'753', N'150403', N'元宝山区', N'62', N'3', N'0', N'0', N'Yuanbaoshan Qu', N'YBO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'754', N'150404', N'松山区', N'62', N'3', N'0', N'0', N'Songshan Qu', N'SSQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'755', N'150421', N'阿鲁科尔沁旗', N'62', N'3', N'0', N'0', N'Ar Horqin Qi', N'AHO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'756', N'150422', N'巴林左旗', N'62', N'3', N'0', N'0', N'Bairin Zuoqi', N'BAZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'757', N'150423', N'巴林右旗', N'62', N'3', N'0', N'0', N'Bairin Youqi', N'BAY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'758', N'150424', N'林西县', N'62', N'3', N'0', N'0', N'Linxi Xian', N'LXM')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'759', N'150425', N'克什克腾旗', N'62', N'3', N'0', N'0', N'Hexigten Qi', N'HXT')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'760', N'150426', N'翁牛特旗', N'62', N'3', N'0', N'0', N'Ongniud Qi', N'ONG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'761', N'150428', N'喀喇沁旗', N'62', N'3', N'0', N'0', N'Harqin Qi', N'HAR')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'762', N'150429', N'宁城县', N'62', N'3', N'0', N'0', N'Ningcheng Xian', N'NCH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'763', N'150430', N'敖汉旗', N'62', N'3', N'0', N'0', N'Aohan Qi', N'AHN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'764', N'150501', N'市辖区', N'63', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'765', N'150502', N'科尔沁区', N'63', N'3', N'0', N'0', N'Keermi Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'766', N'150521', N'科尔沁左翼中旗', N'63', N'3', N'0', N'0', N'Horqin Zuoyi Zhongqi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'767', N'150522', N'科尔沁左翼后旗', N'63', N'3', N'0', N'0', N'Horqin Zuoyi Houqi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'768', N'150523', N'开鲁县', N'63', N'3', N'0', N'0', N'Kailu Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'769', N'150524', N'库伦旗', N'63', N'3', N'0', N'0', N'Hure Qi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'770', N'150525', N'奈曼旗', N'63', N'3', N'0', N'0', N'Naiman Qi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'771', N'150526', N'扎鲁特旗', N'63', N'3', N'0', N'0', N'Jarud Qi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'772', N'150581', N'霍林郭勒市', N'63', N'3', N'0', N'0', N'Holingol Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'773', N'150602', N'东胜区', N'64', N'3', N'0', N'0', N'Dongsheng Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'774', N'150621', N'达拉特旗', N'64', N'3', N'0', N'0', N'Dalad Qi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'775', N'150622', N'准格尔旗', N'64', N'3', N'0', N'0', N'Jungar Qi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'776', N'150623', N'鄂托克前旗', N'64', N'3', N'0', N'0', N'Otog Qianqi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'777', N'150624', N'鄂托克旗', N'64', N'3', N'0', N'0', N'Otog Qi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'778', N'150625', N'杭锦旗', N'64', N'3', N'0', N'0', N'Hanggin Qi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'779', N'150626', N'乌审旗', N'64', N'3', N'0', N'0', N'Uxin Qi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'780', N'150627', N'伊金霍洛旗', N'64', N'3', N'0', N'0', N'Ejin Horo Qi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'781', N'150701', N'市辖区', N'65', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'782', N'150702', N'海拉尔区', N'65', N'3', N'0', N'0', N'Hailaer Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'783', N'150721', N'阿荣旗', N'65', N'3', N'0', N'0', N'Arun Qi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'784', N'150722', N'莫力达瓦达斡尔族自治旗', N'65', N'3', N'0', N'0', N'Morin Dawa Daurzu Zizhiqi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'785', N'150723', N'鄂伦春自治旗', N'65', N'3', N'0', N'0', N'Oroqen Zizhiqi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'786', N'150724', N'鄂温克族自治旗', N'65', N'3', N'0', N'0', N'Ewenkizu Zizhiqi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'787', N'150725', N'陈巴尔虎旗', N'65', N'3', N'0', N'0', N'Chen Barag Qi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'788', N'150726', N'新巴尔虎左旗', N'65', N'3', N'0', N'0', N'Xin Barag Zuoqi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'789', N'150727', N'新巴尔虎右旗', N'65', N'3', N'0', N'0', N'Xin Barag Youqi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'790', N'150781', N'满洲里市', N'65', N'3', N'0', N'0', N'Manzhouli Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'791', N'150782', N'牙克石市', N'65', N'3', N'0', N'0', N'Yakeshi Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'792', N'150783', N'扎兰屯市', N'65', N'3', N'0', N'0', N'Zalantun Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'793', N'150784', N'额尔古纳市', N'65', N'3', N'0', N'0', N'Ergun Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'794', N'150785', N'根河市', N'65', N'3', N'0', N'0', N'Genhe Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'795', N'150801', N'市辖区', N'66', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'796', N'150802', N'临河区', N'66', N'3', N'0', N'0', N'Linhe Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'797', N'150821', N'五原县', N'66', N'3', N'0', N'0', N'Wuyuan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'798', N'150822', N'磴口县', N'66', N'3', N'0', N'0', N'Dengkou Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'799', N'150823', N'乌拉特前旗', N'66', N'3', N'0', N'0', N'Urad Qianqi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'800', N'150824', N'乌拉特中旗', N'66', N'3', N'0', N'0', N'Urad Zhongqi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'801', N'150825', N'乌拉特后旗', N'66', N'3', N'0', N'0', N'Urad Houqi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'802', N'150826', N'杭锦后旗', N'66', N'3', N'0', N'0', N'Hanggin Houqi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'803', N'150901', N'市辖区', N'67', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'804', N'150902', N'集宁区', N'67', N'3', N'0', N'0', N'Jining Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'805', N'150921', N'卓资县', N'67', N'3', N'0', N'0', N'Zhuozi Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'806', N'150922', N'化德县', N'67', N'3', N'0', N'0', N'Huade Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'807', N'150923', N'商都县', N'67', N'3', N'0', N'0', N'Shangdu Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'808', N'150924', N'兴和县', N'67', N'3', N'0', N'0', N'Xinghe Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'809', N'150925', N'凉城县', N'67', N'3', N'0', N'0', N'Liangcheng Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'810', N'150926', N'察哈尔右翼前旗', N'67', N'3', N'0', N'0', N'Qahar Youyi Qianqi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'811', N'150927', N'察哈尔右翼中旗', N'67', N'3', N'0', N'0', N'Qahar Youyi Zhongqi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'812', N'150928', N'察哈尔右翼后旗', N'67', N'3', N'0', N'0', N'Qahar Youyi Houqi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'813', N'150929', N'四子王旗', N'67', N'3', N'0', N'0', N'Dorbod Qi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'814', N'150981', N'丰镇市', N'67', N'3', N'0', N'0', N'Fengzhen Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'815', N'152201', N'乌兰浩特市', N'68', N'3', N'0', N'0', N'Ulan Hot Shi', N'ULO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'816', N'152202', N'阿尔山市', N'68', N'3', N'0', N'0', N'Arxan Shi', N'ARS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'817', N'152221', N'科尔沁右翼前旗', N'68', N'3', N'0', N'0', N'Horqin Youyi Qianqi', N'HYQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'818', N'152222', N'科尔沁右翼中旗', N'68', N'3', N'0', N'0', N'Horqin Youyi Zhongqi', N'HYZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'819', N'152223', N'扎赉特旗', N'68', N'3', N'0', N'0', N'Jalaid Qi', N'JAL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'820', N'152224', N'突泉县', N'68', N'3', N'0', N'0', N'Tuquan Xian', N'TUQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'821', N'152501', N'二连浩特市', N'69', N'3', N'0', N'0', N'Erenhot Shi', N'ERC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'822', N'152502', N'锡林浩特市', N'69', N'3', N'0', N'0', N'Xilinhot Shi', N'XLI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'823', N'152522', N'阿巴嘎旗', N'69', N'3', N'0', N'0', N'Abag Qi', N'ABG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'824', N'152523', N'苏尼特左旗', N'69', N'3', N'0', N'0', N'Sonid Zuoqi', N'SOZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'825', N'152524', N'苏尼特右旗', N'69', N'3', N'0', N'0', N'Sonid Youqi', N'SOY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'826', N'152525', N'东乌珠穆沁旗', N'69', N'3', N'0', N'0', N'Dong Ujimqin Qi', N'DUJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'827', N'152526', N'西乌珠穆沁旗', N'69', N'3', N'0', N'0', N'Xi Ujimqin Qi', N'XUJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'828', N'152527', N'太仆寺旗', N'69', N'3', N'0', N'0', N'Taibus Qi', N'TAB')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'829', N'152528', N'镶黄旗', N'69', N'3', N'0', N'0', N'Xianghuang(Hobot Xar) Qi', N'XHG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'830', N'152529', N'正镶白旗', N'69', N'3', N'0', N'0', N'Zhengxiangbai(Xulun Hobot Qagan)Qi', N'ZXB')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'831', N'152530', N'正蓝旗', N'69', N'3', N'0', N'0', N'Zhenglan(Xulun Hoh)Qi', N'ZLM')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'832', N'152531', N'多伦县', N'69', N'3', N'0', N'0', N'Duolun (Dolonnur)Xian', N'DLM')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'833', N'152921', N'阿拉善左旗', N'70', N'3', N'0', N'0', N'Alxa Zuoqi', N'ALZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'834', N'152922', N'阿拉善右旗', N'70', N'3', N'0', N'0', N'Alxa Youqi', N'ALY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'835', N'152923', N'额济纳旗', N'70', N'3', N'0', N'0', N'Ejin Qi', N'EJI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'836', N'210101', N'市辖区', N'71', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'837', N'210102', N'和平区', N'71', N'3', N'0', N'0', N'Heping Qu', N'HEP')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'838', N'210103', N'沈河区', N'71', N'3', N'0', N'0', N'Shenhe Qu', N'SHQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'839', N'210104', N'大东区', N'71', N'3', N'0', N'0', N'Dadong Qu', N'DDQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'840', N'210105', N'皇姑区', N'71', N'3', N'0', N'0', N'Huanggu Qu', N'HGU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'841', N'210106', N'铁西区', N'71', N'3', N'0', N'0', N'Tiexi Qu', N'TXI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'842', N'210111', N'苏家屯区', N'71', N'3', N'0', N'0', N'Sujiatun Qu', N'SJT')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'843', N'210112', N'东陵区', N'71', N'3', N'0', N'0', N'Dongling Qu', N'DLQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'844', N'210113', N'沈北新区', N'71', N'3', N'0', N'0', N'Xinchengzi Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'845', N'210114', N'于洪区', N'71', N'3', N'0', N'0', N'Yuhong Qu', N'YHQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'846', N'210122', N'辽中县', N'71', N'3', N'0', N'0', N'Liaozhong Xian', N'LZL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'847', N'210123', N'康平县', N'71', N'3', N'0', N'0', N'Kangping Xian', N'KPG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'848', N'210124', N'法库县', N'71', N'3', N'0', N'0', N'Faku Xian', N'FKU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'849', N'210181', N'新民市', N'71', N'3', N'0', N'0', N'Xinmin Shi', N'XMS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'850', N'210201', N'市辖区', N'72', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'851', N'210202', N'中山区', N'72', N'3', N'0', N'0', N'Zhongshan Qu', N'ZSD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'852', N'210203', N'西岗区', N'72', N'3', N'0', N'0', N'Xigang Qu', N'XGD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'853', N'210204', N'沙河口区', N'72', N'3', N'0', N'0', N'Shahekou Qu', N'SHK')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'854', N'210211', N'甘井子区', N'72', N'3', N'0', N'0', N'Ganjingzi Qu', N'GJZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'855', N'210212', N'旅顺口区', N'72', N'3', N'0', N'0', N'Lvshunkou Qu', N'LSK')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'856', N'210213', N'金州区', N'72', N'3', N'0', N'0', N'Jinzhou Qu', N'JZH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'857', N'210224', N'长海县', N'72', N'3', N'0', N'0', N'Changhai Xian', N'CHX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'858', N'210281', N'瓦房店市', N'72', N'3', N'0', N'0', N'Wafangdian Shi', N'WFD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'859', N'210282', N'普兰店市', N'72', N'3', N'0', N'0', N'Pulandian Shi', N'PLD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'860', N'210283', N'庄河市', N'72', N'3', N'0', N'0', N'Zhuanghe Shi', N'ZHH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'861', N'210301', N'市辖区', N'73', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'862', N'210302', N'铁东区', N'73', N'3', N'0', N'0', N'Tiedong Qu', N'TED')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'863', N'210303', N'铁西区', N'73', N'3', N'0', N'0', N'Tiexi Qu', N'TXL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'864', N'210304', N'立山区', N'73', N'3', N'0', N'0', N'Lishan Qu', N'LAS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'865', N'210311', N'千山区', N'73', N'3', N'0', N'0', N'Qianshan Qu', N'QSQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'866', N'210321', N'台安县', N'73', N'3', N'0', N'0', N'Tai,an Xian', N'TAX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'867', N'210323', N'岫岩满族自治县', N'73', N'3', N'0', N'0', N'Xiuyan Manzu Zizhixian', N'XYL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'868', N'210381', N'海城市', N'73', N'3', N'0', N'0', N'Haicheng Shi', N'HCL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'869', N'210401', N'市辖区', N'74', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'870', N'210402', N'新抚区', N'74', N'3', N'0', N'0', N'Xinfu Qu', N'XFU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'871', N'210403', N'东洲区', N'74', N'3', N'0', N'0', N'Dongzhou Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'872', N'210404', N'望花区', N'74', N'3', N'0', N'0', N'Wanghua Qu', N'WHF')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'873', N'210411', N'顺城区', N'74', N'3', N'0', N'0', N'Shuncheng Qu', N'SCF')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'874', N'210421', N'抚顺县', N'74', N'3', N'0', N'0', N'Fushun Xian', N'FSX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'875', N'210422', N'新宾满族自治县', N'74', N'3', N'0', N'0', N'Xinbinmanzuzizhi Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'876', N'210423', N'清原满族自治县', N'74', N'3', N'0', N'0', N'Qingyuanmanzuzizhi Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'877', N'210501', N'市辖区', N'75', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'878', N'210502', N'平山区', N'75', N'3', N'0', N'0', N'Pingshan Qu', N'PSN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'879', N'210503', N'溪湖区', N'75', N'3', N'0', N'0', N'Xihu Qu', N'XHB')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'880', N'210504', N'明山区', N'75', N'3', N'0', N'0', N'Mingshan Qu', N'MSB')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'881', N'210505', N'南芬区', N'75', N'3', N'0', N'0', N'Nanfen Qu', N'NFQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'882', N'210521', N'本溪满族自治县', N'75', N'3', N'0', N'0', N'Benxi Manzu Zizhixian', N'BXX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'883', N'210522', N'桓仁满族自治县', N'75', N'3', N'0', N'0', N'Huanren Manzu Zizhixian', N'HRL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'884', N'210601', N'市辖区', N'76', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'885', N'210602', N'元宝区', N'76', N'3', N'0', N'0', N'Yuanbao Qu', N'YBD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'886', N'210603', N'振兴区', N'76', N'3', N'0', N'0', N'Zhenxing Qu', N'ZXQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'887', N'210604', N'振安区', N'76', N'3', N'0', N'0', N'Zhen,an Qu', N'ZAQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'888', N'210624', N'宽甸满族自治县', N'76', N'3', N'0', N'0', N'Kuandian Manzu Zizhixian', N'KDN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'889', N'210681', N'东港市', N'76', N'3', N'0', N'0', N'Donggang Shi', N'DGS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'890', N'210682', N'凤城市', N'76', N'3', N'0', N'0', N'Fengcheng Shi', N'FCL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'891', N'210701', N'市辖区', N'77', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'892', N'210702', N'古塔区', N'77', N'3', N'0', N'0', N'Guta Qu', N'GTQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'893', N'210703', N'凌河区', N'77', N'3', N'0', N'0', N'Linghe Qu', N'LHF')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'894', N'210711', N'太和区', N'77', N'3', N'0', N'0', N'Taihe Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'895', N'210726', N'黑山县', N'77', N'3', N'0', N'0', N'Heishan Xian', N'HSL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'896', N'210727', N'义县', N'77', N'3', N'0', N'0', N'Yi Xian', N'YXL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'897', N'210781', N'凌海市', N'77', N'3', N'0', N'0', N'Linghai Shi', N'LHL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'898', N'210782', N'北镇市', N'77', N'3', N'0', N'0', N'Beining Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'899', N'210801', N'市辖区', N'78', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'900', N'210802', N'站前区', N'78', N'3', N'0', N'0', N'Zhanqian Qu', N'ZQQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'901', N'210803', N'西市区', N'78', N'3', N'0', N'0', N'Xishi Qu', N'XII')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'902', N'210804', N'鲅鱼圈区', N'78', N'3', N'0', N'0', N'Bayuquan Qu', N'BYQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'903', N'210811', N'老边区', N'78', N'3', N'0', N'0', N'Laobian Qu', N'LOB')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'904', N'210881', N'盖州市', N'78', N'3', N'0', N'0', N'Gaizhou Shi', N'GZU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'905', N'210882', N'大石桥市', N'78', N'3', N'0', N'0', N'Dashiqiao Shi', N'DSQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'906', N'210901', N'市辖区', N'79', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'907', N'210902', N'海州区', N'79', N'3', N'0', N'0', N'Haizhou Qu', N'HZF')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'908', N'210903', N'新邱区', N'79', N'3', N'0', N'0', N'Xinqiu Qu', N'XQF')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'909', N'210904', N'太平区', N'79', N'3', N'0', N'0', N'Taiping Qu', N'TPG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'910', N'210905', N'清河门区', N'79', N'3', N'0', N'0', N'Qinghemen Qu', N'QHM')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'911', N'210911', N'细河区', N'79', N'3', N'0', N'0', N'Xihe Qu', N'XHO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'912', N'210921', N'阜新蒙古族自治县', N'79', N'3', N'0', N'0', N'Fuxin Mongolzu Zizhixian', N'FXX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'913', N'210922', N'彰武县', N'79', N'3', N'0', N'0', N'Zhangwu Xian', N'ZWU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'914', N'211001', N'市辖区', N'80', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'915', N'211002', N'白塔区', N'80', N'3', N'0', N'0', N'Baita Qu', N'BTL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'916', N'211003', N'文圣区', N'80', N'3', N'0', N'0', N'Wensheng Qu', N'WST')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'917', N'211004', N'宏伟区', N'80', N'3', N'0', N'0', N'Hongwei Qu', N'HWQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'918', N'211005', N'弓长岭区', N'80', N'3', N'0', N'0', N'Gongchangling Qu', N'GCL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'919', N'211011', N'太子河区', N'80', N'3', N'0', N'0', N'Taizihe Qu', N'TZH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'920', N'211021', N'辽阳县', N'80', N'3', N'0', N'0', N'Liaoyang Xian', N'LYX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'921', N'211081', N'灯塔市', N'80', N'3', N'0', N'0', N'Dengta Shi', N'DTL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'922', N'211101', N'市辖区', N'81', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'923', N'211102', N'双台子区', N'81', N'3', N'0', N'0', N'Shuangtaizi Qu', N'STZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'924', N'211103', N'兴隆台区', N'81', N'3', N'0', N'0', N'Xinglongtai Qu', N'XLT')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'925', N'211121', N'大洼县', N'81', N'3', N'0', N'0', N'Dawa Xian', N'DWA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'926', N'211122', N'盘山县', N'81', N'3', N'0', N'0', N'Panshan Xian', N'PNS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'927', N'211201', N'市辖区', N'82', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'928', N'211202', N'银州区', N'82', N'3', N'0', N'0', N'Yinzhou Qu', N'YZU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'929', N'211204', N'清河区', N'82', N'3', N'0', N'0', N'Qinghe Qu', N'QHQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'930', N'211221', N'铁岭县', N'82', N'3', N'0', N'0', N'Tieling Xian', N'TLG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'931', N'211223', N'西丰县', N'82', N'3', N'0', N'0', N'Xifeng Xian', N'XIF')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'932', N'211224', N'昌图县', N'82', N'3', N'0', N'0', N'Changtu Xian', N'CTX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'933', N'211281', N'调兵山市', N'82', N'3', N'0', N'0', N'Diaobingshan Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'934', N'211282', N'开原市', N'82', N'3', N'0', N'0', N'Kaiyuan Shi', N'KYS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'935', N'211301', N'市辖区', N'83', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'936', N'211302', N'双塔区', N'83', N'3', N'0', N'0', N'Shuangta Qu', N'STQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'937', N'211303', N'龙城区', N'83', N'3', N'0', N'0', N'Longcheng Qu', N'LCL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'938', N'211321', N'朝阳县', N'83', N'3', N'0', N'0', N'Chaoyang Xian', N'CYG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'939', N'211322', N'建平县', N'83', N'3', N'0', N'0', N'Jianping Xian', N'JPG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'940', N'211324', N'喀喇沁左翼蒙古族自治县', N'83', N'3', N'0', N'0', N'Harqin Zuoyi Mongolzu Zizhixian', N'HAZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'941', N'211381', N'北票市', N'83', N'3', N'0', N'0', N'Beipiao Shi', N'BPO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'942', N'211382', N'凌源市', N'83', N'3', N'0', N'0', N'Lingyuan Shi', N'LYK')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'943', N'211401', N'市辖区', N'84', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'944', N'211402', N'连山区', N'84', N'3', N'0', N'0', N'Lianshan Qu', N'LSQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'945', N'211403', N'龙港区', N'84', N'3', N'0', N'0', N'Longgang Qu', N'LGD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'946', N'211404', N'南票区', N'84', N'3', N'0', N'0', N'Nanpiao Qu', N'NPQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'947', N'211421', N'绥中县', N'84', N'3', N'0', N'0', N'Suizhong Xian', N'SZL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'948', N'211422', N'建昌县', N'84', N'3', N'0', N'0', N'Jianchang Xian', N'JCL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'949', N'211481', N'兴城市', N'84', N'3', N'0', N'0', N'Xingcheng Shi', N'XCL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'950', N'220101', N'市辖区', N'85', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'951', N'220102', N'南关区', N'85', N'3', N'0', N'0', N'Nanguan Qu', N'NGN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'952', N'220103', N'宽城区', N'85', N'3', N'0', N'0', N'Kuancheng Qu', N'KCQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'953', N'220104', N'朝阳区', N'85', N'3', N'0', N'0', N'Chaoyang Qu', N'CYC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'954', N'220105', N'二道区', N'85', N'3', N'0', N'0', N'Erdao Qu', N'EDQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'955', N'220106', N'绿园区', N'85', N'3', N'0', N'0', N'Lvyuan Qu', N'LYQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'956', N'220112', N'双阳区', N'85', N'3', N'0', N'0', N'Shuangyang Qu', N'SYQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'957', N'220122', N'农安县', N'85', N'3', N'0', N'0', N'Nong,an Xian', N'NAJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'958', N'220181', N'九台市', N'85', N'3', N'0', N'0', N'Jiutai Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'959', N'220182', N'榆树市', N'85', N'3', N'0', N'0', N'Yushu Shi', N'YSS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'960', N'220183', N'德惠市', N'85', N'3', N'0', N'0', N'Dehui Shi', N'DEH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'961', N'220201', N'市辖区', N'86', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'962', N'220202', N'昌邑区', N'86', N'3', N'0', N'0', N'Changyi Qu', N'CYI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'963', N'220203', N'龙潭区', N'86', N'3', N'0', N'0', N'Longtan Qu', N'LTQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'964', N'220204', N'船营区', N'86', N'3', N'0', N'0', N'Chuanying Qu', N'CYJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'965', N'220211', N'丰满区', N'86', N'3', N'0', N'0', N'Fengman Qu', N'FMQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'966', N'220221', N'永吉县', N'86', N'3', N'0', N'0', N'Yongji Xian', N'YOJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'967', N'220281', N'蛟河市', N'86', N'3', N'0', N'0', N'Jiaohe Shi', N'JHJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'968', N'220282', N'桦甸市', N'86', N'3', N'0', N'0', N'Huadian Shi', N'HDJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'969', N'220283', N'舒兰市', N'86', N'3', N'0', N'0', N'Shulan Shi', N'SLN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'970', N'220284', N'磐石市', N'86', N'3', N'0', N'0', N'Panshi Shi', N'PSI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'971', N'220301', N'市辖区', N'87', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'972', N'220302', N'铁西区', N'87', N'3', N'0', N'0', N'Tiexi Qu', N'TXS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'973', N'220303', N'铁东区', N'87', N'3', N'0', N'0', N'Tiedong Qu', N'TDQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'974', N'220322', N'梨树县', N'87', N'3', N'0', N'0', N'Lishu Xian', N'LSU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'975', N'220323', N'伊通满族自治县', N'87', N'3', N'0', N'0', N'Yitong Manzu Zizhixian', N'YTO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'976', N'220381', N'公主岭市', N'87', N'3', N'0', N'0', N'Gongzhuling Shi', N'GZL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'977', N'220382', N'双辽市', N'87', N'3', N'0', N'0', N'Shuangliao Shi', N'SLS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'978', N'220401', N'市辖区', N'88', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'979', N'220402', N'龙山区', N'88', N'3', N'0', N'0', N'Longshan Qu', N'LGS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'980', N'220403', N'西安区', N'88', N'3', N'0', N'0', N'Xi,an Qu', N'XAA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'981', N'220421', N'东丰县', N'88', N'3', N'0', N'0', N'Dongfeng Xian', N'DGF')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'982', N'220422', N'东辽县', N'88', N'3', N'0', N'0', N'Dongliao Xian', N'DLX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'983', N'220501', N'市辖区', N'89', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'984', N'220502', N'东昌区', N'89', N'3', N'0', N'0', N'Dongchang Qu', N'DCT')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'985', N'220503', N'二道江区', N'89', N'3', N'0', N'0', N'Erdaojiang Qu', N'EDJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'986', N'220521', N'通化县', N'89', N'3', N'0', N'0', N'Tonghua Xian', N'THX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'987', N'220523', N'辉南县', N'89', N'3', N'0', N'0', N'Huinan Xian', N'HNA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'988', N'220524', N'柳河县', N'89', N'3', N'0', N'0', N'Liuhe Xian', N'LHC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'989', N'220581', N'梅河口市', N'89', N'3', N'0', N'0', N'Meihekou Shi', N'MHK')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'990', N'220582', N'集安市', N'89', N'3', N'0', N'0', N'Ji,an Shi', N'KNC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'991', N'220601', N'市辖区', N'90', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'992', N'220602', N'八道江区', N'90', N'3', N'0', N'0', N'Badaojiang Qu', N'BDJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'993', N'220621', N'抚松县', N'90', N'3', N'0', N'0', N'Fusong Xian', N'FSG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'994', N'220622', N'靖宇县', N'90', N'3', N'0', N'0', N'Jingyu Xian', N'JYJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'995', N'220623', N'长白朝鲜族自治县', N'90', N'3', N'0', N'0', N'Changbaichaoxianzuzizhi Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'996', N'220605', N'江源区', N'90', N'3', N'0', N'0', N'Jiangyuan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'997', N'220681', N'临江市', N'90', N'3', N'0', N'0', N'Linjiang Shi', N'LIN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'998', N'220701', N'市辖区', N'91', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'999', N'220702', N'宁江区', N'91', N'3', N'0', N'0', N'Ningjiang Qu', N'NJA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1000', N'220721', N'前郭尔罗斯蒙古族自治县', N'91', N'3', N'0', N'0', N'Qian Gorlos Mongolzu Zizhixian', N'Q')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1001', N'220722', N'长岭县', N'91', N'3', N'0', N'0', N'Changling Xian', N'CLG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1002', N'220723', N'乾安县', N'91', N'3', N'0', N'0', N'Qian,an Xian', N'QAJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1003', N'220724', N'扶余县', N'91', N'3', N'0', N'0', N'Fuyu Xian', N'FYU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1004', N'220801', N'市辖区', N'92', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1005', N'220802', N'洮北区', N'92', N'3', N'0', N'0', N'Taobei Qu', N'TBQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1006', N'220821', N'镇赉县', N'92', N'3', N'0', N'0', N'Zhenlai Xian', N'ZLA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1007', N'220822', N'通榆县', N'92', N'3', N'0', N'0', N'Tongyu Xian', N'TGY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1008', N'220881', N'洮南市', N'92', N'3', N'0', N'0', N'Taonan Shi', N'TNS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1009', N'220882', N'大安市', N'92', N'3', N'0', N'0', N'Da,an Shi', N'DNA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1010', N'222401', N'延吉市', N'93', N'3', N'0', N'0', N'Yanji Shi', N'YNJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1011', N'222402', N'图们市', N'93', N'3', N'0', N'0', N'Tumen Shi', N'TME')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1012', N'222403', N'敦化市', N'93', N'3', N'0', N'0', N'Dunhua Shi', N'DHS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1013', N'222404', N'珲春市', N'93', N'3', N'0', N'0', N'Hunchun Shi', N'HUC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1014', N'222405', N'龙井市', N'93', N'3', N'0', N'0', N'Longjing Shi', N'LJJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1015', N'222406', N'和龙市', N'93', N'3', N'0', N'0', N'Helong Shi', N'HEL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1016', N'222424', N'汪清县', N'93', N'3', N'0', N'0', N'Wangqing Xian', N'WGQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1017', N'222426', N'安图县', N'93', N'3', N'0', N'0', N'Antu Xian', N'ATU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1018', N'230101', N'市辖区', N'94', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1019', N'230102', N'道里区', N'94', N'3', N'0', N'0', N'Daoli Qu', N'DLH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1020', N'230103', N'南岗区', N'94', N'3', N'0', N'0', N'Nangang Qu', N'NGQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1021', N'230104', N'道外区', N'94', N'3', N'0', N'0', N'Daowai Qu', N'DWQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1022', N'230110', N'香坊区', N'94', N'3', N'0', N'0', N'Xiangfang Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1024', N'230108', N'平房区', N'94', N'3', N'0', N'0', N'Pingfang Qu', N'PFQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1025', N'230109', N'松北区', N'94', N'3', N'0', N'0', N'Songbei Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1026', N'230111', N'呼兰区', N'94', N'3', N'0', N'0', N'Hulan Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1027', N'230123', N'依兰县', N'94', N'3', N'0', N'0', N'Yilan Xian', N'YLH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1028', N'230124', N'方正县', N'94', N'3', N'0', N'0', N'Fangzheng Xian', N'FZH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1029', N'230125', N'宾县', N'94', N'3', N'0', N'0', N'Bin Xian', N'BNX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1030', N'230126', N'巴彦县', N'94', N'3', N'0', N'0', N'Bayan Xian', N'BYH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1031', N'230127', N'木兰县', N'94', N'3', N'0', N'0', N'Mulan Xian', N'MUL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1032', N'230128', N'通河县', N'94', N'3', N'0', N'0', N'Tonghe Xian', N'TOH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1033', N'230129', N'延寿县', N'94', N'3', N'0', N'0', N'Yanshou Xian', N'YSU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1034', N'230112', N'阿城区', N'94', N'3', N'0', N'0', N'Acheng Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1035', N'230182', N'双城市', N'94', N'3', N'0', N'0', N'Shuangcheng Shi', N'SCS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1036', N'230183', N'尚志市', N'94', N'3', N'0', N'0', N'Shangzhi Shi', N'SZI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1037', N'230184', N'五常市', N'94', N'3', N'0', N'0', N'Wuchang Shi', N'WCA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1038', N'230201', N'市辖区', N'95', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1039', N'230202', N'龙沙区', N'95', N'3', N'0', N'0', N'Longsha Qu', N'LQQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1040', N'230203', N'建华区', N'95', N'3', N'0', N'0', N'Jianhua Qu', N'JHQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1041', N'230204', N'铁锋区', N'95', N'3', N'0', N'0', N'Tiefeng Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1042', N'230205', N'昂昂溪区', N'95', N'3', N'0', N'0', N'Ang,angxi Qu', N'AAX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1043', N'230206', N'富拉尔基区', N'95', N'3', N'0', N'0', N'Hulan Ergi Qu', N'HUE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1044', N'230207', N'碾子山区', N'95', N'3', N'0', N'0', N'Nianzishan Qu', N'NZS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1045', N'230208', N'梅里斯达斡尔族区', N'95', N'3', N'0', N'0', N'Meilisidawoerzu Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1046', N'230221', N'龙江县', N'95', N'3', N'0', N'0', N'Longjiang Xian', N'LGJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1047', N'230223', N'依安县', N'95', N'3', N'0', N'0', N'Yi,an Xian', N'YAN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1048', N'230224', N'泰来县', N'95', N'3', N'0', N'0', N'Tailai Xian', N'TLA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1049', N'230225', N'甘南县', N'95', N'3', N'0', N'0', N'Gannan Xian', N'GNX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1050', N'230227', N'富裕县', N'95', N'3', N'0', N'0', N'Fuyu Xian', N'FYX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1051', N'230229', N'克山县', N'95', N'3', N'0', N'0', N'Keshan Xian', N'KSN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1052', N'230230', N'克东县', N'95', N'3', N'0', N'0', N'Kedong Xian', N'KDO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1053', N'230231', N'拜泉县', N'95', N'3', N'0', N'0', N'Baiquan Xian', N'BQN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1054', N'230281', N'讷河市', N'95', N'3', N'0', N'0', N'Nehe Shi', N'NEH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1055', N'230301', N'市辖区', N'96', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1056', N'230302', N'鸡冠区', N'96', N'3', N'0', N'0', N'Jiguan Qu', N'JGU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1057', N'230303', N'恒山区', N'96', N'3', N'0', N'0', N'Hengshan Qu', N'HSD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1058', N'230304', N'滴道区', N'96', N'3', N'0', N'0', N'Didao Qu', N'DDO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1059', N'230305', N'梨树区', N'96', N'3', N'0', N'0', N'Lishu Qu', N'LJX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1060', N'230306', N'城子河区', N'96', N'3', N'0', N'0', N'Chengzihe Qu', N'CZH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1061', N'230307', N'麻山区', N'96', N'3', N'0', N'0', N'Mashan Qu', N'MSN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1062', N'230321', N'鸡东县', N'96', N'3', N'0', N'0', N'Jidong Xian', N'JID')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1063', N'230381', N'虎林市', N'96', N'3', N'0', N'0', N'Hulin Shi', N'HUL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1064', N'230382', N'密山市', N'96', N'3', N'0', N'0', N'Mishan Shi', N'MIS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1065', N'230401', N'市辖区', N'97', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1066', N'230402', N'向阳区', N'97', N'3', N'0', N'0', N'Xiangyang  Qu', N'XYZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1067', N'230403', N'工农区', N'97', N'3', N'0', N'0', N'Gongnong Qu', N'GNH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1068', N'230404', N'南山区', N'97', N'3', N'0', N'0', N'Nanshan Qu', N'NSQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1069', N'230405', N'兴安区', N'97', N'3', N'0', N'0', N'Xing,an Qu', N'XAH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1070', N'230406', N'东山区', N'97', N'3', N'0', N'0', N'Dongshan Qu', N'DSA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1071', N'230407', N'兴山区', N'97', N'3', N'0', N'0', N'Xingshan Qu', N'XSQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1072', N'230421', N'萝北县', N'97', N'3', N'0', N'0', N'Luobei Xian', N'LUB')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1073', N'230422', N'绥滨县', N'97', N'3', N'0', N'0', N'Suibin Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1074', N'230501', N'市辖区', N'98', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1075', N'230502', N'尖山区', N'98', N'3', N'0', N'0', N'Jianshan Qu', N'JSQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1076', N'230503', N'岭东区', N'98', N'3', N'0', N'0', N'Lingdong Qu', N'LDQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1077', N'230505', N'四方台区', N'98', N'3', N'0', N'0', N'Sifangtai Qu', N'SFT')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1078', N'230506', N'宝山区', N'98', N'3', N'0', N'0', N'Baoshan Qu', N'BSQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1079', N'230521', N'集贤县', N'98', N'3', N'0', N'0', N'Jixian Xian', N'JXH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1080', N'230522', N'友谊县', N'98', N'3', N'0', N'0', N'Youyi Xian', N'YYI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1081', N'230523', N'宝清县', N'98', N'3', N'0', N'0', N'Baoqing Xian', N'BQG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1082', N'230524', N'饶河县', N'98', N'3', N'0', N'0', N'Raohe Xian', N'ROH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1083', N'230601', N'市辖区', N'99', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1084', N'230602', N'萨尔图区', N'99', N'3', N'0', N'0', N'Sairt Qu', N'SAI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1085', N'230603', N'龙凤区', N'99', N'3', N'0', N'0', N'Longfeng Qu', N'LFQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1086', N'230604', N'让胡路区', N'99', N'3', N'0', N'0', N'Ranghulu Qu', N'RHL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1087', N'230605', N'红岗区', N'99', N'3', N'0', N'0', N'Honggang Qu', N'HGD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1088', N'230606', N'大同区', N'99', N'3', N'0', N'0', N'Datong Qu', N'DHD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1089', N'230621', N'肇州县', N'99', N'3', N'0', N'0', N'Zhaozhou Xian', N'ZAZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1090', N'230622', N'肇源县', N'99', N'3', N'0', N'0', N'Zhaoyuan Xian', N'ZYH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1091', N'230623', N'林甸县', N'99', N'3', N'0', N'0', N'Lindian Xian', N'LDN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1092', N'230624', N'杜尔伯特蒙古族自治县', N'99', N'3', N'0', N'0', N'Dorbod Mongolzu Zizhixian', N'DOM')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1093', N'230701', N'市辖区', N'100', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1094', N'230702', N'伊春区', N'100', N'3', N'0', N'0', N'Yichun Qu', N'YYC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1095', N'230703', N'南岔区', N'100', N'3', N'0', N'0', N'Nancha Qu', N'NCQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1096', N'230704', N'友好区', N'100', N'3', N'0', N'0', N'Youhao Qu', N'YOH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1097', N'230705', N'西林区', N'100', N'3', N'0', N'0', N'Xilin Qu', N'XIL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1098', N'230706', N'翠峦区', N'100', N'3', N'0', N'0', N'Cuiluan Qu', N'CLN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1099', N'230707', N'新青区', N'100', N'3', N'0', N'0', N'Xinqing Qu', N'XQQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1100', N'230708', N'美溪区', N'100', N'3', N'0', N'0', N'Meixi Qu', N'MXQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1101', N'230709', N'金山屯区', N'100', N'3', N'0', N'0', N'Jinshantun Qu', N'JST')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1102', N'230710', N'五营区', N'100', N'3', N'0', N'0', N'Wuying Qu', N'WYQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1103', N'230711', N'乌马河区', N'100', N'3', N'0', N'0', N'Wumahe Qu', N'WMH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1104', N'230712', N'汤旺河区', N'100', N'3', N'0', N'0', N'Tangwanghe Qu', N'TWH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1105', N'230713', N'带岭区', N'100', N'3', N'0', N'0', N'Dailing Qu', N'DLY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1106', N'230714', N'乌伊岭区', N'100', N'3', N'0', N'0', N'Wuyiling Qu', N'WYL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1107', N'230715', N'红星区', N'100', N'3', N'0', N'0', N'Hongxing Qu', N'HGX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1108', N'230716', N'上甘岭区', N'100', N'3', N'0', N'0', N'Shangganling Qu', N'SGL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1109', N'230722', N'嘉荫县', N'100', N'3', N'0', N'0', N'Jiayin Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1110', N'230781', N'铁力市', N'100', N'3', N'0', N'0', N'Tieli Shi', N'TEL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1111', N'230801', N'市辖区', N'101', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1113', N'230803', N'向阳区', N'101', N'3', N'0', N'0', N'Xiangyang  Qu', N'XYQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1114', N'230804', N'前进区', N'101', N'3', N'0', N'0', N'Qianjin Qu', N'QJQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1115', N'230805', N'东风区', N'101', N'3', N'0', N'0', N'Dongfeng Qu', N'DFQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1116', N'230811', N'郊区', N'101', N'3', N'0', N'0', N'Jiaoqu', N'JQJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1117', N'230822', N'桦南县', N'101', N'3', N'0', N'0', N'Huanan Xian', N'HNH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1118', N'230826', N'桦川县', N'101', N'3', N'0', N'0', N'Huachuan Xian', N'HCN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1119', N'230828', N'汤原县', N'101', N'3', N'0', N'0', N'Tangyuan Xian', N'TYX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1120', N'230833', N'抚远县', N'101', N'3', N'0', N'0', N'Fuyuan Xian', N'FUY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1121', N'230881', N'同江市', N'101', N'3', N'0', N'0', N'Tongjiang Shi', N'TOJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1122', N'230882', N'富锦市', N'101', N'3', N'0', N'0', N'Fujin Shi', N'FUJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1123', N'230901', N'市辖区', N'102', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1124', N'230902', N'新兴区', N'102', N'3', N'0', N'0', N'Xinxing Qu', N'XXQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1125', N'230903', N'桃山区', N'102', N'3', N'0', N'0', N'Taoshan Qu', N'TSC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1126', N'230904', N'茄子河区', N'102', N'3', N'0', N'0', N'Qiezihe Qu', N'QZI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1127', N'230921', N'勃利县', N'102', N'3', N'0', N'0', N'Boli Xian', N'BLI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1128', N'231001', N'市辖区', N'103', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1129', N'231002', N'东安区', N'103', N'3', N'0', N'0', N'Dong,an Qu', N'DGA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1130', N'231003', N'阳明区', N'103', N'3', N'0', N'0', N'Yangming Qu', N'YMQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1131', N'231004', N'爱民区', N'103', N'3', N'0', N'0', N'Aimin Qu', N'AMQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1132', N'231005', N'西安区', N'103', N'3', N'0', N'0', N'Xi,an Qu', N'XAQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1133', N'231024', N'东宁县', N'103', N'3', N'0', N'0', N'Dongning Xian', N'DON')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1134', N'231025', N'林口县', N'103', N'3', N'0', N'0', N'Linkou Xian', N'LKO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1135', N'231081', N'绥芬河市', N'103', N'3', N'0', N'0', N'Suifenhe Shi', N'SFE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1136', N'231083', N'海林市', N'103', N'3', N'0', N'0', N'Hailin Shi', N'HLS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1137', N'231084', N'宁安市', N'103', N'3', N'0', N'0', N'Ning,an Shi', N'NAI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1138', N'231085', N'穆棱市', N'103', N'3', N'0', N'0', N'Muling Shi', N'MLG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1139', N'231101', N'市辖区', N'104', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1140', N'231102', N'爱辉区', N'104', N'3', N'0', N'0', N'Aihui Qu', N'AHQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1141', N'231121', N'嫩江县', N'104', N'3', N'0', N'0', N'Nenjiang Xian', N'NJH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1142', N'231123', N'逊克县', N'104', N'3', N'0', N'0', N'Xunke Xian', N'XUK')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1143', N'231124', N'孙吴县', N'104', N'3', N'0', N'0', N'Sunwu Xian', N'SUW')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1144', N'231181', N'北安市', N'104', N'3', N'0', N'0', N'Bei,an Shi', N'BAS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1145', N'231182', N'五大连池市', N'104', N'3', N'0', N'0', N'Wudalianchi Shi', N'WDL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1146', N'231201', N'市辖区', N'105', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1147', N'231202', N'北林区', N'105', N'3', N'0', N'0', N'Beilin Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1148', N'231221', N'望奎县', N'105', N'3', N'0', N'0', N'Wangkui Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1149', N'231222', N'兰西县', N'105', N'3', N'0', N'0', N'Lanxi Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1150', N'231223', N'青冈县', N'105', N'3', N'0', N'0', N'Qinggang Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1151', N'231224', N'庆安县', N'105', N'3', N'0', N'0', N'Qing,an Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1152', N'231225', N'明水县', N'105', N'3', N'0', N'0', N'Mingshui Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1153', N'231226', N'绥棱县', N'105', N'3', N'0', N'0', N'Suileng Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1154', N'231281', N'安达市', N'105', N'3', N'0', N'0', N'Anda Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1155', N'231282', N'肇东市', N'105', N'3', N'0', N'0', N'Zhaodong Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1156', N'231283', N'海伦市', N'105', N'3', N'0', N'0', N'Hailun Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1157', N'232721', N'呼玛县', N'106', N'3', N'0', N'0', N'Huma Xian', N'HUM')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1158', N'232722', N'塔河县', N'106', N'3', N'0', N'0', N'Tahe Xian', N'TAH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1159', N'232723', N'漠河县', N'106', N'3', N'0', N'0', N'Mohe Xian', N'MOH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1160', N'310101', N'黄浦区', N'107', N'3', N'0', N'0', N'Huangpu Qu', N'HGP')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1161', N'310103', N'卢湾区', N'107', N'3', N'0', N'0', N'Luwan Qu', N'LWN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1162', N'310104', N'徐汇区', N'107', N'3', N'0', N'0', N'Xuhui Qu', N'XHI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1163', N'310105', N'长宁区', N'107', N'3', N'0', N'0', N'Changning Qu', N'CNQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1164', N'310106', N'静安区', N'107', N'3', N'0', N'0', N'Jing,an Qu', N'JAQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1165', N'310107', N'普陀区', N'107', N'3', N'0', N'0', N'Putuo Qu', N'PTQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1166', N'310108', N'闸北区', N'107', N'3', N'0', N'0', N'Zhabei Qu', N'ZBE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1167', N'310109', N'虹口区', N'107', N'3', N'0', N'0', N'Hongkou Qu', N'HKQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1168', N'310110', N'杨浦区', N'107', N'3', N'0', N'0', N'Yangpu Qu', N'YPU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1169', N'310112', N'闵行区', N'107', N'3', N'0', N'0', N'Minhang Qu', N'MHQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1170', N'310113', N'宝山区', N'107', N'3', N'0', N'0', N'Baoshan Qu', N'BAO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1171', N'310114', N'嘉定区', N'107', N'3', N'0', N'0', N'Jiading Qu', N'JDG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1172', N'310115', N'浦东新区', N'107', N'3', N'0', N'0', N'Pudong Xinqu', N'PDX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1173', N'310116', N'金山区', N'107', N'3', N'0', N'0', N'Jinshan Qu', N'JSH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1174', N'310117', N'松江区', N'107', N'3', N'0', N'0', N'Songjiang Qu', N'SOJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1175', N'310118', N'青浦区', N'107', N'3', N'0', N'0', N'Qingpu  Qu', N'QPU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1177', N'310120', N'奉贤区', N'107', N'3', N'0', N'0', N'Fengxian Qu', N'FXI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1178', N'310230', N'崇明县', N'108', N'3', N'0', N'0', N'Chongming Xian', N'CMI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1179', N'320101', N'市辖区', N'109', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1180', N'320102', N'玄武区', N'109', N'3', N'0', N'0', N'Xuanwu Qu', N'XWU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1181', N'320103', N'白下区', N'109', N'3', N'0', N'0', N'Baixia Qu', N'BXQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1182', N'320104', N'秦淮区', N'109', N'3', N'0', N'0', N'Qinhuai Qu', N'QHU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1183', N'320105', N'建邺区', N'109', N'3', N'0', N'0', N'Jianye Qu', N'JYQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1184', N'320106', N'鼓楼区', N'109', N'3', N'0', N'0', N'Gulou Qu', N'GLQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1185', N'320107', N'下关区', N'109', N'3', N'0', N'0', N'Xiaguan Qu', N'XGQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1186', N'320111', N'浦口区', N'109', N'3', N'0', N'0', N'Pukou Qu', N'PKO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1187', N'320113', N'栖霞区', N'109', N'3', N'0', N'0', N'Qixia Qu', N'QAX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1188', N'320114', N'雨花台区', N'109', N'3', N'0', N'0', N'Yuhuatai Qu', N'YHT')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1189', N'320115', N'江宁区', N'109', N'3', N'0', N'0', N'Jiangning Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1190', N'320116', N'六合区', N'109', N'3', N'0', N'0', N'Liuhe Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1191', N'320124', N'溧水县', N'109', N'3', N'0', N'0', N'Lishui Xian', N'LIS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1192', N'320125', N'高淳县', N'109', N'3', N'0', N'0', N'Gaochun Xian', N'GCN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1193', N'320201', N'市辖区', N'110', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1194', N'320202', N'崇安区', N'110', N'3', N'0', N'0', N'Chong,an Qu', N'CGA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1195', N'320203', N'南长区', N'110', N'3', N'0', N'0', N'Nanchang Qu', N'NCG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1196', N'320204', N'北塘区', N'110', N'3', N'0', N'0', N'Beitang Qu', N'BTQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1197', N'320205', N'锡山区', N'110', N'3', N'0', N'0', N'Xishan Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1198', N'320206', N'惠山区', N'110', N'3', N'0', N'0', N'Huishan Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1199', N'320211', N'滨湖区', N'110', N'3', N'0', N'0', N'Binhu Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1200', N'320281', N'江阴市', N'110', N'3', N'0', N'0', N'Jiangyin Shi', N'JIA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1201', N'320282', N'宜兴市', N'110', N'3', N'0', N'0', N'Yixing Shi', N'YIX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1202', N'320301', N'市辖区', N'111', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1203', N'320302', N'鼓楼区', N'111', N'3', N'0', N'0', N'Gulou Qu', N'GLU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1204', N'320303', N'云龙区', N'111', N'3', N'0', N'0', N'Yunlong Qu', N'YLF')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1206', N'320305', N'贾汪区', N'111', N'3', N'0', N'0', N'Jiawang Qu', N'JWQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1207', N'320311', N'泉山区', N'111', N'3', N'0', N'0', N'Quanshan Qu', N'QSX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1208', N'320321', N'丰县', N'111', N'3', N'0', N'0', N'Feng Xian', N'FXN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1209', N'320322', N'沛县', N'111', N'3', N'0', N'0', N'Pei Xian', N'PEI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1210', N'320312', N'铜山区', N'111', N'3', N'0', N'0', N'Tongshan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1211', N'320324', N'睢宁县', N'111', N'3', N'0', N'0', N'Suining Xian', N'SNI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1212', N'320381', N'新沂市', N'111', N'3', N'0', N'0', N'Xinyi Shi', N'XYW')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1213', N'320382', N'邳州市', N'111', N'3', N'0', N'0', N'Pizhou Shi', N'PZO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1214', N'320401', N'市辖区', N'112', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1215', N'320402', N'天宁区', N'112', N'3', N'0', N'0', N'Tianning Qu', N'TNQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1216', N'320404', N'钟楼区', N'112', N'3', N'0', N'0', N'Zhonglou Qu', N'ZLQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1217', N'320405', N'戚墅堰区', N'112', N'3', N'0', N'0', N'Qishuyan Qu', N'QSY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1218', N'320411', N'新北区', N'112', N'3', N'0', N'0', N'Xinbei Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1219', N'320412', N'武进区', N'112', N'3', N'0', N'0', N'Wujin Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1220', N'320481', N'溧阳市', N'112', N'3', N'0', N'0', N'Liyang Shi', N'LYR')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1221', N'320482', N'金坛市', N'112', N'3', N'0', N'0', N'Jintan Shi', N'JTS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1222', N'320501', N'市辖区', N'113', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1223', N'320502', N'沧浪区', N'113', N'3', N'0', N'0', N'Canglang Qu', N'CLQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1224', N'320503', N'平江区', N'113', N'3', N'0', N'0', N'Pingjiang Qu', N'PJQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1225', N'320504', N'金阊区', N'113', N'3', N'0', N'0', N'Jinchang Qu', N'JCA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1226', N'320505', N'虎丘区', N'113', N'3', N'0', N'0', N'Huqiu Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1227', N'320506', N'吴中区', N'113', N'3', N'0', N'0', N'Wuzhong Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1228', N'320507', N'相城区', N'113', N'3', N'0', N'0', N'Xiangcheng Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1229', N'320581', N'常熟市', N'113', N'3', N'0', N'0', N'Changshu Shi', N'CGS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1230', N'320582', N'张家港市', N'113', N'3', N'0', N'0', N'Zhangjiagang Shi', N'ZJG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1231', N'320583', N'昆山市', N'113', N'3', N'0', N'0', N'Kunshan Shi', N'KUS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1232', N'320584', N'吴江市', N'113', N'3', N'0', N'0', N'Wujiang Shi', N'WUJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1233', N'320585', N'太仓市', N'113', N'3', N'0', N'0', N'Taicang Shi', N'TAC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1234', N'320601', N'市辖区', N'114', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1235', N'320602', N'崇川区', N'114', N'3', N'0', N'0', N'Chongchuan Qu', N'CCQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1236', N'320611', N'港闸区', N'114', N'3', N'0', N'0', N'Gangzha Qu', N'GZQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1237', N'320621', N'海安县', N'114', N'3', N'0', N'0', N'Hai,an Xian', N'HIA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1238', N'320623', N'如东县', N'114', N'3', N'0', N'0', N'Rudong Xian', N'RDG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1239', N'320681', N'启东市', N'114', N'3', N'0', N'0', N'Qidong Shi', N'QID')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1240', N'320682', N'如皋市', N'114', N'3', N'0', N'0', N'Rugao Shi', N'R')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1241', N'320612', N'通州区', N'114', N'3', N'0', N'0', N'Tongzhou Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1242', N'320684', N'海门市', N'114', N'3', N'0', N'0', N'Haimen Shi', N'HME')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1243', N'320701', N'市辖区', N'115', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1244', N'320703', N'连云区', N'115', N'3', N'0', N'0', N'Lianyun Qu', N'LYB')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1245', N'320705', N'新浦区', N'115', N'3', N'0', N'0', N'Xinpu Qu', N'XPQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1246', N'320706', N'海州区', N'115', N'3', N'0', N'0', N'Haizhou Qu', N'HIZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1247', N'320721', N'赣榆县', N'115', N'3', N'0', N'0', N'Ganyu Xian', N'GYU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1248', N'320722', N'东海县', N'115', N'3', N'0', N'0', N'Donghai Xian', N'DHX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1249', N'320723', N'灌云县', N'115', N'3', N'0', N'0', N'Guanyun Xian', N'GYS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1250', N'320724', N'灌南县', N'115', N'3', N'0', N'0', N'Guannan Xian', N'GUN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1251', N'320801', N'市辖区', N'116', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1252', N'320802', N'清河区', N'116', N'3', N'0', N'0', N'Qinghe Qu', N'QHH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1253', N'320803', N'楚州区', N'116', N'3', N'0', N'0', N'Chuzhou Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1254', N'320804', N'淮阴区', N'116', N'3', N'0', N'0', N'Huaiyin Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1255', N'320811', N'清浦区', N'116', N'3', N'0', N'0', N'Qingpu Qu', N'QPQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1256', N'320826', N'涟水县', N'116', N'3', N'0', N'0', N'Lianshui Xian', N'LSI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1257', N'320829', N'洪泽县', N'116', N'3', N'0', N'0', N'Hongze Xian', N'HGZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1258', N'320830', N'盱眙县', N'116', N'3', N'0', N'0', N'Xuyi Xian', N'XUY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1259', N'320831', N'金湖县', N'116', N'3', N'0', N'0', N'Jinhu Xian', N'JHU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1260', N'320901', N'市辖区', N'117', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1261', N'320902', N'亭湖区', N'117', N'3', N'0', N'0', N'Tinghu Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1262', N'320903', N'盐都区', N'117', N'3', N'0', N'0', N'Yandu Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1263', N'320921', N'响水县', N'117', N'3', N'0', N'0', N'Xiangshui Xian', N'XSH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1264', N'320922', N'滨海县', N'117', N'3', N'0', N'0', N'Binhai Xian', N'BHI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1265', N'320923', N'阜宁县', N'117', N'3', N'0', N'0', N'Funing Xian', N'FNG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1266', N'320924', N'射阳县', N'117', N'3', N'0', N'0', N'Sheyang Xian', N'SEY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1267', N'320925', N'建湖县', N'117', N'3', N'0', N'0', N'Jianhu Xian', N'JIH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1268', N'320981', N'东台市', N'117', N'3', N'0', N'0', N'Dongtai Shi', N'DTS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1269', N'320982', N'大丰市', N'117', N'3', N'0', N'0', N'Dafeng Shi', N'DFS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1270', N'321001', N'市辖区', N'118', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1271', N'321002', N'广陵区', N'118', N'3', N'0', N'0', N'Guangling Qu', N'GGL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1272', N'321003', N'邗江区', N'118', N'3', N'0', N'0', N'Hanjiang Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1273', N'321011', N'维扬区', N'118', N'3', N'0', N'0', N'Weiyang Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1274', N'321023', N'宝应县', N'118', N'3', N'0', N'0', N'Baoying Xian', N'BYI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1275', N'321081', N'仪征市', N'118', N'3', N'0', N'0', N'Yizheng Shi', N'YZE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1276', N'321084', N'高邮市', N'118', N'3', N'0', N'0', N'Gaoyou Shi', N'GYO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1277', N'321088', N'江都市', N'118', N'3', N'0', N'0', N'Jiangdu Shi', N'JDU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1278', N'321101', N'市辖区', N'119', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1279', N'321102', N'京口区', N'119', N'3', N'0', N'0', N'Jingkou Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1280', N'321111', N'润州区', N'119', N'3', N'0', N'0', N'Runzhou Qu', N'RZQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1281', N'321112', N'丹徒区', N'119', N'3', N'0', N'0', N'Dantu Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1282', N'321181', N'丹阳市', N'119', N'3', N'0', N'0', N'Danyang Xian', N'DNY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1283', N'321182', N'扬中市', N'119', N'3', N'0', N'0', N'Yangzhong Shi', N'YZG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1284', N'321183', N'句容市', N'119', N'3', N'0', N'0', N'Jurong Shi', N'JRG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1285', N'321201', N'市辖区', N'120', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1286', N'321202', N'海陵区', N'120', N'3', N'0', N'0', N'Hailing Qu', N'HIL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1287', N'321203', N'高港区', N'120', N'3', N'0', N'0', N'Gaogang Qu', N'GGQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1288', N'321281', N'兴化市', N'120', N'3', N'0', N'0', N'Xinghua Shi', N'XHS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1289', N'321282', N'靖江市', N'120', N'3', N'0', N'0', N'Jingjiang Shi', N'JGJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1290', N'321283', N'泰兴市', N'120', N'3', N'0', N'0', N'Taixing Shi', N'TXG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1291', N'321284', N'姜堰市', N'120', N'3', N'0', N'0', N'Jiangyan Shi', N'JYS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1292', N'321301', N'市辖区', N'121', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1293', N'321302', N'宿城区', N'121', N'3', N'0', N'0', N'Sucheng Qu', N'SCE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1294', N'321311', N'宿豫区', N'121', N'3', N'0', N'0', N'Suyu Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1295', N'321322', N'沭阳县', N'121', N'3', N'0', N'0', N'Shuyang Xian', N'SYD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1296', N'321323', N'泗阳县', N'121', N'3', N'0', N'0', N'Siyang Xian', N'SIY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1297', N'321324', N'泗洪县', N'121', N'3', N'0', N'0', N'Sihong Xian', N'SIH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1298', N'330101', N'市辖区', N'122', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1299', N'330102', N'上城区', N'122', N'3', N'0', N'0', N'Shangcheng Qu', N'SCQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1300', N'330103', N'下城区', N'122', N'3', N'0', N'0', N'Xiacheng Qu', N'XCG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1301', N'330104', N'江干区', N'122', N'3', N'0', N'0', N'Jianggan Qu', N'JGQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1302', N'330105', N'拱墅区', N'122', N'3', N'0', N'0', N'Gongshu Qu', N'GSQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1303', N'330106', N'西湖区', N'122', N'3', N'0', N'0', N'Xihu Qu', N'XHU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1304', N'330108', N'滨江区', N'122', N'3', N'0', N'0', N'Binjiang Qu', N'BJQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1305', N'330109', N'萧山区', N'122', N'3', N'0', N'0', N'Xiaoshan Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1306', N'330110', N'余杭区', N'122', N'3', N'0', N'0', N'Yuhang Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1307', N'330122', N'桐庐县', N'122', N'3', N'0', N'0', N'Tonglu Xian', N'TLU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1308', N'330127', N'淳安县', N'122', N'3', N'0', N'0', N'Chun,an Xian', N'CAZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1309', N'330182', N'建德市', N'122', N'3', N'0', N'0', N'Jiande Shi', N'JDS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1310', N'330183', N'富阳市', N'122', N'3', N'0', N'0', N'Fuyang Shi', N'FYZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1311', N'330185', N'临安市', N'122', N'3', N'0', N'0', N'Lin,an Shi', N'LNA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1312', N'330201', N'市辖区', N'123', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1313', N'330203', N'海曙区', N'123', N'3', N'0', N'0', N'Haishu Qu', N'HNB')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1314', N'330204', N'江东区', N'123', N'3', N'0', N'0', N'Jiangdong Qu', N'JDO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1315', N'330205', N'江北区', N'123', N'3', N'0', N'0', N'Jiangbei Qu', N'JBQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1316', N'330206', N'北仑区', N'123', N'3', N'0', N'0', N'Beilun Qu', N'BLN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1317', N'330211', N'镇海区', N'123', N'3', N'0', N'0', N'Zhenhai Qu', N'ZHF')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1318', N'330212', N'鄞州区', N'123', N'3', N'0', N'0', N'Yinzhou Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1319', N'330225', N'象山县', N'123', N'3', N'0', N'0', N'Xiangshan Xian', N'YSZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1320', N'330226', N'宁海县', N'123', N'3', N'0', N'0', N'Ninghai Xian', N'NHI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1321', N'330281', N'余姚市', N'123', N'3', N'0', N'0', N'Yuyao Shi', N'YYO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1322', N'330282', N'慈溪市', N'123', N'3', N'0', N'0', N'Cixi Shi', N'CXI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1323', N'330283', N'奉化市', N'123', N'3', N'0', N'0', N'Fenghua Shi', N'FHU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1324', N'330301', N'市辖区', N'124', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1325', N'330302', N'鹿城区', N'124', N'3', N'0', N'0', N'Lucheng Qu', N'LUW')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1326', N'330303', N'龙湾区', N'124', N'3', N'0', N'0', N'Longwan Qu', N'LWW')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1327', N'330304', N'瓯海区', N'124', N'3', N'0', N'0', N'Ouhai Qu', N'OHQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1328', N'330322', N'洞头县', N'124', N'3', N'0', N'0', N'Dongtou Xian', N'DTO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1329', N'330324', N'永嘉县', N'124', N'3', N'0', N'0', N'Yongjia Xian', N'YJX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1330', N'330326', N'平阳县', N'124', N'3', N'0', N'0', N'Pingyang Xian', N'PYG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1331', N'330327', N'苍南县', N'124', N'3', N'0', N'0', N'Cangnan Xian', N'CAN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1332', N'330328', N'文成县', N'124', N'3', N'0', N'0', N'Wencheng Xian', N'WCZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1333', N'330329', N'泰顺县', N'124', N'3', N'0', N'0', N'Taishun Xian', N'TSZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1334', N'330381', N'瑞安市', N'124', N'3', N'0', N'0', N'Rui,an Xian', N'RAS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1335', N'330382', N'乐清市', N'124', N'3', N'0', N'0', N'Yueqing Shi', N'YQZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1336', N'330401', N'市辖区', N'125', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1338', N'330411', N'秀洲区', N'125', N'3', N'0', N'0', N'Xiuzhou Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1339', N'330421', N'嘉善县', N'125', N'3', N'0', N'0', N'Jiashan Xian', N'JSK')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1340', N'330424', N'海盐县', N'125', N'3', N'0', N'0', N'Haiyan Xian', N'HYN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1341', N'330481', N'海宁市', N'125', N'3', N'0', N'0', N'Haining Shi', N'HNG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1342', N'330482', N'平湖市', N'125', N'3', N'0', N'0', N'Pinghu Shi', N'PHU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1343', N'330483', N'桐乡市', N'125', N'3', N'0', N'0', N'Tongxiang Shi', N'TXZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1344', N'330501', N'市辖区', N'126', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1345', N'330502', N'吴兴区', N'126', N'3', N'0', N'0', N'Wuxing Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1346', N'330503', N'南浔区', N'126', N'3', N'0', N'0', N'Nanxun Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1347', N'330521', N'德清县', N'126', N'3', N'0', N'0', N'Deqing Xian', N'DQX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1348', N'330522', N'长兴县', N'126', N'3', N'0', N'0', N'Changxing Xian', N'CXG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1349', N'330523', N'安吉县', N'126', N'3', N'0', N'0', N'Anji Xian', N'AJI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1350', N'330601', N'市辖区', N'127', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1351', N'330602', N'越城区', N'127', N'3', N'0', N'0', N'Yuecheng Qu', N'YSX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1352', N'330621', N'绍兴县', N'127', N'3', N'0', N'0', N'Shaoxing Xian', N'SXZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1353', N'330624', N'新昌县', N'127', N'3', N'0', N'0', N'Xinchang Xian', N'XCX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1354', N'330681', N'诸暨市', N'127', N'3', N'0', N'0', N'Zhuji Shi', N'ZHJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1355', N'330682', N'上虞市', N'127', N'3', N'0', N'0', N'Shangyu Shi', N'SYZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1356', N'330683', N'嵊州市', N'127', N'3', N'0', N'0', N'Shengzhou Shi', N'SGZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1357', N'330701', N'市辖区', N'128', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1358', N'330702', N'婺城区', N'128', N'3', N'0', N'0', N'Wucheng Qu', N'WCF')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1359', N'330703', N'金东区', N'128', N'3', N'0', N'0', N'Jindong Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1360', N'330723', N'武义县', N'128', N'3', N'0', N'0', N'Wuyi Xian', N'WYX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1361', N'330726', N'浦江县', N'128', N'3', N'0', N'0', N'Pujiang Xian', N'PJG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1362', N'330727', N'磐安县', N'128', N'3', N'0', N'0', N'Pan,an Xian', N'PAX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1363', N'330781', N'兰溪市', N'128', N'3', N'0', N'0', N'Lanxi Shi', N'LXZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1364', N'330782', N'义乌市', N'128', N'3', N'0', N'0', N'Yiwu Shi', N'YWS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1365', N'330783', N'东阳市', N'128', N'3', N'0', N'0', N'Dongyang Shi', N'DGY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1366', N'330784', N'永康市', N'128', N'3', N'0', N'0', N'Yongkang Shi', N'YKG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1367', N'330801', N'市辖区', N'129', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1368', N'330802', N'柯城区', N'129', N'3', N'0', N'0', N'Kecheng Qu', N'KEC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1369', N'330803', N'衢江区', N'129', N'3', N'0', N'0', N'Qujiang Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1370', N'330822', N'常山县', N'129', N'3', N'0', N'0', N'Changshan Xian', N'CSN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1371', N'330824', N'开化县', N'129', N'3', N'0', N'0', N'Kaihua Xian', N'KHU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1372', N'330825', N'龙游县', N'129', N'3', N'0', N'0', N'Longyou Xian', N'LGY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1373', N'330881', N'江山市', N'129', N'3', N'0', N'0', N'Jiangshan Shi', N'JIS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1374', N'330901', N'市辖区', N'130', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1375', N'330902', N'定海区', N'130', N'3', N'0', N'0', N'Dinghai Qu', N'DHQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1376', N'330903', N'普陀区', N'130', N'3', N'0', N'0', N'Putuo Qu', N'PTO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1377', N'330921', N'岱山县', N'130', N'3', N'0', N'0', N'Daishan Xian', N'DSH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1378', N'330922', N'嵊泗县', N'130', N'3', N'0', N'0', N'Shengsi Xian', N'SSZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1379', N'331001', N'市辖区', N'131', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1380', N'331002', N'椒江区', N'131', N'3', N'0', N'0', N'Jiaojiang Qu', N'JJT')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1381', N'331003', N'黄岩区', N'131', N'3', N'0', N'0', N'Huangyan Qu', N'HYT')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1382', N'331004', N'路桥区', N'131', N'3', N'0', N'0', N'Luqiao Qu', N'LQT')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1383', N'331021', N'玉环县', N'131', N'3', N'0', N'0', N'Yuhuan Xian', N'YHN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1384', N'331022', N'三门县', N'131', N'3', N'0', N'0', N'Sanmen Xian', N'SMN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1385', N'331023', N'天台县', N'131', N'3', N'0', N'0', N'Tiantai Xian', N'TTA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1386', N'331024', N'仙居县', N'131', N'3', N'0', N'0', N'Xianju Xian', N'XJU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1387', N'331081', N'温岭市', N'131', N'3', N'0', N'0', N'Wenling Shi', N'WLS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1388', N'331082', N'临海市', N'131', N'3', N'0', N'0', N'Linhai Shi', N'LHI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1389', N'331101', N'市辖区', N'132', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1390', N'331102', N'莲都区', N'132', N'3', N'0', N'0', N'Liandu Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1391', N'331121', N'青田县', N'132', N'3', N'0', N'0', N'Qingtian Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1392', N'331122', N'缙云县', N'132', N'3', N'0', N'0', N'Jinyun Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1393', N'331123', N'遂昌县', N'132', N'3', N'0', N'0', N'Suichang Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1394', N'331124', N'松阳县', N'132', N'3', N'0', N'0', N'Songyang Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1395', N'331125', N'云和县', N'132', N'3', N'0', N'0', N'Yunhe Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1396', N'331126', N'庆元县', N'132', N'3', N'0', N'0', N'Qingyuan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1397', N'331127', N'景宁畲族自治县', N'132', N'3', N'0', N'0', N'Jingning Shezu Zizhixian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1398', N'331181', N'龙泉市', N'132', N'3', N'0', N'0', N'Longquan Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1399', N'340101', N'市辖区', N'133', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1400', N'340102', N'瑶海区', N'133', N'3', N'0', N'0', N'Yaohai Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1401', N'340103', N'庐阳区', N'133', N'3', N'0', N'0', N'Luyang Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1402', N'340104', N'蜀山区', N'133', N'3', N'0', N'0', N'Shushan Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1403', N'340111', N'包河区', N'133', N'3', N'0', N'0', N'Baohe Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1404', N'340121', N'长丰县', N'133', N'3', N'0', N'0', N'Changfeng Xian', N'CFG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1405', N'340122', N'肥东县', N'133', N'3', N'0', N'0', N'Feidong Xian', N'FDO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1406', N'340123', N'肥西县', N'133', N'3', N'0', N'0', N'Feixi Xian', N'FIX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1415', N'340301', N'市辖区', N'135', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1416', N'340302', N'龙子湖区', N'135', N'3', N'0', N'0', N'Longzihu Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1417', N'340303', N'蚌山区', N'135', N'3', N'0', N'0', N'Bangshan Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1418', N'340304', N'禹会区', N'135', N'3', N'0', N'0', N'Yuhui Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1419', N'340311', N'淮上区', N'135', N'3', N'0', N'0', N'Huaishang Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1420', N'340321', N'怀远县', N'135', N'3', N'0', N'0', N'Huaiyuan Qu', N'HYW')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1421', N'340322', N'五河县', N'135', N'3', N'0', N'0', N'Wuhe Xian', N'WHE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1422', N'340323', N'固镇县', N'135', N'3', N'0', N'0', N'Guzhen Xian', N'GZX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1423', N'340401', N'市辖区', N'136', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1424', N'340402', N'大通区', N'136', N'3', N'0', N'0', N'Datong Qu', N'DTQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1425', N'340403', N'田家庵区', N'136', N'3', N'0', N'0', N'Tianjia,an Qu', N'TJA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1426', N'340404', N'谢家集区', N'136', N'3', N'0', N'0', N'Xiejiaji Qu', N'XJJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1427', N'340405', N'八公山区', N'136', N'3', N'0', N'0', N'Bagongshan Qu', N'BGS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1428', N'340406', N'潘集区', N'136', N'3', N'0', N'0', N'Panji Qu', N'PJI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1429', N'340421', N'凤台县', N'136', N'3', N'0', N'0', N'Fengtai Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1430', N'340501', N'市辖区', N'137', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1431', N'340502', N'金家庄区', N'137', N'3', N'0', N'0', N'Jinjiazhuang Qu', N'JJZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1432', N'340503', N'花山区', N'137', N'3', N'0', N'0', N'Huashan Qu', N'HSM')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1433', N'340504', N'雨山区', N'137', N'3', N'0', N'0', N'Yushan Qu', N'YSQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1434', N'340521', N'当涂县', N'137', N'3', N'0', N'0', N'Dangtu Xian', N'DTU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1435', N'340601', N'市辖区', N'138', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1436', N'340602', N'杜集区', N'138', N'3', N'0', N'0', N'Duji Qu', N'DJQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1437', N'340603', N'相山区', N'138', N'3', N'0', N'0', N'Xiangshan Qu', N'XSA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1438', N'340604', N'烈山区', N'138', N'3', N'0', N'0', N'Lieshan Qu', N'LHB')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1439', N'340621', N'濉溪县', N'138', N'3', N'0', N'0', N'Suixi Xian', N'SXW')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1440', N'340701', N'市辖区', N'139', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1441', N'340702', N'铜官山区', N'139', N'3', N'0', N'0', N'Tongguanshan Qu', N'TGQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1442', N'340703', N'狮子山区', N'139', N'3', N'0', N'0', N'Shizishan Qu', N'SZN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1443', N'340711', N'郊区', N'139', N'3', N'0', N'0', N'Jiaoqu', N'JTL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1444', N'340721', N'铜陵县', N'139', N'3', N'0', N'0', N'Tongling Xian', N'TLX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1445', N'340801', N'市辖区', N'140', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1446', N'340802', N'迎江区', N'140', N'3', N'0', N'0', N'Yingjiang Qu', N'YJQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1447', N'340803', N'大观区', N'140', N'3', N'0', N'0', N'Daguan Qu', N'DGQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1448', N'340811', N'宜秀区', N'140', N'3', N'0', N'0', N'Yixiu Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1449', N'340822', N'怀宁县', N'140', N'3', N'0', N'0', N'Huaining Xian', N'HNW')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1450', N'340823', N'枞阳县', N'140', N'3', N'0', N'0', N'Zongyang Xian', N'ZYW')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1451', N'340824', N'潜山县', N'140', N'3', N'0', N'0', N'Qianshan Xian', N'QSW')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1452', N'340825', N'太湖县', N'140', N'3', N'0', N'0', N'Taihu Xian', N'THU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1453', N'340826', N'宿松县', N'140', N'3', N'0', N'0', N'Susong Xian', N'SUS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1454', N'340827', N'望江县', N'140', N'3', N'0', N'0', N'Wangjiang Xian', N'WJX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1455', N'340828', N'岳西县', N'140', N'3', N'0', N'0', N'Yuexi Xian', N'YXW')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1456', N'340881', N'桐城市', N'140', N'3', N'0', N'0', N'Tongcheng Shi', N'TCW')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1457', N'341001', N'市辖区', N'141', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1458', N'341002', N'屯溪区', N'141', N'3', N'0', N'0', N'Tunxi Qu', N'TXN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1459', N'341003', N'黄山区', N'141', N'3', N'0', N'0', N'Huangshan Qu', N'HSK')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1460', N'341004', N'徽州区', N'141', N'3', N'0', N'0', N'Huizhou Qu', N'HZQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1461', N'341021', N'歙县', N'141', N'3', N'0', N'0', N'She Xian', N'SEX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1462', N'341022', N'休宁县', N'141', N'3', N'0', N'0', N'Xiuning Xian', N'XUN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1463', N'341023', N'黟县', N'141', N'3', N'0', N'0', N'Yi Xian', N'YIW')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1464', N'341024', N'祁门县', N'141', N'3', N'0', N'0', N'Qimen Xian', N'QMN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1465', N'341101', N'市辖区', N'142', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1466', N'341102', N'琅琊区', N'142', N'3', N'0', N'0', N'Langya Qu', N'LYU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1467', N'341103', N'南谯区', N'142', N'3', N'0', N'0', N'Nanqiao Qu', N'NQQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1468', N'341122', N'来安县', N'142', N'3', N'0', N'0', N'Lai,an Xian', N'LAX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1469', N'341124', N'全椒县', N'142', N'3', N'0', N'0', N'Quanjiao Xian', N'QJO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1470', N'341125', N'定远县', N'142', N'3', N'0', N'0', N'Dingyuan Xian', N'DYW')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1471', N'341126', N'凤阳县', N'142', N'3', N'0', N'0', N'Fengyang Xian', N'FYG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1472', N'341181', N'天长市', N'142', N'3', N'0', N'0', N'Tianchang Shi', N'TNC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1473', N'341182', N'明光市', N'142', N'3', N'0', N'0', N'Mingguang Shi', N'MGG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1474', N'341201', N'市辖区', N'143', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1475', N'341202', N'颍州区', N'143', N'3', N'0', N'0', N'Yingzhou Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1476', N'341203', N'颍东区', N'143', N'3', N'0', N'0', N'Yingdong Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1477', N'341204', N'颍泉区', N'143', N'3', N'0', N'0', N'Yingquan Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1478', N'341221', N'临泉县', N'143', N'3', N'0', N'0', N'Linquan Xian', N'LQN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1479', N'341222', N'太和县', N'143', N'3', N'0', N'0', N'Taihe Xian', N'TIH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1480', N'341225', N'阜南县', N'143', N'3', N'0', N'0', N'Funan Xian', N'FNX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1481', N'341226', N'颍上县', N'143', N'3', N'0', N'0', N'Yingshang Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1482', N'341282', N'界首市', N'143', N'3', N'0', N'0', N'Jieshou Shi', N'JSW')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1483', N'341301', N'市辖区', N'144', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1484', N'341302', N'埇桥区', N'144', N'3', N'0', N'0', N'Yongqiao Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1485', N'341321', N'砀山县', N'144', N'3', N'0', N'0', N'Dangshan Xian', N'DSW')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1486', N'341322', N'萧县', N'144', N'3', N'0', N'0', N'Xiao Xian', N'XIO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1487', N'341323', N'灵璧县', N'144', N'3', N'0', N'0', N'Lingbi Xian', N'LBI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1488', N'341324', N'泗县', N'144', N'3', N'0', N'0', N'Si Xian', N'SIX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1489', N'341401', N'市辖区', N'145', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1490', N'341402', N'居巢区', N'145', N'3', N'0', N'0', N'Juchao Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1491', N'341421', N'庐江县', N'145', N'3', N'0', N'0', N'Lujiang Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1492', N'341422', N'无为县', N'145', N'3', N'0', N'0', N'Wuwei Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1493', N'341423', N'含山县', N'145', N'3', N'0', N'0', N'Hanshan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1494', N'341424', N'和县', N'145', N'3', N'0', N'0', N'He Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1495', N'341501', N'市辖区', N'146', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1496', N'341502', N'金安区', N'146', N'3', N'0', N'0', N'Jinan Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1497', N'341503', N'裕安区', N'146', N'3', N'0', N'0', N'Yuan Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1498', N'341521', N'寿县', N'146', N'3', N'0', N'0', N'Shou Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1499', N'341522', N'霍邱县', N'146', N'3', N'0', N'0', N'Huoqiu Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1500', N'341523', N'舒城县', N'146', N'3', N'0', N'0', N'Shucheng Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1501', N'341524', N'金寨县', N'146', N'3', N'0', N'0', N'Jingzhai Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1502', N'341525', N'霍山县', N'146', N'3', N'0', N'0', N'Huoshan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1503', N'341601', N'市辖区', N'147', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1504', N'341602', N'谯城区', N'147', N'3', N'0', N'0', N'Qiaocheng Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1505', N'341621', N'涡阳县', N'147', N'3', N'0', N'0', N'Guoyang Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1506', N'341622', N'蒙城县', N'147', N'3', N'0', N'0', N'Mengcheng Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1507', N'341623', N'利辛县', N'147', N'3', N'0', N'0', N'Lixin Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1508', N'341701', N'市辖区', N'148', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1509', N'341702', N'贵池区', N'148', N'3', N'0', N'0', N'Guichi Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1510', N'341721', N'东至县', N'148', N'3', N'0', N'0', N'Dongzhi Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1511', N'341722', N'石台县', N'148', N'3', N'0', N'0', N'Shitai Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1512', N'341723', N'青阳县', N'148', N'3', N'0', N'0', N'Qingyang Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1513', N'341801', N'市辖区', N'149', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1514', N'341802', N'宣州区', N'149', N'3', N'0', N'0', N'Xuanzhou Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1515', N'341821', N'郎溪县', N'149', N'3', N'0', N'0', N'Langxi Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1516', N'341822', N'广德县', N'149', N'3', N'0', N'0', N'Guangde Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1517', N'341823', N'泾县', N'149', N'3', N'0', N'0', N'Jing Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1518', N'341824', N'绩溪县', N'149', N'3', N'0', N'0', N'Jixi Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1519', N'341825', N'旌德县', N'149', N'3', N'0', N'0', N'Jingde Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1520', N'341881', N'宁国市', N'149', N'3', N'0', N'0', N'Ningguo Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1521', N'350101', N'市辖区', N'150', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1522', N'350102', N'鼓楼区', N'150', N'3', N'0', N'0', N'Gulou Qu', N'GLR')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1523', N'350103', N'台江区', N'150', N'3', N'0', N'0', N'Taijiang Qu', N'TJQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1524', N'350104', N'仓山区', N'150', N'3', N'0', N'0', N'Cangshan Qu', N'CSQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1525', N'350105', N'马尾区', N'150', N'3', N'0', N'0', N'Mawei Qu', N'MWQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1526', N'350111', N'晋安区', N'150', N'3', N'0', N'0', N'Jin,an Qu', N'JAF')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1527', N'350121', N'闽侯县', N'150', N'3', N'0', N'0', N'Minhou Qu', N'MHO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1528', N'350122', N'连江县', N'150', N'3', N'0', N'0', N'Lianjiang Xian', N'LJF')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1529', N'350123', N'罗源县', N'150', N'3', N'0', N'0', N'Luoyuan Xian', N'LOY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1530', N'350124', N'闽清县', N'150', N'3', N'0', N'0', N'Minqing Xian', N'MQG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1531', N'350125', N'永泰县', N'150', N'3', N'0', N'0', N'Yongtai Xian', N'YTX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1532', N'350128', N'平潭县', N'150', N'3', N'0', N'0', N'Pingtan Xian', N'PTN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1533', N'350181', N'福清市', N'150', N'3', N'0', N'0', N'Fuqing Shi', N'FQS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1534', N'350182', N'长乐市', N'150', N'3', N'0', N'0', N'Changle Shi', N'CLS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1535', N'350201', N'市辖区', N'151', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1536', N'350203', N'思明区', N'151', N'3', N'0', N'0', N'Siming Qu', N'SMQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1537', N'350205', N'海沧区', N'151', N'3', N'0', N'0', N'Haicang Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1538', N'350206', N'湖里区', N'151', N'3', N'0', N'0', N'Huli Qu', N'HLQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1539', N'350211', N'集美区', N'151', N'3', N'0', N'0', N'Jimei Qu', N'JMQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1540', N'350212', N'同安区', N'151', N'3', N'0', N'0', N'Tong,an Qu', N'TAQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1541', N'350213', N'翔安区', N'151', N'3', N'0', N'0', N'Xiangan Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1542', N'350301', N'市辖区', N'152', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1543', N'350302', N'城厢区', N'152', N'3', N'0', N'0', N'Chengxiang Qu', N'CXP')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1544', N'350303', N'涵江区', N'152', N'3', N'0', N'0', N'Hanjiang Qu', N'HJQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1545', N'350304', N'荔城区', N'152', N'3', N'0', N'0', N'Licheng Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1546', N'350305', N'秀屿区', N'152', N'3', N'0', N'0', N'Xiuyu Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1547', N'350322', N'仙游县', N'152', N'3', N'0', N'0', N'Xianyou Xian', N'XYF')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1548', N'350401', N'市辖区', N'153', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1549', N'350402', N'梅列区', N'153', N'3', N'0', N'0', N'Meilie Qu', N'MLQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1550', N'350403', N'三元区', N'153', N'3', N'0', N'0', N'Sanyuan Qu', N'SYB')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1551', N'350421', N'明溪县', N'153', N'3', N'0', N'0', N'Mingxi Xian', N'MXI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1552', N'350423', N'清流县', N'153', N'3', N'0', N'0', N'Qingliu Xian', N'QLX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1553', N'350424', N'宁化县', N'153', N'3', N'0', N'0', N'Ninghua Xian', N'NGH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1554', N'350425', N'大田县', N'153', N'3', N'0', N'0', N'Datian Xian', N'DTM')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1555', N'350426', N'尤溪县', N'153', N'3', N'0', N'0', N'Youxi Xian', N'YXF')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1556', N'350427', N'沙县', N'153', N'3', N'0', N'0', N'Sha Xian', N'SAX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1557', N'350428', N'将乐县', N'153', N'3', N'0', N'0', N'Jiangle Xian', N'JLE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1558', N'350429', N'泰宁县', N'153', N'3', N'0', N'0', N'Taining Xian', N'TNG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1559', N'350430', N'建宁县', N'153', N'3', N'0', N'0', N'Jianning Xian', N'JNF')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1560', N'350481', N'永安市', N'153', N'3', N'0', N'0', N'Yong,an Shi', N'YAF')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1561', N'350501', N'市辖区', N'154', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1562', N'350502', N'鲤城区', N'154', N'3', N'0', N'0', N'Licheng Qu', N'LCQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1563', N'350503', N'丰泽区', N'154', N'3', N'0', N'0', N'Fengze Qu', N'FZE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1564', N'350504', N'洛江区', N'154', N'3', N'0', N'0', N'Luojiang Qu', N'LJQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1565', N'350505', N'泉港区', N'154', N'3', N'0', N'0', N'Quangang Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1566', N'350521', N'惠安县', N'154', N'3', N'0', N'0', N'Hui,an Xian', N'HAF')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1567', N'350524', N'安溪县', N'154', N'3', N'0', N'0', N'Anxi Xian', N'ANX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1568', N'350525', N'永春县', N'154', N'3', N'0', N'0', N'Yongchun Xian', N'YCM')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1569', N'350526', N'德化县', N'154', N'3', N'0', N'0', N'Dehua Xian', N'DHA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1570', N'350527', N'金门县', N'154', N'3', N'0', N'0', N'Jinmen Xian', N'JME')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1571', N'350581', N'石狮市', N'154', N'3', N'0', N'0', N'Shishi Shi', N'SHH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1572', N'350582', N'晋江市', N'154', N'3', N'0', N'0', N'Jinjiang Shi', N'JJG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1573', N'350583', N'南安市', N'154', N'3', N'0', N'0', N'Nan,an Shi', N'NAS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1574', N'350601', N'市辖区', N'155', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1575', N'350602', N'芗城区', N'155', N'3', N'0', N'0', N'Xiangcheng Qu', N'XZZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1576', N'350603', N'龙文区', N'155', N'3', N'0', N'0', N'Longwen Qu', N'LWZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1577', N'350622', N'云霄县', N'155', N'3', N'0', N'0', N'Yunxiao Xian', N'YXO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1578', N'350623', N'漳浦县', N'155', N'3', N'0', N'0', N'Zhangpu Xian', N'ZPU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1579', N'350624', N'诏安县', N'155', N'3', N'0', N'0', N'Zhao,an Xian', N'ZAF')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1580', N'350625', N'长泰县', N'155', N'3', N'0', N'0', N'Changtai Xian', N'CTA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1581', N'350626', N'东山县', N'155', N'3', N'0', N'0', N'Dongshan Xian', N'DSN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1582', N'350627', N'南靖县', N'155', N'3', N'0', N'0', N'Nanjing Xian', N'NJX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1583', N'350628', N'平和县', N'155', N'3', N'0', N'0', N'Pinghe Xian', N'PHE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1584', N'350629', N'华安县', N'155', N'3', N'0', N'0', N'Hua,an Xian', N'HAN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1585', N'350681', N'龙海市', N'155', N'3', N'0', N'0', N'Longhai Shi', N'LHM')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1586', N'350701', N'市辖区', N'156', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1587', N'350702', N'延平区', N'156', N'3', N'0', N'0', N'Yanping Qu', N'YPQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1588', N'350721', N'顺昌县', N'156', N'3', N'0', N'0', N'Shunchang Xian', N'SCG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1589', N'350722', N'浦城县', N'156', N'3', N'0', N'0', N'Pucheng Xian', N'PCX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1590', N'350723', N'光泽县', N'156', N'3', N'0', N'0', N'Guangze Xian', N'GZE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1591', N'350724', N'松溪县', N'156', N'3', N'0', N'0', N'Songxi Xian', N'SOX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1592', N'350725', N'政和县', N'156', N'3', N'0', N'0', N'Zhenghe Xian', N'ZGH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1593', N'350781', N'邵武市', N'156', N'3', N'0', N'0', N'Shaowu Shi', N'SWU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1594', N'350782', N'武夷山市', N'156', N'3', N'0', N'0', N'Wuyishan Shi', N'WUS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1595', N'350783', N'建瓯市', N'156', N'3', N'0', N'0', N'Jian,ou Shi', N'JOU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1596', N'350784', N'建阳市', N'156', N'3', N'0', N'0', N'Jianyang Shi', N'JNY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1597', N'350801', N'市辖区', N'157', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1598', N'350802', N'新罗区', N'157', N'3', N'0', N'0', N'Xinluo Qu', N'XNL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1599', N'350821', N'长汀县', N'157', N'3', N'0', N'0', N'Changting Xian', N'CTG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1600', N'350822', N'永定县', N'157', N'3', N'0', N'0', N'Yongding Xian', N'YDI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1601', N'350823', N'上杭县', N'157', N'3', N'0', N'0', N'Shanghang Xian', N'SHF')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1602', N'350824', N'武平县', N'157', N'3', N'0', N'0', N'Wuping Xian', N'WPG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1603', N'350825', N'连城县', N'157', N'3', N'0', N'0', N'Liancheng Xian', N'LCF')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1604', N'350881', N'漳平市', N'157', N'3', N'0', N'0', N'Zhangping Xian', N'ZGP')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1605', N'350901', N'市辖区', N'158', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1606', N'350902', N'蕉城区', N'158', N'3', N'0', N'0', N'Jiaocheng Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1607', N'350921', N'霞浦县', N'158', N'3', N'0', N'0', N'Xiapu Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1608', N'350922', N'古田县', N'158', N'3', N'0', N'0', N'Gutian Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1609', N'350923', N'屏南县', N'158', N'3', N'0', N'0', N'Pingnan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1610', N'350924', N'寿宁县', N'158', N'3', N'0', N'0', N'Shouning Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1611', N'350925', N'周宁县', N'158', N'3', N'0', N'0', N'Zhouning Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1612', N'350926', N'柘荣县', N'158', N'3', N'0', N'0', N'Zherong Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1613', N'350981', N'福安市', N'158', N'3', N'0', N'0', N'Fu,an Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1614', N'350982', N'福鼎市', N'158', N'3', N'0', N'0', N'Fuding Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1615', N'360101', N'市辖区', N'159', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1616', N'360102', N'东湖区', N'159', N'3', N'0', N'0', N'Donghu Qu', N'DHU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1617', N'360103', N'西湖区', N'159', N'3', N'0', N'0', N'Xihu Qu', N'XHQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1618', N'360104', N'青云谱区', N'159', N'3', N'0', N'0', N'Qingyunpu Qu', N'QYP')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1619', N'360105', N'湾里区', N'159', N'3', N'0', N'0', N'Wanli Qu', N'WLI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1620', N'360111', N'青山湖区', N'159', N'3', N'0', N'0', N'Qingshanhu Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1621', N'360121', N'南昌县', N'159', N'3', N'0', N'0', N'Nanchang Xian', N'NCA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1622', N'360122', N'新建县', N'159', N'3', N'0', N'0', N'Xinjian Xian', N'XJN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1623', N'360123', N'安义县', N'159', N'3', N'0', N'0', N'Anyi Xian', N'AYI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1624', N'360124', N'进贤县', N'159', N'3', N'0', N'0', N'Jinxian Xian', N'JXX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1625', N'360201', N'市辖区', N'160', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1626', N'360202', N'昌江区', N'160', N'3', N'0', N'0', N'Changjiang Qu', N'CJG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1627', N'360203', N'珠山区', N'160', N'3', N'0', N'0', N'Zhushan Qu', N'ZSJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1628', N'360222', N'浮梁县', N'160', N'3', N'0', N'0', N'Fuliang Xian', N'FLX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1629', N'360281', N'乐平市', N'160', N'3', N'0', N'0', N'Leping Shi', N'LEP')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1630', N'360301', N'市辖区', N'161', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1631', N'360302', N'安源区', N'161', N'3', N'0', N'0', N'Anyuan Qu', N'AYQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1632', N'360313', N'湘东区', N'161', N'3', N'0', N'0', N'Xiangdong Qu', N'XDG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1633', N'360321', N'莲花县', N'161', N'3', N'0', N'0', N'Lianhua Xian', N'LHG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1634', N'360322', N'上栗县', N'161', N'3', N'0', N'0', N'Shangli Xian', N'SLI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1635', N'360323', N'芦溪县', N'161', N'3', N'0', N'0', N'Lixi Xian', N'LXP')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1636', N'360401', N'市辖区', N'162', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1637', N'360402', N'庐山区', N'162', N'3', N'0', N'0', N'Lushan Qu', N'LSV')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1638', N'360403', N'浔阳区', N'162', N'3', N'0', N'0', N'Xunyang Qu', N'XYC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1639', N'360421', N'九江县', N'162', N'3', N'0', N'0', N'Jiujiang Xian', N'JUJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1640', N'360423', N'武宁县', N'162', N'3', N'0', N'0', N'Wuning Xian', N'WUN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1641', N'360424', N'修水县', N'162', N'3', N'0', N'0', N'Xiushui Xian', N'XSG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1642', N'360425', N'永修县', N'162', N'3', N'0', N'0', N'Yongxiu Xian', N'YOX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1643', N'360426', N'德安县', N'162', N'3', N'0', N'0', N'De,an Xian', N'DEA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1644', N'360427', N'星子县', N'162', N'3', N'0', N'0', N'Xingzi Xian', N'XZI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1645', N'360428', N'都昌县', N'162', N'3', N'0', N'0', N'Duchang Xian', N'DUC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1646', N'360429', N'湖口县', N'162', N'3', N'0', N'0', N'Hukou Xian', N'HUK')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1647', N'360430', N'彭泽县', N'162', N'3', N'0', N'0', N'Pengze Xian', N'PZE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1648', N'360481', N'瑞昌市', N'162', N'3', N'0', N'0', N'Ruichang Shi', N'RCG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1649', N'360501', N'市辖区', N'163', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1650', N'360502', N'渝水区', N'163', N'3', N'0', N'0', N'Yushui Qu', N'YSR')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1651', N'360521', N'分宜县', N'163', N'3', N'0', N'0', N'Fenyi Xian', N'FYI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1652', N'360601', N'市辖区', N'164', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1653', N'360602', N'月湖区', N'164', N'3', N'0', N'0', N'Yuehu Qu', N'YHY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1654', N'360622', N'余江县', N'164', N'3', N'0', N'0', N'Yujiang Xian', N'YUJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1655', N'360681', N'贵溪市', N'164', N'3', N'0', N'0', N'Guixi Shi', N'GXS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1656', N'360701', N'市辖区', N'165', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1657', N'360702', N'章贡区', N'165', N'3', N'0', N'0', N'Zhanggong Qu', N'ZGG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1658', N'360721', N'赣县', N'165', N'3', N'0', N'0', N'Gan Xian', N'GXN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1659', N'360722', N'信丰县', N'165', N'3', N'0', N'0', N'Xinfeng Xian', N'XNF')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1660', N'360723', N'大余县', N'165', N'3', N'0', N'0', N'Dayu Xian', N'DYX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1661', N'360724', N'上犹县', N'165', N'3', N'0', N'0', N'Shangyou Xian', N'SYO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1662', N'360725', N'崇义县', N'165', N'3', N'0', N'0', N'Chongyi Xian', N'CYX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1663', N'360726', N'安远县', N'165', N'3', N'0', N'0', N'Anyuan Xian', N'AYN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1664', N'360727', N'龙南县', N'165', N'3', N'0', N'0', N'Longnan Xian', N'LNX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1665', N'360728', N'定南县', N'165', N'3', N'0', N'0', N'Dingnan Xian', N'DNN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1666', N'360729', N'全南县', N'165', N'3', N'0', N'0', N'Quannan Xian', N'QNN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1667', N'360730', N'宁都县', N'165', N'3', N'0', N'0', N'Ningdu Xian', N'NDU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1668', N'360731', N'于都县', N'165', N'3', N'0', N'0', N'Yudu Xian', N'YUD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1669', N'360732', N'兴国县', N'165', N'3', N'0', N'0', N'Xingguo Xian', N'XGG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1670', N'360733', N'会昌县', N'165', N'3', N'0', N'0', N'Huichang Xian', N'HIC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1671', N'360734', N'寻乌县', N'165', N'3', N'0', N'0', N'Xunwu Xian', N'XNW')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1672', N'360735', N'石城县', N'165', N'3', N'0', N'0', N'Shicheng Xian', N'SIC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1673', N'360781', N'瑞金市', N'165', N'3', N'0', N'0', N'Ruijin Shi', N'RJS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1674', N'360782', N'南康市', N'165', N'3', N'0', N'0', N'Nankang Shi', N'NNK')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1675', N'360801', N'市辖区', N'166', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1676', N'360802', N'吉州区', N'166', N'3', N'0', N'0', N'Jizhou Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1677', N'360803', N'青原区', N'166', N'3', N'0', N'0', N'Qingyuan Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1678', N'360821', N'吉安县', N'166', N'3', N'0', N'0', N'Ji,an Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1679', N'360822', N'吉水县', N'166', N'3', N'0', N'0', N'Jishui Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1680', N'360823', N'峡江县', N'166', N'3', N'0', N'0', N'Xiajiang Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1681', N'360824', N'新干县', N'166', N'3', N'0', N'0', N'Xingan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1682', N'360825', N'永丰县', N'166', N'3', N'0', N'0', N'Yongfeng Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1683', N'360826', N'泰和县', N'166', N'3', N'0', N'0', N'Taihe Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1684', N'360827', N'遂川县', N'166', N'3', N'0', N'0', N'Suichuan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1685', N'360828', N'万安县', N'166', N'3', N'0', N'0', N'Wan,an Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1686', N'360829', N'安福县', N'166', N'3', N'0', N'0', N'Anfu Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1687', N'360830', N'永新县', N'166', N'3', N'0', N'0', N'Yongxin Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1688', N'360881', N'井冈山市', N'166', N'3', N'0', N'0', N'Jinggangshan Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1689', N'360901', N'市辖区', N'167', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1690', N'360902', N'袁州区', N'167', N'3', N'0', N'0', N'Yuanzhou Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1691', N'360921', N'奉新县', N'167', N'3', N'0', N'0', N'Fengxin Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1692', N'360922', N'万载县', N'167', N'3', N'0', N'0', N'Wanzai Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1693', N'360923', N'上高县', N'167', N'3', N'0', N'0', N'Shanggao Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1694', N'360924', N'宜丰县', N'167', N'3', N'0', N'0', N'Yifeng Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1695', N'360925', N'靖安县', N'167', N'3', N'0', N'0', N'Jing,an Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1696', N'360926', N'铜鼓县', N'167', N'3', N'0', N'0', N'Tonggu Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1697', N'360981', N'丰城市', N'167', N'3', N'0', N'0', N'Fengcheng Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1698', N'360982', N'樟树市', N'167', N'3', N'0', N'0', N'Zhangshu Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1699', N'360983', N'高安市', N'167', N'3', N'0', N'0', N'Gao,an Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1700', N'361001', N'市辖区', N'168', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1701', N'361002', N'临川区', N'168', N'3', N'0', N'0', N'Linchuan Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1702', N'361021', N'南城县', N'168', N'3', N'0', N'0', N'Nancheng Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1703', N'361022', N'黎川县', N'168', N'3', N'0', N'0', N'Lichuan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1704', N'361023', N'南丰县', N'168', N'3', N'0', N'0', N'Nanfeng Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1705', N'361024', N'崇仁县', N'168', N'3', N'0', N'0', N'Chongren Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1706', N'361025', N'乐安县', N'168', N'3', N'0', N'0', N'Le,an Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1707', N'361026', N'宜黄县', N'168', N'3', N'0', N'0', N'Yihuang Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1708', N'361027', N'金溪县', N'168', N'3', N'0', N'0', N'Jinxi Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1709', N'361028', N'资溪县', N'168', N'3', N'0', N'0', N'Zixi Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1710', N'361029', N'东乡县', N'168', N'3', N'0', N'0', N'Dongxiang Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1711', N'361030', N'广昌县', N'168', N'3', N'0', N'0', N'Guangchang Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1712', N'361101', N'市辖区', N'169', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1713', N'361102', N'信州区', N'169', N'3', N'0', N'0', N'Xinzhou Qu', N'XZQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1714', N'361121', N'上饶县', N'169', N'3', N'0', N'0', N'Shangrao Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1715', N'361122', N'广丰县', N'169', N'3', N'0', N'0', N'Guangfeng Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1716', N'361123', N'玉山县', N'169', N'3', N'0', N'0', N'Yushan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1717', N'361124', N'铅山县', N'169', N'3', N'0', N'0', N'Qianshan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1718', N'361125', N'横峰县', N'169', N'3', N'0', N'0', N'Hengfeng Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1719', N'361126', N'弋阳县', N'169', N'3', N'0', N'0', N'Yiyang Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1720', N'361127', N'余干县', N'169', N'3', N'0', N'0', N'Yugan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1721', N'361128', N'鄱阳县', N'169', N'3', N'0', N'0', N'Poyang Xian', N'PYX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1722', N'361129', N'万年县', N'169', N'3', N'0', N'0', N'Wannian Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1723', N'361130', N'婺源县', N'169', N'3', N'0', N'0', N'Wuyuan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1724', N'361181', N'德兴市', N'169', N'3', N'0', N'0', N'Dexing Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1725', N'370101', N'市辖区', N'170', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1726', N'370102', N'历下区', N'170', N'3', N'0', N'0', N'Lixia Qu', N'LXQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1728', N'370104', N'槐荫区', N'170', N'3', N'0', N'0', N'Huaiyin Qu', N'HYF')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1729', N'370105', N'天桥区', N'170', N'3', N'0', N'0', N'Tianqiao Qu', N'TQQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1730', N'370112', N'历城区', N'170', N'3', N'0', N'0', N'Licheng Qu', N'LCZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1731', N'370113', N'长清区', N'170', N'3', N'0', N'0', N'Changqing Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1732', N'370124', N'平阴县', N'170', N'3', N'0', N'0', N'Pingyin Xian', N'PYL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1733', N'370125', N'济阳县', N'170', N'3', N'0', N'0', N'Jiyang Xian', N'JYL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1734', N'370126', N'商河县', N'170', N'3', N'0', N'0', N'Shanghe Xian', N'SGH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1735', N'370181', N'章丘市', N'170', N'3', N'0', N'0', N'Zhangqiu Shi', N'ZQS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1736', N'370201', N'市辖区', N'171', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1737', N'370202', N'市南区', N'171', N'3', N'0', N'0', N'Shinan Qu', N'SNQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1738', N'370203', N'市北区', N'171', N'3', N'0', N'0', N'Shibei Qu', N'SBQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1739', N'370205', N'四方区', N'171', N'3', N'0', N'0', N'Sifang Qu', N'SFQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1740', N'370211', N'黄岛区', N'171', N'3', N'0', N'0', N'Huangdao Qu', N'HDO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1741', N'370212', N'崂山区', N'171', N'3', N'0', N'0', N'Laoshan Qu', N'LQD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1742', N'370213', N'李沧区', N'171', N'3', N'0', N'0', N'Licang Qu', N'LCT')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1743', N'370214', N'城阳区', N'171', N'3', N'0', N'0', N'Chengyang Qu', N'CEY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1744', N'370281', N'胶州市', N'171', N'3', N'0', N'0', N'Jiaozhou Shi', N'JZS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1745', N'370282', N'即墨市', N'171', N'3', N'0', N'0', N'Jimo Shi', N'JMO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1746', N'370283', N'平度市', N'171', N'3', N'0', N'0', N'Pingdu Shi', N'PDU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1747', N'370284', N'胶南市', N'171', N'3', N'0', N'0', N'Jiaonan Shi', N'JNS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1748', N'370285', N'莱西市', N'171', N'3', N'0', N'0', N'Laixi Shi', N'LXE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1749', N'370301', N'市辖区', N'172', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1750', N'370302', N'淄川区', N'172', N'3', N'0', N'0', N'Zichuan Qu', N'ZCQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1751', N'370303', N'张店区', N'172', N'3', N'0', N'0', N'Zhangdian Qu', N'ZDQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1752', N'370304', N'博山区', N'172', N'3', N'0', N'0', N'Boshan Qu', N'BSZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1753', N'370305', N'临淄区', N'172', N'3', N'0', N'0', N'Linzi Qu', N'LZQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1754', N'370306', N'周村区', N'172', N'3', N'0', N'0', N'Zhoucun Qu', N'ZCN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1755', N'370321', N'桓台县', N'172', N'3', N'0', N'0', N'Huantai Xian', N'HTL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1756', N'370322', N'高青县', N'172', N'3', N'0', N'0', N'Gaoqing Xian', N'GQG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1757', N'370323', N'沂源县', N'172', N'3', N'0', N'0', N'Yiyuan Xian', N'YIY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1758', N'370401', N'市辖区', N'173', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1759', N'370402', N'市中区', N'173', N'3', N'0', N'0', N'Shizhong Qu', N'SZZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1760', N'370403', N'薛城区', N'173', N'3', N'0', N'0', N'Xuecheng Qu', N'XEC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1761', N'370404', N'峄城区', N'173', N'3', N'0', N'0', N'Yicheng Qu', N'YZZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1762', N'370405', N'台儿庄区', N'173', N'3', N'0', N'0', N'Tai,erzhuang Qu', N'TEZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1763', N'370406', N'山亭区', N'173', N'3', N'0', N'0', N'Shanting Qu', N'STG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1764', N'370481', N'滕州市', N'173', N'3', N'0', N'0', N'Tengzhou Shi', N'TZO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1765', N'370501', N'市辖区', N'174', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1766', N'370502', N'东营区', N'174', N'3', N'0', N'0', N'Dongying Qu', N'DYQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1767', N'370503', N'河口区', N'174', N'3', N'0', N'0', N'Hekou Qu', N'HKO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1768', N'370521', N'垦利县', N'174', N'3', N'0', N'0', N'Kenli Xian', N'KLI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1769', N'370522', N'利津县', N'174', N'3', N'0', N'0', N'Lijin Xian', N'LJN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1770', N'370523', N'广饶县', N'174', N'3', N'0', N'0', N'Guangrao Xian', N'GRO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1771', N'370601', N'市辖区', N'175', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1772', N'370602', N'芝罘区', N'175', N'3', N'0', N'0', N'Zhifu Qu', N'ZFQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1773', N'370611', N'福山区', N'175', N'3', N'0', N'0', N'Fushan Qu', N'FUS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1774', N'370612', N'牟平区', N'175', N'3', N'0', N'0', N'Muping Qu', N'MPQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1775', N'370613', N'莱山区', N'175', N'3', N'0', N'0', N'Laishan Qu', N'LYT')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1776', N'370634', N'长岛县', N'175', N'3', N'0', N'0', N'Changdao Xian', N'CDO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1777', N'370681', N'龙口市', N'175', N'3', N'0', N'0', N'Longkou Shi', N'LKU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1778', N'370682', N'莱阳市', N'175', N'3', N'0', N'0', N'Laiyang Shi', N'LYD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1779', N'370683', N'莱州市', N'175', N'3', N'0', N'0', N'Laizhou Shi', N'LZG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1780', N'370684', N'蓬莱市', N'175', N'3', N'0', N'0', N'Penglai Shi', N'PLI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1781', N'370685', N'招远市', N'175', N'3', N'0', N'0', N'Zhaoyuan Shi', N'ZYL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1782', N'370686', N'栖霞市', N'175', N'3', N'0', N'0', N'Qixia Shi', N'QXS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1783', N'370687', N'海阳市', N'175', N'3', N'0', N'0', N'Haiyang Shi', N'HYL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1784', N'370701', N'市辖区', N'176', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1785', N'370702', N'潍城区', N'176', N'3', N'0', N'0', N'Weicheng Qu', N'WCG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1786', N'370703', N'寒亭区', N'176', N'3', N'0', N'0', N'Hanting Qu', N'HNT')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1787', N'370704', N'坊子区', N'176', N'3', N'0', N'0', N'Fangzi Qu', N'FZQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1788', N'370705', N'奎文区', N'176', N'3', N'0', N'0', N'Kuiwen Qu', N'KWN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1789', N'370724', N'临朐县', N'176', N'3', N'0', N'0', N'Linqu Xian', N'LNQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1790', N'370725', N'昌乐县', N'176', N'3', N'0', N'0', N'Changle Xian', N'CLX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1791', N'370781', N'青州市', N'176', N'3', N'0', N'0', N'Qingzhou Shi', N'QGZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1792', N'370782', N'诸城市', N'176', N'3', N'0', N'0', N'Zhucheng Shi', N'ZCL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1793', N'370783', N'寿光市', N'176', N'3', N'0', N'0', N'Shouguang Shi', N'SGG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1794', N'370784', N'安丘市', N'176', N'3', N'0', N'0', N'Anqiu Shi', N'AQU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1795', N'370785', N'高密市', N'176', N'3', N'0', N'0', N'Gaomi Shi', N'GMI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1796', N'370786', N'昌邑市', N'176', N'3', N'0', N'0', N'Changyi Shi', N'CYL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1797', N'370801', N'市辖区', N'177', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1798', N'370802', N'市中区', N'177', N'3', N'0', N'0', N'Shizhong Qu', N'SZU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1799', N'370811', N'任城区', N'177', N'3', N'0', N'0', N'Rencheng Qu', N'RCQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1800', N'370826', N'微山县', N'177', N'3', N'0', N'0', N'Weishan Xian', N'WSA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1801', N'370827', N'鱼台县', N'177', N'3', N'0', N'0', N'Yutai Xian', N'YTL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1802', N'370828', N'金乡县', N'177', N'3', N'0', N'0', N'Jinxiang Xian', N'JXG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1803', N'370829', N'嘉祥县', N'177', N'3', N'0', N'0', N'Jiaxiang Xian', N'JXP')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1804', N'370830', N'汶上县', N'177', N'3', N'0', N'0', N'Wenshang Xian', N'WNS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1805', N'370831', N'泗水县', N'177', N'3', N'0', N'0', N'Sishui Xian', N'SSH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1806', N'370832', N'梁山县', N'177', N'3', N'0', N'0', N'Liangshan Xian', N'LSN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1807', N'370881', N'曲阜市', N'177', N'3', N'0', N'0', N'Qufu Shi', N'QFU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1808', N'370882', N'兖州市', N'177', N'3', N'0', N'0', N'Yanzhou Shi', N'YZL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1809', N'370883', N'邹城市', N'177', N'3', N'0', N'0', N'Zoucheng Shi', N'ZCG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1810', N'370901', N'市辖区', N'178', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1811', N'370902', N'泰山区', N'178', N'3', N'0', N'0', N'Taishan Qu', N'TSQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1812', N'370911', N'岱岳区', N'178', N'3', N'0', N'0', N'Daiyue Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1813', N'370921', N'宁阳县', N'178', N'3', N'0', N'0', N'Ningyang Xian', N'NGY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1814', N'370923', N'东平县', N'178', N'3', N'0', N'0', N'Dongping Xian', N'DPG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1815', N'370982', N'新泰市', N'178', N'3', N'0', N'0', N'Xintai Shi', N'XTA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1816', N'370983', N'肥城市', N'178', N'3', N'0', N'0', N'Feicheng Shi', N'FEC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1817', N'371001', N'市辖区', N'179', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1818', N'371002', N'环翠区', N'179', N'3', N'0', N'0', N'Huancui Qu', N'HNC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1819', N'371081', N'文登市', N'179', N'3', N'0', N'0', N'Wendeng Shi', N'WDS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1820', N'371082', N'荣成市', N'179', N'3', N'0', N'0', N'Rongcheng Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1821', N'371083', N'乳山市', N'179', N'3', N'0', N'0', N'Rushan Shi', N'RSN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1822', N'371101', N'市辖区', N'180', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1823', N'371102', N'东港区', N'180', N'3', N'0', N'0', N'Donggang Qu', N'DGR')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1824', N'371103', N'岚山区', N'180', N'3', N'0', N'0', N'Lanshan Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1825', N'371121', N'五莲县', N'180', N'3', N'0', N'0', N'Wulian Xian', N'WLN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1826', N'371122', N'莒县', N'180', N'3', N'0', N'0', N'Ju Xian', N'JUX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1827', N'371201', N'市辖区', N'181', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1828', N'371202', N'莱城区', N'181', N'3', N'0', N'0', N'Laicheng Qu', N'LAC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1829', N'371203', N'钢城区', N'181', N'3', N'0', N'0', N'Gangcheng Qu', N'GCQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1830', N'371301', N'市辖区', N'182', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1831', N'371302', N'兰山区', N'182', N'3', N'0', N'0', N'Lanshan Qu', N'LLS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1832', N'371311', N'罗庄区', N'182', N'3', N'0', N'0', N'Luozhuang Qu', N'LZU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1834', N'371321', N'沂南县', N'182', N'3', N'0', N'0', N'Yinan Xian', N'YNN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1835', N'371322', N'郯城县', N'182', N'3', N'0', N'0', N'Tancheng Xian', N'TCE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1836', N'371323', N'沂水县', N'182', N'3', N'0', N'0', N'Yishui Xian', N'YIS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1837', N'371324', N'苍山县', N'182', N'3', N'0', N'0', N'Cangshan Xian', N'CSH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1838', N'371325', N'费县', N'182', N'3', N'0', N'0', N'Fei Xian', N'FEI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1839', N'371326', N'平邑县', N'182', N'3', N'0', N'0', N'Pingyi Xian', N'PYI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1840', N'371327', N'莒南县', N'182', N'3', N'0', N'0', N'Junan Xian', N'JNB')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1841', N'371328', N'蒙阴县', N'182', N'3', N'0', N'0', N'Mengyin Xian', N'MYL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1842', N'371329', N'临沭县', N'182', N'3', N'0', N'0', N'Linshu Xian', N'LSP')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1843', N'371401', N'市辖区', N'183', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1844', N'371402', N'德城区', N'183', N'3', N'0', N'0', N'Decheng Qu', N'DCD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1845', N'371421', N'陵县', N'183', N'3', N'0', N'0', N'Ling Xian', N'LXL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1846', N'371422', N'宁津县', N'183', N'3', N'0', N'0', N'Ningjin Xian', N'NGJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1847', N'371423', N'庆云县', N'183', N'3', N'0', N'0', N'Qingyun Xian', N'QYL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1848', N'371424', N'临邑县', N'183', N'3', N'0', N'0', N'Linyi xian', N'LYM')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1849', N'371425', N'齐河县', N'183', N'3', N'0', N'0', N'Qihe Xian', N'QIH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1850', N'371426', N'平原县', N'183', N'3', N'0', N'0', N'Pingyuan Xian', N'PYN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1851', N'371427', N'夏津县', N'183', N'3', N'0', N'0', N'Xiajin Xian', N'XAJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1852', N'371428', N'武城县', N'183', N'3', N'0', N'0', N'Wucheng Xian', N'WUC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1853', N'371481', N'乐陵市', N'183', N'3', N'0', N'0', N'Leling Shi', N'LEL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1854', N'371482', N'禹城市', N'183', N'3', N'0', N'0', N'Yucheng Shi', N'YCL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1855', N'371501', N'市辖区', N'184', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1856', N'371502', N'东昌府区', N'184', N'3', N'0', N'0', N'Dongchangfu Qu', N'DCF')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1857', N'371521', N'阳谷县', N'184', N'3', N'0', N'0', N'Yanggu Xian', N'YGU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1858', N'371522', N'莘县', N'184', N'3', N'0', N'0', N'Shen Xian', N'SHN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1859', N'371523', N'茌平县', N'184', N'3', N'0', N'0', N'Chiping Xian', N'CPG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1860', N'371524', N'东阿县', N'184', N'3', N'0', N'0', N'Dong,e Xian', N'DGE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1861', N'371525', N'冠县', N'184', N'3', N'0', N'0', N'Guan Xian', N'GXL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1862', N'371526', N'高唐县', N'184', N'3', N'0', N'0', N'Gaotang Xian', N'GTG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1863', N'371581', N'临清市', N'184', N'3', N'0', N'0', N'Linqing Xian', N'LQS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1864', N'371601', N'市辖区', N'185', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1865', N'371602', N'滨城区', N'185', N'3', N'0', N'0', N'Bincheng Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1866', N'371621', N'惠民县', N'185', N'3', N'0', N'0', N'Huimin Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1867', N'371622', N'阳信县', N'185', N'3', N'0', N'0', N'Yangxin Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1868', N'371623', N'无棣县', N'185', N'3', N'0', N'0', N'Wudi Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1869', N'371624', N'沾化县', N'185', N'3', N'0', N'0', N'Zhanhua Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1870', N'371625', N'博兴县', N'185', N'3', N'0', N'0', N'Boxing Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1871', N'371626', N'邹平县', N'185', N'3', N'0', N'0', N'Zouping Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1873', N'371702', N'牡丹区', N'186', N'3', N'0', N'0', N'Mudan Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1874', N'371721', N'曹县', N'186', N'3', N'0', N'0', N'Cao Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1875', N'371722', N'单县', N'186', N'3', N'0', N'0', N'Shan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1876', N'371723', N'成武县', N'186', N'3', N'0', N'0', N'Chengwu Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1877', N'371724', N'巨野县', N'186', N'3', N'0', N'0', N'Juye Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1878', N'371725', N'郓城县', N'186', N'3', N'0', N'0', N'Yuncheng Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1879', N'371726', N'鄄城县', N'186', N'3', N'0', N'0', N'Juancheng Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1880', N'371727', N'定陶县', N'186', N'3', N'0', N'0', N'Dingtao Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1881', N'371728', N'东明县', N'186', N'3', N'0', N'0', N'Dongming Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1882', N'410101', N'市辖区', N'187', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1883', N'410102', N'中原区', N'187', N'3', N'0', N'0', N'Zhongyuan Qu', N'ZYQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1884', N'410103', N'二七区', N'187', N'3', N'0', N'0', N'Erqi Qu', N'EQQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1885', N'410104', N'管城回族区', N'187', N'3', N'0', N'0', N'Guancheng Huizu Qu', N'GCH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1886', N'410105', N'金水区', N'187', N'3', N'0', N'0', N'Jinshui Qu', N'JSU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1887', N'410106', N'上街区', N'187', N'3', N'0', N'0', N'Shangjie Qu', N'SJE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1888', N'410108', N'惠济区', N'187', N'3', N'0', N'0', N'Mangshan Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1889', N'410122', N'中牟县', N'187', N'3', N'0', N'0', N'Zhongmou Xian', N'ZMO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1890', N'410181', N'巩义市', N'187', N'3', N'0', N'0', N'Gongyi Shi', N'GYI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1891', N'410182', N'荥阳市', N'187', N'3', N'0', N'0', N'Xingyang Shi', N'XYK')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1892', N'410183', N'新密市', N'187', N'3', N'0', N'0', N'Xinmi Shi', N'XMI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1893', N'410184', N'新郑市', N'187', N'3', N'0', N'0', N'Xinzheng Shi', N'XZG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1894', N'410185', N'登封市', N'187', N'3', N'0', N'0', N'Dengfeng Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1895', N'410201', N'市辖区', N'188', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1896', N'410202', N'龙亭区', N'188', N'3', N'0', N'0', N'Longting Qu', N'LTK')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1897', N'410203', N'顺河回族区', N'188', N'3', N'0', N'0', N'Shunhe Huizu Qu', N'SHR')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1898', N'410204', N'鼓楼区', N'188', N'3', N'0', N'0', N'Gulou Qu', N'GLK')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1899', N'410205', N'禹王台区', N'188', N'3', N'0', N'0', N'Yuwangtai Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1900', N'410211', N'金明区', N'188', N'3', N'0', N'0', N'Jinming Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1901', N'410221', N'杞县', N'188', N'3', N'0', N'0', N'Qi Xian', N'QIX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1902', N'410222', N'通许县', N'188', N'3', N'0', N'0', N'Tongxu Xian', N'TXY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1903', N'410223', N'尉氏县', N'188', N'3', N'0', N'0', N'Weishi Xian', N'WSI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1904', N'410224', N'开封县', N'188', N'3', N'0', N'0', N'Kaifeng Xian', N'KFX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1905', N'410225', N'兰考县', N'188', N'3', N'0', N'0', N'Lankao Xian', N'LKA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1906', N'410301', N'市辖区', N'189', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1907', N'410302', N'老城区', N'189', N'3', N'0', N'0', N'Laocheng Qu', N'LLY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1908', N'410303', N'西工区', N'189', N'3', N'0', N'0', N'Xigong Qu', N'XGL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1909', N'410304', N'瀍河回族区', N'189', N'3', N'0', N'0', N'Chanhehuizu Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1910', N'410305', N'涧西区', N'189', N'3', N'0', N'0', N'Jianxi Qu', N'JXL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1911', N'410306', N'吉利区', N'189', N'3', N'0', N'0', N'Jili Qu', N'JLL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1912', N'410311', N'洛龙区', N'189', N'3', N'0', N'0', N'Luolong Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1913', N'410322', N'孟津县', N'189', N'3', N'0', N'0', N'Mengjin Xian', N'MGJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1914', N'410323', N'新安县', N'189', N'3', N'0', N'0', N'Xin,an Xian', N'XAX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1915', N'410324', N'栾川县', N'189', N'3', N'0', N'0', N'Luanchuan Xian', N'LCK')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1916', N'410325', N'嵩县', N'189', N'3', N'0', N'0', N'Song Xian', N'SON')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1917', N'410326', N'汝阳县', N'189', N'3', N'0', N'0', N'Ruyang Xian', N'RUY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1918', N'410327', N'宜阳县', N'189', N'3', N'0', N'0', N'Yiyang Xian', N'YYY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1919', N'410328', N'洛宁县', N'189', N'3', N'0', N'0', N'Luoning Xian', N'LNI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1920', N'410329', N'伊川县', N'189', N'3', N'0', N'0', N'Yichuan Xian', N'YCZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1921', N'410381', N'偃师市', N'189', N'3', N'0', N'0', N'Yanshi Shi', N'YST')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1922', N'410401', N'市辖区', N'190', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1923', N'410402', N'新华区', N'190', N'3', N'0', N'0', N'Xinhua Qu', N'XHP')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1924', N'410403', N'卫东区', N'190', N'3', N'0', N'0', N'Weidong Qu', N'WDG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1925', N'410404', N'石龙区', N'190', N'3', N'0', N'0', N'Shilong Qu', N'SIL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1926', N'410411', N'湛河区', N'190', N'3', N'0', N'0', N'Zhanhe Qu', N'ZHQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1927', N'410421', N'宝丰县', N'190', N'3', N'0', N'0', N'Baofeng Xian', N'BFG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1928', N'410422', N'叶县', N'190', N'3', N'0', N'0', N'Ye Xian', N'YEX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1929', N'410423', N'鲁山县', N'190', N'3', N'0', N'0', N'Lushan Xian', N'LUS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1930', N'410425', N'郏县', N'190', N'3', N'0', N'0', N'Jia Xian', N'JXY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1931', N'410481', N'舞钢市', N'190', N'3', N'0', N'0', N'Wugang Shi', N'WGY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1932', N'410482', N'汝州市', N'190', N'3', N'0', N'0', N'Ruzhou Shi', N'RZO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1933', N'410501', N'市辖区', N'191', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1934', N'410502', N'文峰区', N'191', N'3', N'0', N'0', N'Wenfeng Qu', N'WFQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1935', N'410503', N'北关区', N'191', N'3', N'0', N'0', N'Beiguan Qu', N'BGQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1936', N'410505', N'殷都区', N'191', N'3', N'0', N'0', N'Yindu Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1937', N'410506', N'龙安区', N'191', N'3', N'0', N'0', N'Longan Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1938', N'410522', N'安阳县', N'191', N'3', N'0', N'0', N'Anyang Xian', N'AYX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1939', N'410523', N'汤阴县', N'191', N'3', N'0', N'0', N'Tangyin Xian', N'TYI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1940', N'410526', N'滑县', N'191', N'3', N'0', N'0', N'Hua Xian', N'HUA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1941', N'410527', N'内黄县', N'191', N'3', N'0', N'0', N'Neihuang Xian', N'NHG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1942', N'410581', N'林州市', N'191', N'3', N'0', N'0', N'Linzhou Shi', N'LZY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1943', N'410601', N'市辖区', N'192', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1944', N'410602', N'鹤山区', N'192', N'3', N'0', N'0', N'Heshan Qu', N'HSF')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1945', N'410603', N'山城区', N'192', N'3', N'0', N'0', N'Shancheng Qu', N'SCB')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1946', N'410611', N'淇滨区', N'192', N'3', N'0', N'0', N'Qibin Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1947', N'410621', N'浚县', N'192', N'3', N'0', N'0', N'Xun Xian', N'XUX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1948', N'410622', N'淇县', N'192', N'3', N'0', N'0', N'Qi Xian', N'QXY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1949', N'410701', N'市辖区', N'193', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1950', N'410702', N'红旗区', N'193', N'3', N'0', N'0', N'Hongqi Qu', N'HQQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1951', N'410703', N'卫滨区', N'193', N'3', N'0', N'0', N'Weibin Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1952', N'410704', N'凤泉区', N'193', N'3', N'0', N'0', N'Fengquan Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1953', N'410711', N'牧野区', N'193', N'3', N'0', N'0', N'Muye Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1954', N'410721', N'新乡县', N'193', N'3', N'0', N'0', N'Xinxiang Xian', N'XXX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1955', N'410724', N'获嘉县', N'193', N'3', N'0', N'0', N'Huojia Xian', N'HOJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1956', N'410725', N'原阳县', N'193', N'3', N'0', N'0', N'Yuanyang Xian', N'YYA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1957', N'410726', N'延津县', N'193', N'3', N'0', N'0', N'Yanjin Xian', N'YJN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1958', N'410727', N'封丘县', N'193', N'3', N'0', N'0', N'Fengqiu Xian', N'FQU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1959', N'410728', N'长垣县', N'193', N'3', N'0', N'0', N'Changyuan Xian', N'CYU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1960', N'410781', N'卫辉市', N'193', N'3', N'0', N'0', N'Weihui Shi', N'WHS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1961', N'410782', N'辉县市', N'193', N'3', N'0', N'0', N'Huixian Shi', N'HXS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1962', N'410801', N'市辖区', N'194', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1963', N'410802', N'解放区', N'194', N'3', N'0', N'0', N'Jiefang Qu', N'JFQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1964', N'410803', N'中站区', N'194', N'3', N'0', N'0', N'Zhongzhan Qu', N'ZZQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1965', N'410804', N'马村区', N'194', N'3', N'0', N'0', N'Macun Qu', N'MCQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1966', N'410811', N'山阳区', N'194', N'3', N'0', N'0', N'Shanyang Qu', N'SYC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1967', N'410821', N'修武县', N'194', N'3', N'0', N'0', N'Xiuwu Xian', N'XUW')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1968', N'410822', N'博爱县', N'194', N'3', N'0', N'0', N'Bo,ai Xian', N'BOA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1969', N'410823', N'武陟县', N'194', N'3', N'0', N'0', N'Wuzhi Xian', N'WZI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1970', N'410825', N'温县', N'194', N'3', N'0', N'0', N'Wen Xian', N'WEN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1971', N'419001', N'济源市', N'194', N'3', N'0', N'0', N'Jiyuan Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1972', N'410882', N'沁阳市', N'194', N'3', N'0', N'0', N'Qinyang Shi', N'QYS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1973', N'410883', N'孟州市', N'194', N'3', N'0', N'0', N'Mengzhou Shi', N'MZO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1974', N'410901', N'市辖区', N'195', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1975', N'410902', N'华龙区', N'195', N'3', N'0', N'0', N'Hualong Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1976', N'410922', N'清丰县', N'195', N'3', N'0', N'0', N'Qingfeng Xian', N'QFG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1977', N'410923', N'南乐县', N'195', N'3', N'0', N'0', N'Nanle Xian', N'NLE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1978', N'410926', N'范县', N'195', N'3', N'0', N'0', N'Fan Xian', N'FAX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1979', N'410927', N'台前县', N'195', N'3', N'0', N'0', N'Taiqian Xian', N'TQN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1980', N'410928', N'濮阳县', N'195', N'3', N'0', N'0', N'Puyang Xian', N'PUY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1981', N'411001', N'市辖区', N'196', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1982', N'411002', N'魏都区', N'196', N'3', N'0', N'0', N'Weidu Qu', N'WED')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1983', N'411023', N'许昌县', N'196', N'3', N'0', N'0', N'Xuchang Xian', N'XUC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1984', N'411024', N'鄢陵县', N'196', N'3', N'0', N'0', N'Yanling Xian', N'YLY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1985', N'411025', N'襄城县', N'196', N'3', N'0', N'0', N'Xiangcheng Xian', N'XAC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1986', N'411081', N'禹州市', N'196', N'3', N'0', N'0', N'Yuzhou Shi', N'YUZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1987', N'411082', N'长葛市', N'196', N'3', N'0', N'0', N'Changge Shi', N'CGE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1988', N'411101', N'市辖区', N'197', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1989', N'411102', N'源汇区', N'197', N'3', N'0', N'0', N'Yuanhui Qu', N'YHI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1990', N'411103', N'郾城区', N'197', N'3', N'0', N'0', N'Yancheng Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1991', N'411104', N'召陵区', N'197', N'3', N'0', N'0', N'Zhaoling Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1992', N'411121', N'舞阳县', N'197', N'3', N'0', N'0', N'Wuyang Xian', N'WYG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1993', N'411122', N'临颍县', N'197', N'3', N'0', N'0', N'Linying Xian', N'LNY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1994', N'411201', N'市辖区', N'198', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1995', N'411202', N'湖滨区', N'198', N'3', N'0', N'0', N'Hubin Qu', N'HBI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1996', N'411221', N'渑池县', N'198', N'3', N'0', N'0', N'Mianchi Xian', N'MCI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1997', N'411222', N'陕县', N'198', N'3', N'0', N'0', N'Shan Xian', N'SHX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1998', N'411224', N'卢氏县', N'198', N'3', N'0', N'0', N'Lushi Xian', N'LUU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'1999', N'411281', N'义马市', N'198', N'3', N'0', N'0', N'Yima Shi', N'YMA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2000', N'411282', N'灵宝市', N'198', N'3', N'0', N'0', N'Lingbao Shi', N'LBS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2001', N'411301', N'市辖区', N'199', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2002', N'411302', N'宛城区', N'199', N'3', N'0', N'0', N'Wancheng Qu', N'WCN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2003', N'411303', N'卧龙区', N'199', N'3', N'0', N'0', N'Wolong Qu', N'WOL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2004', N'411321', N'南召县', N'199', N'3', N'0', N'0', N'Nanzhao Xian', N'NZO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2005', N'411322', N'方城县', N'199', N'3', N'0', N'0', N'Fangcheng Xian', N'FCX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2006', N'411323', N'西峡县', N'199', N'3', N'0', N'0', N'Xixia Xian', N'XXY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2007', N'411324', N'镇平县', N'199', N'3', N'0', N'0', N'Zhenping Xian', N'ZPX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2008', N'411325', N'内乡县', N'199', N'3', N'0', N'0', N'Neixiang Xian', N'NXG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2009', N'411326', N'淅川县', N'199', N'3', N'0', N'0', N'Xichuan Xian', N'XCY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2010', N'411327', N'社旗县', N'199', N'3', N'0', N'0', N'Sheqi Xian', N'SEQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2011', N'411328', N'唐河县', N'199', N'3', N'0', N'0', N'Tanghe Xian', N'TGH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2012', N'411329', N'新野县', N'199', N'3', N'0', N'0', N'Xinye Xian', N'XYE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2013', N'411330', N'桐柏县', N'199', N'3', N'0', N'0', N'Tongbai Xian', N'TBX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2014', N'411381', N'邓州市', N'199', N'3', N'0', N'0', N'Dengzhou Shi', N'DGZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2015', N'411401', N'市辖区', N'200', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2016', N'411402', N'梁园区', N'200', N'3', N'0', N'0', N'Liangyuan Qu', N'LYY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2017', N'411403', N'睢阳区', N'200', N'3', N'0', N'0', N'Suiyang Qu', N'SYA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2018', N'411421', N'民权县', N'200', N'3', N'0', N'0', N'Minquan Xian', N'MQY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2019', N'411422', N'睢县', N'200', N'3', N'0', N'0', N'Sui Xian', N'SUI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2020', N'411423', N'宁陵县', N'200', N'3', N'0', N'0', N'Ningling Xian', N'NGL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2021', N'411424', N'柘城县', N'200', N'3', N'0', N'0', N'Zhecheng Xian', N'ZHC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2022', N'411425', N'虞城县', N'200', N'3', N'0', N'0', N'Yucheng Xian', N'YUC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2023', N'411426', N'夏邑县', N'200', N'3', N'0', N'0', N'Xiayi Xian', N'XAY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2024', N'411481', N'永城市', N'200', N'3', N'0', N'0', N'Yongcheng Shi', N'YOC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2025', N'411501', N'市辖区', N'201', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2026', N'411502', N'浉河区', N'201', N'3', N'0', N'0', N'Shihe Qu', N'SHU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2027', N'411503', N'平桥区', N'201', N'3', N'0', N'0', N'Pingqiao Qu', N'PQQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2028', N'411521', N'罗山县', N'201', N'3', N'0', N'0', N'Luoshan Xian', N'LSE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2029', N'411522', N'光山县', N'201', N'3', N'0', N'0', N'Guangshan Xian', N'GSX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2030', N'411523', N'新县', N'201', N'3', N'0', N'0', N'Xin Xian', N'XXI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2031', N'411524', N'商城县', N'201', N'3', N'0', N'0', N'Shangcheng Xian', N'SCX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2032', N'411525', N'固始县', N'201', N'3', N'0', N'0', N'Gushi Xian', N'GSI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2033', N'411526', N'潢川县', N'201', N'3', N'0', N'0', N'Huangchuan Xian', N'HCU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2034', N'411527', N'淮滨县', N'201', N'3', N'0', N'0', N'Huaibin Xian', N'HBN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2035', N'411528', N'息县', N'201', N'3', N'0', N'0', N'Xi Xian', N'XIX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2036', N'411601', N'市辖区', N'202', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2037', N'411602', N'川汇区', N'202', N'3', N'0', N'0', N'Chuanhui Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2038', N'411621', N'扶沟县', N'202', N'3', N'0', N'0', N'Fugou Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2039', N'411622', N'西华县', N'202', N'3', N'0', N'0', N'Xihua Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2040', N'411623', N'商水县', N'202', N'3', N'0', N'0', N'Shangshui Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2041', N'411624', N'沈丘县', N'202', N'3', N'0', N'0', N'Shenqiu Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2042', N'411625', N'郸城县', N'202', N'3', N'0', N'0', N'Dancheng Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2043', N'411626', N'淮阳县', N'202', N'3', N'0', N'0', N'Huaiyang Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2044', N'411627', N'太康县', N'202', N'3', N'0', N'0', N'Taikang Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2045', N'411628', N'鹿邑县', N'202', N'3', N'0', N'0', N'Luyi Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2046', N'411681', N'项城市', N'202', N'3', N'0', N'0', N'Xiangcheng Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2047', N'411701', N'市辖区', N'203', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2048', N'411702', N'驿城区', N'203', N'3', N'0', N'0', N'Yicheng Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2049', N'411721', N'西平县', N'203', N'3', N'0', N'0', N'Xiping Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2050', N'411722', N'上蔡县', N'203', N'3', N'0', N'0', N'Shangcai Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2051', N'411723', N'平舆县', N'203', N'3', N'0', N'0', N'Pingyu Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2052', N'411724', N'正阳县', N'203', N'3', N'0', N'0', N'Zhengyang Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2053', N'411725', N'确山县', N'203', N'3', N'0', N'0', N'Queshan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2054', N'411726', N'泌阳县', N'203', N'3', N'0', N'0', N'Biyang Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2055', N'411727', N'汝南县', N'203', N'3', N'0', N'0', N'Runan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2056', N'411728', N'遂平县', N'203', N'3', N'0', N'0', N'Suiping Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2057', N'411729', N'新蔡县', N'203', N'3', N'0', N'0', N'Xincai Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2058', N'420101', N'市辖区', N'204', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2059', N'420102', N'江岸区', N'204', N'3', N'0', N'0', N'Jiang,an Qu', N'JAA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2060', N'420103', N'江汉区', N'204', N'3', N'0', N'0', N'Jianghan Qu', N'JHN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2061', N'420104', N'硚口区', N'204', N'3', N'0', N'0', N'Qiaokou Qu', N'QKQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2062', N'420105', N'汉阳区', N'204', N'3', N'0', N'0', N'Hanyang Qu', N'HYA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2063', N'420106', N'武昌区', N'204', N'3', N'0', N'0', N'Wuchang Qu', N'WCQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2064', N'420107', N'青山区', N'204', N'3', N'0', N'0', N'Qingshan Qu', N'QSN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2065', N'420111', N'洪山区', N'204', N'3', N'0', N'0', N'Hongshan Qu', N'HSQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2066', N'420112', N'东西湖区', N'204', N'3', N'0', N'0', N'Dongxihu Qu', N'DXH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2067', N'420113', N'汉南区', N'204', N'3', N'0', N'0', N'Hannan Qu', N'HNQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2068', N'420114', N'蔡甸区', N'204', N'3', N'0', N'0', N'Caidian Qu', N'CDN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2069', N'420115', N'江夏区', N'204', N'3', N'0', N'0', N'Jiangxia Qu', N'JXQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2070', N'420116', N'黄陂区', N'204', N'3', N'0', N'0', N'Huangpi Qu', N'HPI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2071', N'420117', N'新洲区', N'204', N'3', N'0', N'0', N'Xinzhou Qu', N'XNZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2072', N'420201', N'市辖区', N'205', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2073', N'420202', N'黄石港区', N'205', N'3', N'0', N'0', N'Huangshigang Qu', N'HSG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2074', N'420203', N'西塞山区', N'205', N'3', N'0', N'0', N'Xisaishan Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2075', N'420204', N'下陆区', N'205', N'3', N'0', N'0', N'Xialu Qu', N'XAL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2076', N'420205', N'铁山区', N'205', N'3', N'0', N'0', N'Tieshan Qu', N'TSH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2077', N'420222', N'阳新县', N'205', N'3', N'0', N'0', N'Yangxin Xian', N'YXE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2078', N'420281', N'大冶市', N'205', N'3', N'0', N'0', N'Daye Shi', N'DYE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2079', N'420301', N'市辖区', N'206', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2080', N'420302', N'茅箭区', N'206', N'3', N'0', N'0', N'Maojian Qu', N'MJN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2081', N'420303', N'张湾区', N'206', N'3', N'0', N'0', N'Zhangwan Qu', N'ZWQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2082', N'420321', N'郧县', N'206', N'3', N'0', N'0', N'Yun Xian', N'YUN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2083', N'420322', N'郧西县', N'206', N'3', N'0', N'0', N'Yunxi Xian', N'YNX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2084', N'420323', N'竹山县', N'206', N'3', N'0', N'0', N'Zhushan Xian', N'ZHS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2085', N'420324', N'竹溪县', N'206', N'3', N'0', N'0', N'Zhuxi Xian', N'ZXX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2086', N'420325', N'房县', N'206', N'3', N'0', N'0', N'Fang Xian', N'FAG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2087', N'420381', N'丹江口市', N'206', N'3', N'0', N'0', N'Danjiangkou Shi', N'DJK')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2088', N'420501', N'市辖区', N'207', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2089', N'420502', N'西陵区', N'207', N'3', N'0', N'0', N'Xiling Qu', N'XLQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2090', N'420503', N'伍家岗区', N'207', N'3', N'0', N'0', N'Wujiagang Qu', N'WJG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2091', N'420504', N'点军区', N'207', N'3', N'0', N'0', N'Dianjun Qu', N'DJN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2092', N'420505', N'猇亭区', N'207', N'3', N'0', N'0', N'Xiaoting Qu', N'XTQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2093', N'420506', N'夷陵区', N'207', N'3', N'0', N'0', N'Yiling Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2094', N'420525', N'远安县', N'207', N'3', N'0', N'0', N'Yuan,an Xian', N'YAX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2095', N'420526', N'兴山县', N'207', N'3', N'0', N'0', N'Xingshan Xian', N'XSX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2096', N'420527', N'秭归县', N'207', N'3', N'0', N'0', N'Zigui Xian', N'ZGI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2097', N'420528', N'长阳土家族自治县', N'207', N'3', N'0', N'0', N'Changyang Tujiazu Zizhixian', N'CYA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2098', N'420529', N'五峰土家族自治县', N'207', N'3', N'0', N'0', N'Wufeng Tujiazu Zizhixian', N'WFG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2099', N'420581', N'宜都市', N'207', N'3', N'0', N'0', N'Yidu Shi', N'YID')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2100', N'420582', N'当阳市', N'207', N'3', N'0', N'0', N'Dangyang Shi', N'DYS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2101', N'420583', N'枝江市', N'207', N'3', N'0', N'0', N'Zhijiang Shi', N'ZIJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2102', N'420601', N'市辖区', N'208', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2103', N'420602', N'襄城区', N'208', N'3', N'0', N'0', N'Xiangcheng Qu', N'XXF')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2104', N'420606', N'樊城区', N'208', N'3', N'0', N'0', N'Fancheng Qu', N'FNC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2105', N'420607', N'襄阳区', N'208', N'3', N'0', N'0', N'Xiangyang Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2106', N'420624', N'南漳县', N'208', N'3', N'0', N'0', N'Nanzhang Xian', N'NZH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2107', N'420625', N'谷城县', N'208', N'3', N'0', N'0', N'Gucheng Xian', N'GUC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2108', N'420626', N'保康县', N'208', N'3', N'0', N'0', N'Baokang Xian', N'BKG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2109', N'420682', N'老河口市', N'208', N'3', N'0', N'0', N'Laohekou Shi', N'LHK')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2110', N'420683', N'枣阳市', N'208', N'3', N'0', N'0', N'Zaoyang Shi', N'ZOY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2111', N'420684', N'宜城市', N'208', N'3', N'0', N'0', N'Yicheng Shi', N'YCW')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2112', N'420701', N'市辖区', N'209', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2113', N'420702', N'梁子湖区', N'209', N'3', N'0', N'0', N'Liangzihu Qu', N'LZI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2114', N'420703', N'华容区', N'209', N'3', N'0', N'0', N'Huarong Qu', N'HRQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2115', N'420704', N'鄂城区', N'209', N'3', N'0', N'0', N'Echeng Qu', N'ECQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2116', N'420801', N'市辖区', N'210', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2117', N'420802', N'东宝区', N'210', N'3', N'0', N'0', N'Dongbao Qu', N'DBQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2118', N'420804', N'掇刀区', N'210', N'3', N'0', N'0', N'Duodao Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2119', N'420821', N'京山县', N'210', N'3', N'0', N'0', N'Jingshan Xian', N'JSA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2120', N'420822', N'沙洋县', N'210', N'3', N'0', N'0', N'Shayang Xian', N'SYF')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2121', N'420881', N'钟祥市', N'210', N'3', N'0', N'0', N'Zhongxiang Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2122', N'420901', N'市辖区', N'211', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2123', N'420902', N'孝南区', N'211', N'3', N'0', N'0', N'Xiaonan Qu', N'XNA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2124', N'420921', N'孝昌县', N'211', N'3', N'0', N'0', N'Xiaochang Xian', N'XOC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2125', N'420922', N'大悟县', N'211', N'3', N'0', N'0', N'Dawu Xian', N'DWU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2126', N'420923', N'云梦县', N'211', N'3', N'0', N'0', N'Yunmeng Xian', N'YMX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2127', N'420981', N'应城市', N'211', N'3', N'0', N'0', N'Yingcheng Shi', N'YCG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2128', N'420982', N'安陆市', N'211', N'3', N'0', N'0', N'Anlu Shi', N'ALU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2129', N'420984', N'汉川市', N'211', N'3', N'0', N'0', N'Hanchuan Shi', N'HCH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2130', N'421001', N'市辖区', N'212', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2131', N'421002', N'沙市区', N'212', N'3', N'0', N'0', N'Shashi Qu', N'SSJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2132', N'421003', N'荆州区', N'212', N'3', N'0', N'0', N'Jingzhou Qu', N'JZQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2133', N'421022', N'公安县', N'212', N'3', N'0', N'0', N'Gong,an Xian', N'GGA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2134', N'421023', N'监利县', N'212', N'3', N'0', N'0', N'Jianli Xian', N'JLI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2135', N'421024', N'江陵县', N'212', N'3', N'0', N'0', N'Jiangling Xian', N'JLX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2136', N'421081', N'石首市', N'212', N'3', N'0', N'0', N'Shishou Shi', N'SSO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2137', N'421083', N'洪湖市', N'212', N'3', N'0', N'0', N'Honghu Shi', N'HHU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2138', N'421087', N'松滋市', N'212', N'3', N'0', N'0', N'Songzi Shi', N'SZF')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2139', N'421101', N'市辖区', N'213', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2140', N'421102', N'黄州区', N'213', N'3', N'0', N'0', N'Huangzhou Qu', N'HZC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2141', N'421121', N'团风县', N'213', N'3', N'0', N'0', N'Tuanfeng Xian', N'TFG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2142', N'421122', N'红安县', N'213', N'3', N'0', N'0', N'Hong,an Xian', N'HGA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2143', N'421123', N'罗田县', N'213', N'3', N'0', N'0', N'Luotian Xian', N'LTE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2144', N'421124', N'英山县', N'213', N'3', N'0', N'0', N'Yingshan Xian', N'YSE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2145', N'421125', N'浠水县', N'213', N'3', N'0', N'0', N'Xishui Xian', N'XSE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2146', N'421126', N'蕲春县', N'213', N'3', N'0', N'0', N'Qichun Xian', N'QCN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2147', N'421127', N'黄梅县', N'213', N'3', N'0', N'0', N'Huangmei Xian', N'HGM')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2148', N'421181', N'麻城市', N'213', N'3', N'0', N'0', N'Macheng Shi', N'MCS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2149', N'421182', N'武穴市', N'213', N'3', N'0', N'0', N'Wuxue Shi', N'WXE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2150', N'421201', N'市辖区', N'214', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2151', N'421202', N'咸安区', N'214', N'3', N'0', N'0', N'Xian,an Qu', N'XAN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2152', N'421221', N'嘉鱼县', N'214', N'3', N'0', N'0', N'Jiayu Xian', N'JYX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2153', N'421222', N'通城县', N'214', N'3', N'0', N'0', N'Tongcheng Xian', N'TCX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2154', N'421223', N'崇阳县', N'214', N'3', N'0', N'0', N'Chongyang Xian', N'CGY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2155', N'421224', N'通山县', N'214', N'3', N'0', N'0', N'Tongshan Xian', N'TSA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2156', N'421281', N'赤壁市', N'214', N'3', N'0', N'0', N'Chibi Shi', N'CBI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2157', N'421301', N'市辖区', N'215', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2158', N'421303', N'曾都区', N'215', N'3', N'0', N'0', N'Zengdu Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2159', N'421381', N'广水市', N'215', N'3', N'0', N'0', N'Guangshui Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2160', N'422801', N'恩施市', N'216', N'3', N'0', N'0', N'Enshi Shi', N'ESS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2161', N'422802', N'利川市', N'216', N'3', N'0', N'0', N'Lichuan Shi', N'LCE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2162', N'422822', N'建始县', N'216', N'3', N'0', N'0', N'Jianshi Xian', N'JSE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2163', N'422823', N'巴东县', N'216', N'3', N'0', N'0', N'Badong Xian', N'BDG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2164', N'422825', N'宣恩县', N'216', N'3', N'0', N'0', N'Xuan,en Xian', N'XEN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2165', N'422826', N'咸丰县', N'216', N'3', N'0', N'0', N'Xianfeng Xian', N'XFG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2166', N'422827', N'来凤县', N'216', N'3', N'0', N'0', N'Laifeng Xian', N'LFG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2167', N'422828', N'鹤峰县', N'216', N'3', N'0', N'0', N'Hefeng Xian', N'HEF')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2168', N'429004', N'仙桃市', N'217', N'3', N'0', N'0', N'Xiantao Shi', N'XNT')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2169', N'429005', N'潜江市', N'217', N'3', N'0', N'0', N'Qianjiang Shi', N'QNJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2170', N'429006', N'天门市', N'217', N'3', N'0', N'0', N'Tianmen Shi', N'TMS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2171', N'429021', N'神农架林区', N'217', N'3', N'0', N'0', N'Shennongjia Linqu', N'SNJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2172', N'430101', N'市辖区', N'218', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2173', N'430102', N'芙蓉区', N'218', N'3', N'0', N'0', N'Furong Qu', N'FRQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2174', N'430103', N'天心区', N'218', N'3', N'0', N'0', N'Tianxin Qu', N'TXQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2175', N'430104', N'岳麓区', N'218', N'3', N'0', N'0', N'Yuelu Qu', N'YLU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2176', N'430105', N'开福区', N'218', N'3', N'0', N'0', N'Kaifu Qu', N'KFQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2177', N'430111', N'雨花区', N'218', N'3', N'0', N'0', N'Yuhua Qu', N'YHA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2178', N'430121', N'长沙县', N'218', N'3', N'0', N'0', N'Changsha Xian', N'CSA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2179', N'430122', N'望城县', N'218', N'3', N'0', N'0', N'Wangcheng Xian', N'WCH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2180', N'430124', N'宁乡县', N'218', N'3', N'0', N'0', N'Ningxiang Xian', N'NXX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2181', N'430181', N'浏阳市', N'218', N'3', N'0', N'0', N'Liuyang Shi', N'LYS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2182', N'430201', N'市辖区', N'219', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2183', N'430202', N'荷塘区', N'219', N'3', N'0', N'0', N'Hetang Qu', N'HTZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2184', N'430203', N'芦淞区', N'219', N'3', N'0', N'0', N'Lusong Qu', N'LZZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2185', N'430204', N'石峰区', N'219', N'3', N'0', N'0', N'Shifeng Qu', N'SFG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2186', N'430211', N'天元区', N'219', N'3', N'0', N'0', N'Tianyuan Qu', N'TYQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2187', N'430221', N'株洲县', N'219', N'3', N'0', N'0', N'Zhuzhou Xian', N'ZZX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2188', N'430223', N'攸县', N'219', N'3', N'0', N'0', N'You Xian', N'YOU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2189', N'430224', N'茶陵县', N'219', N'3', N'0', N'0', N'Chaling Xian', N'CAL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2190', N'430225', N'炎陵县', N'219', N'3', N'0', N'0', N'Yanling Xian', N'YLX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2191', N'430281', N'醴陵市', N'219', N'3', N'0', N'0', N'Liling Shi', N'LIL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2192', N'430301', N'市辖区', N'220', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2193', N'430302', N'雨湖区', N'220', N'3', N'0', N'0', N'Yuhu Qu', N'YHU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2194', N'430304', N'岳塘区', N'220', N'3', N'0', N'0', N'Yuetang Qu', N'YTG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2195', N'430321', N'湘潭县', N'220', N'3', N'0', N'0', N'Xiangtan Qu', N'XTX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2196', N'430381', N'湘乡市', N'220', N'3', N'0', N'0', N'Xiangxiang Shi', N'XXG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2197', N'430382', N'韶山市', N'220', N'3', N'0', N'0', N'Shaoshan Shi', N'SSN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2198', N'430401', N'市辖区', N'221', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2199', N'430405', N'珠晖区', N'221', N'3', N'0', N'0', N'Zhuhui Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2200', N'430406', N'雁峰区', N'221', N'3', N'0', N'0', N'Yanfeng Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2201', N'430407', N'石鼓区', N'221', N'3', N'0', N'0', N'Shigu Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2202', N'430408', N'蒸湘区', N'221', N'3', N'0', N'0', N'Zhengxiang Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2203', N'430412', N'南岳区', N'221', N'3', N'0', N'0', N'Nanyue Qu', N'NYQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2204', N'430421', N'衡阳县', N'221', N'3', N'0', N'0', N'Hengyang Xian', N'HYO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2205', N'430422', N'衡南县', N'221', N'3', N'0', N'0', N'Hengnan Xian', N'HNX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2206', N'430423', N'衡山县', N'221', N'3', N'0', N'0', N'Hengshan Xian', N'HSH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2207', N'430424', N'衡东县', N'221', N'3', N'0', N'0', N'Hengdong Xian', N'HED')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2208', N'430426', N'祁东县', N'221', N'3', N'0', N'0', N'Qidong Xian', N'QDX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2209', N'430481', N'耒阳市', N'221', N'3', N'0', N'0', N'Leiyang Shi', N'LEY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2210', N'430482', N'常宁市', N'221', N'3', N'0', N'0', N'Changning Shi', N'CNS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2211', N'430501', N'市辖区', N'222', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2212', N'430502', N'双清区', N'222', N'3', N'0', N'0', N'Shuangqing Qu', N'SGQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2213', N'430503', N'大祥区', N'222', N'3', N'0', N'0', N'Daxiang Qu', N'DXS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2214', N'430511', N'北塔区', N'222', N'3', N'0', N'0', N'Beita Qu', N'BET')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2215', N'430521', N'邵东县', N'222', N'3', N'0', N'0', N'Shaodong Xian', N'SDG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2216', N'430522', N'新邵县', N'222', N'3', N'0', N'0', N'Xinshao Xian', N'XSO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2217', N'430523', N'邵阳县', N'222', N'3', N'0', N'0', N'Shaoyang Xian', N'SYW')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2218', N'430524', N'隆回县', N'222', N'3', N'0', N'0', N'Longhui Xian', N'LGH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2219', N'430525', N'洞口县', N'222', N'3', N'0', N'0', N'Dongkou Xian', N'DGK')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2220', N'430527', N'绥宁县', N'222', N'3', N'0', N'0', N'Suining Xian', N'SNX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2221', N'430528', N'新宁县', N'222', N'3', N'0', N'0', N'Xinning Xian', N'XNI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2222', N'430529', N'城步苗族自治县', N'222', N'3', N'0', N'0', N'Chengbu Miaozu Zizhixian', N'CBU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2223', N'430581', N'武冈市', N'222', N'3', N'0', N'0', N'Wugang Shi', N'WGS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2224', N'430601', N'市辖区', N'223', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2225', N'430602', N'岳阳楼区', N'223', N'3', N'0', N'0', N'Yueyanglou Qu', N'YYL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2226', N'430603', N'云溪区', N'223', N'3', N'0', N'0', N'Yunxi Qu', N'YXI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2227', N'430611', N'君山区', N'223', N'3', N'0', N'0', N'Junshan Qu', N'JUS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2228', N'430621', N'岳阳县', N'223', N'3', N'0', N'0', N'Yueyang Xian', N'YYX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2229', N'430623', N'华容县', N'223', N'3', N'0', N'0', N'Huarong Xian', N'HRG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2230', N'430624', N'湘阴县', N'223', N'3', N'0', N'0', N'Xiangyin Xian', N'XYN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2231', N'430626', N'平江县', N'223', N'3', N'0', N'0', N'Pingjiang Xian', N'PJH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2232', N'430681', N'汨罗市', N'223', N'3', N'0', N'0', N'Miluo Shi', N'MLU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2233', N'430682', N'临湘市', N'223', N'3', N'0', N'0', N'Linxiang Shi', N'LXY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2234', N'430701', N'市辖区', N'224', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2235', N'430702', N'武陵区', N'224', N'3', N'0', N'0', N'Wuling Qu', N'WLQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2236', N'430703', N'鼎城区', N'224', N'3', N'0', N'0', N'Dingcheng Qu', N'DCE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2237', N'430721', N'安乡县', N'224', N'3', N'0', N'0', N'Anxiang Xian', N'AXG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2238', N'430722', N'汉寿县', N'224', N'3', N'0', N'0', N'Hanshou Xian', N'HSO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2239', N'430723', N'澧县', N'224', N'3', N'0', N'0', N'Li Xian', N'LXX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2240', N'430724', N'临澧县', N'224', N'3', N'0', N'0', N'Linli Xian', N'LNL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2241', N'430725', N'桃源县', N'224', N'3', N'0', N'0', N'Taoyuan Xian', N'TOY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2242', N'430726', N'石门县', N'224', N'3', N'0', N'0', N'Shimen Xian', N'SHM')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2243', N'430781', N'津市市', N'224', N'3', N'0', N'0', N'Jinshi Shi', N'JSS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2244', N'430801', N'市辖区', N'225', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2245', N'430802', N'永定区', N'225', N'3', N'0', N'0', N'Yongding Qu', N'YDQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2246', N'430811', N'武陵源区', N'225', N'3', N'0', N'0', N'Wulingyuan Qu', N'WLY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2247', N'430821', N'慈利县', N'225', N'3', N'0', N'0', N'Cili Xian', N'CLI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2248', N'430822', N'桑植县', N'225', N'3', N'0', N'0', N'Sangzhi Xian', N'SZT')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2249', N'430901', N'市辖区', N'226', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2250', N'430902', N'资阳区', N'226', N'3', N'0', N'0', N'Ziyang Qu', N'ZYC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2251', N'430903', N'赫山区', N'226', N'3', N'0', N'0', N'Heshan Qu', N'HSY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2252', N'430921', N'南县', N'226', N'3', N'0', N'0', N'Nan Xian', N'NXN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2253', N'430922', N'桃江县', N'226', N'3', N'0', N'0', N'Taojiang Xian', N'TJG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2254', N'430923', N'安化县', N'226', N'3', N'0', N'0', N'Anhua Xian', N'ANH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2255', N'430981', N'沅江市', N'226', N'3', N'0', N'0', N'Yuanjiang Shi', N'YJS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2256', N'431001', N'市辖区', N'227', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2257', N'431002', N'北湖区', N'227', N'3', N'0', N'0', N'Beihu Qu', N'BHQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2258', N'431003', N'苏仙区', N'227', N'3', N'0', N'0', N'Suxian Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2259', N'431021', N'桂阳县', N'227', N'3', N'0', N'0', N'Guiyang Xian', N'GYX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2260', N'431022', N'宜章县', N'227', N'3', N'0', N'0', N'yizhang Xian', N'YZA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2261', N'431023', N'永兴县', N'227', N'3', N'0', N'0', N'Yongxing Xian', N'YXX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2262', N'431024', N'嘉禾县', N'227', N'3', N'0', N'0', N'Jiahe Xian', N'JAH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2263', N'431025', N'临武县', N'227', N'3', N'0', N'0', N'Linwu Xian', N'LWX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2264', N'431026', N'汝城县', N'227', N'3', N'0', N'0', N'Rucheng Xian', N'RCE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2265', N'431027', N'桂东县', N'227', N'3', N'0', N'0', N'Guidong Xian', N'GDO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2266', N'431028', N'安仁县', N'227', N'3', N'0', N'0', N'Anren Xian', N'ARN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2267', N'431081', N'资兴市', N'227', N'3', N'0', N'0', N'Zixing Shi', N'ZXG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2268', N'431101', N'市辖区', N'228', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2270', N'431103', N'冷水滩区', N'228', N'3', N'0', N'0', N'Lengshuitan Qu', N'LST')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2271', N'431121', N'祁阳县', N'228', N'3', N'0', N'0', N'Qiyang Xian', N'QJY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2272', N'431122', N'东安县', N'228', N'3', N'0', N'0', N'Dong,an Xian', N'DOA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2273', N'431123', N'双牌县', N'228', N'3', N'0', N'0', N'Shuangpai Xian', N'SPA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2274', N'431124', N'道县', N'228', N'3', N'0', N'0', N'Dao Xian', N'DAO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2275', N'431125', N'江永县', N'228', N'3', N'0', N'0', N'Jiangyong Xian', N'JYD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2276', N'431126', N'宁远县', N'228', N'3', N'0', N'0', N'Ningyuan Xian', N'NYN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2277', N'431127', N'蓝山县', N'228', N'3', N'0', N'0', N'Lanshan Xian', N'LNS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2278', N'431128', N'新田县', N'228', N'3', N'0', N'0', N'Xintian Xian', N'XTN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2279', N'431129', N'江华瑶族自治县', N'228', N'3', N'0', N'0', N'Jianghua Yaozu Zizhixian', N'JHX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2280', N'431201', N'市辖区', N'229', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2281', N'431202', N'鹤城区', N'229', N'3', N'0', N'0', N'Hecheng Qu', N'HCG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2282', N'431221', N'中方县', N'229', N'3', N'0', N'0', N'Zhongfang Xian', N'ZFX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2283', N'431222', N'沅陵县', N'229', N'3', N'0', N'0', N'Yuanling Xian', N'YNL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2284', N'431223', N'辰溪县', N'229', N'3', N'0', N'0', N'Chenxi Xian', N'CXX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2285', N'431224', N'溆浦县', N'229', N'3', N'0', N'0', N'Xupu Xian', N'XUP')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2286', N'431225', N'会同县', N'229', N'3', N'0', N'0', N'Huitong Xian', N'HTG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2287', N'431226', N'麻阳苗族自治县', N'229', N'3', N'0', N'0', N'Mayang Miaozu Zizhixian', N'MYX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2288', N'431227', N'新晃侗族自治县', N'229', N'3', N'0', N'0', N'Xinhuang Dongzu Zizhixian', N'XHD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2289', N'431228', N'芷江侗族自治县', N'229', N'3', N'0', N'0', N'Zhijiang Dongzu Zizhixian', N'ZJX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2290', N'431229', N'靖州苗族侗族自治县', N'229', N'3', N'0', N'0', N'Jingzhou Miaozu Dongzu Zizhixian', N'JZO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2291', N'431230', N'通道侗族自治县', N'229', N'3', N'0', N'0', N'Tongdao Dongzu Zizhixian', N'TDD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2292', N'431281', N'洪江市', N'229', N'3', N'0', N'0', N'Hongjiang Shi', N'HGJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2293', N'431301', N'市辖区', N'230', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2294', N'431302', N'娄星区', N'230', N'3', N'0', N'0', N'Louxing Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2295', N'431321', N'双峰县', N'230', N'3', N'0', N'0', N'Shuangfeng Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2296', N'431322', N'新化县', N'230', N'3', N'0', N'0', N'Xinhua Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2297', N'431381', N'冷水江市', N'230', N'3', N'0', N'0', N'Lengshuijiang Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2298', N'431382', N'涟源市', N'230', N'3', N'0', N'0', N'Lianyuan Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2299', N'433101', N'吉首市', N'231', N'3', N'0', N'0', N'Jishou Shi', N'JSO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2300', N'433122', N'泸溪县', N'231', N'3', N'0', N'0', N'Luxi Xian', N'LXW')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2301', N'433123', N'凤凰县', N'231', N'3', N'0', N'0', N'Fenghuang Xian', N'FHX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2302', N'433124', N'花垣县', N'231', N'3', N'0', N'0', N'Huayuan Xian', N'HYH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2303', N'433125', N'保靖县', N'231', N'3', N'0', N'0', N'Baojing Xian', N'BJG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2304', N'433126', N'古丈县', N'231', N'3', N'0', N'0', N'Guzhang Xian', N'GZG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2305', N'433127', N'永顺县', N'231', N'3', N'0', N'0', N'Yongshun Xian', N'YSF')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2306', N'433130', N'龙山县', N'231', N'3', N'0', N'0', N'Longshan Xian', N'LSR')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2307', N'440101', N'市辖区', N'232', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2308', N'440115', N'南沙区', N'232', N'3', N'0', N'0', N'Nansha Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2309', N'440103', N'荔湾区', N'232', N'3', N'0', N'0', N'Liwan Qu', N'LWQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2310', N'440104', N'越秀区', N'232', N'3', N'0', N'0', N'Yuexiu Qu', N'YXU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2311', N'440105', N'海珠区', N'232', N'3', N'0', N'0', N'Haizhu Qu', N'HZU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2312', N'440106', N'天河区', N'232', N'3', N'0', N'0', N'Tianhe Qu', N'THQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2313', N'440116', N'萝岗区', N'232', N'3', N'0', N'0', N'Luogang Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2314', N'440111', N'白云区', N'232', N'3', N'0', N'0', N'Baiyun Qu', N'BYN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2315', N'440112', N'黄埔区', N'232', N'3', N'0', N'0', N'Huangpu Qu', N'HPU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2316', N'440113', N'番禺区', N'232', N'3', N'0', N'0', N'Panyu Qu', N'PNY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2317', N'440114', N'花都区', N'232', N'3', N'0', N'0', N'Huadu Qu', N'HDU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2318', N'440183', N'增城市', N'232', N'3', N'0', N'0', N'Zengcheng Shi', N'ZEC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2319', N'440184', N'从化市', N'232', N'3', N'0', N'0', N'Conghua Shi', N'CNH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2320', N'440201', N'市辖区', N'233', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2321', N'440203', N'武江区', N'233', N'3', N'0', N'0', N'Wujiang Qu', N'WJQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2322', N'440204', N'浈江区', N'233', N'3', N'0', N'0', N'Zhenjiang Qu', N'ZJQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2323', N'440205', N'曲江区', N'233', N'3', N'0', N'0', N'Qujiang Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2324', N'440222', N'始兴县', N'233', N'3', N'0', N'0', N'Shixing Xian', N'SXX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2325', N'440224', N'仁化县', N'233', N'3', N'0', N'0', N'Renhua Xian', N'RHA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2326', N'440229', N'翁源县', N'233', N'3', N'0', N'0', N'Wengyuan Xian', N'WYN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2327', N'440232', N'乳源瑶族自治县', N'233', N'3', N'0', N'0', N'Ruyuan Yaozu Zizhixian', N'RYN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2328', N'440233', N'新丰县', N'233', N'3', N'0', N'0', N'Xinfeng Xian', N'XFY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2329', N'440281', N'乐昌市', N'233', N'3', N'0', N'0', N'Lechang Shi', N'LEC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2330', N'440282', N'南雄市', N'233', N'3', N'0', N'0', N'Nanxiong Shi', N'NXS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2331', N'440301', N'市辖区', N'234', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2332', N'440303', N'罗湖区', N'234', N'3', N'0', N'0', N'Luohu Qu', N'LHQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2333', N'440304', N'福田区', N'234', N'3', N'0', N'0', N'Futian Qu', N'FTN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2334', N'440305', N'南山区', N'234', N'3', N'0', N'0', N'Nanshan Qu', N'NSN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2335', N'440306', N'宝安区', N'234', N'3', N'0', N'0', N'Bao,an Qu', N'BAQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2336', N'440307', N'龙岗区', N'234', N'3', N'0', N'0', N'Longgang Qu', N'LGG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2337', N'440308', N'盐田区', N'234', N'3', N'0', N'0', N'Yan Tian Qu', N'YTQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2338', N'440401', N'市辖区', N'235', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2339', N'440402', N'香洲区', N'235', N'3', N'0', N'0', N'Xiangzhou Qu', N'XZQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2340', N'440403', N'斗门区', N'235', N'3', N'0', N'0', N'Doumen Qu', N'DOU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2341', N'440404', N'金湾区', N'235', N'3', N'0', N'0', N'Jinwan Qu', N'JW Q')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2342', N'440501', N'市辖区', N'236', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2343', N'440507', N'龙湖区', N'236', N'3', N'0', N'0', N'Longhu Qu', N'LHH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2344', N'440511', N'金平区', N'236', N'3', N'0', N'0', N'Jinping Qu', N'JPQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2345', N'440512', N'濠江区', N'236', N'3', N'0', N'0', N'Haojiang Qu', N'HJ Q')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2346', N'440513', N'潮阳区', N'236', N'3', N'0', N'0', N'Chaoyang  Qu', N'CHY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2347', N'440514', N'潮南区', N'236', N'3', N'0', N'0', N'Chaonan Qu', N'CN Q')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2348', N'440515', N'澄海区', N'236', N'3', N'0', N'0', N'Chenghai QU', N'CHS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2349', N'440523', N'南澳县', N'236', N'3', N'0', N'0', N'Nan,ao Xian', N'NAN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2350', N'440601', N'市辖区', N'237', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2351', N'440604', N'禅城区', N'237', N'3', N'0', N'0', N'Chancheng Qu', N'CC Q')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2352', N'440605', N'南海区', N'237', N'3', N'0', N'0', N'Nanhai Shi', N'NAH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2353', N'440606', N'顺德区', N'237', N'3', N'0', N'0', N'Shunde Shi', N'SUD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2354', N'440607', N'三水区', N'237', N'3', N'0', N'0', N'Sanshui Shi', N'SJQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2355', N'440608', N'高明区', N'237', N'3', N'0', N'0', N'Gaoming Shi', N'M')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2356', N'440701', N'市辖区', N'238', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2357', N'440703', N'蓬江区', N'238', N'3', N'0', N'0', N'Pengjiang Qu', N'PJJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2358', N'440704', N'江海区', N'238', N'3', N'0', N'0', N'Jianghai Qu', N'JHI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2359', N'440705', N'新会区', N'238', N'3', N'0', N'0', N'Xinhui Shi', N'XIN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2360', N'440781', N'台山市', N'238', N'3', N'0', N'0', N'Taishan Shi', N'TSS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2361', N'440783', N'开平市', N'238', N'3', N'0', N'0', N'Kaiping Shi', N'KPS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2362', N'440784', N'鹤山市', N'238', N'3', N'0', N'0', N'Heshan Shi', N'HES')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2363', N'440785', N'恩平市', N'238', N'3', N'0', N'0', N'Enping Shi', N'ENP')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2364', N'440801', N'市辖区', N'239', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2365', N'440802', N'赤坎区', N'239', N'3', N'0', N'0', N'Chikan Qu', N'CKQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2366', N'440803', N'霞山区', N'239', N'3', N'0', N'0', N'Xiashan Qu', N'XAS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2367', N'440804', N'坡头区', N'239', N'3', N'0', N'0', N'Potou Qu', N'PTU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2368', N'440811', N'麻章区', N'239', N'3', N'0', N'0', N'Mazhang Qu', N'MZQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2369', N'440823', N'遂溪县', N'239', N'3', N'0', N'0', N'Suixi Xian', N'SXI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2370', N'440825', N'徐闻县', N'239', N'3', N'0', N'0', N'Xuwen Xian', N'XWN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2371', N'440881', N'廉江市', N'239', N'3', N'0', N'0', N'Lianjiang Shi', N'LJS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2372', N'440882', N'雷州市', N'239', N'3', N'0', N'0', N'Leizhou Shi', N'LEZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2373', N'440883', N'吴川市', N'239', N'3', N'0', N'0', N'Wuchuan Shi', N'WCS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2374', N'440901', N'市辖区', N'240', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2375', N'440902', N'茂南区', N'240', N'3', N'0', N'0', N'Maonan Qu', N'MNQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2376', N'440903', N'茂港区', N'240', N'3', N'0', N'0', N'Maogang Qu', N'MGQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2377', N'440923', N'电白县', N'240', N'3', N'0', N'0', N'Dianbai Xian', N'DBI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2378', N'440981', N'高州市', N'240', N'3', N'0', N'0', N'Gaozhou Shi', N'GZO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2379', N'440982', N'化州市', N'240', N'3', N'0', N'0', N'Huazhou Shi', N'HZY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2380', N'440983', N'信宜市', N'240', N'3', N'0', N'0', N'Xinyi Shi', N'XYY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2381', N'441201', N'市辖区', N'241', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2382', N'441202', N'端州区', N'241', N'3', N'0', N'0', N'Duanzhou Qu', N'DZQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2383', N'441203', N'鼎湖区', N'241', N'3', N'0', N'0', N'Dinghu Qu', N'DGH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2384', N'441223', N'广宁县', N'241', N'3', N'0', N'0', N'Guangning Xian', N'GNG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2385', N'441224', N'怀集县', N'241', N'3', N'0', N'0', N'Huaiji Xian', N'HJX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2386', N'441225', N'封开县', N'241', N'3', N'0', N'0', N'Fengkai Xian', N'FKX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2387', N'441226', N'德庆县', N'241', N'3', N'0', N'0', N'Deqing Xian', N'DQY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2388', N'441283', N'高要市', N'241', N'3', N'0', N'0', N'Gaoyao Xian', N'GYY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2389', N'441284', N'四会市', N'241', N'3', N'0', N'0', N'Sihui Shi', N'SHI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2390', N'441301', N'市辖区', N'242', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2391', N'441302', N'惠城区', N'242', N'3', N'0', N'0', N'Huicheng Qu', N'HCQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2392', N'441303', N'惠阳区', N'242', N'3', N'0', N'0', N'Huiyang Shi', N'HUY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2393', N'441322', N'博罗县', N'242', N'3', N'0', N'0', N'Boluo Xian', N'BOL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2394', N'441323', N'惠东县', N'242', N'3', N'0', N'0', N'Huidong Xian', N'HID')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2395', N'441324', N'龙门县', N'242', N'3', N'0', N'0', N'Longmen Xian', N'LMN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2396', N'441401', N'市辖区', N'243', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2397', N'441402', N'梅江区', N'243', N'3', N'0', N'0', N'Meijiang Qu', N'MJQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2398', N'441421', N'梅县', N'243', N'3', N'0', N'0', N'Mei Xian', N'MEX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2399', N'441422', N'大埔县', N'243', N'3', N'0', N'0', N'Dabu Xian', N'DBX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2400', N'441423', N'丰顺县', N'243', N'3', N'0', N'0', N'Fengshun Xian', N'FES')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2401', N'441424', N'五华县', N'243', N'3', N'0', N'0', N'Wuhua Xian', N'WHY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2402', N'441426', N'平远县', N'243', N'3', N'0', N'0', N'Pingyuan Xian', N'PYY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2403', N'441427', N'蕉岭县', N'243', N'3', N'0', N'0', N'Jiaoling Xian', N'JOL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2404', N'441481', N'兴宁市', N'243', N'3', N'0', N'0', N'Xingning Shi', N'XNG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2405', N'441501', N'市辖区', N'244', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2406', N'441502', N'城区', N'244', N'3', N'0', N'0', N'Chengqu', N'CQS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2407', N'441521', N'海丰县', N'244', N'3', N'0', N'0', N'Haifeng Xian', N'HIF')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2408', N'441523', N'陆河县', N'244', N'3', N'0', N'0', N'Luhe Xian', N'LHY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2409', N'441581', N'陆丰市', N'244', N'3', N'0', N'0', N'Lufeng Shi', N'LUF')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2410', N'441601', N'市辖区', N'245', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2411', N'441602', N'源城区', N'245', N'3', N'0', N'0', N'Yuancheng Qu', N'YCQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2412', N'441621', N'紫金县', N'245', N'3', N'0', N'0', N'Zijin Xian', N'ZJY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2413', N'441622', N'龙川县', N'245', N'3', N'0', N'0', N'Longchuan Xian', N'LCY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2414', N'441623', N'连平县', N'245', N'3', N'0', N'0', N'Lianping Xian', N'LNP')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2415', N'441624', N'和平县', N'245', N'3', N'0', N'0', N'Heping Xian', N'HPY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2416', N'441625', N'东源县', N'245', N'3', N'0', N'0', N'Dongyuan Xian', N'DYN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2417', N'441701', N'市辖区', N'246', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2418', N'441702', N'江城区', N'246', N'3', N'0', N'0', N'Jiangcheng Qu', N'JCQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2419', N'441721', N'阳西县', N'246', N'3', N'0', N'0', N'Yangxi Xian', N'YXY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2420', N'441723', N'阳东县', N'246', N'3', N'0', N'0', N'Yangdong Xian', N'YGD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2421', N'441781', N'阳春市', N'246', N'3', N'0', N'0', N'Yangchun Shi', N'YCU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2422', N'441801', N'市辖区', N'247', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2423', N'441802', N'清城区', N'247', N'3', N'0', N'0', N'Qingcheng Qu', N'QCQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2424', N'441821', N'佛冈县', N'247', N'3', N'0', N'0', N'Fogang Xian', N'FGY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2425', N'441823', N'阳山县', N'247', N'3', N'0', N'0', N'Yangshan Xian', N'YSN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2426', N'441825', N'连山壮族瑶族自治县', N'247', N'3', N'0', N'0', N'Lianshan Zhuangzu Yaozu Zizhixian', N'LSZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2427', N'441826', N'连南瑶族自治县', N'247', N'3', N'0', N'0', N'Liannanyaozuzizhi Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2428', N'441827', N'清新县', N'247', N'3', N'0', N'0', N'Qingxin Xian', N'QGX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2429', N'441881', N'英德市', N'247', N'3', N'0', N'0', N'Yingde Shi', N'YDS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2430', N'441882', N'连州市', N'247', N'3', N'0', N'0', N'Lianzhou Shi', N'LZO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2431', N'445101', N'市辖区', N'250', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2432', N'445102', N'湘桥区', N'250', N'3', N'0', N'0', N'Xiangqiao Qu', N'XQO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2433', N'445121', N'潮安县', N'250', N'3', N'0', N'0', N'Chao,an Xian', N'CAY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2434', N'445122', N'饶平县', N'250', N'3', N'0', N'0', N'Raoping Xian', N'RPG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2435', N'445201', N'市辖区', N'251', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2436', N'445202', N'榕城区', N'251', N'3', N'0', N'0', N'Rongcheng Qu', N'RCH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2437', N'445221', N'揭东县', N'251', N'3', N'0', N'0', N'Jiedong Xian', N'JDX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2438', N'445222', N'揭西县', N'251', N'3', N'0', N'0', N'Jiexi Xian', N'JEX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2439', N'445224', N'惠来县', N'251', N'3', N'0', N'0', N'Huilai Xian', N'HLY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2440', N'445281', N'普宁市', N'251', N'3', N'0', N'0', N'Puning Shi', N'PNG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2441', N'445301', N'市辖区', N'252', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2442', N'445302', N'云城区', N'252', N'3', N'0', N'0', N'Yuncheng Qu', N'YYF')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2443', N'445321', N'新兴县', N'252', N'3', N'0', N'0', N'Xinxing Xian', N'XNX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2444', N'445322', N'郁南县', N'252', N'3', N'0', N'0', N'Yunan Xian', N'YNK')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2445', N'445323', N'云安县', N'252', N'3', N'0', N'0', N'Yun,an Xian', N'YUA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2446', N'445381', N'罗定市', N'252', N'3', N'0', N'0', N'Luoding Shi', N'LUO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2447', N'450101', N'市辖区', N'253', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2448', N'450102', N'兴宁区', N'253', N'3', N'0', N'0', N'Xingning Qu', N'XNE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2449', N'450103', N'青秀区', N'253', N'3', N'0', N'0', N'Qingxiu Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2450', N'450105', N'江南区', N'253', N'3', N'0', N'0', N'Jiangnan Qu', N'JNA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2451', N'450107', N'西乡塘区', N'253', N'3', N'0', N'0', N'Xixiangtang Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2452', N'450108', N'良庆区', N'253', N'3', N'0', N'0', N'Liangqing Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2453', N'450109', N'邕宁区', N'253', N'3', N'0', N'0', N'Yongning Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2454', N'450122', N'武鸣县', N'253', N'3', N'0', N'0', N'Wuming Xian', N'WMG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2455', N'450123', N'隆安县', N'253', N'3', N'0', N'0', N'Long,an Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2456', N'450124', N'马山县', N'253', N'3', N'0', N'0', N'Mashan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2457', N'450125', N'上林县', N'253', N'3', N'0', N'0', N'Shanglin Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2458', N'450126', N'宾阳县', N'253', N'3', N'0', N'0', N'Binyang Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2459', N'450127', N'横县', N'253', N'3', N'0', N'0', N'Heng Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2460', N'450201', N'市辖区', N'254', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2461', N'450202', N'城中区', N'254', N'3', N'0', N'0', N'Chengzhong Qu', N'CZG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2462', N'450203', N'鱼峰区', N'254', N'3', N'0', N'0', N'Yufeng Qu', N'YFQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2463', N'450204', N'柳南区', N'254', N'3', N'0', N'0', N'Liunan Qu', N'LNU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2464', N'450205', N'柳北区', N'254', N'3', N'0', N'0', N'Liubei Qu', N'LBE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2465', N'450221', N'柳江县', N'254', N'3', N'0', N'0', N'Liujiang Xian', N'LUJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2466', N'450222', N'柳城县', N'254', N'3', N'0', N'0', N'Liucheng Xian', N'LCB')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2467', N'450223', N'鹿寨县', N'254', N'3', N'0', N'0', N'Luzhai Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2468', N'450224', N'融安县', N'254', N'3', N'0', N'0', N'Rong,an Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2469', N'450225', N'融水苗族自治县', N'254', N'3', N'0', N'0', N'Rongshui Miaozu Zizhixian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2470', N'450226', N'三江侗族自治县', N'254', N'3', N'0', N'0', N'Sanjiang Dongzu Zizhixian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2471', N'450301', N'市辖区', N'255', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2472', N'450302', N'秀峰区', N'255', N'3', N'0', N'0', N'Xiufeng Qu', N'XUF')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2473', N'450303', N'叠彩区', N'255', N'3', N'0', N'0', N'Diecai Qu', N'DCA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2474', N'450304', N'象山区', N'255', N'3', N'0', N'0', N'Xiangshan Qu', N'XSK')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2475', N'450305', N'七星区', N'255', N'3', N'0', N'0', N'Qixing Qu', N'QXG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2476', N'450311', N'雁山区', N'255', N'3', N'0', N'0', N'Yanshan Qu', N'YSA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2477', N'450321', N'阳朔县', N'255', N'3', N'0', N'0', N'Yangshuo Xian', N'YSO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2478', N'450322', N'临桂县', N'255', N'3', N'0', N'0', N'Lingui Xian', N'LGI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2479', N'450323', N'灵川县', N'255', N'3', N'0', N'0', N'Lingchuan Xian', N'LCU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2480', N'450324', N'全州县', N'255', N'3', N'0', N'0', N'Quanzhou Xian', N'QZO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2481', N'450325', N'兴安县', N'255', N'3', N'0', N'0', N'Xing,an Xian', N'XAG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2482', N'450326', N'永福县', N'255', N'3', N'0', N'0', N'Yongfu Xian', N'YFU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2483', N'450327', N'灌阳县', N'255', N'3', N'0', N'0', N'Guanyang Xian', N'GNY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2484', N'450328', N'龙胜各族自治县', N'255', N'3', N'0', N'0', N'Longsheng Gezu Zizhixian', N'LSG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2485', N'450329', N'资源县', N'255', N'3', N'0', N'0', N'Ziyuan Xian', N'ZYU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2486', N'450330', N'平乐县', N'255', N'3', N'0', N'0', N'Pingle Xian', N'PLE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2487', N'450331', N'荔蒲县', N'255', N'3', N'0', N'0', N'Lipu Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2488', N'450332', N'恭城瑶族自治县', N'255', N'3', N'0', N'0', N'Gongcheng Yaozu Zizhixian', N'GGC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2489', N'450401', N'市辖区', N'256', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2490', N'450403', N'万秀区', N'256', N'3', N'0', N'0', N'Wanxiu Qu', N'WXQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2491', N'450404', N'蝶山区', N'256', N'3', N'0', N'0', N'Dieshan Qu', N'DES')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2492', N'450405', N'长洲区', N'256', N'3', N'0', N'0', N'Changzhou Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2493', N'450421', N'苍梧县', N'256', N'3', N'0', N'0', N'Cangwu Xian', N'CAW')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2494', N'450422', N'藤县', N'256', N'3', N'0', N'0', N'Teng Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2495', N'450423', N'蒙山县', N'256', N'3', N'0', N'0', N'Mengshan Xian', N'MSA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2496', N'450481', N'岑溪市', N'256', N'3', N'0', N'0', N'Cenxi Shi', N'CEX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2497', N'450501', N'市辖区', N'257', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2498', N'450502', N'海城区', N'257', N'3', N'0', N'0', N'Haicheng Qu', N'HCB')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2499', N'450503', N'银海区', N'257', N'3', N'0', N'0', N'Yinhai Qu', N'YHB')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2500', N'450512', N'铁山港区', N'257', N'3', N'0', N'0', N'Tieshangangqu', N'TSG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2501', N'450521', N'合浦县', N'257', N'3', N'0', N'0', N'Hepu Xian', N'HPX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2502', N'450601', N'市辖区', N'258', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2503', N'450602', N'港口区', N'258', N'3', N'0', N'0', N'Gangkou Qu', N'GKQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2504', N'450603', N'防城区', N'258', N'3', N'0', N'0', N'Fangcheng Qu', N'FCQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2505', N'450621', N'上思县', N'258', N'3', N'0', N'0', N'Shangsi Xian', N'SGS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2506', N'450681', N'东兴市', N'258', N'3', N'0', N'0', N'Dongxing Shi', N'DOX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2507', N'450701', N'市辖区', N'259', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2508', N'450702', N'钦南区', N'259', N'3', N'0', N'0', N'Qinnan Qu', N'QNQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2509', N'450703', N'钦北区', N'259', N'3', N'0', N'0', N'Qinbei Qu', N'QBQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2510', N'450721', N'灵山县', N'259', N'3', N'0', N'0', N'Lingshan Xian', N'LSB')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2511', N'450722', N'浦北县', N'259', N'3', N'0', N'0', N'Pubei Xian', N'PBE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2512', N'450801', N'市辖区', N'260', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2513', N'450802', N'港北区', N'260', N'3', N'0', N'0', N'Gangbei Qu', N'GBE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2514', N'450803', N'港南区', N'260', N'3', N'0', N'0', N'Gangnan Qu', N'GNQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2515', N'450804', N'覃塘区', N'260', N'3', N'0', N'0', N'Tantang Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2516', N'450821', N'平南县', N'260', N'3', N'0', N'0', N'Pingnan Xian', N'PNN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2517', N'450881', N'桂平市', N'260', N'3', N'0', N'0', N'Guiping Shi', N'GPS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2518', N'450901', N'市辖区', N'261', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2519', N'450902', N'玉州区', N'261', N'3', N'0', N'0', N'Yuzhou Qu', N'YZO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2520', N'450921', N'容县', N'261', N'3', N'0', N'0', N'Rong Xian', N'ROG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2521', N'450922', N'陆川县', N'261', N'3', N'0', N'0', N'Luchuan Xian', N'LCJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2522', N'450923', N'博白县', N'261', N'3', N'0', N'0', N'Bobai Xian', N'BBA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2523', N'450924', N'兴业县', N'261', N'3', N'0', N'0', N'Xingye Xian', N'XGY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2524', N'450981', N'北流市', N'261', N'3', N'0', N'0', N'Beiliu Shi', N'BLS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2525', N'451001', N'市辖区', N'262', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2526', N'451002', N'右江区', N'262', N'3', N'0', N'0', N'Youjiang Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2527', N'451021', N'田阳县', N'262', N'3', N'0', N'0', N'Tianyang Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2528', N'451022', N'田东县', N'262', N'3', N'0', N'0', N'Tiandong Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2529', N'451023', N'平果县', N'262', N'3', N'0', N'0', N'Pingguo Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2530', N'451024', N'德保县', N'262', N'3', N'0', N'0', N'Debao Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2531', N'451025', N'靖西县', N'262', N'3', N'0', N'0', N'Jingxi Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2532', N'451026', N'那坡县', N'262', N'3', N'0', N'0', N'Napo Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2533', N'451027', N'凌云县', N'262', N'3', N'0', N'0', N'Lingyun Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2534', N'451028', N'乐业县', N'262', N'3', N'0', N'0', N'Leye Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2535', N'451029', N'田林县', N'262', N'3', N'0', N'0', N'Tianlin Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2536', N'451030', N'西林县', N'262', N'3', N'0', N'0', N'Xilin Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2537', N'451031', N'隆林各族自治县', N'262', N'3', N'0', N'0', N'Longlin Gezu Zizhixian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2538', N'451101', N'市辖区', N'263', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2539', N'451102', N'八步区', N'263', N'3', N'0', N'0', N'Babu Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2540', N'451121', N'昭平县', N'263', N'3', N'0', N'0', N'Zhaoping Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2541', N'451122', N'钟山县', N'263', N'3', N'0', N'0', N'Zhongshan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2542', N'451123', N'富川瑶族自治县', N'263', N'3', N'0', N'0', N'Fuchuan Yaozu Zizhixian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2543', N'451201', N'市辖区', N'264', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2544', N'451202', N'金城江区', N'264', N'3', N'0', N'0', N'Jinchengjiang Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2545', N'451221', N'南丹县', N'264', N'3', N'0', N'0', N'Nandan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2546', N'451222', N'天峨县', N'264', N'3', N'0', N'0', N'Tian,e Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2547', N'451223', N'凤山县', N'264', N'3', N'0', N'0', N'Fengshan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2548', N'451224', N'东兰县', N'264', N'3', N'0', N'0', N'Donglan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2549', N'451225', N'罗城仫佬族自治县', N'264', N'3', N'0', N'0', N'Luocheng Mulaozu Zizhixian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2550', N'451226', N'环江毛南族自治县', N'264', N'3', N'0', N'0', N'Huanjiang Maonanzu Zizhixian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2551', N'451227', N'巴马瑶族自治县', N'264', N'3', N'0', N'0', N'Bama Yaozu Zizhixian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2552', N'451228', N'都安瑶族自治县', N'264', N'3', N'0', N'0', N'Du,an Yaozu Zizhixian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2553', N'451229', N'大化瑶族自治县', N'264', N'3', N'0', N'0', N'Dahua Yaozu Zizhixian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2554', N'451281', N'宜州市', N'264', N'3', N'0', N'0', N'Yizhou Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2555', N'451301', N'市辖区', N'265', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2556', N'451302', N'兴宾区', N'265', N'3', N'0', N'0', N'Xingbin Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2557', N'451321', N'忻城县', N'265', N'3', N'0', N'0', N'Xincheng Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2558', N'451322', N'象州县', N'265', N'3', N'0', N'0', N'Xiangzhou Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2559', N'451323', N'武宣县', N'265', N'3', N'0', N'0', N'Wuxuan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2560', N'451324', N'金秀瑶族自治县', N'265', N'3', N'0', N'0', N'Jinxiu Yaozu Zizhixian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2561', N'451381', N'合山市', N'265', N'3', N'0', N'0', N'Heshan Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2562', N'451401', N'市辖区', N'266', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2563', N'451402', N'江洲区', N'266', N'3', N'0', N'0', N'Jiangzhou Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2564', N'451421', N'扶绥县', N'266', N'3', N'0', N'0', N'Fusui Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2565', N'451422', N'宁明县', N'266', N'3', N'0', N'0', N'Ningming Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2566', N'451423', N'龙州县', N'266', N'3', N'0', N'0', N'Longzhou Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2567', N'451424', N'大新县', N'266', N'3', N'0', N'0', N'Daxin Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2568', N'451425', N'天等县', N'266', N'3', N'0', N'0', N'Tiandeng Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2569', N'451481', N'凭祥市', N'266', N'3', N'0', N'0', N'Pingxiang Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2570', N'460101', N'市辖区', N'267', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2571', N'460105', N'秀英区', N'267', N'3', N'0', N'0', N'Xiuying Qu', N'XYH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2572', N'460106', N'龙华区', N'267', N'3', N'0', N'0', N'LongHua Qu', N'LH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2573', N'460107', N'琼山区', N'267', N'3', N'0', N'0', N'QiongShan Qu', N'QS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2574', N'460108', N'美兰区', N'267', N'3', N'0', N'0', N'MeiLan Qu', N'ML')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2575', N'460201', N'市辖区', N'268', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2576', N'469001', N'五指山市', N'269', N'3', N'0', N'0', N'Wuzhishan Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2577', N'469002', N'琼海市', N'269', N'3', N'0', N'0', N'Qionghai Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2578', N'469003', N'儋州市', N'269', N'3', N'0', N'0', N'Danzhou Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2579', N'469005', N'文昌市', N'269', N'3', N'0', N'0', N'Wenchang Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2580', N'469006', N'万宁市', N'269', N'3', N'0', N'0', N'Wanning Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2581', N'469007', N'东方市', N'269', N'3', N'0', N'0', N'Dongfang Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2582', N'469021', N'定安县', N'269', N'3', N'0', N'0', N'Ding,an Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2583', N'469022', N'屯昌县', N'269', N'3', N'0', N'0', N'Tunchang Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2584', N'469023', N'澄迈县', N'269', N'3', N'0', N'0', N'Chengmai Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2585', N'469024', N'临高县', N'269', N'3', N'0', N'0', N'Lingao Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2586', N'469025', N'白沙黎族自治县', N'269', N'3', N'0', N'0', N'Baisha Lizu Zizhixian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2587', N'469026', N'昌江黎族自治县', N'269', N'3', N'0', N'0', N'Changjiang Lizu Zizhixian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2588', N'469027', N'乐东黎族自治县', N'269', N'3', N'0', N'0', N'Ledong Lizu Zizhixian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2589', N'469028', N'陵水黎族自治县', N'269', N'3', N'0', N'0', N'Lingshui Lizu Zizhixian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2590', N'469029', N'保亭黎族苗族自治县', N'269', N'3', N'0', N'0', N'Baoting Lizu Miaozu Zizhixian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2591', N'469030', N'琼中黎族苗族自治县', N'269', N'3', N'0', N'0', N'Qiongzhong Lizu Miaozu Zizhixian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2592', N'469031', N'西沙群岛', N'269', N'3', N'0', N'0', N'Xisha Qundao', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2593', N'469032', N'南沙群岛', N'269', N'3', N'0', N'0', N'Nansha Qundao', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2594', N'469033', N'中沙群岛的岛礁及其海域', N'269', N'3', N'0', N'0', N'Zhongsha Qundao de Daojiao Jiqi Haiyu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2595', N'500101', N'万州区', N'270', N'3', N'0', N'0', N'Wanzhou Qu', N'WZO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2596', N'500102', N'涪陵区', N'270', N'3', N'0', N'0', N'Fuling Qu', N'FLG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2597', N'500103', N'渝中区', N'270', N'3', N'0', N'0', N'Yuzhong Qu', N'YZQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2598', N'500104', N'大渡口区', N'270', N'3', N'0', N'0', N'Dadukou Qu', N'DDK')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2599', N'500105', N'江北区', N'270', N'3', N'0', N'0', N'Jiangbei Qu', N'JBE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2600', N'500106', N'沙坪坝区', N'270', N'3', N'0', N'0', N'Shapingba Qu', N'SPB')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2601', N'500107', N'九龙坡区', N'270', N'3', N'0', N'0', N'Jiulongpo Qu', N'JLP')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2602', N'500108', N'南岸区', N'270', N'3', N'0', N'0', N'Nan,an Qu', N'NAQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2603', N'500109', N'北碚区', N'270', N'3', N'0', N'0', N'Beibei Qu', N'BBE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2604', N'500110', N'万盛区', N'270', N'3', N'0', N'0', N'Wansheng Qu', N'WSQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2605', N'500111', N'双桥区', N'270', N'3', N'0', N'0', N'Shuangqiao Qu', N'SQQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2606', N'500112', N'渝北区', N'270', N'3', N'0', N'0', N'Yubei Qu', N'YBE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2607', N'500113', N'巴南区', N'270', N'3', N'0', N'0', N'Banan Qu', N'BNN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2608', N'500114', N'黔江区', N'270', N'3', N'0', N'0', N'Qianjiang Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2609', N'500115', N'长寿区', N'270', N'3', N'0', N'0', N'Changshou Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2610', N'500222', N'綦江县', N'271', N'3', N'0', N'0', N'Qijiang Xian', N'QJG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2611', N'500223', N'潼南县', N'271', N'3', N'0', N'0', N'Tongnan Xian', N'TNN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2612', N'500224', N'铜梁县', N'271', N'3', N'0', N'0', N'Tongliang Xian', N'TGL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2613', N'500225', N'大足县', N'271', N'3', N'0', N'0', N'Dazu Xian', N'DZX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2614', N'500226', N'荣昌县', N'271', N'3', N'0', N'0', N'Rongchang Xian', N'RGC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2615', N'500227', N'璧山县', N'271', N'3', N'0', N'0', N'Bishan Xian', N'BSY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2616', N'500228', N'梁平县', N'271', N'3', N'0', N'0', N'Liangping Xian', N'LGP')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2617', N'500229', N'城口县', N'271', N'3', N'0', N'0', N'Chengkou Xian', N'CKO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2618', N'500230', N'丰都县', N'271', N'3', N'0', N'0', N'Fengdu Xian', N'FDU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2619', N'500231', N'垫江县', N'271', N'3', N'0', N'0', N'Dianjiang Xian', N'DJG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2620', N'500232', N'武隆县', N'271', N'3', N'0', N'0', N'Wulong Xian', N'WLG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2621', N'500233', N'忠县', N'271', N'3', N'0', N'0', N'Zhong Xian', N'ZHX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2622', N'500234', N'开县', N'271', N'3', N'0', N'0', N'Kai Xian', N'KAI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2623', N'500235', N'云阳县', N'271', N'3', N'0', N'0', N'Yunyang Xian', N'YNY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2624', N'500236', N'奉节县', N'271', N'3', N'0', N'0', N'Fengjie Xian', N'FJE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2625', N'500237', N'巫山县', N'271', N'3', N'0', N'0', N'Wushan Xian', N'WSN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2626', N'500238', N'巫溪县', N'271', N'3', N'0', N'0', N'Wuxi Xian', N'WXX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2627', N'500240', N'石柱土家族自治县', N'271', N'3', N'0', N'0', N'Shizhu Tujiazu Zizhixian', N'SZY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2628', N'500241', N'秀山土家族苗族自治县', N'271', N'3', N'0', N'0', N'Xiushan Tujiazu Miaozu Zizhixian', N'XUS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2629', N'500242', N'酉阳土家族苗族自治县', N'271', N'3', N'0', N'0', N'Youyang Tujiazu Miaozu Zizhixian', N'YUY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2630', N'500243', N'彭水苗族土家族自治县', N'271', N'3', N'0', N'0', N'Pengshui Miaozu Tujiazu Zizhixian', N'PSU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2635', N'510101', N'市辖区', N'273', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2636', N'510104', N'锦江区', N'273', N'3', N'0', N'0', N'Jinjiang Qu', N'JJQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2637', N'510105', N'青羊区', N'273', N'3', N'0', N'0', N'Qingyang Qu', N'QYQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2638', N'510106', N'金牛区', N'273', N'3', N'0', N'0', N'Jinniu Qu', N'JNU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2639', N'510107', N'武侯区', N'273', N'3', N'0', N'0', N'Wuhou Qu', N'WHQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2640', N'510108', N'成华区', N'273', N'3', N'0', N'0', N'Chenghua Qu', N'CHQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2641', N'510112', N'龙泉驿区', N'273', N'3', N'0', N'0', N'Longquanyi Qu', N'LQY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2642', N'510113', N'青白江区', N'273', N'3', N'0', N'0', N'Qingbaijiang Qu', N'QBJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2643', N'510114', N'新都区', N'273', N'3', N'0', N'0', N'Xindu Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2644', N'510115', N'温江区', N'273', N'3', N'0', N'0', N'Wenjiang Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2645', N'510121', N'金堂县', N'273', N'3', N'0', N'0', N'Jintang Xian', N'JNT')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2646', N'510122', N'双流县', N'273', N'3', N'0', N'0', N'Shuangliu Xian', N'SLU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2647', N'510124', N'郫县', N'273', N'3', N'0', N'0', N'Pi Xian', N'PIX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2648', N'510129', N'大邑县', N'273', N'3', N'0', N'0', N'Dayi Xian', N'DYI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2649', N'510131', N'蒲江县', N'273', N'3', N'0', N'0', N'Pujiang Xian', N'PJX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2650', N'510132', N'新津县', N'273', N'3', N'0', N'0', N'Xinjin Xian', N'XJC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2651', N'510181', N'都江堰市', N'273', N'3', N'0', N'0', N'Dujiangyan Shi', N'DJY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2652', N'510182', N'彭州市', N'273', N'3', N'0', N'0', N'Pengzhou Shi', N'PZS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2653', N'510183', N'邛崃市', N'273', N'3', N'0', N'0', N'Qionglai Shi', N'QLA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2654', N'510184', N'崇州市', N'273', N'3', N'0', N'0', N'Chongzhou Shi', N'CZO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2655', N'510301', N'市辖区', N'274', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2656', N'510302', N'自流井区', N'274', N'3', N'0', N'0', N'Ziliujing Qu', N'ZLJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2657', N'510303', N'贡井区', N'274', N'3', N'0', N'0', N'Gongjing Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2658', N'510304', N'大安区', N'274', N'3', N'0', N'0', N'Da,an Qu', N'DAQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2659', N'510311', N'沿滩区', N'274', N'3', N'0', N'0', N'Yantan Qu', N'YTN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2660', N'510321', N'荣县', N'274', N'3', N'0', N'0', N'Rong Xian', N'RGX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2661', N'510322', N'富顺县', N'274', N'3', N'0', N'0', N'Fushun Xian', N'FSH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2662', N'510401', N'市辖区', N'275', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2663', N'510402', N'东区', N'275', N'3', N'0', N'0', N'Dong Qu', N'DQP')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2664', N'510403', N'西区', N'275', N'3', N'0', N'0', N'Xi Qu', N'XIQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2665', N'510411', N'仁和区', N'275', N'3', N'0', N'0', N'Renhe Qu', N'RHQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2666', N'510421', N'米易县', N'275', N'3', N'0', N'0', N'Miyi Xian', N'MIY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2667', N'510422', N'盐边县', N'275', N'3', N'0', N'0', N'Yanbian Xian', N'YBN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2668', N'510501', N'市辖区', N'276', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2669', N'510502', N'江阳区', N'276', N'3', N'0', N'0', N'Jiangyang Qu', N'JYB')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2670', N'510503', N'纳溪区', N'276', N'3', N'0', N'0', N'Naxi Qu', N'NXI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2671', N'510504', N'龙马潭区', N'276', N'3', N'0', N'0', N'Longmatan Qu', N'LMT')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2672', N'510521', N'泸县', N'276', N'3', N'0', N'0', N'Lu Xian', N'LUX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2673', N'510522', N'合江县', N'276', N'3', N'0', N'0', N'Hejiang Xian', N'HEJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2674', N'510524', N'叙永县', N'276', N'3', N'0', N'0', N'Xuyong Xian', N'XYO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2675', N'510525', N'古蔺县', N'276', N'3', N'0', N'0', N'Gulin Xian', N'GUL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2676', N'510601', N'市辖区', N'277', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2677', N'510603', N'旌阳区', N'277', N'3', N'0', N'0', N'Jingyang Qu', N'JYF')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2678', N'510623', N'中江县', N'277', N'3', N'0', N'0', N'Zhongjiang Xian', N'ZGJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2679', N'510626', N'罗江县', N'277', N'3', N'0', N'0', N'Luojiang Xian', N'LOJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2680', N'510681', N'广汉市', N'277', N'3', N'0', N'0', N'Guanghan Shi', N'GHN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2681', N'510682', N'什邡市', N'277', N'3', N'0', N'0', N'Shifang Shi', N'SFS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2682', N'510683', N'绵竹市', N'277', N'3', N'0', N'0', N'Jinzhou Shi', N'MZU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2683', N'510701', N'市辖区', N'278', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2684', N'510703', N'涪城区', N'278', N'3', N'0', N'0', N'Fucheng Qu', N'FCM')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2685', N'510704', N'游仙区', N'278', N'3', N'0', N'0', N'Youxian Qu', N'YXM')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2686', N'510722', N'三台县', N'278', N'3', N'0', N'0', N'Santai Xian', N'SNT')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2687', N'510723', N'盐亭县', N'278', N'3', N'0', N'0', N'Yanting Xian', N'YTC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2688', N'510724', N'安县', N'278', N'3', N'0', N'0', N'An Xian', N'AXN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2689', N'510725', N'梓潼县', N'278', N'3', N'0', N'0', N'Zitong Xian', N'ZTG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2690', N'510726', N'北川羌族自治县', N'278', N'3', N'0', N'0', N'Beichuanqiangzuzizhi Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2691', N'510727', N'平武县', N'278', N'3', N'0', N'0', N'Pingwu Xian', N'PWU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2692', N'510781', N'江油市', N'278', N'3', N'0', N'0', N'Jiangyou Shi', N'JYO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2693', N'510801', N'市辖区', N'279', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2694', N'511002', N'市中区', N'279', N'3', N'0', N'0', N'Shizhong Qu', N'SZM')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2695', N'510811', N'元坝区', N'279', N'3', N'0', N'0', N'Yuanba Qu', N'YBQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2696', N'510812', N'朝天区', N'279', N'3', N'0', N'0', N'Chaotian Qu', N'CTN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2697', N'510821', N'旺苍县', N'279', N'3', N'0', N'0', N'Wangcang Xian', N'WGC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2698', N'510822', N'青川县', N'279', N'3', N'0', N'0', N'Qingchuan Xian', N'QCX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2699', N'510823', N'剑阁县', N'279', N'3', N'0', N'0', N'Jiange Xian', N'JGE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2700', N'510824', N'苍溪县', N'279', N'3', N'0', N'0', N'Cangxi Xian', N'CXC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2701', N'510901', N'市辖区', N'280', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2702', N'510903', N'船山区', N'280', N'3', N'0', N'0', N'Chuanshan Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2703', N'510904', N'安居区', N'280', N'3', N'0', N'0', N'Anju Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2704', N'510921', N'蓬溪县', N'280', N'3', N'0', N'0', N'Pengxi Xian', N'PXI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2705', N'510922', N'射洪县', N'280', N'3', N'0', N'0', N'Shehong Xian', N'SHE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2706', N'510923', N'大英县', N'280', N'3', N'0', N'0', N'Daying Xian', N'DAY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2707', N'511001', N'市辖区', N'281', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2709', N'511011', N'东兴区', N'281', N'3', N'0', N'0', N'Dongxing Qu', N'DXQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2710', N'511024', N'威远县', N'281', N'3', N'0', N'0', N'Weiyuan Xian', N'WYU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2711', N'511025', N'资中县', N'281', N'3', N'0', N'0', N'Zizhong Xian', N'ZZC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2712', N'511028', N'隆昌县', N'281', N'3', N'0', N'0', N'Longchang Xian', N'LCC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2713', N'511101', N'市辖区', N'282', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2714', N'511102', N'市中区', N'282', N'3', N'0', N'0', N'Shizhong Qu', N'SZP')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2715', N'511111', N'沙湾区', N'282', N'3', N'0', N'0', N'Shawan Qu', N'SWN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2716', N'511112', N'五通桥区', N'282', N'3', N'0', N'0', N'Wutongqiao Qu', N'WTQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2717', N'511113', N'金口河区', N'282', N'3', N'0', N'0', N'Jinkouhe Qu', N'JKH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2718', N'511123', N'犍为县', N'282', N'3', N'0', N'0', N'Qianwei Xian', N'QWE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2719', N'511124', N'井研县', N'282', N'3', N'0', N'0', N'Jingyan Xian', N'JYA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2720', N'511126', N'夹江县', N'282', N'3', N'0', N'0', N'Jiajiang Xian', N'JJC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2721', N'511129', N'沐川县', N'282', N'3', N'0', N'0', N'Muchuan Xian', N'MCH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2722', N'511132', N'峨边彝族自治县', N'282', N'3', N'0', N'0', N'Ebian Yizu Zizhixian', N'EBN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2723', N'511133', N'马边彝族自治县', N'282', N'3', N'0', N'0', N'Mabian Yizu Zizhixian', N'MBN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2724', N'511181', N'峨眉山市', N'282', N'3', N'0', N'0', N'Emeishan Shi', N'EMS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2725', N'511301', N'市辖区', N'283', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2726', N'511302', N'顺庆区', N'283', N'3', N'0', N'0', N'Shunqing Xian', N'SQG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2727', N'511303', N'高坪区', N'283', N'3', N'0', N'0', N'Gaoping Qu', N'GPQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2728', N'511304', N'嘉陵区', N'283', N'3', N'0', N'0', N'Jialing Qu', N'JLG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2729', N'511321', N'南部县', N'283', N'3', N'0', N'0', N'Nanbu Xian', N'NBU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2730', N'511322', N'营山县', N'283', N'3', N'0', N'0', N'Yingshan Xian', N'YGS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2731', N'511323', N'蓬安县', N'283', N'3', N'0', N'0', N'Peng,an Xian', N'PGA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2732', N'511324', N'仪陇县', N'283', N'3', N'0', N'0', N'Yilong Xian', N'YLC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2733', N'511325', N'西充县', N'283', N'3', N'0', N'0', N'Xichong Xian', N'XCO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2734', N'511381', N'阆中市', N'283', N'3', N'0', N'0', N'Langzhong Shi', N'LZJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2735', N'511401', N'市辖区', N'284', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2736', N'511402', N'东坡区', N'284', N'3', N'0', N'0', N'Dongpo Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2737', N'511421', N'仁寿县', N'284', N'3', N'0', N'0', N'Renshou Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2738', N'511422', N'彭山县', N'284', N'3', N'0', N'0', N'Pengshan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2739', N'511423', N'洪雅县', N'284', N'3', N'0', N'0', N'Hongya Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2740', N'511424', N'丹棱县', N'284', N'3', N'0', N'0', N'Danling Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2741', N'511425', N'青神县', N'284', N'3', N'0', N'0', N'Qingshen Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2742', N'511501', N'市辖区', N'285', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2743', N'511502', N'翠屏区', N'285', N'3', N'0', N'0', N'Cuiping Qu', N'CPQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2744', N'511521', N'宜宾县', N'285', N'3', N'0', N'0', N'Yibin Xian', N'YBX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2745', N'511522', N'南溪县', N'285', N'3', N'0', N'0', N'Nanxi Xian', N'NNX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2746', N'511523', N'江安县', N'285', N'3', N'0', N'0', N'Jiang,an Xian', N'JAC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2747', N'511524', N'长宁县', N'285', N'3', N'0', N'0', N'Changning Xian', N'CNX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2748', N'511525', N'高县', N'285', N'3', N'0', N'0', N'Gao Xian', N'GAO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2749', N'511526', N'珙县', N'285', N'3', N'0', N'0', N'Gong Xian', N'G')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2750', N'511527', N'筠连县', N'285', N'3', N'0', N'0', N'Junlian Xian', N'JNL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2751', N'511528', N'兴文县', N'285', N'3', N'0', N'0', N'Xingwen Xian', N'XWC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2752', N'511529', N'屏山县', N'285', N'3', N'0', N'0', N'Pingshan Xian', N'PSC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2753', N'511601', N'市辖区', N'286', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2754', N'511602', N'广安区', N'286', N'3', N'0', N'0', N'Guang,an Qu', N'GAQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2755', N'511621', N'岳池县', N'286', N'3', N'0', N'0', N'Yuechi Xian', N'YCC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2756', N'511622', N'武胜县', N'286', N'3', N'0', N'0', N'Wusheng Xian', N'WSG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2757', N'511623', N'邻水县', N'286', N'3', N'0', N'0', N'Linshui Xian', N'LSH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2759', N'511701', N'市辖区', N'287', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2760', N'511702', N'通川区', N'287', N'3', N'0', N'0', N'Tongchuan Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2761', N'511721', N'达县', N'287', N'3', N'0', N'0', N'Da Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2762', N'511722', N'宣汉县', N'287', N'3', N'0', N'0', N'Xuanhan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2763', N'511723', N'开江县', N'287', N'3', N'0', N'0', N'Kaijiang Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2764', N'511724', N'大竹县', N'287', N'3', N'0', N'0', N'Dazhu Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2765', N'511725', N'渠县', N'287', N'3', N'0', N'0', N'Qu Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2766', N'511781', N'万源市', N'287', N'3', N'0', N'0', N'Wanyuan Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2767', N'511801', N'市辖区', N'288', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2768', N'511802', N'雨城区', N'288', N'3', N'0', N'0', N'Yucheg Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2769', N'511821', N'名山县', N'288', N'3', N'0', N'0', N'Mingshan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2770', N'511822', N'荥经县', N'288', N'3', N'0', N'0', N'Yingjing Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2771', N'511823', N'汉源县', N'288', N'3', N'0', N'0', N'Hanyuan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2772', N'511824', N'石棉县', N'288', N'3', N'0', N'0', N'Shimian Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2773', N'511825', N'天全县', N'288', N'3', N'0', N'0', N'Tianquan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2774', N'511826', N'芦山县', N'288', N'3', N'0', N'0', N'Lushan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2775', N'511827', N'宝兴县', N'288', N'3', N'0', N'0', N'Baoxing Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2776', N'511901', N'市辖区', N'289', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2777', N'511902', N'巴州区', N'289', N'3', N'0', N'0', N'Bazhou Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2778', N'511921', N'通江县', N'289', N'3', N'0', N'0', N'Tongjiang Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2779', N'511922', N'南江县', N'289', N'3', N'0', N'0', N'Nanjiang Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2780', N'511923', N'平昌县', N'289', N'3', N'0', N'0', N'Pingchang Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2781', N'512001', N'市辖区', N'290', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2782', N'512002', N'雁江区', N'290', N'3', N'0', N'0', N'Yanjiang Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2783', N'512021', N'安岳县', N'290', N'3', N'0', N'0', N'Anyue Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2784', N'512022', N'乐至县', N'290', N'3', N'0', N'0', N'Lezhi Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2785', N'512081', N'简阳市', N'290', N'3', N'0', N'0', N'Jianyang Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2786', N'513221', N'汶川县', N'291', N'3', N'0', N'0', N'Wenchuan Xian', N'WNC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2787', N'513222', N'理县', N'291', N'3', N'0', N'0', N'Li Xian', N'LXC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2788', N'513223', N'茂县', N'291', N'3', N'0', N'0', N'Mao Xian', N'MAO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2789', N'513224', N'松潘县', N'291', N'3', N'0', N'0', N'Songpan Xian', N'SOP')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2790', N'513225', N'九寨沟县', N'291', N'3', N'0', N'0', N'Jiuzhaigou Xian', N'JZG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2791', N'513226', N'金川县', N'291', N'3', N'0', N'0', N'Jinchuan Xian', N'JCH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2792', N'513227', N'小金县', N'291', N'3', N'0', N'0', N'Xiaojin Xian', N'XJX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2793', N'513228', N'黑水县', N'291', N'3', N'0', N'0', N'Heishui Xian', N'HIS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2794', N'513229', N'马尔康县', N'291', N'3', N'0', N'0', N'Barkam Xian', N'BAK')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2795', N'513230', N'壤塘县', N'291', N'3', N'0', N'0', N'Zamtang Xian', N'ZAM')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2796', N'513231', N'阿坝县', N'291', N'3', N'0', N'0', N'Aba(Ngawa) Xian', N'ABX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2797', N'513232', N'若尔盖县', N'291', N'3', N'0', N'0', N'ZoigeXian', N'ZOI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2798', N'513233', N'红原县', N'291', N'3', N'0', N'0', N'Hongyuan Xian', N'HOY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2799', N'513321', N'康定县', N'292', N'3', N'0', N'0', N'Kangding(Dardo) Xian', N'KDX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2800', N'513322', N'泸定县', N'292', N'3', N'0', N'0', N'Luding(Jagsamka) Xian', N'LUD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2801', N'513323', N'丹巴县', N'292', N'3', N'0', N'0', N'Danba(Rongzhag) Xian', N'DBA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2802', N'513324', N'九龙县', N'292', N'3', N'0', N'0', N'Jiulong(Gyaisi) Xian', N'JLC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2803', N'513325', N'雅江县', N'292', N'3', N'0', N'0', N'Yajiang(Nyagquka) Xian', N'YAJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2804', N'513326', N'道孚县', N'292', N'3', N'0', N'0', N'Dawu Xian', N'DAW')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2805', N'513327', N'炉霍县', N'292', N'3', N'0', N'0', N'Luhuo(Zhaggo) Xian', N'LUH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2806', N'513328', N'甘孜县', N'292', N'3', N'0', N'0', N'Garze Xian', N'GRZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2807', N'513329', N'新龙县', N'292', N'3', N'0', N'0', N'Xinlong(Nyagrong) Xian', N'XLG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2808', N'513330', N'德格县', N'292', N'3', N'0', N'0', N'DegeXian', N'DEG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2809', N'513331', N'白玉县', N'292', N'3', N'0', N'0', N'Baiyu Xian', N'BYC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2810', N'513332', N'石渠县', N'292', N'3', N'0', N'0', N'Serxv Xian', N'SER')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2811', N'513333', N'色达县', N'292', N'3', N'0', N'0', N'Sertar Xian', N'STX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2812', N'513334', N'理塘县', N'292', N'3', N'0', N'0', N'Litang Xian', N'LIT')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2813', N'513335', N'巴塘县', N'292', N'3', N'0', N'0', N'Batang Xian', N'BTC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2814', N'513336', N'乡城县', N'292', N'3', N'0', N'0', N'Xiangcheng(Qagcheng) Xian', N'XCC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2815', N'513337', N'稻城县', N'292', N'3', N'0', N'0', N'Daocheng(Dabba) Xian', N'DCX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2816', N'513338', N'得荣县', N'292', N'3', N'0', N'0', N'Derong Xian', N'DER')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2817', N'513401', N'西昌市', N'293', N'3', N'0', N'0', N'Xichang Shi', N'XCA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2818', N'513422', N'木里藏族自治县', N'293', N'3', N'0', N'0', N'Muli Zangzu Zizhixian', N'MLI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2819', N'513423', N'盐源县', N'293', N'3', N'0', N'0', N'Yanyuan Xian', N'YYU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2820', N'513424', N'德昌县', N'293', N'3', N'0', N'0', N'Dechang Xian', N'DEC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2821', N'513425', N'会理县', N'293', N'3', N'0', N'0', N'Huili Xian', N'HLI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2822', N'513426', N'会东县', N'293', N'3', N'0', N'0', N'Huidong Xian', N'HDG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2823', N'513427', N'宁南县', N'293', N'3', N'0', N'0', N'Ningnan Xian', N'NIN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2824', N'513428', N'普格县', N'293', N'3', N'0', N'0', N'Puge Xian', N'PGE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2825', N'513429', N'布拖县', N'293', N'3', N'0', N'0', N'Butuo Xian', N'BTO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2826', N'513430', N'金阳县', N'293', N'3', N'0', N'0', N'Jinyang Xian', N'JYW')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2827', N'513431', N'昭觉县', N'293', N'3', N'0', N'0', N'Zhaojue Xian', N'ZJE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2828', N'513432', N'喜德县', N'293', N'3', N'0', N'0', N'Xide Xian', N'XDE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2829', N'513433', N'冕宁县', N'293', N'3', N'0', N'0', N'Mianning Xian', N'MNG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2830', N'513434', N'越西县', N'293', N'3', N'0', N'0', N'Yuexi Xian', N'YXC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2831', N'513435', N'甘洛县', N'293', N'3', N'0', N'0', N'Ganluo Xian', N'GLO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2832', N'513436', N'美姑县', N'293', N'3', N'0', N'0', N'Meigu Xian', N'MEG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2833', N'513437', N'雷波县', N'293', N'3', N'0', N'0', N'Leibo Xian', N'LBX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2834', N'520101', N'市辖区', N'294', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2835', N'520102', N'南明区', N'294', N'3', N'0', N'0', N'Nanming Qu', N'NMQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2836', N'520103', N'云岩区', N'294', N'3', N'0', N'0', N'Yunyan Qu', N'YYQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2837', N'520111', N'花溪区', N'294', N'3', N'0', N'0', N'Huaxi Qu', N'HXI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2838', N'520112', N'乌当区', N'294', N'3', N'0', N'0', N'Wudang Qu', N'WDQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2839', N'520113', N'白云区', N'294', N'3', N'0', N'0', N'Baiyun Qu', N'BYU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2840', N'520114', N'小河区', N'294', N'3', N'0', N'0', N'Xiaohe Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2841', N'520121', N'开阳县', N'294', N'3', N'0', N'0', N'Kaiyang Xian', N'KYG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2842', N'520122', N'息烽县', N'294', N'3', N'0', N'0', N'Xifeng Xian', N'XFX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2843', N'520123', N'修文县', N'294', N'3', N'0', N'0', N'Xiuwen Xian', N'XWX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2844', N'520181', N'清镇市', N'294', N'3', N'0', N'0', N'Qingzhen Shi', N'QZN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2845', N'520201', N'钟山区', N'295', N'3', N'0', N'0', N'Zhongshan Qu', N'ZSQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2846', N'520203', N'六枝特区', N'295', N'3', N'0', N'0', N'Liuzhi Tequ', N'LZT')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2847', N'520221', N'水城县', N'295', N'3', N'0', N'0', N'Shuicheng Xian', N'SUC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2848', N'520222', N'盘县', N'295', N'3', N'0', N'0', N'Pan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2849', N'520301', N'市辖区', N'296', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2850', N'520302', N'红花岗区', N'296', N'3', N'0', N'0', N'Honghuagang Qu', N'HHG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2851', N'520303', N'汇川区', N'296', N'3', N'0', N'0', N'Huichuan Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2852', N'520321', N'遵义县', N'296', N'3', N'0', N'0', N'Zunyi Xian', N'ZYI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2853', N'520322', N'桐梓县', N'296', N'3', N'0', N'0', N'Tongzi Xian', N'TZI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2854', N'520323', N'绥阳县', N'296', N'3', N'0', N'0', N'Suiyang Xian', N'SUY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2855', N'520324', N'正安县', N'296', N'3', N'0', N'0', N'Zhengan Xan', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2856', N'520325', N'道真仡佬族苗族自治县', N'296', N'3', N'0', N'0', N'Daozhen Gelaozu Miaozu Zizhixian', N'DZN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2857', N'520326', N'务川仡佬族苗族自治县', N'296', N'3', N'0', N'0', N'Wuchuan Gelaozu Miaozu Zizhixian', N'WCU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2858', N'520327', N'凤冈县', N'296', N'3', N'0', N'0', N'Fenggang Xian', N'FGG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2859', N'520328', N'湄潭县', N'296', N'3', N'0', N'0', N'Meitan Xian', N'MTN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2860', N'520329', N'余庆县', N'296', N'3', N'0', N'0', N'Yuqing Xian', N'YUQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2861', N'520330', N'习水县', N'296', N'3', N'0', N'0', N'Xishui Xian', N'XSI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2862', N'520381', N'赤水市', N'296', N'3', N'0', N'0', N'Chishui Shi', N'CSS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2863', N'520382', N'仁怀市', N'296', N'3', N'0', N'0', N'Renhuai Shi', N'RHS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2864', N'520401', N'市辖区', N'297', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2865', N'520402', N'西秀区', N'297', N'3', N'0', N'0', N'Xixiu Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2866', N'520421', N'平坝县', N'297', N'3', N'0', N'0', N'Pingba Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2867', N'520422', N'普定县', N'297', N'3', N'0', N'0', N'Puding Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2868', N'520423', N'镇宁布依族苗族自治县', N'297', N'3', N'0', N'0', N'Zhenning Buyeizu Miaozu Zizhixian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2869', N'520424', N'关岭布依族苗族自治县', N'297', N'3', N'0', N'0', N'Guanling Buyeizu Miaozu Zizhixian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2870', N'520425', N'紫云苗族布依族自治县', N'297', N'3', N'0', N'0', N'Ziyun Miaozu Buyeizu Zizhixian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2871', N'522201', N'铜仁市', N'298', N'3', N'0', N'0', N'Tongren Shi', N'TRS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2872', N'522222', N'江口县', N'298', N'3', N'0', N'0', N'Jiangkou Xian', N'JGK')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2873', N'522223', N'玉屏侗族自治县', N'298', N'3', N'0', N'0', N'Yuping Dongzu Zizhixian', N'YPG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2874', N'522224', N'石阡县', N'298', N'3', N'0', N'0', N'Shiqian Xian', N'SQI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2875', N'522225', N'思南县', N'298', N'3', N'0', N'0', N'Sinan Xian', N'SNA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2876', N'522226', N'印江土家族苗族自治县', N'298', N'3', N'0', N'0', N'Yinjiang Tujiazu Miaozu Zizhixian', N'YJY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2877', N'522227', N'德江县', N'298', N'3', N'0', N'0', N'Dejiang Xian', N'DEJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2878', N'522228', N'沿河土家族自治县', N'298', N'3', N'0', N'0', N'Yanhe Tujiazu Zizhixian', N'YHE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2879', N'522229', N'松桃苗族自治县', N'298', N'3', N'0', N'0', N'Songtao Miaozu Zizhixian', N'STM')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2880', N'522230', N'万山特区', N'298', N'3', N'0', N'0', N'Wanshan Tequ', N'WAS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2881', N'522301', N'兴义市', N'299', N'3', N'0', N'0', N'Xingyi Shi', N'XYI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2882', N'522322', N'兴仁县', N'299', N'3', N'0', N'0', N'Xingren Xian', N'XRN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2883', N'522323', N'普安县', N'299', N'3', N'0', N'0', N'Pu,an Xian', N'PUA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2884', N'522324', N'晴隆县', N'299', N'3', N'0', N'0', N'Qinglong Xian', N'QLG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2885', N'522325', N'贞丰县', N'299', N'3', N'0', N'0', N'Zhenfeng Xian', N'ZFG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2886', N'522326', N'望谟县', N'299', N'3', N'0', N'0', N'Wangmo Xian', N'WMO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2887', N'522327', N'册亨县', N'299', N'3', N'0', N'0', N'Ceheng Xian', N'CEH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2888', N'522328', N'安龙县', N'299', N'3', N'0', N'0', N'Anlong Xian', N'ALG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2889', N'522401', N'毕节市', N'300', N'3', N'0', N'0', N'Bijie Shi', N'BJE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2890', N'522422', N'大方县', N'300', N'3', N'0', N'0', N'Dafang Xian', N'DAF')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2891', N'522423', N'黔西县', N'300', N'3', N'0', N'0', N'Qianxi Xian', N'QNX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2892', N'522424', N'金沙县', N'300', N'3', N'0', N'0', N'Jinsha Xian', N'JSX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2893', N'522425', N'织金县', N'300', N'3', N'0', N'0', N'Zhijin Xian', N'ZJN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2894', N'522426', N'纳雍县', N'300', N'3', N'0', N'0', N'Nayong Xian', N'NYG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2895', N'522427', N'威宁彝族回族苗族自治县', N'300', N'3', N'0', N'0', N'Weining Yizu Huizu Miaozu Zizhixian', N'WNG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2896', N'522428', N'赫章县', N'300', N'3', N'0', N'0', N'Hezhang Xian', N'HZA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2897', N'522601', N'凯里市', N'301', N'3', N'0', N'0', N'Kaili Shi', N'KLS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2898', N'522622', N'黄平县', N'301', N'3', N'0', N'0', N'Huangping Xian', N'HPN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2899', N'522623', N'施秉县', N'301', N'3', N'0', N'0', N'Shibing Xian', N'SBG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2900', N'522624', N'三穗县', N'301', N'3', N'0', N'0', N'Sansui Xian', N'SAS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2901', N'522625', N'镇远县', N'301', N'3', N'0', N'0', N'Zhenyuan Xian', N'ZYX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2902', N'522626', N'岑巩县', N'301', N'3', N'0', N'0', N'Cengong Xian', N'CGX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2903', N'522627', N'天柱县', N'301', N'3', N'0', N'0', N'Tianzhu Xian', N'TZU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2904', N'522628', N'锦屏县', N'301', N'3', N'0', N'0', N'Jinping Xian', N'JPX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2905', N'522629', N'剑河县', N'301', N'3', N'0', N'0', N'Jianhe Xian', N'JHE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2906', N'522630', N'台江县', N'301', N'3', N'0', N'0', N'Taijiang Xian', N'TJX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2907', N'522631', N'黎平县', N'301', N'3', N'0', N'0', N'Liping Xian', N'LIP')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2908', N'522632', N'榕江县', N'301', N'3', N'0', N'0', N'Rongjiang Xian', N'RJG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2909', N'522633', N'从江县', N'301', N'3', N'0', N'0', N'Congjiang Xian', N'COJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2910', N'522634', N'雷山县', N'301', N'3', N'0', N'0', N'Leishan Xian', N'LSA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2911', N'522635', N'麻江县', N'301', N'3', N'0', N'0', N'Majiang Xian', N'MAJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2912', N'522636', N'丹寨县', N'301', N'3', N'0', N'0', N'Danzhai Xian', N'DZH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2913', N'522701', N'都匀市', N'302', N'3', N'0', N'0', N'Duyun Shi', N'DUY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2914', N'522702', N'福泉市', N'302', N'3', N'0', N'0', N'Fuquan Shi', N'FQN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2915', N'522722', N'荔波县', N'302', N'3', N'0', N'0', N'Libo Xian', N'LBO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2916', N'522723', N'贵定县', N'302', N'3', N'0', N'0', N'Guiding Xian', N'GDG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2917', N'522725', N'瓮安县', N'302', N'3', N'0', N'0', N'Weng,an Xian', N'WGA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2918', N'522726', N'独山县', N'302', N'3', N'0', N'0', N'Dushan Xian', N'DSX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2919', N'522727', N'平塘县', N'302', N'3', N'0', N'0', N'Pingtang Xian', N'PTG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2920', N'522728', N'罗甸县', N'302', N'3', N'0', N'0', N'Luodian Xian', N'LOD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2921', N'522729', N'长顺县', N'302', N'3', N'0', N'0', N'Changshun Xian', N'CSU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2922', N'522730', N'龙里县', N'302', N'3', N'0', N'0', N'Longli Xian', N'LLI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2923', N'522731', N'惠水县', N'302', N'3', N'0', N'0', N'Huishui Xian', N'HUS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2924', N'522732', N'三都水族自治县', N'302', N'3', N'0', N'0', N'Sandu Suizu Zizhixian', N'SDU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2925', N'530101', N'市辖区', N'303', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2926', N'530102', N'五华区', N'303', N'3', N'0', N'0', N'Wuhua Qu', N'WHA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2927', N'530103', N'盘龙区', N'303', N'3', N'0', N'0', N'Panlong Qu', N'PLQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2928', N'530111', N'官渡区', N'303', N'3', N'0', N'0', N'Guandu Qu', N'GDU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2929', N'530112', N'西山区', N'303', N'3', N'0', N'0', N'Xishan Qu', N'XSN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2930', N'530113', N'东川区', N'303', N'3', N'0', N'0', N'Dongchuan Qu', N'DCU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2931', N'530121', N'呈贡县', N'303', N'3', N'0', N'0', N'Chenggong Xian', N'CGD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2932', N'530122', N'晋宁县', N'303', N'3', N'0', N'0', N'Jinning Xian', N'JND')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2933', N'530124', N'富民县', N'303', N'3', N'0', N'0', N'Fumin Xian', N'FMN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2934', N'530125', N'宜良县', N'303', N'3', N'0', N'0', N'Yiliang Xian', N'YIL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2935', N'530126', N'石林彝族自治县', N'303', N'3', N'0', N'0', N'Shilin Yizu Zizhixian', N'SLY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2936', N'530127', N'嵩明县', N'303', N'3', N'0', N'0', N'Songming Xian', N'SMI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2937', N'530128', N'禄劝彝族苗族自治县', N'303', N'3', N'0', N'0', N'Luchuan Yizu Miaozu Zizhixian', N'LUC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2938', N'530129', N'寻甸回族彝族自治县', N'303', N'3', N'0', N'0', N'Xundian Huizu Yizu Zizhixian', N'XDN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2939', N'530181', N'安宁市', N'303', N'3', N'0', N'0', N'Anning Shi', N'ANG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2940', N'530301', N'市辖区', N'304', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2941', N'530302', N'麒麟区', N'304', N'3', N'0', N'0', N'Qilin Xian', N'QLQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2942', N'530321', N'马龙县', N'304', N'3', N'0', N'0', N'Malong Xian', N'MLO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2943', N'530322', N'陆良县', N'304', N'3', N'0', N'0', N'Luliang Xian', N'LLX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2944', N'530323', N'师宗县', N'304', N'3', N'0', N'0', N'Shizong Xian', N'SZD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2945', N'530324', N'罗平县', N'304', N'3', N'0', N'0', N'Luoping Xian', N'LPX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2946', N'530325', N'富源县', N'304', N'3', N'0', N'0', N'Fuyuan Xian', N'FYD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2947', N'530326', N'会泽县', N'304', N'3', N'0', N'0', N'Huize Xian', N'HUZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2948', N'530328', N'沾益县', N'304', N'3', N'0', N'0', N'Zhanyi Xian', N'ZYD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2949', N'530381', N'宣威市', N'304', N'3', N'0', N'0', N'Xuanwei Shi', N'XWS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2950', N'530401', N'市辖区', N'305', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2951', N'530402', N'红塔区', N'305', N'3', N'0', N'0', N'Hongta Qu', N'HTA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2952', N'530421', N'江川县', N'305', N'3', N'0', N'0', N'Jiangchuan Xian', N'JGC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2953', N'530422', N'澄江县', N'305', N'3', N'0', N'0', N'Chengjiang Xian', N'CGJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2954', N'530423', N'通海县', N'305', N'3', N'0', N'0', N'Tonghai Xian', N'THI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2955', N'530424', N'华宁县', N'305', N'3', N'0', N'0', N'Huaning Xian', N'HND')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2956', N'530425', N'易门县', N'305', N'3', N'0', N'0', N'Yimen Xian', N'YMD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2957', N'530426', N'峨山彝族自治县', N'305', N'3', N'0', N'0', N'Eshan Yizu Zizhixian', N'ESN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2958', N'530427', N'新平彝族傣族自治县', N'305', N'3', N'0', N'0', N'Xinping Yizu Daizu Zizhixian', N'XNP')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2959', N'530428', N'元江哈尼族彝族傣族自治县', N'305', N'3', N'0', N'0', N'Yuanjiang Hanizu Yizu Daizu Zizhixian', N'YJA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2960', N'530501', N'市辖区', N'306', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2961', N'530502', N'隆阳区', N'306', N'3', N'0', N'0', N'Longyang Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2962', N'530521', N'施甸县', N'306', N'3', N'0', N'0', N'Shidian Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2963', N'530522', N'腾冲县', N'306', N'3', N'0', N'0', N'Tengchong Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2964', N'530523', N'龙陵县', N'306', N'3', N'0', N'0', N'Longling Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2965', N'530524', N'昌宁县', N'306', N'3', N'0', N'0', N'Changning Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2966', N'530601', N'市辖区', N'307', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2967', N'530602', N'昭阳区', N'307', N'3', N'0', N'0', N'Zhaoyang Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2968', N'530621', N'鲁甸县', N'307', N'3', N'0', N'0', N'Ludian Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2969', N'530622', N'巧家县', N'307', N'3', N'0', N'0', N'Qiaojia Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2970', N'530623', N'盐津县', N'307', N'3', N'0', N'0', N'Yanjin Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2971', N'530624', N'大关县', N'307', N'3', N'0', N'0', N'Daguan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2972', N'530625', N'永善县', N'307', N'3', N'0', N'0', N'Yongshan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2973', N'530626', N'绥江县', N'307', N'3', N'0', N'0', N'Suijiang Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2974', N'530627', N'镇雄县', N'307', N'3', N'0', N'0', N'Zhenxiong Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2975', N'530628', N'彝良县', N'307', N'3', N'0', N'0', N'Yiliang Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2976', N'530629', N'威信县', N'307', N'3', N'0', N'0', N'Weixin Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2977', N'530630', N'水富县', N'307', N'3', N'0', N'0', N'Shuifu Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2978', N'530701', N'市辖区', N'308', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2979', N'530702', N'古城区', N'308', N'3', N'0', N'0', N'Gucheng Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2980', N'530721', N'玉龙纳西族自治县', N'308', N'3', N'0', N'0', N'Yulongnaxizuzizhi Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2981', N'530722', N'永胜县', N'308', N'3', N'0', N'0', N'Yongsheng Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2982', N'530723', N'华坪县', N'308', N'3', N'0', N'0', N'Huaping Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2983', N'530724', N'宁蒗彝族自治县', N'308', N'3', N'0', N'0', N'Ninglang Yizu Zizhixian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2984', N'530801', N'市辖区', N'309', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2985', N'530802', N'思茅区', N'309', N'3', N'0', N'0', N'Simao Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2986', N'530821', N'宁洱哈尼族彝族自治县', N'309', N'3', N'0', N'0', N'Pu,er Hanizu Yizu Zizhixian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2987', N'530822', N'墨江哈尼族自治县', N'309', N'3', N'0', N'0', N'Mojiang Hanizu Zizhixian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2988', N'530823', N'景东彝族自治县', N'309', N'3', N'0', N'0', N'Jingdong Yizu Zizhixian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2989', N'530824', N'景谷傣族彝族自治县', N'309', N'3', N'0', N'0', N'Jinggu Daizu Yizu Zizhixian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2990', N'530825', N'镇沅彝族哈尼族拉祜族自治县', N'309', N'3', N'0', N'0', N'Zhenyuan Yizu Hanizu Lahuzu Zizhixian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2991', N'530826', N'江城哈尼族彝族自治县', N'309', N'3', N'0', N'0', N'Jiangcheng Hanizu Yizu Zizhixian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2992', N'530827', N'孟连傣族拉祜族佤族自治县', N'309', N'3', N'0', N'0', N'Menglian Daizu Lahuzu Vazu Zizixian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2993', N'530828', N'澜沧拉祜族自治县', N'309', N'3', N'0', N'0', N'Lancang Lahuzu Zizhixian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2994', N'530829', N'西盟佤族自治县', N'309', N'3', N'0', N'0', N'Ximeng Vazu Zizhixian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2995', N'530901', N'市辖区', N'310', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2996', N'530902', N'临翔区', N'310', N'3', N'0', N'0', N'Linxiang Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2997', N'530921', N'凤庆县', N'310', N'3', N'0', N'0', N'Fengqing Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2998', N'530922', N'云县', N'310', N'3', N'0', N'0', N'Yun Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'2999', N'530923', N'永德县', N'310', N'3', N'0', N'0', N'Yongde Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3000', N'530924', N'镇康县', N'310', N'3', N'0', N'0', N'Zhenkang Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3001', N'530925', N'双江拉祜族佤族布朗族傣族自治县', N'310', N'3', N'0', N'0', N'Shuangjiang Lahuzu Vazu Bulangzu Daizu Zizhixian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3002', N'530926', N'耿马傣族佤族自治县', N'310', N'3', N'0', N'0', N'Gengma Daizu Vazu Zizhixian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3003', N'530927', N'沧源佤族自治县', N'310', N'3', N'0', N'0', N'Cangyuan Vazu Zizhixian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3004', N'532301', N'楚雄市', N'311', N'3', N'0', N'0', N'Chuxiong Shi', N'CXS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3005', N'532322', N'双柏县', N'311', N'3', N'0', N'0', N'Shuangbai Xian', N'SBA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3006', N'532323', N'牟定县', N'311', N'3', N'0', N'0', N'Mouding Xian', N'MDI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3007', N'532324', N'南华县', N'311', N'3', N'0', N'0', N'Nanhua Xian', N'NHA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3008', N'532325', N'姚安县', N'311', N'3', N'0', N'0', N'Yao,an Xian', N'YOA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3009', N'532326', N'大姚县', N'311', N'3', N'0', N'0', N'Dayao Xian', N'DYO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3010', N'532327', N'永仁县', N'311', N'3', N'0', N'0', N'Yongren Xian', N'YRN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3011', N'532328', N'元谋县', N'311', N'3', N'0', N'0', N'Yuanmou Xian', N'YMO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3012', N'532329', N'武定县', N'311', N'3', N'0', N'0', N'Wuding Xian', N'WDX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3013', N'532331', N'禄丰县', N'311', N'3', N'0', N'0', N'Lufeng Xian', N'LFX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3014', N'532501', N'个旧市', N'312', N'3', N'0', N'0', N'Gejiu Shi', N'GJU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3015', N'532502', N'开远市', N'312', N'3', N'0', N'0', N'Kaiyuan Shi', N'KYD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3016', N'532503', N'蒙自市', N'312', N'3', N'0', N'0', N'Mengzi Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3017', N'532523', N'屏边苗族自治县', N'312', N'3', N'0', N'0', N'Pingbian Miaozu Zizhixian', N'PBN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3018', N'532524', N'建水县', N'312', N'3', N'0', N'0', N'Jianshui Xian', N'JSD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3019', N'532525', N'石屏县', N'312', N'3', N'0', N'0', N'Shiping Xian', N'SPG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3020', N'532526', N'弥勒县', N'312', N'3', N'0', N'0', N'Mile Xian', N'MIL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3021', N'532527', N'泸西县', N'312', N'3', N'0', N'0', N'Luxi Xian', N'LXD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3022', N'532528', N'元阳县', N'312', N'3', N'0', N'0', N'Yuanyang Xian', N'YYD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3023', N'532529', N'红河县', N'312', N'3', N'0', N'0', N'Honghe Xian', N'HHX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3024', N'532530', N'金平苗族瑶族傣族自治县', N'312', N'3', N'0', N'0', N'Jinping Miaozu Yaozu Daizu Zizhixian', N'JNP')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3025', N'532531', N'绿春县', N'312', N'3', N'0', N'0', N'Lvchun Xian', N'LCX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3026', N'532532', N'河口瑶族自治县', N'312', N'3', N'0', N'0', N'Hekou Yaozu Zizhixian', N'HKM')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3027', N'532621', N'文山县', N'313', N'3', N'0', N'0', N'Wenshan Xian', N'WES')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3028', N'532622', N'砚山县', N'313', N'3', N'0', N'0', N'Yanshan Xian', N'YSD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3029', N'532623', N'西畴县', N'313', N'3', N'0', N'0', N'Xichou Xian', N'XIC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3030', N'532624', N'麻栗坡县', N'313', N'3', N'0', N'0', N'Malipo Xian', N'MLP')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3031', N'532625', N'马关县', N'313', N'3', N'0', N'0', N'Maguan Xian', N'MGN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3032', N'532626', N'丘北县', N'313', N'3', N'0', N'0', N'Qiubei Xian', N'QBE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3033', N'532627', N'广南县', N'313', N'3', N'0', N'0', N'Guangnan Xian', N'GGN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3034', N'532628', N'富宁县', N'313', N'3', N'0', N'0', N'Funing Xian', N'FND')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3035', N'532801', N'景洪市', N'314', N'3', N'0', N'0', N'Jinghong Shi', N'JHG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3036', N'532822', N'勐海县', N'314', N'3', N'0', N'0', N'Menghai Xian', N'MHI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3037', N'532823', N'勐腊县', N'314', N'3', N'0', N'0', N'Mengla Xian', N'MLA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3038', N'532901', N'大理市', N'315', N'3', N'0', N'0', N'Dali Shi', N'DLS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3039', N'532922', N'漾濞彝族自治县', N'315', N'3', N'0', N'0', N'Yangbi Yizu Zizhixian', N'YGB')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3040', N'532923', N'祥云县', N'315', N'3', N'0', N'0', N'Xiangyun Xian', N'XYD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3041', N'532924', N'宾川县', N'315', N'3', N'0', N'0', N'Binchuan Xian', N'BCD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3042', N'532925', N'弥渡县', N'315', N'3', N'0', N'0', N'Midu Xian', N'MDU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3043', N'532926', N'南涧彝族自治县', N'315', N'3', N'0', N'0', N'Nanjian Yizu Zizhixian', N'NNJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3044', N'532927', N'巍山彝族回族自治县', N'315', N'3', N'0', N'0', N'Weishan Yizu Huizu Zizhixian', N'WSY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3045', N'532928', N'永平县', N'315', N'3', N'0', N'0', N'Yongping Xian', N'YPX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3046', N'532929', N'云龙县', N'315', N'3', N'0', N'0', N'Yunlong Xian', N'YLO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3047', N'532930', N'洱源县', N'315', N'3', N'0', N'0', N'Eryuan Xian', N'EYN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3048', N'532931', N'剑川县', N'315', N'3', N'0', N'0', N'Jianchuan Xian', N'JIC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3049', N'532932', N'鹤庆县', N'315', N'3', N'0', N'0', N'Heqing Xian', N'HQG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3050', N'533102', N'瑞丽市', N'316', N'3', N'0', N'0', N'Ruili Shi', N'RUI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3051', N'533103', N'芒市', N'316', N'3', N'0', N'0', N'Luxi Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3052', N'533122', N'梁河县', N'316', N'3', N'0', N'0', N'Lianghe Xian', N'LHD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3053', N'533123', N'盈江县', N'316', N'3', N'0', N'0', N'Yingjiang Xian', N'YGJ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3054', N'533124', N'陇川县', N'316', N'3', N'0', N'0', N'Longchuan Xian', N'LCN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3055', N'533321', N'泸水县', N'317', N'3', N'0', N'0', N'Lushui Xian', N'LSX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3056', N'533323', N'福贡县', N'317', N'3', N'0', N'0', N'Fugong Xian', N'F')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3057', N'533324', N'贡山独龙族怒族自治县', N'317', N'3', N'0', N'0', N'Gongshan Dulongzu Nuzu Zizhixian', N'GSN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3058', N'533325', N'兰坪白族普米族自治县', N'317', N'3', N'0', N'0', N'Lanping Baizu Pumizu Zizhixian', N'LPG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3059', N'533421', N'香格里拉县', N'318', N'3', N'0', N'0', N'Xianggelila Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3060', N'533422', N'德钦县', N'318', N'3', N'0', N'0', N'Deqen Xian', N'DQN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3061', N'533423', N'维西傈僳族自治县', N'318', N'3', N'0', N'0', N'Weixi Lisuzu Zizhixian', N'WXI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3062', N'540101', N'市辖区', N'319', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3063', N'540102', N'城关区', N'319', N'3', N'0', N'0', N'Chengguang Qu', N'CGN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3064', N'540121', N'林周县', N'319', N'3', N'0', N'0', N'Lhvnzhub Xian', N'LZB')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3065', N'540122', N'当雄县', N'319', N'3', N'0', N'0', N'Damxung Xian', N'DAM')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3066', N'540123', N'尼木县', N'319', N'3', N'0', N'0', N'Nyemo Xian', N'NYE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3067', N'540124', N'曲水县', N'319', N'3', N'0', N'0', N'Qvxv Xian', N'QUX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3068', N'540125', N'堆龙德庆县', N'319', N'3', N'0', N'0', N'Doilungdeqen Xian', N'DOI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3069', N'540126', N'达孜县', N'319', N'3', N'0', N'0', N'Dagze Xian', N'DAG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3070', N'540127', N'墨竹工卡县', N'319', N'3', N'0', N'0', N'Maizhokunggar Xian', N'MAI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3071', N'542121', N'昌都县', N'320', N'3', N'0', N'0', N'Qamdo Xian', N'QAX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3072', N'542122', N'江达县', N'320', N'3', N'0', N'0', N'Jomda Xian', N'JOM')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3073', N'542123', N'贡觉县', N'320', N'3', N'0', N'0', N'Konjo Xian', N'KON')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3074', N'542124', N'类乌齐县', N'320', N'3', N'0', N'0', N'Riwoqe Xian', N'RIW')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3075', N'542125', N'丁青县', N'320', N'3', N'0', N'0', N'Dengqen Xian', N'DEN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3076', N'542126', N'察雅县', N'320', N'3', N'0', N'0', N'Chagyab Xian', N'CHA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3077', N'542127', N'八宿县', N'320', N'3', N'0', N'0', N'Baxoi Xian', N'BAX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3078', N'542128', N'左贡县', N'320', N'3', N'0', N'0', N'Zogang Xian', N'ZOX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3079', N'542129', N'芒康县', N'320', N'3', N'0', N'0', N'Mangkam Xian', N'MAN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3080', N'542132', N'洛隆县', N'320', N'3', N'0', N'0', N'Lhorong Xian', N'LHO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3081', N'542133', N'边坝县', N'320', N'3', N'0', N'0', N'Banbar Xian', N'BAN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3082', N'542221', N'乃东县', N'321', N'3', N'0', N'0', N'Nedong Xian', N'NED')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3083', N'542222', N'扎囊县', N'321', N'3', N'0', N'0', N'Chanang(Chatang) Xian', N'CNG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3084', N'542223', N'贡嘎县', N'321', N'3', N'0', N'0', N'Gonggar Xian', N'N')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3085', N'542224', N'桑日县', N'321', N'3', N'0', N'0', N'Sangri Xian', N'SRI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3086', N'542225', N'琼结县', N'321', N'3', N'0', N'0', N'Qonggyai Xian', N'QON')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3087', N'542226', N'曲松县', N'321', N'3', N'0', N'0', N'Qusum Xian', N'QUS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3088', N'542227', N'措美县', N'321', N'3', N'0', N'0', N'Comai Xian', N'COM')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3089', N'542228', N'洛扎县', N'321', N'3', N'0', N'0', N'Lhozhag Xian', N'LHX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3090', N'542229', N'加查县', N'321', N'3', N'0', N'0', N'Gyaca Xian', N'GYA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3091', N'542231', N'隆子县', N'321', N'3', N'0', N'0', N'Lhvnze Xian', N'LHZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3092', N'542232', N'错那县', N'321', N'3', N'0', N'0', N'Cona Xian', N'CON')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3093', N'542233', N'浪卡子县', N'321', N'3', N'0', N'0', N'Nagarze Xian', N'NAX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3094', N'542301', N'日喀则市', N'322', N'3', N'0', N'0', N'Xigaze Shi', N'XIG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3095', N'542322', N'南木林县', N'322', N'3', N'0', N'0', N'Namling Xian', N'NAM')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3096', N'542323', N'江孜县', N'322', N'3', N'0', N'0', N'Gyangze Xian', N'GYZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3097', N'542324', N'定日县', N'322', N'3', N'0', N'0', N'Tingri Xian', N'TIN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3098', N'542325', N'萨迦县', N'322', N'3', N'0', N'0', N'Sa,gya Xian', N'SGX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3099', N'542326', N'拉孜县', N'322', N'3', N'0', N'0', N'Lhaze Xian', N'LAZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3100', N'542327', N'昂仁县', N'322', N'3', N'0', N'0', N'Ngamring Xian', N'NGA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3101', N'542328', N'谢通门县', N'322', N'3', N'0', N'0', N'Xaitongmoin Xian', N'XTM')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3102', N'542329', N'白朗县', N'322', N'3', N'0', N'0', N'Bainang Xian', N'BAI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3103', N'542330', N'仁布县', N'322', N'3', N'0', N'0', N'Rinbung Xian', N'RIN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3104', N'542331', N'康马县', N'322', N'3', N'0', N'0', N'Kangmar Xian', N'KAN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3105', N'542332', N'定结县', N'322', N'3', N'0', N'0', N'Dinggye Xian', N'DIN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3106', N'542333', N'仲巴县', N'322', N'3', N'0', N'0', N'Zhongba Xian', N'ZHB')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3107', N'542334', N'亚东县', N'322', N'3', N'0', N'0', N'Yadong(Chomo) Xian', N'YDZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3108', N'542335', N'吉隆县', N'322', N'3', N'0', N'0', N'Gyirong Xian', N'GIR')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3109', N'542336', N'聂拉木县', N'322', N'3', N'0', N'0', N'Nyalam Xian', N'NYA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3110', N'542337', N'萨嘎县', N'322', N'3', N'0', N'0', N'Saga Xian', N'SAG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3111', N'542338', N'岗巴县', N'322', N'3', N'0', N'0', N'Gamba Xian', N'GAM')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3112', N'542421', N'那曲县', N'323', N'3', N'0', N'0', N'Nagqu Xian', N'NAG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3113', N'542422', N'嘉黎县', N'323', N'3', N'0', N'0', N'Lhari Xian', N'LHR')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3114', N'542423', N'比如县', N'323', N'3', N'0', N'0', N'Biru Xian', N'BRU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3115', N'542424', N'聂荣县', N'323', N'3', N'0', N'0', N'Nyainrong Xian', N'NRO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3116', N'542425', N'安多县', N'323', N'3', N'0', N'0', N'Amdo Xian', N'AMD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3117', N'542426', N'申扎县', N'323', N'3', N'0', N'0', N'Xainza Xian', N'XZX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3118', N'542427', N'索县', N'323', N'3', N'0', N'0', N'Sog Xian', N'SOG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3119', N'542428', N'班戈县', N'323', N'3', N'0', N'0', N'Bangoin Xian', N'BGX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3120', N'542429', N'巴青县', N'323', N'3', N'0', N'0', N'Baqen Xian', N'BQE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3121', N'542430', N'尼玛县', N'323', N'3', N'0', N'0', N'Nyima Xian', N'NYX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3122', N'542521', N'普兰县', N'324', N'3', N'0', N'0', N'Burang Xian', N'BUR')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3123', N'542522', N'札达县', N'324', N'3', N'0', N'0', N'Zanda Xian', N'ZAN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3124', N'542523', N'噶尔县', N'324', N'3', N'0', N'0', N'Gar Xian', N'GAR')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3125', N'542524', N'日土县', N'324', N'3', N'0', N'0', N'Rutog Xian', N'RUT')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3126', N'542525', N'革吉县', N'324', N'3', N'0', N'0', N'Ge,gyai Xian', N'GEG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3127', N'542526', N'改则县', N'324', N'3', N'0', N'0', N'Gerze Xian', N'GER')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3128', N'542527', N'措勤县', N'324', N'3', N'0', N'0', N'Coqen Xian', N'COQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3129', N'542621', N'林芝县', N'325', N'3', N'0', N'0', N'Nyingchi Xian', N'NYI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3130', N'542622', N'工布江达县', N'325', N'3', N'0', N'0', N'Gongbo,gyamda Xian', N'X')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3131', N'542623', N'米林县', N'325', N'3', N'0', N'0', N'Mainling Xian', N'MAX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3132', N'542624', N'墨脱县', N'325', N'3', N'0', N'0', N'Metog Xian', N'MET')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3133', N'542625', N'波密县', N'325', N'3', N'0', N'0', N'Bomi(Bowo) Xian', N'BMI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3134', N'542626', N'察隅县', N'325', N'3', N'0', N'0', N'Zayv Xian', N'ZAY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3135', N'542627', N'朗县', N'325', N'3', N'0', N'0', N'Nang Xian', N'NGX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3136', N'610101', N'市辖区', N'326', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3137', N'610102', N'新城区', N'326', N'3', N'0', N'0', N'Xincheng Qu', N'XCK')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3138', N'610103', N'碑林区', N'326', N'3', N'0', N'0', N'Beilin Qu', N'BLQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3139', N'610104', N'莲湖区', N'326', N'3', N'0', N'0', N'Lianhu Qu', N'LHU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3140', N'610111', N'灞桥区', N'326', N'3', N'0', N'0', N'Baqiao Qu', N'BQQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3141', N'610112', N'未央区', N'326', N'3', N'0', N'0', N'Weiyang Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3142', N'610113', N'雁塔区', N'326', N'3', N'0', N'0', N'Yanta Qu', N'YTA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3143', N'610114', N'阎良区', N'326', N'3', N'0', N'0', N'Yanliang Qu', N'YLQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3144', N'610115', N'临潼区', N'326', N'3', N'0', N'0', N'Lintong Qu', N'LTG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3145', N'610116', N'长安区', N'326', N'3', N'0', N'0', N'Changan Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3146', N'610122', N'蓝田县', N'326', N'3', N'0', N'0', N'Lantian Xian', N'LNT')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3147', N'610124', N'周至县', N'326', N'3', N'0', N'0', N'Zhouzhi Xian', N'ZOZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3148', N'610125', N'户县', N'326', N'3', N'0', N'0', N'Hu Xian', N'HUX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3149', N'610126', N'高陵县', N'326', N'3', N'0', N'0', N'Gaoling Xian', N'GLS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3150', N'610201', N'市辖区', N'327', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3151', N'610202', N'王益区', N'327', N'3', N'0', N'0', N'Wangyi Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3152', N'610203', N'印台区', N'327', N'3', N'0', N'0', N'Yintai Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3153', N'610204', N'耀州区', N'327', N'3', N'0', N'0', N'Yaozhou Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3154', N'610222', N'宜君县', N'327', N'3', N'0', N'0', N'Yijun Xian', N'YJU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3155', N'610301', N'市辖区', N'328', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3156', N'610302', N'渭滨区', N'328', N'3', N'0', N'0', N'Weibin Qu', N'WBQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3157', N'610303', N'金台区', N'328', N'3', N'0', N'0', N'Jintai Qu', N'JTQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3158', N'610304', N'陈仓区', N'328', N'3', N'0', N'0', N'Chencang Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3159', N'610322', N'凤翔县', N'328', N'3', N'0', N'0', N'Fengxiang Xian', N'FXG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3160', N'610323', N'岐山县', N'328', N'3', N'0', N'0', N'Qishan Xian', N'QIS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3161', N'610324', N'扶风县', N'328', N'3', N'0', N'0', N'Fufeng Xian', N'FFG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3162', N'610326', N'眉县', N'328', N'3', N'0', N'0', N'Mei Xian', N'MEI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3163', N'610327', N'陇县', N'328', N'3', N'0', N'0', N'Long Xian', N'LON')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3164', N'610328', N'千阳县', N'328', N'3', N'0', N'0', N'Qianyang Xian', N'QNY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3165', N'610329', N'麟游县', N'328', N'3', N'0', N'0', N'Linyou Xian', N'LYP')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3166', N'610330', N'凤县', N'328', N'3', N'0', N'0', N'Feng Xian', N'FEG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3167', N'610331', N'太白县', N'328', N'3', N'0', N'0', N'Taibai Xian', N'TBA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3168', N'610401', N'市辖区', N'329', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3169', N'610402', N'秦都区', N'329', N'3', N'0', N'0', N'Qindu Qu', N'QDU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3170', N'610403', N'杨陵区', N'329', N'3', N'0', N'0', N'Yangling Qu', N'YGL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3171', N'610404', N'渭城区', N'329', N'3', N'0', N'0', N'Weicheng Qu', N'WIC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3172', N'610422', N'三原县', N'329', N'3', N'0', N'0', N'Sanyuan Xian', N'SYN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3173', N'610423', N'泾阳县', N'329', N'3', N'0', N'0', N'Jingyang Xian', N'JGY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3174', N'610424', N'乾县', N'329', N'3', N'0', N'0', N'Qian Xian', N'QIA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3175', N'610425', N'礼泉县', N'329', N'3', N'0', N'0', N'Liquan Xian', N'LIQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3176', N'610426', N'永寿县', N'329', N'3', N'0', N'0', N'Yongshou Xian', N'YSH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3177', N'610427', N'彬县', N'329', N'3', N'0', N'0', N'Bin Xian', N'BIX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3178', N'610428', N'长武县', N'329', N'3', N'0', N'0', N'Changwu Xian', N'CWU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3179', N'610429', N'旬邑县', N'329', N'3', N'0', N'0', N'Xunyi Xian', N'XNY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3180', N'610430', N'淳化县', N'329', N'3', N'0', N'0', N'Chunhua Xian', N'CHU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3181', N'610431', N'武功县', N'329', N'3', N'0', N'0', N'Wugong Xian', N'WGG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3182', N'610481', N'兴平市', N'329', N'3', N'0', N'0', N'Xingping Shi', N'XPG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3183', N'610501', N'市辖区', N'330', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3184', N'610502', N'临渭区', N'330', N'3', N'0', N'0', N'Linwei Qu', N'LWE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3185', N'610521', N'华县', N'330', N'3', N'0', N'0', N'Hua Xian', N'HXN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3186', N'610522', N'潼关县', N'330', N'3', N'0', N'0', N'Tongguan Xian', N'TGN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3187', N'610523', N'大荔县', N'330', N'3', N'0', N'0', N'Dali Xian', N'DAL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3188', N'610524', N'合阳县', N'330', N'3', N'0', N'0', N'Heyang Xian', N'HYK')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3189', N'610525', N'澄城县', N'330', N'3', N'0', N'0', N'Chengcheng Xian', N'CCG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3190', N'610526', N'蒲城县', N'330', N'3', N'0', N'0', N'Pucheng Xian', N'PUC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3191', N'610527', N'白水县', N'330', N'3', N'0', N'0', N'Baishui Xian', N'BSU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3192', N'610528', N'富平县', N'330', N'3', N'0', N'0', N'Fuping Xian', N'FPX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3193', N'610581', N'韩城市', N'330', N'3', N'0', N'0', N'Hancheng Shi', N'HCE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3194', N'610582', N'华阴市', N'330', N'3', N'0', N'0', N'Huayin Shi', N'HYI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3195', N'610601', N'市辖区', N'331', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3196', N'610602', N'宝塔区', N'331', N'3', N'0', N'0', N'Baota Qu', N'BTA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3197', N'610621', N'延长县', N'331', N'3', N'0', N'0', N'Yanchang Xian', N'YCA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3198', N'610622', N'延川县', N'331', N'3', N'0', N'0', N'Yanchuan Xian', N'YCT')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3199', N'610623', N'子长县', N'331', N'3', N'0', N'0', N'Zichang Xian', N'ZCA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3200', N'610624', N'安塞县', N'331', N'3', N'0', N'0', N'Ansai Xian', N'ANS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3201', N'610625', N'志丹县', N'331', N'3', N'0', N'0', N'Zhidan Xian', N'ZDN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3202', N'610626', N'吴起县', N'331', N'3', N'0', N'0', N'Wuqi Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3203', N'610627', N'甘泉县', N'331', N'3', N'0', N'0', N'Ganquan Xian', N'GQN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3204', N'610628', N'富县', N'331', N'3', N'0', N'0', N'Fu Xian', N'FUX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3205', N'610629', N'洛川县', N'331', N'3', N'0', N'0', N'Luochuan Xian', N'LCW')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3206', N'610630', N'宜川县', N'331', N'3', N'0', N'0', N'Yichuan Xian', N'YIC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3207', N'610631', N'黄龙县', N'331', N'3', N'0', N'0', N'Huanglong Xian', N'HGL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3208', N'610632', N'黄陵县', N'331', N'3', N'0', N'0', N'Huangling Xian', N'HLG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3209', N'610701', N'市辖区', N'332', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3210', N'610702', N'汉台区', N'332', N'3', N'0', N'0', N'Hantai Qu', N'HTQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3211', N'610721', N'南郑县', N'332', N'3', N'0', N'0', N'Nanzheng Xian', N'NZG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3212', N'610722', N'城固县', N'332', N'3', N'0', N'0', N'Chenggu Xian', N'CGU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3213', N'610723', N'洋县', N'332', N'3', N'0', N'0', N'Yang Xian', N'YGX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3214', N'610724', N'西乡县', N'332', N'3', N'0', N'0', N'Xixiang Xian', N'XXA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3215', N'610725', N'勉县', N'332', N'3', N'0', N'0', N'Mian Xian', N'MIA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3216', N'610726', N'宁强县', N'332', N'3', N'0', N'0', N'Ningqiang Xian', N'NQG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3217', N'610727', N'略阳县', N'332', N'3', N'0', N'0', N'Lueyang Xian', N'LYC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3218', N'610728', N'镇巴县', N'332', N'3', N'0', N'0', N'Zhenba Xian', N'ZBA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3219', N'610729', N'留坝县', N'332', N'3', N'0', N'0', N'Liuba Xian', N'LBA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3220', N'610730', N'佛坪县', N'332', N'3', N'0', N'0', N'Foping Xian', N'FPG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3221', N'610801', N'市辖区', N'333', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3222', N'610802', N'榆阳区', N'333', N'3', N'0', N'0', N'Yuyang Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3223', N'610821', N'神木县', N'333', N'3', N'0', N'0', N'Shenmu Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3224', N'610822', N'府谷县', N'333', N'3', N'0', N'0', N'Fugu Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3225', N'610823', N'横山县', N'333', N'3', N'0', N'0', N'Hengshan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3226', N'610824', N'靖边县', N'333', N'3', N'0', N'0', N'Jingbian Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3227', N'610825', N'定边县', N'333', N'3', N'0', N'0', N'Dingbian Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3228', N'610826', N'绥德县', N'333', N'3', N'0', N'0', N'Suide Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3229', N'610827', N'米脂县', N'333', N'3', N'0', N'0', N'Mizhi Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3230', N'610828', N'佳县', N'333', N'3', N'0', N'0', N'Jia Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3231', N'610829', N'吴堡县', N'333', N'3', N'0', N'0', N'Wubu Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3232', N'610830', N'清涧县', N'333', N'3', N'0', N'0', N'Qingjian Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3233', N'610831', N'子洲县', N'333', N'3', N'0', N'0', N'Zizhou Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3234', N'610901', N'市辖区', N'334', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3235', N'610902', N'汉滨区', N'334', N'3', N'0', N'0', N'Hanbin Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3236', N'610921', N'汉阴县', N'334', N'3', N'0', N'0', N'Hanyin Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3237', N'610922', N'石泉县', N'334', N'3', N'0', N'0', N'Shiquan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3238', N'610923', N'宁陕县', N'334', N'3', N'0', N'0', N'Ningshan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3239', N'610924', N'紫阳县', N'334', N'3', N'0', N'0', N'Ziyang Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3240', N'610925', N'岚皋县', N'334', N'3', N'0', N'0', N'Langao Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3241', N'610926', N'平利县', N'334', N'3', N'0', N'0', N'Pingli Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3242', N'610927', N'镇坪县', N'334', N'3', N'0', N'0', N'Zhenping Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3243', N'610928', N'旬阳县', N'334', N'3', N'0', N'0', N'Xunyang Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3244', N'610929', N'白河县', N'334', N'3', N'0', N'0', N'Baihe Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3245', N'611001', N'市辖区', N'335', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3246', N'611002', N'商州区', N'335', N'3', N'0', N'0', N'Shangzhou Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3247', N'611021', N'洛南县', N'335', N'3', N'0', N'0', N'Luonan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3248', N'611022', N'丹凤县', N'335', N'3', N'0', N'0', N'Danfeng Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3249', N'611023', N'商南县', N'335', N'3', N'0', N'0', N'Shangnan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3250', N'611024', N'山阳县', N'335', N'3', N'0', N'0', N'Shanyang Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3251', N'611025', N'镇安县', N'335', N'3', N'0', N'0', N'Zhen,an Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3252', N'611026', N'柞水县', N'335', N'3', N'0', N'0', N'Zhashui Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3253', N'620101', N'市辖区', N'336', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3254', N'620102', N'城关区', N'336', N'3', N'0', N'0', N'Chengguan Qu', N'CLZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3255', N'620103', N'七里河区', N'336', N'3', N'0', N'0', N'Qilihe Qu', N'QLH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3256', N'620104', N'西固区', N'336', N'3', N'0', N'0', N'Xigu Qu', N'XGU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3257', N'620105', N'安宁区', N'336', N'3', N'0', N'0', N'Anning Qu', N'ANQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3258', N'620111', N'红古区', N'336', N'3', N'0', N'0', N'Honggu Qu', N'HOG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3259', N'620121', N'永登县', N'336', N'3', N'0', N'0', N'Yongdeng Xian', N'YDG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3260', N'620122', N'皋兰县', N'336', N'3', N'0', N'0', N'Gaolan Xian', N'GAL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3261', N'620123', N'榆中县', N'336', N'3', N'0', N'0', N'Yuzhong Xian', N'YZX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3262', N'620201', N'市辖区', N'337', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3263', N'620301', N'市辖区', N'338', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3264', N'620302', N'金川区', N'338', N'3', N'0', N'0', N'Jinchuan Qu', N'JCU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3265', N'620321', N'永昌县', N'338', N'3', N'0', N'0', N'Yongchang Xian', N'YCF')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3266', N'620401', N'市辖区', N'339', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3267', N'620402', N'白银区', N'339', N'3', N'0', N'0', N'Baiyin Qu', N'BYB')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3268', N'620403', N'平川区', N'339', N'3', N'0', N'0', N'Pingchuan Qu', N'PCQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3269', N'620421', N'靖远县', N'339', N'3', N'0', N'0', N'Jingyuan Xian', N'JYH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3270', N'620422', N'会宁县', N'339', N'3', N'0', N'0', N'Huining xian', N'HNI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3271', N'620423', N'景泰县', N'339', N'3', N'0', N'0', N'Jingtai Xian', N'JGT')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3272', N'620501', N'市辖区', N'340', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3274', N'620502', N'秦州区', N'340', N'3', N'0', N'0', N'Beidao Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3275', N'620521', N'清水县', N'340', N'3', N'0', N'0', N'Qingshui Xian', N'QSG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3276', N'620522', N'秦安县', N'340', N'3', N'0', N'0', N'Qin,an Xian', N'QNA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3277', N'620523', N'甘谷县', N'340', N'3', N'0', N'0', N'Gangu Xian', N'GGU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3278', N'620524', N'武山县', N'340', N'3', N'0', N'0', N'Wushan Xian', N'WSX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3279', N'620525', N'张家川回族自治县', N'340', N'3', N'0', N'0', N'Zhangjiachuan Huizu Zizhixian', N'ZJC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3280', N'620601', N'市辖区', N'341', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3281', N'620602', N'凉州区', N'341', N'3', N'0', N'0', N'Liangzhou Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3282', N'620621', N'民勤县', N'341', N'3', N'0', N'0', N'Minqin Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3283', N'620622', N'古浪县', N'341', N'3', N'0', N'0', N'Gulang Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3284', N'620623', N'天祝藏族自治县', N'341', N'3', N'0', N'0', N'Tianzhu Zangzu Zizhixian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3285', N'620701', N'市辖区', N'342', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3286', N'620702', N'甘州区', N'342', N'3', N'0', N'0', N'Ganzhou Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3287', N'620721', N'肃南裕固族自治县', N'342', N'3', N'0', N'0', N'Sunan Yugurzu Zizhixian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3288', N'620722', N'民乐县', N'342', N'3', N'0', N'0', N'Minle Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3289', N'620723', N'临泽县', N'342', N'3', N'0', N'0', N'Linze Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3290', N'620724', N'高台县', N'342', N'3', N'0', N'0', N'Gaotai Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3291', N'620725', N'山丹县', N'342', N'3', N'0', N'0', N'Shandan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3292', N'620801', N'市辖区', N'343', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3293', N'620802', N'崆峒区', N'343', N'3', N'0', N'0', N'Kongdong Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3294', N'620821', N'泾川县', N'343', N'3', N'0', N'0', N'Jingchuan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3295', N'620822', N'灵台县', N'343', N'3', N'0', N'0', N'Lingtai Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3296', N'620823', N'崇信县', N'343', N'3', N'0', N'0', N'Chongxin Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3297', N'620824', N'华亭县', N'343', N'3', N'0', N'0', N'Huating Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3298', N'620825', N'庄浪县', N'343', N'3', N'0', N'0', N'Zhuanglang Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3299', N'620826', N'静宁县', N'343', N'3', N'0', N'0', N'Jingning Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3300', N'620901', N'市辖区', N'344', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3301', N'620902', N'肃州区', N'344', N'3', N'0', N'0', N'Suzhou Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3302', N'620921', N'金塔县', N'344', N'3', N'0', N'0', N'Jinta Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3304', N'620923', N'肃北蒙古族自治县', N'344', N'3', N'0', N'0', N'Subei Monguzu Zizhixian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3305', N'620924', N'阿克塞哈萨克族自治县', N'344', N'3', N'0', N'0', N'Aksay Kazakzu Zizhixian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3306', N'620981', N'玉门市', N'344', N'3', N'0', N'0', N'Yumen Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3307', N'620982', N'敦煌市', N'344', N'3', N'0', N'0', N'Dunhuang Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3308', N'621001', N'市辖区', N'345', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3309', N'621002', N'西峰区', N'345', N'3', N'0', N'0', N'Xifeng Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3310', N'621021', N'庆城县', N'345', N'3', N'0', N'0', N'Qingcheng Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3311', N'621022', N'环县', N'345', N'3', N'0', N'0', N'Huan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3312', N'621023', N'华池县', N'345', N'3', N'0', N'0', N'Huachi Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3313', N'621024', N'合水县', N'345', N'3', N'0', N'0', N'Heshui Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3314', N'621025', N'正宁县', N'345', N'3', N'0', N'0', N'Zhengning Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3315', N'621026', N'宁县', N'345', N'3', N'0', N'0', N'Ning Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3316', N'621027', N'镇原县', N'345', N'3', N'0', N'0', N'Zhenyuan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3317', N'621101', N'市辖区', N'346', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3318', N'621102', N'安定区', N'346', N'3', N'0', N'0', N'Anding Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3319', N'621121', N'通渭县', N'346', N'3', N'0', N'0', N'Tongwei Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3320', N'621122', N'陇西县', N'346', N'3', N'0', N'0', N'Longxi Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3321', N'621123', N'渭源县', N'346', N'3', N'0', N'0', N'Weiyuan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3322', N'621124', N'临洮县', N'346', N'3', N'0', N'0', N'Lintao Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3323', N'621125', N'漳县', N'346', N'3', N'0', N'0', N'Zhang Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3324', N'621126', N'岷县', N'346', N'3', N'0', N'0', N'Min Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3325', N'621201', N'市辖区', N'347', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3326', N'621202', N'武都区', N'347', N'3', N'0', N'0', N'Wudu Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3327', N'621221', N'成县', N'347', N'3', N'0', N'0', N'Cheng Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3328', N'621222', N'文县', N'347', N'3', N'0', N'0', N'Wen Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3329', N'621223', N'宕昌县', N'347', N'3', N'0', N'0', N'Dangchang Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3330', N'621224', N'康县', N'347', N'3', N'0', N'0', N'Kang Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3331', N'621225', N'西和县', N'347', N'3', N'0', N'0', N'Xihe Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3332', N'621226', N'礼县', N'347', N'3', N'0', N'0', N'Li Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3333', N'621227', N'徽县', N'347', N'3', N'0', N'0', N'Hui Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3334', N'621228', N'两当县', N'347', N'3', N'0', N'0', N'Liangdang Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3335', N'622901', N'临夏市', N'348', N'3', N'0', N'0', N'Linxia Shi', N'LXR')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3336', N'622921', N'临夏县', N'348', N'3', N'0', N'0', N'Linxia Xian', N'LXF')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3337', N'622922', N'康乐县', N'348', N'3', N'0', N'0', N'Kangle Xian', N'KLE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3338', N'622923', N'永靖县', N'348', N'3', N'0', N'0', N'Yongjing Xian', N'YJG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3339', N'622924', N'广河县', N'348', N'3', N'0', N'0', N'Guanghe Xian', N'GHX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3340', N'622925', N'和政县', N'348', N'3', N'0', N'0', N'Hezheng Xian', N'HZG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3341', N'622926', N'东乡族自治县', N'348', N'3', N'0', N'0', N'Dongxiangzu Zizhixian', N'DXZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3342', N'622927', N'积石山保安族东乡族撒拉族自治县', N'348', N'3', N'0', N'0', N'Jishishan Bonanzu Dongxiangzu Salarzu Zizhixian', N'JSN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3343', N'623001', N'合作市', N'349', N'3', N'0', N'0', N'Hezuo Shi', N'HEZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3344', N'623021', N'临潭县', N'349', N'3', N'0', N'0', N'Lintan Xian', N'LTN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3345', N'623022', N'卓尼县', N'349', N'3', N'0', N'0', N'Jone', N'JON')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3346', N'623023', N'舟曲县', N'349', N'3', N'0', N'0', N'Zhugqu Xian', N'ZQU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3347', N'623024', N'迭部县', N'349', N'3', N'0', N'0', N'Tewo Xian', N'TEW')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3348', N'623025', N'玛曲县', N'349', N'3', N'0', N'0', N'Maqu Xian', N'MQU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3349', N'623026', N'碌曲县', N'349', N'3', N'0', N'0', N'Luqu Xian', N'LQU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3350', N'623027', N'夏河县', N'349', N'3', N'0', N'0', N'Xiahe Xian', N'XHN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3351', N'630101', N'市辖区', N'350', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3352', N'630102', N'城东区', N'350', N'3', N'0', N'0', N'Chengdong Qu', N'CDQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3353', N'630103', N'城中区', N'350', N'3', N'0', N'0', N'Chengzhong Qu', N'CZQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3354', N'630104', N'城西区', N'350', N'3', N'0', N'0', N'Chengxi Qu', N'CXQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3355', N'630105', N'城北区', N'350', N'3', N'0', N'0', N'Chengbei Qu', N'CBE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3356', N'630121', N'大通回族土族自治县', N'350', N'3', N'0', N'0', N'Datong Huizu Tuzu Zizhixian', N'DAT')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3357', N'630122', N'湟中县', N'350', N'3', N'0', N'0', N'Huangzhong Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3358', N'630123', N'湟源县', N'350', N'3', N'0', N'0', N'Huangyuan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3359', N'632121', N'平安县', N'351', N'3', N'0', N'0', N'Ping,an Xian', N'PAN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3360', N'632122', N'民和回族土族自治县', N'351', N'3', N'0', N'0', N'Minhe Huizu Tuzu Zizhixian', N'MHE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3361', N'632123', N'乐都县', N'351', N'3', N'0', N'0', N'Ledu Xian', N'LDU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3362', N'632126', N'互助土族自治县', N'351', N'3', N'0', N'0', N'Huzhu Tuzu Zizhixian', N'HZT')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3363', N'632127', N'化隆回族自治县', N'351', N'3', N'0', N'0', N'Hualong Huizu Zizhixian', N'HLO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3364', N'632128', N'循化撒拉族自治县', N'351', N'3', N'0', N'0', N'Xunhua Salazu Zizhixian', N'XUH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3365', N'632221', N'门源回族自治县', N'352', N'3', N'0', N'0', N'Menyuan Huizu Zizhixian', N'MYU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3366', N'632222', N'祁连县', N'352', N'3', N'0', N'0', N'Qilian Xian', N'QLN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3367', N'632223', N'海晏县', N'352', N'3', N'0', N'0', N'Haiyan Xian', N'HIY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3368', N'632224', N'刚察县', N'352', N'3', N'0', N'0', N'Gangca Xian', N'GAN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3369', N'632321', N'同仁县', N'353', N'3', N'0', N'0', N'Tongren Xian', N'TRN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3370', N'632322', N'尖扎县', N'353', N'3', N'0', N'0', N'Jainca Xian', N'JAI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3371', N'632323', N'泽库县', N'353', N'3', N'0', N'0', N'Zekog Xian', N'ZEK')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3372', N'632324', N'河南蒙古族自治县', N'353', N'3', N'0', N'0', N'Henan Mongolzu Zizhixian', N'HNM')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3373', N'632521', N'共和县', N'354', N'3', N'0', N'0', N'Gonghe Xian', N'GHE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3374', N'632522', N'同德县', N'354', N'3', N'0', N'0', N'Tongde Xian', N'TDX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3375', N'632523', N'贵德县', N'354', N'3', N'0', N'0', N'Guide Xian', N'GID')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3376', N'632524', N'兴海县', N'354', N'3', N'0', N'0', N'Xinghai Xian', N'XHA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3377', N'632525', N'贵南县', N'354', N'3', N'0', N'0', N'Guinan Xian', N'GNN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3378', N'632621', N'玛沁县', N'355', N'3', N'0', N'0', N'Maqen Xian', N'MAQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3379', N'632622', N'班玛县', N'355', N'3', N'0', N'0', N'Baima Xian', N'BMX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3380', N'632623', N'甘德县', N'355', N'3', N'0', N'0', N'Gade Xian', N'GAD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3381', N'632624', N'达日县', N'355', N'3', N'0', N'0', N'Tarlag Xian', N'TAR')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3382', N'632625', N'久治县', N'355', N'3', N'0', N'0', N'Jigzhi Xian', N'JUZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3383', N'632626', N'玛多县', N'355', N'3', N'0', N'0', N'Madoi Xian', N'MAD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3384', N'632721', N'玉树县', N'356', N'3', N'0', N'0', N'Yushu Xian', N'YSK')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3385', N'632722', N'杂多县', N'356', N'3', N'0', N'0', N'Zadoi Xian', N'ZAD')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3386', N'632723', N'称多县', N'356', N'3', N'0', N'0', N'Chindu Xian', N'CHI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3387', N'632724', N'治多县', N'356', N'3', N'0', N'0', N'Zhidoi Xian', N'ZHI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3388', N'632725', N'囊谦县', N'356', N'3', N'0', N'0', N'Nangqen Xian', N'NQN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3389', N'632726', N'曲麻莱县', N'356', N'3', N'0', N'0', N'Qumarleb Xian', N'QUM')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3390', N'632801', N'格尔木市', N'357', N'3', N'0', N'0', N'Golmud Shi', N'S')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3391', N'632802', N'德令哈市', N'357', N'3', N'0', N'0', N'Delhi Shi', N'DEL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3392', N'632821', N'乌兰县', N'357', N'3', N'0', N'0', N'Ulan Xian', N'ULA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3393', N'632822', N'都兰县', N'357', N'3', N'0', N'0', N'Dulan Xian', N'DUL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3394', N'632823', N'天峻县', N'357', N'3', N'0', N'0', N'Tianjun Xian', N'TJN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3395', N'640101', N'市辖区', N'358', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3396', N'640104', N'兴庆区', N'358', N'3', N'0', N'0', N'Xingqing Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3397', N'640105', N'西夏区', N'358', N'3', N'0', N'0', N'Xixia Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3398', N'640106', N'金凤区', N'358', N'3', N'0', N'0', N'Jinfeng Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3399', N'640121', N'永宁县', N'358', N'3', N'0', N'0', N'Yongning Xian', N'YGN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3400', N'640122', N'贺兰县', N'358', N'3', N'0', N'0', N'Helan Xian', N'HLN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3401', N'640181', N'灵武市', N'358', N'3', N'0', N'0', N'Lingwu Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3402', N'640201', N'市辖区', N'359', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3403', N'640202', N'大武口区', N'359', N'3', N'0', N'0', N'Dawukou Qu', N'DWK')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3404', N'640205', N'惠农区', N'359', N'3', N'0', N'0', N'Huinong Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3405', N'640221', N'平罗县', N'359', N'3', N'0', N'0', N'Pingluo Xian', N'PLO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3406', N'640301', N'市辖区', N'360', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3407', N'640302', N'利通区', N'360', N'3', N'0', N'0', N'Litong Qu', N'LTW')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3408', N'640323', N'盐池县', N'360', N'3', N'0', N'0', N'Yanchi Xian', N'YCY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3409', N'640324', N'同心县', N'360', N'3', N'0', N'0', N'Tongxin Xian', N'TGX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3410', N'640381', N'青铜峡市', N'360', N'3', N'0', N'0', N'Qingtongxia Xian', N'QTX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3411', N'640401', N'市辖区', N'361', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3412', N'640402', N'原州区', N'361', N'3', N'0', N'0', N'Yuanzhou Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3413', N'640422', N'西吉县', N'361', N'3', N'0', N'0', N'Xiji Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3414', N'640423', N'隆德县', N'361', N'3', N'0', N'0', N'Longde Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3415', N'640424', N'泾源县', N'361', N'3', N'0', N'0', N'Jingyuan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3416', N'640425', N'彭阳县', N'361', N'3', N'0', N'0', N'Pengyang Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3417', N'640501', N'市辖区', N'362', N'3', N'0', N'0', N'1', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3418', N'640502', N'沙坡头区', N'362', N'3', N'0', N'0', N'Shapotou Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3419', N'640521', N'中宁县', N'362', N'3', N'0', N'0', N'Zhongning Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3420', N'640522', N'海原县', N'362', N'3', N'0', N'0', N'Haiyuan Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3421', N'650101', N'市辖区', N'363', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3422', N'650102', N'天山区', N'363', N'3', N'0', N'0', N'Tianshan Qu', N'TSL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3423', N'650103', N'沙依巴克区', N'363', N'3', N'0', N'0', N'Saybag Qu', N'SAY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3424', N'650104', N'新市区', N'363', N'3', N'0', N'0', N'Xinshi Qu', N'XSU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3425', N'650105', N'水磨沟区', N'363', N'3', N'0', N'0', N'Shuimogou Qu', N'SMG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3426', N'650106', N'头屯河区', N'363', N'3', N'0', N'0', N'Toutunhe Qu', N'TTH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3427', N'650107', N'达坂城区', N'363', N'3', N'0', N'0', N'Dabancheng Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3428', N'650109', N'米东区', N'363', N'3', N'0', N'0', N'Midong Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3429', N'650121', N'乌鲁木齐县', N'363', N'3', N'0', N'0', N'Urumqi Xian', N'URX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3430', N'650201', N'市辖区', N'364', N'3', N'0', N'0', N'Shixiaqu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3431', N'650202', N'独山子区', N'364', N'3', N'0', N'0', N'Dushanzi Qu', N'DSZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3432', N'650203', N'克拉玛依区', N'364', N'3', N'0', N'0', N'Karamay Qu', N'KRQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3433', N'650204', N'白碱滩区', N'364', N'3', N'0', N'0', N'Baijiantan Qu', N'BJT')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3434', N'650205', N'乌尔禾区', N'364', N'3', N'0', N'0', N'Orku Qu', N'ORK')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3435', N'652101', N'吐鲁番市', N'365', N'3', N'0', N'0', N'Turpan Shi', N'TUR')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3436', N'652122', N'鄯善县', N'365', N'3', N'0', N'0', N'Shanshan(piqan) Xian', N'SSX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3437', N'652123', N'托克逊县', N'365', N'3', N'0', N'0', N'Toksun Xian', N'TOK')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3438', N'652201', N'哈密市', N'366', N'3', N'0', N'0', N'Hami(kumul) Shi', N'HAM')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3439', N'652222', N'巴里坤哈萨克自治县', N'366', N'3', N'0', N'0', N'Barkol Kazak Zizhixian', N'BAR')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3440', N'652223', N'伊吾县', N'366', N'3', N'0', N'0', N'Yiwu(Araturuk) Xian', N'YWX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3441', N'652301', N'昌吉市', N'367', N'3', N'0', N'0', N'Changji Shi', N'CJS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3442', N'652302', N'阜康市', N'367', N'3', N'0', N'0', N'Fukang Shi', N'FKG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3444', N'652323', N'呼图壁县', N'367', N'3', N'0', N'0', N'Hutubi Xian', N'HTB')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3445', N'652324', N'玛纳斯县', N'367', N'3', N'0', N'0', N'Manas Xian', N'MAS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3446', N'652325', N'奇台县', N'367', N'3', N'0', N'0', N'Qitai Xian', N'QTA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3447', N'652327', N'吉木萨尔县', N'367', N'3', N'0', N'0', N'Jimsar Xian', N'JIM')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3448', N'652328', N'木垒哈萨克自治县', N'367', N'3', N'0', N'0', N'Mori Kazak Zizhixian', N'MOR')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3449', N'652701', N'博乐市', N'368', N'3', N'0', N'0', N'Bole(Bortala) Shi', N'BLE')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3450', N'652722', N'精河县', N'368', N'3', N'0', N'0', N'Jinghe(Jing) Xian', N'JGH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3451', N'652723', N'温泉县', N'368', N'3', N'0', N'0', N'Wenquan(Arixang) Xian', N'WNQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3452', N'652801', N'库尔勒市', N'369', N'3', N'0', N'0', N'Korla Shi', N'KOR')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3453', N'652822', N'轮台县', N'369', N'3', N'0', N'0', N'Luntai(Bugur) Xian', N'LTX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3454', N'652823', N'尉犁县', N'369', N'3', N'0', N'0', N'Yuli(Lopnur) Xian', N'YLI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3455', N'652824', N'若羌县', N'369', N'3', N'0', N'0', N'Ruoqiang(Qakilik) Xian', N'RQG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3456', N'652825', N'且末县', N'369', N'3', N'0', N'0', N'Qiemo(Qarqan) Xian', N'QMO')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3457', N'652826', N'焉耆回族自治县', N'369', N'3', N'0', N'0', N'Yanqi Huizu Zizhixian', N'YQI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3458', N'652827', N'和静县', N'369', N'3', N'0', N'0', N'Hejing Xian', N'HJG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3459', N'652828', N'和硕县', N'369', N'3', N'0', N'0', N'Hoxud Xian', N'HOX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3460', N'652829', N'博湖县', N'369', N'3', N'0', N'0', N'Bohu(Bagrax) Xian', N'BHU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3461', N'652901', N'阿克苏市', N'370', N'3', N'0', N'0', N'Aksu Shi', N'AKS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3462', N'652922', N'温宿县', N'370', N'3', N'0', N'0', N'Wensu Xian', N'WSU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3463', N'652923', N'库车县', N'370', N'3', N'0', N'0', N'Kuqa Xian', N'KUQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3464', N'652924', N'沙雅县', N'370', N'3', N'0', N'0', N'Xayar Xian', N'XYR')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3465', N'652925', N'新和县', N'370', N'3', N'0', N'0', N'Xinhe(Toksu) Xian', N'XHT')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3466', N'652926', N'拜城县', N'370', N'3', N'0', N'0', N'Baicheng(Bay) Xian', N'BCG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3467', N'652927', N'乌什县', N'370', N'3', N'0', N'0', N'Wushi(Uqturpan) Xian', N'WSH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3468', N'652928', N'阿瓦提县', N'370', N'3', N'0', N'0', N'Awat Xian', N'AWA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3469', N'652929', N'柯坪县', N'370', N'3', N'0', N'0', N'Kalpin Xian', N'KAL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3470', N'653001', N'阿图什市', N'371', N'3', N'0', N'0', N'Artux Shi', N'ART')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3471', N'653022', N'阿克陶县', N'371', N'3', N'0', N'0', N'Akto Xian', N'AKT')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3472', N'653023', N'阿合奇县', N'371', N'3', N'0', N'0', N'Akqi Xian', N'AKQ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3473', N'653024', N'乌恰县', N'371', N'3', N'0', N'0', N'Wuqia(Ulugqat) Xian', N'WQA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3474', N'653101', N'喀什市', N'372', N'3', N'0', N'0', N'Kashi (Kaxgar) Shi', N'KHG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3475', N'653121', N'疏附县', N'372', N'3', N'0', N'0', N'Shufu Xian', N'SFU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3476', N'653122', N'疏勒县', N'372', N'3', N'0', N'0', N'Shule Xian', N'SHL')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3477', N'653123', N'英吉沙县', N'372', N'3', N'0', N'0', N'Yengisar Xian', N'YEN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3478', N'653124', N'泽普县', N'372', N'3', N'0', N'0', N'Zepu(Poskam) Xian', N'ZEP')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3479', N'653125', N'莎车县', N'372', N'3', N'0', N'0', N'Shache(Yarkant) Xian', N'SHC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3480', N'653126', N'叶城县', N'372', N'3', N'0', N'0', N'Yecheng(Kargilik) Xian', N'YEC')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3481', N'653127', N'麦盖提县', N'372', N'3', N'0', N'0', N'Markit Xian', N'MAR')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3482', N'653128', N'岳普湖县', N'372', N'3', N'0', N'0', N'Yopurga Xian', N'YOP')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3483', N'653129', N'伽师县', N'372', N'3', N'0', N'0', N'Jiashi(Payzawat) Xian', N'JSI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3484', N'653130', N'巴楚县', N'372', N'3', N'0', N'0', N'Bachu(Maralbexi) Xian', N'BCX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3485', N'653131', N'塔什库尔干塔吉克自治县', N'372', N'3', N'0', N'0', N'Taxkorgan Tajik Zizhixian', N'TXK')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3486', N'653201', N'和田市', N'373', N'3', N'0', N'0', N'Hotan Shi', N'HTS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3487', N'653221', N'和田县', N'373', N'3', N'0', N'0', N'Hotan Xian', N'HOT')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3488', N'653222', N'墨玉县', N'373', N'3', N'0', N'0', N'Moyu(Karakax) Xian', N'MOY')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3489', N'653223', N'皮山县', N'373', N'3', N'0', N'0', N'Pishan(Guma) Xian', N'PSA')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3490', N'653224', N'洛浦县', N'373', N'3', N'0', N'0', N'Lop Xian', N'LOP')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3491', N'653225', N'策勒县', N'373', N'3', N'0', N'0', N'Qira Xian', N'QIR')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3492', N'653226', N'于田县', N'373', N'3', N'0', N'0', N'Yutian(Keriya) Xian', N'YUT')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3493', N'653227', N'民丰县', N'373', N'3', N'0', N'0', N'Minfeng(Niya) Xian', N'MFG')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3494', N'654002', N'伊宁市', N'374', N'3', N'0', N'0', N'Yining(Gulja) Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3495', N'654003', N'奎屯市', N'374', N'3', N'0', N'0', N'Kuytun Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3496', N'654021', N'伊宁县', N'374', N'3', N'0', N'0', N'Yining(Gulja) Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3497', N'654022', N'察布查尔锡伯自治县', N'374', N'3', N'0', N'0', N'Qapqal Xibe Zizhixian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3498', N'654023', N'霍城县', N'374', N'3', N'0', N'0', N'Huocheng Xin', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3499', N'654024', N'巩留县', N'374', N'3', N'0', N'0', N'Gongliu(Tokkuztara) Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3500', N'654025', N'新源县', N'374', N'3', N'0', N'0', N'Xinyuan(Kunes) Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3501', N'654026', N'昭苏县', N'374', N'3', N'0', N'0', N'Zhaosu(Mongolkure) Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3502', N'654027', N'特克斯县', N'374', N'3', N'0', N'0', N'Tekes Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3503', N'654028', N'尼勒克县', N'374', N'3', N'0', N'0', N'Nilka Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3504', N'654201', N'塔城市', N'375', N'3', N'0', N'0', N'Tacheng(Qoqek) Shi', N'TCS')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3505', N'654202', N'乌苏市', N'375', N'3', N'0', N'0', N'Usu Shi', N'USU')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3506', N'654221', N'额敏县', N'375', N'3', N'0', N'0', N'Emin(Dorbiljin) Xian', N'EMN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3507', N'654223', N'沙湾县', N'375', N'3', N'0', N'0', N'Shawan Xian', N'SWX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3508', N'654224', N'托里县', N'375', N'3', N'0', N'0', N'Toli Xian', N'TLI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3509', N'654225', N'裕民县', N'375', N'3', N'0', N'0', N'Yumin(Qagantokay) Xian', N'YMN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3510', N'654226', N'和布克赛尔蒙古自治县', N'375', N'3', N'0', N'0', N'Hebukesaiermengguzizhi Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3511', N'654301', N'阿勒泰市', N'376', N'3', N'0', N'0', N'Altay Shi', N'ALT')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3512', N'654321', N'布尔津县', N'376', N'3', N'0', N'0', N'Burqin Xian', N'BUX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3513', N'654322', N'富蕴县', N'376', N'3', N'0', N'0', N'Fuyun(Koktokay) Xian', N'FYN')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3514', N'654323', N'福海县', N'376', N'3', N'0', N'0', N'Fuhai(Burultokay) Xian', N'FHI')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3515', N'654324', N'哈巴河县', N'376', N'3', N'0', N'0', N'Habahe(Kaba) Xian', N'HBH')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3516', N'654325', N'青河县', N'376', N'3', N'0', N'0', N'Qinghe(Qinggil) Xian', N'QHX')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3517', N'654326', N'吉木乃县', N'376', N'3', N'0', N'0', N'Jeminay Xian', N'JEM')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3518', N'659001', N'石河子市', N'377', N'3', N'0', N'0', N'Shihezi Shi', N'SHZ')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3519', N'659002', N'阿拉尔市', N'377', N'3', N'0', N'0', N'Alaer Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3520', N'659003', N'图木舒克市', N'377', N'3', N'0', N'0', N'Tumushuke Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'3521', N'659004', N'五家渠市', N'377', N'3', N'0', N'0', N'Wujiaqu Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'4000', N'620503', N'麦积区', N'340', N'3', N'0', N'0', N'Maiji Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'4100', N'232701', N'加格达奇区', N'106', N'3', N'0', N'0', N'Jiagedaqi Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'4101', N'232702', N'松岭区', N'106', N'3', N'0', N'0', N'Songling Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'4102', N'232703', N'新林区', N'106', N'3', N'0', N'0', N'Xinlin Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'4103', N'232704', N'呼中区', N'106', N'3', N'0', N'0', N'Huzhong Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'4200', N'330402', N'南湖区', N'125', N'3', N'0', N'0', N'Nanhu Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'4300', N'360482', N'共青城市', N'162', N'3', N'0', N'0', N'Gongqingcheng Shi', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'4400', N'640303', N'红寺堡区', N'360', N'3', N'0', N'0', N'Hongsibao Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'4500', N'620922', N'瓜州县', N'344', N'3', N'0', N'0', N'Guazhou Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'4600', N'421321', N'随县', N'215', N'3', N'0', N'0', N'Sui Xian', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'4700', N'431102', N'零陵区', N'228', N'3', N'0', N'0', N'Lingling Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'4800', N'451119', N'平桂管理区', N'263', N'3', N'0', N'0', N'Pingguiguanli Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'4900', N'510802', N'利州区', N'279', N'3', N'0', N'0', N'Lizhou Qu', N'2')
GO
GO
INSERT INTO [dbo].[Addresses] ([Id], [Code], [Name], [ParentId], [Level], [DevelopLevel], [Sort], [EnglishName], [ShortEnglishName]) VALUES (N'5000', N'511681', N'华蓥市', N'286', N'3', N'0', N'0', N'Huaying Shi', N'HYC')
GO
GO
SET IDENTITY_INSERT [dbo].[Addresses] OFF
GO

-- ----------------------------
-- Indexes structure for table Addresses
-- ----------------------------
CREATE INDEX [IX_ParentId] ON [dbo].[Addresses]
([ParentId] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table Addresses
-- ----------------------------
ALTER TABLE [dbo].[Addresses] ADD PRIMARY KEY ([Id])
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[Addresses]
-- ----------------------------
ALTER TABLE [dbo].[Addresses] ADD FOREIGN KEY ([ParentId]) REFERENCES [dbo].[Addresses] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
