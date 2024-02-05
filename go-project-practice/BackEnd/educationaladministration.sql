/*
 Navicat Premium Data Transfer

 Source Server         : .
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : educationaladministration

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 09/10/2023 18:01:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `AID` bigint NOT NULL COMMENT '管理员ID',
  `Apassword` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `LastLoginTime` datetime NOT NULL COMMENT '上次登录时间',
  `DeptID` int NOT NULL COMMENT '学院ID',
  `AName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`AID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (2023000000, '123123', '2023-10-09 06:39:47', 1, '1号管理员');

-- ----------------------------
-- Table structure for cerclas
-- ----------------------------
DROP TABLE IF EXISTS `cerclas`;
CREATE TABLE `cerclas`  (
  `CertificateName` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '证书名称',
  `CertificationAuthority` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '发证机构',
  `CertificateLevel` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '证书等级'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cerclas
-- ----------------------------

-- ----------------------------
-- Table structure for certificate
-- ----------------------------
DROP TABLE IF EXISTS `certificate`;
CREATE TABLE `certificate`  (
  `CertificateID` bigint NOT NULL COMMENT '证书ID',
  `AttributableID` bigint NULL DEFAULT NULL,
  `IsThrough` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否已审核',
  `PictureByte` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '图片地址',
  `CreatTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '上传时间',
  `IssuanceDate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '证书颁发时间',
  `CertificateLevel` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '证书等级',
  `CertificateAuthority` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '证书颁发机构',
  `ClassID` int NOT NULL COMMENT '班级ID',
  `CertificateName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '证书名称',
  `IdentifyLocations` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '鉴定地点',
  PRIMARY KEY (`CertificateID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of certificate
-- ----------------------------
INSERT INTO `certificate` VALUES (1696596572, 2106280101, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/9j8WzDHy3H', '2023-10-06 12:49:33', '2023-01', '初级', '腾讯云计算（北京）有限责任公司', 16, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696596624, 2106280102, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/Ns49enDrGe', '2023-10-06 12:50:25', '2023-01', '初级', '腾讯云计算（北京）有限责任公司', 16, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696596661, 2106280104, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/LveyU5Tvo8', '2023-10-06 12:51:02', '2023-01', '初级', '腾讯云计算（北京）有限责任公司', 16, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696596746, 2106280105, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/SN5fYJoJFb', '2023-10-06 12:52:27', '2023-01', '初级', '腾讯云计算（北京）有限责任公司', 16, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696596765, 2106280106, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/9B3kIcAWTn', '2023-10-06 12:52:45', '2023-01', '初级', '腾讯云计算（北京）有限责任公司', 16, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696596784, 2106280107, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/dawZH0WdXD', '2023-10-06 12:53:04', '2023-01', '初级', '腾讯云计算（北京）有限责任公司', 16, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696596811, 2106280108, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/mNXOzwOTYu', '2023-10-06 12:53:32', '2023-01', '初级', '腾讯云计算（北京）有限责任公司', 16, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696600766, 2106280111, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/gkzOmPxXlV', '2023-10-06 13:59:27', '2023-01', '初级', '腾讯云计算（北京）有限责任公司', 16, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696600812, 2106280112, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/AaJYI7K18h', '2023-10-06 14:00:13', '2023-01', '初级', '腾讯云计算（北京）有限责任公司', 16, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696600857, 2106280113, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/x9reTP6LPW', '2023-10-06 14:00:57', '2023-01', '初级', '腾讯云计算（北京）有限责任公司', 16, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696600959, 2106280116, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/y0pnuoptWy', '2023-10-06 14:02:39', '2023-01', '初级', '腾讯云计算（北京）有限责任公司', 16, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696600990, 2106280117, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/8ioPeRnREg', '2023-10-06 14:03:10', '2023-01', '初级', '腾讯云计算（北京）有限责任公司', 16, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696601043, 2106280118, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/JfvQiY5Auz', '2023-10-06 14:04:04', '2022-04', '初级', '广东省人力资源部和社会保障厅', 16, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696601076, 2106280119, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/y3GWCvhmzd', '2023-10-06 14:04:37', '2023-01', '初级', '腾讯云计算（北京）有限责任公司', 16, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696601106, 2106280120, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/wc9raDGn1S', '2023-10-06 14:05:07', '2023-01', '初级', '腾讯云计算（北京）有限责任公司', 16, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696601132, 2106280121, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/bXrrkYwmA6', '2023-10-06 14:05:32', '2023-01', '初级', '腾讯云计算（北京）有限责任公司', 16, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696601162, 2106280125, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/HjYrP3CcTN', '2023-10-06 14:06:02', '2022-04', '初级', '广东省人力资源部和社会保障厅', 16, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696601189, 2106280126, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/BKVfGZHczu', '2023-10-06 14:06:29', '2023-04', '初级', '广东省人力资源部和社会保障厅', 16, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696601212, 2106280127, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/Be35Fc3MIj', '2023-10-06 14:06:53', '2022-04', '初级', '广东省人力资源部和社会保障厅', 16, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696601242, 2106280129, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/n2bSitCpJh', '2023-10-06 14:07:22', '2022-04', '初级', '广东省人力资源部和社会保障厅', 16, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696601270, 2106280130, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/IRBWjGyRZp', '2023-10-06 14:07:50', '2023-01', '初级', '广东省人力资源部和社会保障厅', 16, '广东省人力资源部和社会保障厅', '校内');
INSERT INTO `certificate` VALUES (1696601365, 2106280131, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/nsShDRAt0O', '2023-10-06 14:09:25', '2023-01', '初级', '腾讯云计算（北京）有限责任公司', 16, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696601446, 2106280132, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/Z48WX6MHRk', '2023-10-06 14:10:47', '2023-01', '初级', '腾讯云计算（北京）有限责任公司', 16, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696601470, 2106280133, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/PvffM7YOKT', '2023-10-06 14:11:11', '2023-01', '初级', '腾讯云计算（北京）有限责任公司', 16, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696601491, 2106280134, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/f3egU04q8x', '2023-10-06 14:11:32', '2023-01', '初级', '广东省人力资源部和社会保障厅', 16, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696601559, 2106280137, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/k4DabuYYxc', '2023-10-06 14:12:39', '2023-01', '初级', '腾讯云计算（北京）有限责任公司', 16, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696601583, 2106280138, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/G0XuXNctky', '2023-10-06 14:13:03', '2023-01', '初级', '腾讯云计算（北京）有限责任公司', 16, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696601750, 2106280139, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/Wjg36tbZUl', '2023-10-06 14:15:51', '2023-03', '初级', '腾讯云计算（北京）有限责任公司', 16, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696601793, 2106280136, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/pKKJb8SmZT', '2023-10-06 14:16:34', '2023-03', '初级', '腾讯云计算（北京）有限责任公司', 16, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696601818, 2106280140, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/s8iMBP1p0R', '2023-10-06 14:16:59', '2023-01', '初级', '腾讯云计算（北京）有限责任公司', 16, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696601841, 2106280141, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/Tztanz0DTG', '2023-10-06 14:17:22', '2023-01', '初级', '腾讯云计算（北京）有限责任公司', 16, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696601863, 2106280142, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/UB5l0TpT4I', '2023-10-06 14:17:43', '2023-01', '初级', '腾讯云计算（北京）有限责任公司', 16, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696601887, 2106280143, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/SHVX3goxco', '2023-10-06 14:18:07', '2023-01', '初级', '腾讯云计算（北京）有限责任公司', 16, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696601907, 2106280145, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/kdCi8koap2', '2023-10-06 14:18:27', '2023-01', '初级', '腾讯云计算（北京）有限责任公司', 16, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696601935, 2106280147, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/swbqcY9wcV', '2023-10-06 14:18:55', '2023-01', '初级', '腾讯云计算（北京）有限责任公司', 16, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696601961, 2106280148, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/A0OHXAZdqo', '2023-10-06 14:19:21', '2023-01', '初级', '腾讯云计算（北京）有限责任公司', 16, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696604156, 2106280109, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/vhhtkqIFdy', '2023-10-06 14:55:57', '2023-05', '初级', '杭州时光坐标影视传媒股份有限公司', 16, '杭州时光坐标影视传媒股份有限公司', '校内');
INSERT INTO `certificate` VALUES (1696604218, 2106280114, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/b0zwXH2oP2', '2023-10-06 14:56:58', '2023-05', '初级', '杭州时光坐标影视传媒股份有限公司', 16, '杭州时光坐标影视传媒股份有限公司', '校内');
INSERT INTO `certificate` VALUES (1696604268, 2106280115, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/UjcNefR51G', '2023-10-06 14:57:48', '2023-05', '初级', '杭州时光坐标影视传媒股份有限公司', 16, '杭州时光坐标影视传媒股份有限公司', '校内');
INSERT INTO `certificate` VALUES (1696604282, 2106280115, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/ypgfOEUPHw', '2023-10-06 14:58:02', '2023-05', '初级', '杭州时光坐标影视传媒股份有限公司', 16, '杭州时光坐标影视传媒股份有限公司', '校内');
INSERT INTO `certificate` VALUES (1696604317, 2106280123, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/VMCCr0Y4Ul', '2023-10-06 14:58:38', '2023-05', '初级', '杭州时光坐标影视传媒股份有限公司', 16, '杭州时光坐标影视传媒股份有限公司', '校内');
INSERT INTO `certificate` VALUES (1696604404, 2106280135, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/grgGb37n9z', '2023-10-06 15:00:05', '2023-05', '初级', '杭州时光坐标影视传媒股份有限公司', 16, '杭州时光坐标影视传媒股份有限公司', '校内');
INSERT INTO `certificate` VALUES (1696668561, 2106290102, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/qnJETafkjw', '2023-10-07 08:49:21', '2023-04', '中级', '北京华晟经世信息技术股份有限公司', 20, '北京华晟经世信息技术股份有限公司', '校内');
INSERT INTO `certificate` VALUES (1696668580, 2106290107, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/bnqZYNLIbV', '2023-10-07 08:49:41', '2023-04', '中级', '北京华晟经世信息技术股份有限公司', 20, '北京华晟经世信息技术股份有限公司', '校内');
INSERT INTO `certificate` VALUES (1696668616, 2106290109, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/GYB4aK8FQG', '2023-10-07 08:50:17', '2022-02', '中级', '北京华晟经世信息技术股份有限公司', 20, '北京华晟经世信息技术股份有限公司', '校内');
INSERT INTO `certificate` VALUES (1696668652, 2106290111, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/hGpQErfvLG', '2023-10-07 08:50:53', '2023-04', '中级', '北京华晟经世信息技术股份有限公司', 20, '北京华晟经世信息技术股份有限公司', '校内');
INSERT INTO `certificate` VALUES (1696668679, 2106290113, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/sZjikQP9Yn', '2023-10-07 08:51:20', '2022-02', '中级', '北京华晟经世信息技术股份有限公司', 20, '北京华晟经世信息技术股份有限公司', '校内');
INSERT INTO `certificate` VALUES (1696668915, 2106290114, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/elKuIz6I2l', '2023-10-07 08:55:15', '2022-02', '中级', '北京华晟经世信息技术股份有限公司', 20, '北京华晟经世信息技术股份有限公司', '校内');
INSERT INTO `certificate` VALUES (1696668936, 2106290118, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/cfrCA7ysLH', '2023-10-07 08:55:37', '2023-04', '中级', '北京华晟经世信息技术股份有限公司', 20, '北京华晟经世信息技术股份有限公司', '校内');
INSERT INTO `certificate` VALUES (1696668958, 2106290126, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/7sy6rh19Wj', '2023-10-07 08:55:58', '2023-04', '中级', '北京华晟经世信息技术股份有限公司', 20, '北京华晟经世信息技术股份有限公司', '校内');
INSERT INTO `certificate` VALUES (1696668981, 2106290129, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/xt2xn5rgXB', '2023-10-07 08:56:22', '2023-04', '中级', '北京华晟经世信息技术股份有限公司', 20, '北京华晟经世信息技术股份有限公司', '校内');
INSERT INTO `certificate` VALUES (1696669028, 2106290140, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/YWVcefDczP', '2023-10-07 08:57:09', '2023-04', '初级', '广东省人力资源部和社会保障厅', 20, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696669052, 2106290142, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/rjSV1UhdAJ', '2023-10-07 08:57:32', '2023-04', '中级', '北京华晟经世信息技术股份有限公司', 20, '北京华晟经世信息技术股份有限公司', '校内');
INSERT INTO `certificate` VALUES (1696669070, 2106290145, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/vOJki3RyFY', '2023-10-07 08:57:50', '2023-04', '中级', '北京华晟经世信息技术股份有限公司', 20, '北京华晟经世信息技术股份有限公司', '校内');
INSERT INTO `certificate` VALUES (1696669088, 2106290147, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/B4Gb2E544m', '2023-10-07 08:58:08', '2023-04', '中级', '北京华晟经世信息技术股份有限公司', 20, '北京华晟经世信息技术股份有限公司', '校内');
INSERT INTO `certificate` VALUES (1696669108, 2106290148, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/FOxhFH3L57', '2023-10-07 08:58:29', '2023-04', '中级', '北京华晟经世信息技术股份有限公司', 20, '北京华晟经世信息技术股份有限公司', '校内');
INSERT INTO `certificate` VALUES (1696669158, 2106290151, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/GviCfhvGWc', '2023-10-07 08:59:18', '2023-04', '初级', '广东省人力资源部和社会保障厅', 20, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696669185, 2106290152, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/YTVtCiokAm', '2023-10-07 08:59:45', '2022-02', '中级', '北京华晟经世信息技术股份有限公司', 20, '北京华晟经世信息技术股份有限公司', '校内');
INSERT INTO `certificate` VALUES (1696669206, 2106290153, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/EEsVsXjWh7', '2023-10-07 09:00:07', '2022-02', '中级', '北京华晟经世信息技术股份有限公司', 20, '北京华晟经世信息技术股份有限公司', '校内');
INSERT INTO `certificate` VALUES (1696669227, 2106290255, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/AXUtN5F08V', '2023-10-07 09:00:28', '2023-04', '中级', '北京华晟经世信息技术股份有限公司', 20, '北京华晟经世信息技术股份有限公司', '校内');
INSERT INTO `certificate` VALUES (1696669291, 2106290149, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/TawTgFFnCl', '2023-10-07 09:01:32', '2023-04', '中级', '北京华晟经世信息技术股份有限公司', 20, '北京华晟经世信息技术股份有限公司', '校内');
INSERT INTO `certificate` VALUES (1696671247, 2106290108, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/ZYgZxW8lU0', '2023-10-07 09:34:07', '2023-04', '中级', '北京华晟经世信息技术股份有限公司', 20, '北京华晟经世信息技术股份有限公司', '校内');
INSERT INTO `certificate` VALUES (1696671272, 2106290135, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/DfSNggjaJz', '2023-10-07 09:34:33', '2023-04', '中级', '北京华晟经世信息技术股份有限公司', 20, '北京华晟经世信息技术股份有限公司', '校内');
INSERT INTO `certificate` VALUES (1696671295, 2106290143, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/taVzjeuI0T', '2023-10-07 09:34:55', '2023-04', '中级', '北京华晟经世信息技术股份有限公司', 20, '北京华晟经世信息技术股份有限公司', '校内');
INSERT INTO `certificate` VALUES (1696671324, 2106290150, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/cAvacWeXoj', '2023-10-07 09:35:24', '2023-04', '中级', '北京华晟经世信息技术股份有限公司', 20, '北京华晟经世信息技术股份有限公司', '校内');
INSERT INTO `certificate` VALUES (1696672757, 2106290139, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/0KS1MKnYOu', '2023-10-07 09:59:18', '2023-04', '中级', '北京华晟经世信息技术股份有限公司', 20, '北京华晟经世信息技术股份有限公司', '校内');
INSERT INTO `certificate` VALUES (1696673396, 2106290110, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/iCBjTEgmIm', '2023-10-07 10:09:56', '2023-04', '中级', '北京华晟经世信息技术股份有限公司', 20, '北京华晟经世信息技术股份有限公司', '校内');
INSERT INTO `certificate` VALUES (1696673469, 2106290115, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/aLk30pQs20', '2023-10-07 10:11:09', '2023-04', '中级', '北京华晟经世信息技术股份有限公司', 20, '北京华晟经世信息技术股份有限公司', '校内');
INSERT INTO `certificate` VALUES (1696751067, 2106280201, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/5BgvL1eWm5', '2023-10-08 07:44:28', '2022-10', '初级', '广东省人力资源部和社会保障厅', 17, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696751162, 2106280202, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/uAnnZtJIrn', '2023-10-08 07:46:03', '2023-06', '初级', '腾讯云计算（北京）有限责任公司', 17, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696751190, 2106280203, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/Sb97MkWybZ', '2023-10-08 07:46:30', '2022-10', '初级', '广东省人力资源部和社会保障厅', 17, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696751272, 2106280205, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/xykMu8C7qg', '2023-10-08 07:47:53', '2022-10', '初级', '广东省人力资源部和社会保障厅', 17, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696751308, 2106280206, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/8BP9ZiG8FE', '2023-10-08 07:48:28', '2022-10', '初级', '广东省人力资源部和社会保障厅', 17, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696751405, 2106280208, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/XOnWolOPzZ', '2023-10-08 07:50:05', '2023-05', '初级', '杭州时光坐标影视传媒股份有限公司', 17, '杭州时光坐标影视传媒股份有限公司', '校内');
INSERT INTO `certificate` VALUES (1696751427, 2106280211, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/vIkcvKizfi', '2023-10-08 07:50:28', '2022-10', '初级', '广东省人力资源部和社会保障厅', 17, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696751452, 2106280212, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/pd75RsCw67', '2023-10-08 07:50:53', '2023-03', '初级', '腾讯云计算（北京）有限责任公司', 17, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696751475, 2106280214, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/gSN8F5vI6Q', '2023-10-08 07:51:15', '2023-04', '初级', '广东省人力资源部和社会保障厅', 17, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696751496, 2106280215, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/FR60eB6u3B', '2023-10-08 07:51:36', '2022-10', '初级', '广东省人力资源部和社会保障厅', 17, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696751532, 2106280217, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/PFp8W3hmM6', '2023-10-08 07:52:13', '2023-06', '初级', '腾讯云计算（北京）有限责任公司', 17, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696751553, 2106280218, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/F7HIwLyrEz', '2023-10-08 07:52:33', '2022-10', '初级', '广东省人力资源部和社会保障厅', 17, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696751575, 2106280219, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/LIgL1GCBtH', '2023-10-08 07:52:55', '2022-10', '初级', '广东省人力资源部和社会保障厅', 17, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696751597, 2106280220, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/UBBjenQEvA', '2023-10-08 07:53:18', '2023-04', '初级', '广东省人力资源部和社会保障厅', 17, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696751618, 2106280221, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/LMtsSwZ2Ee', '2023-10-08 07:53:38', '2022-10', '初级', '广东省人力资源部和社会保障厅', 17, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696751638, 2106280223, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/IU8XX0Y0PC', '2023-10-08 07:53:58', '2022-10', '初级', '广东省人力资源部和社会保障厅', 17, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696751656, 2106280225, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/p3agB4axiG', '2023-10-08 07:54:16', '2022-10', '初级', '广东省人力资源部和社会保障厅', 17, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696751682, 2106280226, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/1ox6GzIXD4', '2023-10-08 07:54:43', '2022-10', '初级', '广东省人力资源部和社会保障厅', 17, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696751703, 2106280227, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/HivZoU5OrR', '2023-10-08 07:55:03', '2023-03', 'undefined', '腾讯云计算（北京）有限责任公司', 17, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696751726, 2106280228, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/KWsAyQ95sE', '2023-10-08 07:55:27', '2023-03', 'undefined', '腾讯云计算（北京）有限责任公司', 17, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696751760, 2106280229, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/MyRIhWPUUS', '2023-10-08 07:56:00', '2023-05', '初级', '杭州时光坐标影视传媒股份有限公司', 17, '杭州时光坐标影视传媒股份有限公司', '校内');
INSERT INTO `certificate` VALUES (1696751784, 2106280230, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/X6GooERybG', '2023-10-08 07:56:25', '2022-10', '初级', '广东省人力资源部和社会保障厅', 17, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696751806, 2106280231, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/kIU8P06tn6', '2023-10-08 07:56:46', '2022-10', '初级', '广东省人力资源部和社会保障厅', 17, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696751828, 2106280232, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/EGEcruBH5g', '2023-10-08 07:57:08', '2022-10', '初级', '广东省人力资源部和社会保障厅', 17, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696751864, 2106280233, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/HUDyOBtFhM', '2023-10-08 07:57:44', '2023-05', '初级', '杭州时光坐标影视传媒股份有限公司', 17, '杭州时光坐标影视传媒股份有限公司', '校内');
INSERT INTO `certificate` VALUES (1696751884, 2106280234, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/YrZLGKP4iW', '2023-10-08 07:58:05', '2022-10', '初级', '广东省人力资源部和社会保障厅', 17, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696751904, 2106280235, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/4GYvnSP3Ee', '2023-10-08 07:58:25', '2022-10', '初级', '广东省人力资源部和社会保障厅', 17, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696751932, 2106280237, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/ueNR5s22Dh', '2023-10-08 07:58:53', '2023-06', '初级', '腾讯云计算（北京）有限责任公司', 17, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696751962, 2106280238, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/ZfuoHfVlF7', '2023-10-08 07:59:22', '2022-10', '初级', '广东省人力资源部和社会保障厅', 17, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696751987, 2106280239, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/QYzR5Y0P8d', '2023-10-08 07:59:48', '2022-10', '初级', '广东省人力资源部和社会保障厅', 17, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696752029, 2106280240, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/ssNsRlcwsM', '2023-10-08 08:00:30', '2023-05', '初级', '杭州时光坐标影视传媒股份有限公司', 17, '杭州时光坐标影视传媒股份有限公司', '校内');
INSERT INTO `certificate` VALUES (1696752048, 2106280242, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/BWe50X6ckz', '2023-10-08 08:00:48', '2022-10', '初级', '广东省人力资源部和社会保障厅', 17, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696752105, 2106280245, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/x8w6a602rd', '2023-10-08 08:01:45', '2023-05', '初级', '杭州时光坐标影视传媒股份有限公司', 17, '杭州时光坐标影视传媒股份有限公司', '校内');
INSERT INTO `certificate` VALUES (1696752124, 2106280246, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/wtrWjVRWZC', '2023-10-08 08:02:05', '2022-10', '初级', '广东省人力资源部和社会保障厅', 17, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696752163, 2106280247, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/mu9z83APyo', '2023-10-08 08:02:43', '2023-01', '初级', '腾讯云计算（北京）有限责任公司', 17, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696752181, 2106280248, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/v0vNRiEsHa', '2023-10-08 08:03:02', '2022-10', '初级', '广东省人力资源部和社会保障厅', 17, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696752201, 2106280249, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/pNluxtLmMB', '2023-10-08 08:03:21', '2022-10', '初级', '广东省人力资源部和社会保障厅', 17, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696752217, 2106280250, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/8u7lmh3fNK', '2023-10-08 08:03:38', '2022-10', '初级', '广东省人力资源部和社会保障厅', 17, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696752589, 2106280244, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/vpsDMTxmsT', '2023-10-08 08:09:50', '2022-10', '初级', '广东省人力资源部和社会保障厅', 17, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696752699, 2106280204, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/bFkWSw7GY1', '2023-10-08 08:11:39', '2023-06', '初级', '腾讯云计算（北京）有限责任公司', 17, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696771009, 2206200528, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/V9sEQTXiHt', '2023-10-08 13:16:49', '2022-06', '三等奖', '广东省教育厅', 24, '广东省教育厅', '校内');
INSERT INTO `certificate` VALUES (1696771151, 2206200535, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/kv6VX3n7Cd', '2023-10-08 13:19:12', '2022-06', '三等奖', '广东省教育厅', 24, '广东省教育厅', '校内');
INSERT INTO `certificate` VALUES (1696771269, 2206200534, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/OrMBCjCdGk', '2023-10-08 13:21:09', '2022-02', '初级', '北京神州数码云科信息技术有限公司', 24, '北京神州数码云科信息技术有限公司', '校内');
INSERT INTO `certificate` VALUES (1696771432, 2206200519, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/TitGp8VBcs', '2023-10-08 13:23:53', '2022-06', '二等奖', '广东省教育厅', 24, '广东省教育厅', '校内');
INSERT INTO `certificate` VALUES (1696771512, 2206200532, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/IvIbbDOTtO', '2023-10-08 13:25:12', '2022-02', '初级', '北京神州数码云科信息技术有限公司', 24, '北京神州数码云科信息技术有限公司', '校内');
INSERT INTO `certificate` VALUES (1696771618, 2206200514, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/O3nSY8EqeR', '2023-10-08 13:26:59', '2022-02', '初级', '北京神州数码云科信息技术有限公司', 24, '北京神州数码云科信息技术有限公司', '校内');
INSERT INTO `certificate` VALUES (1696771693, 2206200546, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/VYYwx785cp', '2023-10-08 13:28:13', '2021-03', '初级', '工业和信息化部教育与考试中心', 24, '工业和信息化部教育与考试中心', '校内');
INSERT INTO `certificate` VALUES (1696771821, 2206200540, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/t3J2fCpukv', '2023-10-08 13:30:21', '2021-03', '初级', '工业和信息化部教育与考试中心', 24, '工业和信息化部教育与考试中心', '校内');
INSERT INTO `certificate` VALUES (1696771837, 2206200540, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/qkN1OD73yn', '2023-10-08 13:30:37', '2021-03', '初级', '工业和信息化部教育与考试中心', 24, '工业和信息化部教育与考试中心', '校内');
INSERT INTO `certificate` VALUES (1696771943, 2206200539, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/H6B2CAMLyR', '2023-10-08 13:32:23', '2021-03', '初级', '工业和信息化部教育与考试中心', 24, '工业和信息化部教育与考试中心', '校内');
INSERT INTO `certificate` VALUES (1696772032, 2206200538, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/EIl9Ut4KYE', '2023-10-08 13:33:53', '2021-03', '初级', '工业和信息化部教育与考试中心', 24, '工业和信息化部教育与考试中心', '校内');
INSERT INTO `certificate` VALUES (1696772186, 2206200515, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/PSPuEF5t16', '2023-10-08 13:36:27', '2022-02', '初级', '北京神州数码云科信息技术有限公司', 24, '北京神州数码云科信息技术有限公司', '校内');
INSERT INTO `certificate` VALUES (1696772278, 2206200506, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/oxCxn23J32', '2023-10-08 13:37:59', '2022-02', '初级', '北京神州数码云科信息技术有限公司', 24, '北京神州数码云科信息技术有限公司', '校内');
INSERT INTO `certificate` VALUES (1696772372, 2206200504, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/GwreywVFzS', '2023-10-08 13:39:33', '2022-02', '初级', '北京神州数码云科信息技术有限公司', 24, '北京神州数码云科信息技术有限公司', '校内');
INSERT INTO `certificate` VALUES (1696772456, 2206200505, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/A1u75U2XRs', '2023-10-08 13:40:57', '2022-02', '初级', '北京神州数码云科信息技术有限公司', 24, '北京神州数码云科信息技术有限公司', '校内');
INSERT INTO `certificate` VALUES (1696772544, 2206200508, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/AEs3VY9tf6', '2023-10-08 13:42:25', '2022-02', '初级', '工业和信息化部教育与考试中心', 24, '工业和信息化部教育与考试中心', '校内');
INSERT INTO `certificate` VALUES (1696772642, 2206200507, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/j8WUhFiRXn', '2023-10-08 13:44:03', '2022-02', '初级', '北京神州数码云科信息技术有限公司', 24, '北京神州数码云科信息技术有限公司', '校内');
INSERT INTO `certificate` VALUES (1696819767, 2106200202, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/2bkCMhGe3N', '2023-10-09 02:49:28', '2022-11', '初级', '腾讯科技(深圳)有限公司', 12, '腾讯科技(深圳)有限公司', '校内');
INSERT INTO `certificate` VALUES (1696819883, 2106200204, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/wpibUeymUl', '2023-10-09 02:51:24', '2022-11', '初级', '腾讯科技(深圳)有限公司', 12, '腾讯科技(深圳)有限公司', '校内');
INSERT INTO `certificate` VALUES (1696819923, 2106200205, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/b0kFttcRdL', '2023-10-09 02:52:04', '2022-11', '初级', '腾讯科技(深圳)有限公司', 12, '腾讯科技(深圳)有限公司', '校内');
INSERT INTO `certificate` VALUES (1696819976, 2106200206, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/x1iNeUvAlA', '2023-10-09 02:52:56', '2022-10', '初级', '广东省人力资源部和社会保障厅', 12, '广东省人力资源部和社会保障厅', '校内');
INSERT INTO `certificate` VALUES (1696820026, 2106200207, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/5j3I5jj7h0', '2023-10-09 02:53:47', '2022-10', '初级', '广东省人力资源部和社会保障厅', 12, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696820092, 2106200209, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/q9w5HJlPgu', '2023-10-09 02:54:52', '2022-10', '初级', '广东省人力资源部和社会保障厅', 12, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696820130, 2106200210, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/pn33tJYFmQ', '2023-10-09 02:55:30', '2023-04', '初级', '广东省人力资源部和社会保障厅', 12, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696820165, 2106200213, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/5Y7Ufbskd5', '2023-10-09 02:56:06', '2022-10', '初级', '广东省人力资源部和社会保障厅', 12, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696820195, 2106200214, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/Of92lTlbGN', '2023-10-09 02:56:36', '2022-11', '初级', '腾讯科技(深圳)有限公司', 12, '腾讯科技(深圳)有限公司', '校内');
INSERT INTO `certificate` VALUES (1696820233, 2106200215, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/jrnynC48Iu', '2023-10-09 02:57:13', '2022-11', '初级', '腾讯科技(深圳)有限公司', 12, '腾讯科技(深圳)有限公司', '校内');
INSERT INTO `certificate` VALUES (1696820268, 2106200216, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/hSrEBxzhPz', '2023-10-09 02:57:48', '2022-11', '初级', '腾讯科技(深圳)有限公司', 12, '腾讯科技(深圳)有限公司', '校内');
INSERT INTO `certificate` VALUES (1696820297, 2106200219, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/x2SZpjAaLK', '2023-10-09 02:58:18', '2022-11', '初级', '腾讯科技(深圳)有限公司', 12, '腾讯科技(深圳)有限公司', '校内');
INSERT INTO `certificate` VALUES (1696820324, 2106200222, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/iER2LPhWv2', '2023-10-09 02:58:45', '2022-10', '初级', '广东省人力资源部和社会保障厅', 12, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696820831, 2106200223, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/377UY5NK37', '2023-10-09 03:07:12', '2023-07', '初级', '腾讯科技(深圳)有限公司', 12, '腾讯科技(深圳)有限公司', '校内');
INSERT INTO `certificate` VALUES (1696820901, 2106200224, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/Nd5u8TWEeI', '2023-10-09 03:08:21', '2023-04', '初级', '广东省人力资源部和社会保障厅', 12, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696821005, 2106200225, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/hUIsM0npIR', '2023-10-09 03:10:05', '2023-04', '初级', '广东省人力资源部和社会保障厅', 12, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696821040, 2106200226, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/A37QUsKEVy', '2023-10-09 03:10:41', '2022-10', '初级', '广东省人力资源部和社会保障厅', 12, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696821087, 2106200227, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/RJjhQgDdYC', '2023-10-09 03:11:27', '2022-04', '初级', '广东省人力资源部和社会保障厅', 12, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696821179, 2106200228, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/A9YFlzr0YH', '2023-10-09 03:13:00', '2022-11', '初级', '腾讯科技(深圳)有限公司', 12, '腾讯科技(深圳)有限公司', '校内');
INSERT INTO `certificate` VALUES (1696821212, 2106200229, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/5rcLyWSGQg', '2023-10-09 03:13:33', '2022-10', '初级', '广东省人力资源部和社会保障厅', 12, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696821255, 2106200231, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/3RpEOKDJEm', '2023-10-09 03:14:15', '2022-11', '初级', '腾讯科技(深圳)有限公司', 12, '腾讯科技(深圳)有限公司', '校内');
INSERT INTO `certificate` VALUES (1696821304, 2106200232, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/9w5NpEPJPm', '2023-10-09 03:15:05', '2023-01', '初级', '腾讯科技(深圳)有限公司', 12, '腾讯科技(深圳)有限公司', '校内');
INSERT INTO `certificate` VALUES (1696821446, 2106200235, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/yQaWZBiuPp', '2023-10-09 03:17:27', '2022-10', '初级', '广东省人力资源部和社会保障厅', 12, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696821990, 2106200236, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/sIiaUPhITU', '2023-10-09 03:26:30', '2022-10', '初级', '广东省人力资源部和社会保障厅', 12, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696822110, 2106200237, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/7ufc090PAU', '2023-10-09 03:28:31', '2022-11', '初级', '腾讯科技(深圳)有限公司', 12, '腾讯科技(深圳)有限公司', '校内');
INSERT INTO `certificate` VALUES (1696822393, 2106200238, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/DjJMFwwlgb', '2023-10-09 03:33:14', '2022-10', '初级', '广东省人力资源部和社会保障厅', 12, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696823756, 2106200239, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/1PGNy5bTLM', '2023-10-09 03:55:56', '2023-07', '初级', '腾讯科技(深圳)有限公司', 12, '腾讯科技(深圳)有限公司', '校内');
INSERT INTO `certificate` VALUES (1696823794, 2106200240, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/xp2xF6UpC0', '2023-10-09 03:56:35', '2022-04', '初级', '广东省人力资源部和社会保障厅', 12, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696823832, 2106200241, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/YFeGnLxdbP', '2023-10-09 03:57:13', '2022-11', '初级', '腾讯科技(深圳)有限公司', 12, '腾讯科技(深圳)有限公司', '校内');
INSERT INTO `certificate` VALUES (1696823882, 2106200242, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/Btj6eAzqyQ', '2023-10-09 03:58:03', '2023-04', '初级', '广东省人力资源部和社会保障厅', 12, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696823928, 2106200243, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/ud7cX1JBbP', '2023-10-09 03:58:49', '2022-10', '初级', '广东省人力资源部和社会保障厅', 12, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696823963, 2106200244, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/ViOs9NTOj3', '2023-10-09 03:59:23', '2022-10', '初级', '广东省人力资源部和社会保障厅', 12, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696824034, 2106200245, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/z9FUHICx5D', '2023-10-09 04:00:34', '2024-01', '初级', '腾讯科技(深圳)有限公司', 12, '腾讯科技(深圳)有限公司', '校内');
INSERT INTO `certificate` VALUES (1696824065, 2106200246, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/KQeBJwxMub', '2023-10-09 04:01:05', '2022-11', '初级', '腾讯科技(深圳)有限公司', 12, '腾讯科技(深圳)有限公司', '校内');
INSERT INTO `certificate` VALUES (1696824196, 2106200247, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/dFmy6VZcIk', '2023-10-09 04:03:16', '2022-10', '初级', '广东省人力资源部和社会保障厅', 12, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696824324, 2106200248, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/NMezyykdPi', '2023-10-09 04:05:24', '2022-11', '初级', '腾讯科技(深圳)有限公司', 12, '腾讯科技(深圳)有限公司', '校外');
INSERT INTO `certificate` VALUES (1696824375, 2106200249, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/qAVK0NHlE3', '2023-10-09 04:06:15', '2023-01', '初级', '腾讯科技(深圳)有限公司', 12, '腾讯科技(深圳)有限公司', '校内');
INSERT INTO `certificate` VALUES (1696824424, 2106200251, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/XxLncorlt2', '2023-10-09 04:07:05', '2022-10', '初级', '广东省人力资源部和社会保障厅', 12, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696824466, 2106200253, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/OCCfUzw3io', '2023-10-09 04:07:47', '2022-11', '初级', '广东省人力资源部和社会保障厅', 12, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696824503, 2106200254, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/Ss6ocH6Nwy', '2023-10-09 04:08:23', '2022-11', '初级', '腾讯科技(深圳)有限公司', 12, '腾讯科技(深圳)有限公司', '校内');
INSERT INTO `certificate` VALUES (1696829990, 2106280312, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/uSFu9w9MeA', '2023-10-09 05:39:51', '2023-01', '初级', '腾讯云计算（北京）有限责任公司', 18, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696831408, 2106280301, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/1cktUvgXfG', '2023-10-09 06:03:28', '2023-01', '初级', '腾讯云计算（北京）有限责任公司', 18, '腾讯云计算（北京）有限责任公司', '校外');
INSERT INTO `certificate` VALUES (1696831483, 2106280303, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/ICS9TWZuOe', '2023-10-09 06:04:44', '2023-01', '初级', '腾讯云计算（北京）有限责任公司', 18, '腾讯云计算（北京）有限责任公司', '校外');
INSERT INTO `certificate` VALUES (1696831560, 2106280304, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/LgVTiEE1na', '2023-10-09 06:06:01', '2023-03', '初级', '腾讯云计算（北京）有限责任公司', 18, '腾讯云计算（北京）有限责任公司', '校外');
INSERT INTO `certificate` VALUES (1696831973, 2206200501, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/SIQDA6BOt5', '2023-10-09 06:12:54', '2022-06', '二等奖', '广东省教育厅', 24, '广东省教育厅', '校内');
INSERT INTO `certificate` VALUES (1696832217, 2206200509, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/Ys4lKKuHfb', '2023-10-09 06:16:58', '2022-02', '初级', '北京神州数码云科信息技术有限公司', 24, '北京神州数码云科信息技术有限公司', '校内');
INSERT INTO `certificate` VALUES (1696838155, 2106070402, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/VFPFgBcfbX', '2023-10-09 07:55:55', '2023-06', '中级', '华为技术有限公司', 4, '华为技术有限公司', '校内');
INSERT INTO `certificate` VALUES (1696838460, 2106070403, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/oa98iTURd8', '2023-10-09 08:01:00', '2023-06', '初级', '广东省人力资源部和社会保障厅', 4, '广东省人力资源部和社会保障厅', '校内');
INSERT INTO `certificate` VALUES (1696839092, 2106070453, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/3uiFMvXNlf', '2023-10-09 08:11:33', '2023-06', '中级', '华为技术有限公司', 4, '华为技术有限公司', '校内');
INSERT INTO `certificate` VALUES (1696839228, 2106070401, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/j6E29u1Hz0', '2023-10-09 08:13:48', '2023-06', '中级', '华为技术有限公司', 4, '华为技术有限公司', '校内');
INSERT INTO `certificate` VALUES (1696839320, 1906070148, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/KCUhGupwLU', '2023-10-09 08:15:21', '2023-06', '中级', '华为技术有限公司', 4, '华为技术有限公司', '校内');
INSERT INTO `certificate` VALUES (1696839409, 2106070452, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/PmYh8NuVCm', '2023-10-09 08:16:50', '2023-06', '中级', '华为技术有限公司', 4, '华为技术有限公司', '校内');
INSERT INTO `certificate` VALUES (1696839498, 2106070407, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/PdJwmVeH94', '2023-10-09 08:18:19', '2023-06', '中级', '华为技术有限公司', 4, '华为技术有限公司', '校内');
INSERT INTO `certificate` VALUES (1696839569, 2106070415, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/ZV6HT9Czwn', '2023-10-09 08:19:29', '2023-06', '中级', '华为技术有限公司', 4, '华为技术有限公司', '校内');
INSERT INTO `certificate` VALUES (1696839663, 2106070408, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/s78g5wtbaG', '2023-10-09 08:21:04', '2023-06', '中级', '华为技术有限公司', 4, '华为技术有限公司', '校内');
INSERT INTO `certificate` VALUES (1696839731, 2106070444, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/CmwI6YSztO', '2023-10-09 08:22:12', '2023-06', '中级', '华为技术有限公司', 4, '华为技术有限公司', '校内');
INSERT INTO `certificate` VALUES (1696840647, 2106280122, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/kHmNkFTirB', '2023-10-09 08:37:28', '2023-03', '初级', '腾讯云计算（北京）有限责任公司', 16, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696840677, 2106280150, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/S0H1TOvsqX', '2023-10-09 08:37:57', '2022-04', '初级', '广东省人力资源部和社会保障厅', 16, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696840770, 2106280149, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/ECKBKebOO2', '2023-10-09 08:39:30', '2023-05', '初级', '杭州时光坐标影视传媒股份有限公司', 16, '杭州时光坐标影视传媒股份有限公司', '校内');
INSERT INTO `certificate` VALUES (1696840849, 2106280151, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/1nYu3ug7A3', '2023-10-09 08:40:49', '2023-05', '初级', '杭州时光坐标影视传媒股份有限公司', 16, '杭州时光坐标影视传媒股份有限公司', '校内');
INSERT INTO `certificate` VALUES (1696840991, 2106280417, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/blza8DLooJ', '2023-10-09 08:43:11', '2022-10', '初级', '广东省人力资源部和社会保障厅', 19, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696841161, 2106280402, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/IsejC89QTE', '2023-10-09 08:46:02', '2023-03', '初级', '腾讯云计算（北京）有限责任公司', 19, '腾讯云计算（北京）有限责任公司', '校外');
INSERT INTO `certificate` VALUES (1696841216, 2106280403, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/Odubj0gJzE', '2023-10-09 08:46:57', '2023-06', '初级', '腾讯云计算（北京）有限责任公司', 19, '腾讯云计算（北京）有限责任公司', '校外');
INSERT INTO `certificate` VALUES (1696841260, 2106280404, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/YFhGANADMN', '2023-10-09 08:47:41', '2022-10', '初级', '广东省人力资源部和社会保障厅', 19, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696841309, 2106280405, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/vp0iHEeAFo', '2023-10-09 08:48:30', '2023-06', '初级', '腾讯云计算（北京）有限责任公司', 19, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696841593, 2106280409, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/IxVQN0K0W6', '2023-10-09 08:53:13', '2023-04', '初级', '北京华晟经世信息技术股份有限公司', 19, '北京华晟经世信息技术股份有限公司', '校内');
INSERT INTO `certificate` VALUES (1696841658, 2106280410, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/Wg1plWNdTC', '2023-10-09 08:54:19', '2023-06', '初级', '腾讯云计算（北京）有限责任公司', 19, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696841820, 2106280411, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/bMaxtKKBqo', '2023-10-09 08:57:01', '2023-01', '初级', '腾讯云计算（北京）有限责任公司', 19, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696841890, 2106280412, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/e3NKiz5yj8', '2023-10-09 08:58:11', '2023-03', '初级', '腾讯云计算（北京）有限责任公司', 19, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696841930, 2106280413, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/3DJhU3bZZl', '2023-10-09 08:58:51', '2022-10', '初级', '广东省人力资源部和社会保障厅', 19, '广东省人力资源部和社会保障厅', '校内');
INSERT INTO `certificate` VALUES (1696842116, 2106280414, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/dCdHh8rQhs', '2023-10-09 09:01:57', '2023-06', '初级', '腾讯云计算（北京）有限责任公司', 19, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696842156, 2106280415, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/UnIdxcZbgP', '2023-10-09 09:02:37', '2023-06', '初级', '腾讯云计算（北京）有限责任公司', 19, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696842239, 2106280416, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/L3U0GYXAf9', '2023-10-09 09:03:59', '2022-10', '初级', '广东省人力资源部和社会保障厅', 19, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696842288, 2106280418, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/nSLk2wWoKK', '2023-10-09 09:04:49', '2023-03', '初级', '腾讯云计算（北京）有限责任公司', 19, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696842346, 2106280420, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/VpS1rh552M', '2023-10-09 09:05:47', '2023-01', '初级', '腾讯云计算（北京）有限责任公司', 19, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696842398, 2106280421, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/2JnbXnit61', '2023-10-09 09:06:39', '2023-06', '初级', '腾讯云计算（北京）有限责任公司', 19, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696842457, 2106280422, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/KGtkohDYgy', '2023-10-09 09:07:37', '2023-01', '初级', '腾讯云计算（北京）有限责任公司', 19, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696842500, 2106280424, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/kP2V1d2HyC', '2023-10-09 09:08:21', '2023-03', '初级', '腾讯云计算（北京）有限责任公司', 19, '腾讯云计算（北京）有限责任公司', '校外');
INSERT INTO `certificate` VALUES (1696842550, 2106280425, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/5yMPYe7fLr', '2023-10-09 09:09:10', '2023-03', '初级', '腾讯云计算（北京）有限责任公司', 19, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696842593, 2106280426, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/J2hkAClDmX', '2023-10-09 09:09:53', '2022-10', '初级', '广东省人力资源部和社会保障厅', 19, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696842659, 2106280305, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/x6ef31OzQx', '2023-10-09 09:10:59', '2022-05', '初级', '腾讯云计算（北京）有限责任公司', 18, '腾讯云计算（北京）有限责任公司', '校外');
INSERT INTO `certificate` VALUES (1696842719, 2106280306, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/1Bl7QDunMO', '2023-10-09 09:11:59', '2023-06', '初级', '腾讯云计算（北京）有限责任公司', 18, '腾讯云计算（北京）有限责任公司', '校外');
INSERT INTO `certificate` VALUES (1696842773, 2106280427, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/DGigqQxsA1', '2023-10-09 09:12:53', '2023-06', '初级', '腾讯云计算（北京）有限责任公司', 19, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696842811, 2106280429, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/F9LzFCt3fL', '2023-10-09 09:13:31', '2023-06', '初级', '腾讯云计算（北京）有限责任公司', 19, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696842866, 2106280308, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/rkwStweE2p', '2023-10-09 09:14:26', '2023-05', '初级', '腾讯云计算（北京）有限责任公司', 18, '腾讯云计算（北京）有限责任公司', '校外');
INSERT INTO `certificate` VALUES (1696842919, 2106280310, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/mIzhC5LBWZ', '2023-10-09 09:15:19', '2023-05', '初级', '腾讯云计算（北京）有限责任公司', 18, '腾讯云计算（北京）有限责任公司', '校外');
INSERT INTO `certificate` VALUES (1696842953, 2106280430, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/sp8C9pz2Xj', '2023-10-09 09:15:54', '2023-01', '初级', '腾讯云计算（北京）有限责任公司', 19, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696842968, 2106280313, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/qiLG3Plo65', '2023-10-09 09:16:08', '2023-05', '初级', 'undefined', 18, 'undefined', '校外');
INSERT INTO `certificate` VALUES (1696843008, 2106280315, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/SN3T1A0zyz', '2023-10-09 09:16:49', '2023-05', '初级', '腾讯云计算（北京）有限责任公司', 18, '腾讯云计算（北京）有限责任公司', '校外');
INSERT INTO `certificate` VALUES (1696843012, 2106280431, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/Q1tSMDDeE3', '2023-10-09 09:16:52', '2023-06', '初级', '腾讯云计算（北京）有限责任公司', 19, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696843048, 2106280316, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/oNfbTtDWVK', '2023-10-09 09:17:28', '2023-03', '初级', '腾讯云计算（北京）有限责任公司', 18, '腾讯云计算（北京）有限责任公司', '校外');
INSERT INTO `certificate` VALUES (1696843074, 2106280432, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/M4HnfepvGD', '2023-10-09 09:17:55', '2023-03', '初级', '腾讯云计算（北京）有限责任公司', 19, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696843083, 2106280317, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/oVoABhdZzr', '2023-10-09 09:18:03', '2023-06', '初级', '腾讯云计算（北京）有限责任公司', 18, '腾讯云计算（北京）有限责任公司', '校外');
INSERT INTO `certificate` VALUES (1696843116, 2106280433, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/RLpf24eXjf', '2023-10-09 09:18:36', '2023-03', '初级', '腾讯云计算（北京）有限责任公司', 19, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696843144, 2106280318, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/EPkCiJWuEZ', '2023-10-09 09:19:05', '2022-10', '初级', '广东省人力资源部和社会保障厅', 18, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696843163, 2106280434, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/Q9QDDZ5w2u', '2023-10-09 09:19:24', '2022-10', '初级', '广东省人力资源部和社会保障厅', 19, '广东省人力资源部和社会保障厅', '校内');
INSERT INTO `certificate` VALUES (1696843178, 2106280319, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/TpmXSJ24gI', '2023-10-09 09:19:39', '2023-06', '初级', '腾讯云计算（北京）有限责任公司', 18, '腾讯云计算（北京）有限责任公司', '校外');
INSERT INTO `certificate` VALUES (1696843208, 2106280435, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/pBikl5DoYk', '2023-10-09 09:20:09', '2023-01', '初级', '腾讯云计算（北京）有限责任公司', 19, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696843226, 2106280321, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/ijIfzA1szn', '2023-10-09 09:20:27', '2023-01', '初级', '腾讯云计算（北京）有限责任公司', 18, '腾讯云计算（北京）有限责任公司', '校外');
INSERT INTO `certificate` VALUES (1696843242, 2106280436, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/Xg5CjOjy6G', '2023-10-09 09:20:43', '2023-01', '初级', '腾讯云计算（北京）有限责任公司', 19, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696843267, 2106280322, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/yRzHWjT1z7', '2023-10-09 09:21:08', '2023-06', '初级', '腾讯云计算（北京）有限责任公司', 18, '腾讯云计算（北京）有限责任公司', '校外');
INSERT INTO `certificate` VALUES (1696843296, 2106280323, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/lSZfrWMtWs', '2023-10-09 09:21:37', '2023-06', '初级', '腾讯云计算（北京）有限责任公司', 18, '腾讯云计算（北京）有限责任公司', '校外');
INSERT INTO `certificate` VALUES (1696843309, 2106280437, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/jFNmkT9lw1', '2023-10-09 09:21:50', '2022-04', '初级', '广东省人力资源部和社会保障厅', 19, '广东省人力资源部和社会保障厅', '校内');
INSERT INTO `certificate` VALUES (1696843327, 2106280324, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/DuRqYoPv0J', '2023-10-09 09:22:08', '2023-03', '初级', '腾讯云计算（北京）有限责任公司', 18, '腾讯云计算（北京）有限责任公司', '校外');
INSERT INTO `certificate` VALUES (1696843351, 2106280325, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/Nm0y5H9HYK', '2023-10-09 09:22:32', '2023-06', '初级', '腾讯云计算（北京）有限责任公司', 18, '腾讯云计算（北京）有限责任公司', '校外');
INSERT INTO `certificate` VALUES (1696843359, 2106280438, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/tzbyMJMZIn', '2023-10-09 09:22:39', '2023-06', '初级', '腾讯云计算（北京）有限责任公司', 19, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696843360, 2106280438, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/SyWFQAyAt2', '2023-10-09 09:22:40', '2023-06', '初级', '腾讯云计算（北京）有限责任公司', 19, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696843383, 2106280326, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/fl9phGkn7r', '2023-10-09 09:23:04', '2023-05', '初级', '腾讯云计算（北京）有限责任公司', 18, '腾讯云计算（北京）有限责任公司', '校外');
INSERT INTO `certificate` VALUES (1696843398, 2106280439, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/BY23gS5Ago', '2023-10-09 09:23:19', '2022-10', '初级', '广东省人力资源部和社会保障厅', 19, '广东省人力资源部和社会保障厅', '校内');
INSERT INTO `certificate` VALUES (1696843421, 2106280327, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/Dri3b4agdv', '2023-10-09 09:23:42', '2023-06', '初级', '腾讯云计算（北京）有限责任公司', 18, '腾讯云计算（北京）有限责任公司', '校外');
INSERT INTO `certificate` VALUES (1696843443, 2106280328, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/JHO95oTuNb', '2023-10-09 09:24:04', '2023-06', '初级', '腾讯云计算（北京）有限责任公司', 18, '腾讯云计算（北京）有限责任公司', '校外');
INSERT INTO `certificate` VALUES (1696843464, 2106280441, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/xCFF0FVssi', '2023-10-09 09:24:25', '2023-06', '初级', '腾讯云计算（北京）有限责任公司', 19, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696843472, 2106280329, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/mVwYg6E4dS', '2023-10-09 09:24:32', '2023-03', '初级', '腾讯云计算（北京）有限责任公司', 18, '腾讯云计算（北京）有限责任公司', '校外');
INSERT INTO `certificate` VALUES (1696843524, 2106280330, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/Q0tTyhiML4', '2023-10-09 09:25:24', '2022-05', '初级', '广东省人力资源部和社会保障厅', 18, '广东省人力资源部和社会保障厅', '校外');
INSERT INTO `certificate` VALUES (1696843549, 2106280332, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/J1hjPev1TN', '2023-10-09 09:25:49', '2023-03', '初级', '腾讯云计算（北京）有限责任公司', 18, '腾讯云计算（北京）有限责任公司', '校外');
INSERT INTO `certificate` VALUES (1696843581, 2106280335, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/gNmYLv3eeg', '2023-10-09 09:26:21', '2023-06', '初级', '腾讯云计算（北京）有限责任公司', 18, '腾讯云计算（北京）有限责任公司', '校外');
INSERT INTO `certificate` VALUES (1696843614, 2106280337, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/VYVzdK86lY', '2023-10-09 09:26:55', '2023-06', '初级', '腾讯云计算（北京）有限责任公司', 18, '腾讯云计算（北京）有限责任公司', '校外');
INSERT INTO `certificate` VALUES (1696843662, 2106280338, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/ZYGg5FKMrj', '2023-10-09 09:27:42', '2023-06', '初级', '腾讯云计算（北京）有限责任公司', 18, '腾讯云计算（北京）有限责任公司', '校外');
INSERT INTO `certificate` VALUES (1696843689, 2106280339, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/YOwgw6lRPa', '2023-10-09 09:28:10', '2023-05', '初级', '腾讯云计算（北京）有限责任公司', 18, '腾讯云计算（北京）有限责任公司', '校外');
INSERT INTO `certificate` VALUES (1696843692, 2106280442, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/6pQAHaCBE9', '2023-10-09 09:28:13', '2023-05', '初级', '北京华晟经世信息技术股份有限公司', 19, '北京华晟经世信息技术股份有限公司', '校内');
INSERT INTO `certificate` VALUES (1696843720, 2106280342, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/rDW6QXgdoO', '2023-10-09 09:28:40', '2023-03', '初级', '腾讯云计算（北京）有限责任公司', 18, '腾讯云计算（北京）有限责任公司', '校外');
INSERT INTO `certificate` VALUES (1696843743, 2106280343, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/6rRpeHlZbb', '2023-10-09 09:29:04', '2023-05', '初级', '腾讯云计算（北京）有限责任公司', 18, '腾讯云计算（北京）有限责任公司', '校外');
INSERT INTO `certificate` VALUES (1696843751, 2106280444, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/Oh50YJhrcx', '2023-10-09 09:29:12', '2023-01', '初级', '腾讯云计算（北京）有限责任公司', 19, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696843766, 2106280344, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/Fjs88VBPph', '2023-10-09 09:29:26', '2023-05', '初级', '腾讯云计算（北京）有限责任公司', 18, '腾讯云计算（北京）有限责任公司', '校外');
INSERT INTO `certificate` VALUES (1696843792, 2106280345, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/KQtZf48QuD', '2023-10-09 09:29:53', '2023-05', '初级', '腾讯云计算（北京）有限责任公司', 18, '腾讯云计算（北京）有限责任公司', '校外');
INSERT INTO `certificate` VALUES (1696843821, 2106280346, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/FEXuSmDi7U', '2023-10-09 09:30:21', '2023-06', '初级', '腾讯云计算（北京）有限责任公司', 18, '腾讯云计算（北京）有限责任公司', '校外');
INSERT INTO `certificate` VALUES (1696843845, 2106280347, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/hkoFgZIg3k', '2023-10-09 09:30:45', '2023-03', '初级', '腾讯云计算（北京）有限责任公司', 18, '腾讯云计算（北京）有限责任公司', '校外');
INSERT INTO `certificate` VALUES (1696843867, 2106280348, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/VrDj2tj534', '2023-10-09 09:31:08', '2023-05', '初级', '腾讯云计算（北京）有限责任公司', 18, '腾讯云计算（北京）有限责任公司', '校外');
INSERT INTO `certificate` VALUES (1696843923, 2106280350, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/z0P3spEGXy', '2023-10-09 09:32:04', '2023-05', '初级', '腾讯云计算（北京）有限责任公司', 18, '腾讯云计算（北京）有限责任公司', '校外');
INSERT INTO `certificate` VALUES (1696843998, 2106280445, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/dfZod4unvQ', '2023-10-09 09:33:18', '2023-06', '初级', '腾讯云计算（北京）有限责任公司', 19, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696844051, 2106280447, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/Bp4OuRM901', '2023-10-09 09:34:12', '2023-03', '初级', '腾讯云计算（北京）有限责任公司', 19, '腾讯云计算（北京）有限责任公司', '校内');
INSERT INTO `certificate` VALUES (1696844118, 2106280448, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/biRdbh0Y5P', '2023-10-09 09:35:18', '2023-06', '初级', '腾讯云计算（北京）有限责任公司', 19, '腾讯云计算（北京）有限责任公司', 'undefined');
INSERT INTO `certificate` VALUES (1696844156, 2106280449, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/StWrKqmxNH', '2023-10-09 09:35:57', '2023-06', '初级', '腾讯云计算（北京）有限责任公司', 19, '腾讯云计算（北京）有限责任公司', 'undefined');
INSERT INTO `certificate` VALUES (1696844225, 2106280349, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/0nmN6aPdtk', '2023-10-09 09:37:05', '2023-01', '初级', '腾讯云计算（北京）有限责任公司', 18, '腾讯云计算（北京）有限责任公司', '校外');
INSERT INTO `certificate` VALUES (1696844512, 2206200533, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/Uux9KR9d4a', '2023-10-09 09:41:52', '2022-02', '初级', '北京神州数码云科信息技术有限公司', 24, '北京神州数码云科信息技术有限公司', '校内');
INSERT INTO `certificate` VALUES (1696844644, 2206200502, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/mxGH44QjCt', '2023-10-09 09:44:05', '2022-06', '二等奖', '广东省教育厅', 24, '广东省教育厅', '校内');
INSERT INTO `certificate` VALUES (1696844949, 2206200521, 0, 'https://educational-1309419557.cos.ap-nanjing.myqcloud.com/KcKTUn2TKC', '2023-10-09 09:49:10', '2022-02', '初级', '北京神州数码云科信息技术有限公司', 24, '北京神州数码云科信息技术有限公司', '校内');

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class`  (
  `ClassID` int NOT NULL COMMENT '班级ID',
  `ClassName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '班级姓名',
  `DeptID` int NULL DEFAULT NULL COMMENT '学院ID',
  `StuNum` int NULL DEFAULT NULL COMMENT '班级学生数量',
  `UploadNum` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '班级已上传整数数量',
  `IsThrough` tinyint(1) NULL DEFAULT 0 COMMENT '是否审核完毕',
  `SOID` int NULL DEFAULT NULL,
  `PID` int NULL DEFAULT NULL,
  PRIMARY KEY (`ClassID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES (1, '2021级计算机网络技术A班', 1, 48, 0, 0, NULL, 13);
INSERT INTO `class` VALUES (2, '2021级计算机网络技术B班', 1, 50, 0, 0, 2106070236, 13);
INSERT INTO `class` VALUES (3, '2021级计算机网络技术C班', 1, 47, 0, 0, NULL, 13);
INSERT INTO `class` VALUES (4, '2021级计算机网络技术D班', 1, 49, 0, 0, 2106070401, 13);
INSERT INTO `class` VALUES (5, '2021级计算机网络技术E班', 1, 31, 0, 0, NULL, 13);
INSERT INTO `class` VALUES (6, '2021级计算机应用技术A班', 1, 51, 0, 0, 2105330154, 12);
INSERT INTO `class` VALUES (7, '2021级计算机应用技术B班', 1, 46, 0, 0, 2106030239, 12);
INSERT INTO `class` VALUES (8, '2021级计算机应用技术C班', 1, 42, 0, 0, NULL, 12);
INSERT INTO `class` VALUES (9, '2021级计算机应用技术D班', 1, 42, 0, 0, 2106030442, 12);
INSERT INTO `class` VALUES (10, '2021级计算机应用技术E班', 1, 44, 0, 0, NULL, 12);
INSERT INTO `class` VALUES (11, '2021级软件技术A班', 1, 51, 0, 0, 2106200122, 11);
INSERT INTO `class` VALUES (12, '2021级软件技术B班', 1, 47, 0, 0, 2106200248, 11);
INSERT INTO `class` VALUES (13, '2021级软件技术C班', 1, 47, 0, 0, 2106200323, 11);
INSERT INTO `class` VALUES (14, '2021级软件技术D班', 1, 46, 0, 0, NULL, 11);
INSERT INTO `class` VALUES (15, '2021级软件技术E班', 1, 26, 0, 0, NULL, 11);
INSERT INTO `class` VALUES (16, '2021级数字媒体技术A班', 1, 49, 0, 0, NULL, 14);
INSERT INTO `class` VALUES (17, '2021级数字媒体技术B班', 1, 45, 0, 0, NULL, 14);
INSERT INTO `class` VALUES (18, '2021级数字媒体技术C班', 1, 46, 0, 0, NULL, 14);
INSERT INTO `class` VALUES (19, '2021级数字媒体技术D班', 1, 43, 0, 0, NULL, 14);
INSERT INTO `class` VALUES (20, '2021级现代通信技术A班', 1, 49, 0, 0, NULL, 15);
INSERT INTO `class` VALUES (21, '2021级现代通信技术B班', 1, 49, 0, 0, NULL, 15);
INSERT INTO `class` VALUES (22, '2021级现代通信技术C班', 1, 43, 0, 0, NULL, 15);
INSERT INTO `class` VALUES (23, '2022级计算机网络技术B班', 1, 39, 0, 0, NULL, 13);
INSERT INTO `class` VALUES (24, '2022级软件技术E班', 1, 48, 0, 0, NULL, 11);
INSERT INTO `class` VALUES (25, '2022级数字媒体技术D班', 1, NULL, 0, 0, NULL, 14);

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept`  (
  `DeptID` int NOT NULL COMMENT '学院ID',
  `DeptName` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '学院名称',
  `IsComplete` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否已全部审核',
  `Grade` int NULL DEFAULT NULL,
  PRIMARY KEY (`DeptID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES (1, '信息工程学院', b'0', 2021);
INSERT INTO `dept` VALUES (2, '信息工程学院', b'0', 2022);

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `MID` bigint NOT NULL COMMENT '消息ID',
  `CreatTime` datetime NOT NULL COMMENT '创建时间',
  `ClassID` int NOT NULL COMMENT '归属者ID',
  `DataText` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '错误信息',
  `CertificateAttID` int NOT NULL COMMENT '错误图片信息',
  `SendAttrID` int NOT NULL,
  PRIMARY KEY (`MID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES (1695999782, '2023-09-29 15:03:02', 22, '已通过', 2106290302, 2003000000);

-- ----------------------------
-- Table structure for professional
-- ----------------------------
DROP TABLE IF EXISTS `professional`;
CREATE TABLE `professional`  (
  `PID` int NOT NULL COMMENT '专业ID',
  `PName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '专业名称',
  `Grade` int NULL DEFAULT NULL,
  `DeptID` int NULL DEFAULT NULL,
  PRIMARY KEY (`PID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of professional
-- ----------------------------
INSERT INTO `professional` VALUES (11, '软件技术', 2021, 1);
INSERT INTO `professional` VALUES (12, '计算机应用技术', 2021, 1);
INSERT INTO `professional` VALUES (13, '计算机网络技术', 2021, 1);
INSERT INTO `professional` VALUES (14, '数字媒体技术', 2021, 1);
INSERT INTO `professional` VALUES (15, '现代通信技术', 2021, 1);
INSERT INTO `professional` VALUES (16, '云计算技术应用', 2021, 1);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `SID` bigint NOT NULL DEFAULT 1 COMMENT '学生ID',
  `SName` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名称',
  `SSex` tinyint NULL DEFAULT 1 COMMENT '性别',
  `ClassID` int NULL DEFAULT NULL COMMENT '班级ID',
  `DeptID` int NULL DEFAULT NULL COMMENT '学院ID',
  `CertificateID` int NULL DEFAULT NULL COMMENT '上传的证书ID',
  `PID` int NULL DEFAULT NULL,
  `Grade` int NULL DEFAULT NULL,
  PRIMARY KEY (`SID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1906030227, '邓佛安', 1, 7, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (1906070114, '杨智杰', 1, 4, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (1906070118, '王杰', 1, 3, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (1906070128, '周计全', 1, 3, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (1906070148, '邓浩江', 1, 4, 1, 1696839320, 13, 2021);
INSERT INTO `student` VALUES (1906070340, '邓易杭', 1, 3, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (1906070424, '王举泽', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (1906200208, '何伟豪', 1, 11, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (1906260308, '陈俊龙', 1, 25, 1, NULL, 14, 2022);
INSERT INTO `student` VALUES (1906260312, '吴泽耿', 1, 19, 1, NULL, 14, 2021);
INSERT INTO `student` VALUES (2006200211, '黄炜杰', 1, 11, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2006200347, '彭炜', 1, 13, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2006260209, '周芳奋', 1, 18, 1, NULL, 14, 2021);
INSERT INTO `student` VALUES (2105330154, '邓立权', 1, 6, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2105410158, '朱煌浩', 1, 6, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2105410443, '陈威帆', 1, 6, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2105460144, '李思佩', 1, 8, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030101, '苏焯楹', 1, 6, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030102, '周仕铭', 1, 6, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030103, '黄志杰', 1, 6, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030104, '刘浩鹏', 1, 6, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030105, '李玉欣', 1, 6, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030106, '何浩洋', 1, 6, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030107, '吴许荣', 1, 6, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030108, '谢逸彤', 1, 6, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030109, '黄珈铭', 1, 6, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030110, '罗俊康', 1, 6, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030111, '谭杰辉', 1, 6, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030112, '李茵', 1, 6, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030113, '蔡晓燕', 1, 6, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030114, '程虹萍', 1, 6, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030115, '周吉琪', 1, 6, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030116, '卢林熙', 1, 6, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030117, '吴泽妍', 1, 6, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030118, '郭学斌', 1, 6, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030119, '罗植欣', 1, 6, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030121, '林永杰', 1, 6, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030122, '张鸿利', 1, 6, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030123, '蔡梓桐', 1, 6, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030124, '陈梓铨', 1, 6, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030125, '张培杰', 1, 6, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030126, '周泽宏', 1, 6, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030127, '许佳帆', 1, 6, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030128, '张轩', 1, 6, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030129, '黄家俊', 1, 6, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030130, '朱希文', 1, 6, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030131, '陈赞聪', 1, 6, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030132, '谭诗华', 1, 6, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030133, '吴尚儒', 1, 6, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030134, '林星宇', 1, 6, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030135, '杨嘉伟', 1, 6, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030136, '梁明', 1, 6, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030137, '陈金莹', 1, 6, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030138, '车奕衡', 1, 6, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030139, '黄树培', 1, 6, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030140, '蔡骐骏', 1, 6, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030141, '倪载勇', 1, 6, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030142, '邵宣瑜', 1, 6, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030143, '温诗效', 1, 6, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030144, '龙盘吉', 1, 6, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030145, '梁正', 1, 6, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030146, '叶广生', 1, 6, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030147, '卢冠希', 1, 6, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030148, '陈钰林', 1, 6, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030150, '杨坤', 1, 6, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030201, '蔡乐言', 1, 7, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030202, '赖嘉炜', 1, 7, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030203, '曾晨曦', 1, 7, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030204, '凌锐立', 1, 7, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030205, '熊欣幸', 1, 7, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030206, '陈锦标', 1, 7, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030207, '陆沛杰', 1, 7, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030208, '何瑞洲', 1, 7, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030209, '鄢然', 1, 7, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030210, '杨旭', 1, 7, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030212, '曾龙', 1, 7, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030213, '薛远强', 1, 7, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030214, '陈伟炫', 1, 7, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030215, '曾奇锐', 1, 7, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030216, '蔡槡坝', 1, 7, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030217, '余焕娜', 1, 7, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030218, '陈明展', 1, 7, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030219, '朱润锋', 1, 7, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030220, '林泽锋', 1, 7, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030223, '蔡炫骅', 1, 7, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030224, '陈宏熙', 1, 7, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030225, '骆志平', 1, 7, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030226, '陈启立', 1, 7, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030227, '包星颖', 1, 7, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030229, '李孟涛', 1, 7, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030230, '王仙锋', 1, 7, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030231, '谢嘉雄', 1, 7, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030232, '黄嘉瑶', 1, 7, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030233, '颜斯昊', 1, 7, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030234, '梁富荣', 1, 7, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030235, '方绍民', 1, 7, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030236, '袁明宇', 1, 7, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030237, '陈梓杭', 1, 7, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030238, '林淑铧', 1, 7, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030239, '陈梓仪', 1, 7, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030240, '张美婷', 1, 7, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030241, '吴洁', 1, 7, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030242, '张圳淇', 1, 7, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030243, '陈泽宇', 1, 7, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030244, '黄俊鹏', 1, 7, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030245, '陈晓雪', 1, 7, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030246, '胡煜斌', 1, 7, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030247, '林灿豪', 1, 7, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030248, '陈丹玲', 1, 7, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030249, '黄洁萍', 1, 7, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030301, '余佳曼', 1, 8, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030302, '邓沛杰', 1, 8, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030303, '练智杰', 1, 8, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030308, '江凌子', 1, 8, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030309, '姚嘉豪', 1, 8, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030310, '伍文杰', 1, 8, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030311, '王刘杰', 1, 8, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030313, '叶骑鸣', 1, 8, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030316, '甘福民', 1, 8, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030317, '梁群豪', 1, 8, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030319, '何奎霖', 1, 8, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030320, '肖君浩', 1, 8, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030321, '闫骏东', 1, 8, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030322, '黄嘉敏', 1, 8, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030323, '刘朝荣', 1, 8, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030324, '曾镇浩', 1, 8, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030325, '连绪杰', 1, 8, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030326, '李裕锋', 1, 8, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030327, '郑雅丹', 1, 8, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030328, '潘宜鸿', 1, 8, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030329, '玉石', 1, 8, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030330, '莫伟琛', 1, 8, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030331, '梁海迅', 1, 8, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030332, '陈镇源', 1, 8, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030333, '司徒思严', 1, 8, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030334, '林坚', 1, 8, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030335, '王菲林', 1, 8, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030336, '李逸靖', 1, 8, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030337, '李栩锜', 1, 8, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030338, '陆境秀', 1, 8, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030339, '陈文柔', 1, 8, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030340, '方智军', 1, 8, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030341, '唐萍蔓', 1, 8, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030342, '黄甜甜', 1, 8, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030343, '吴成孟', 1, 8, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030344, '吴海保', 1, 8, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030345, '梁金铃', 1, 8, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030347, '沈鸿俊', 1, 8, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030348, '崔梓俊', 1, 8, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030349, '李耀扬', 1, 8, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030350, '林泽森', 1, 8, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030402, '魏晓珊', 1, 9, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030403, '湛伟城', 1, 9, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030404, '李沛林', 1, 9, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030405, '黄政尹', 1, 9, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030406, '胡汉森', 1, 9, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030407, '黄国铨', 1, 9, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030408, '彭儒森', 1, 9, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030410, '黄金生', 1, 9, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030411, '郑旭煜', 1, 9, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030412, '李家新', 1, 9, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030414, '刘耘兆', 1, 9, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030415, '张格瑞', 1, 9, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030416, '黄潭发', 1, 9, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030417, '曹钦祥', 1, 9, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030418, '邹树成', 1, 9, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030419, '周凌珊', 1, 9, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030420, '龚政宇', 1, 9, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030421, '曾怡', 1, 9, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030423, '何清', 1, 9, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030425, '黄乙逢', 1, 9, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030426, '罗素娴', 1, 9, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030427, '叶思敏', 1, 9, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030428, '魏德智', 1, 9, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030429, '刘家祥', 1, 9, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030430, '徐锦源', 1, 9, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030431, '洪国滔', 1, 9, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030433, '韦俊豪', 1, 9, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030434, '吴玉梅', 1, 9, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030435, '刘维铭', 1, 9, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030436, '莫础聪', 1, 9, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030437, '谭希帆', 1, 9, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030439, '邱英哲', 1, 9, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030440, '曾昱铨', 1, 9, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030441, '许浩楠', 1, 9, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030442, '何枫炜', 1, 9, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030443, '韩志豪', 1, 9, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030444, '彭祖为', 1, 9, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030445, '黄细玲', 1, 9, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030446, '彭欣', 1, 9, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030447, '詹楚炫', 1, 9, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030449, '陈镇耀', 1, 9, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030450, '吴培鑫', 1, 9, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030501, '陈凯航', 1, 10, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030502, '王泽豪', 1, 10, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030503, '杨锐', 1, 10, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030505, '李榀雄', 1, 10, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030506, '蔡颖华', 1, 10, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030508, '黄俊铭', 1, 10, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030509, '李芷晴', 1, 10, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030510, '邹振阳', 1, 10, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030511, '王晨曦', 1, 10, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030512, '赵庆松', 1, 10, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030513, '余富华', 1, 10, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030514, '李安琪', 1, 10, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030515, '陈婉林', 1, 10, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030516, '彭彬', 1, 10, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030517, '叶泽淇', 1, 10, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030518, '杨强华', 1, 10, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030520, '袁泽鑫', 1, 10, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030521, '方卓钒', 1, 10, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030522, '吴泽镇', 1, 10, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030523, '郑凯斌', 1, 10, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030524, '郑鑫', 1, 10, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030525, '李建欣', 1, 10, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030526, '郑世迁', 1, 10, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030527, '宁华海', 1, 10, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030528, '李健鹏', 1, 10, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030529, '杨翔灿', 1, 10, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030530, '沈佳莹', 1, 10, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030531, '刘铠', 1, 10, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030532, '林晓宜', 1, 10, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030533, '辜耿楠', 1, 10, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030535, '程意涵', 1, 10, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030538, '郑佳铃', 1, 10, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030539, '林梓潮', 1, 10, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030540, '郑佳娜', 1, 10, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030541, '何坤荣', 1, 10, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030542, '黄元迪', 1, 10, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030543, '梁丽明', 1, 10, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030544, '傅文枝', 1, 10, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030545, '林洁枫', 1, 10, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030547, '杨金水', 1, 10, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030548, '吴绍郅', 1, 10, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030549, '李杰强', 1, 10, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030550, '庞国桃', 1, 10, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106030551, '陈舒婕', 1, 10, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106070101, '冯建锵', 1, 1, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070102, '吴桦超', 1, 1, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070103, '黄栋宜', 1, 1, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070104, '何嘉俊', 1, 1, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070105, '谢逸曦', 1, 1, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070107, '吴帆', 1, 1, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070109, '纪铎蓬', 1, 1, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070110, '陈锦浩', 1, 1, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070111, '李馨森', 1, 1, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070112, '肖华升', 1, 1, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070113, '黄学津', 1, 1, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070114, '庄树泽', 1, 1, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070115, '郑志翔', 1, 1, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070116, '陈毓纯', 1, 1, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070117, '陈曼玲', 1, 1, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070118, '陈汉彬', 1, 1, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070119, '陈佳信', 1, 1, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070120, '郑泽航', 1, 1, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070121, '郑楚滨', 1, 1, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070122, '庄楚铃', 1, 1, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070123, '郑耿槟', 1, 1, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070124, '林雨欣', 1, 1, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070125, '钟楚敏', 1, 1, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070126, '林蔚琳', 1, 1, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070127, '李修颖', 1, 1, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070128, '余锦坤', 1, 1, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070129, '王耀濠', 1, 1, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070131, '余锦源', 1, 1, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070132, '李金贤', 1, 1, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070134, '许丽莹', 1, 1, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070135, '麦土明', 1, 1, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070136, '何志活', 1, 1, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070137, '林宇锴', 1, 1, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070138, '苏伟婷', 1, 1, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070139, '李幸霖', 1, 1, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070140, '李思棋', 1, 1, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070141, '李间仪', 1, 1, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070142, '黄俊贤', 1, 1, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070143, '梁棋康', 1, 1, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070144, '彭浩键', 1, 1, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070145, '邱文超', 1, 1, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070146, '魏素丹', 1, 1, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070147, '林振江', 1, 1, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070148, '张汶婷', 1, 1, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070149, '温广鑫', 1, 1, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070150, '陈浩阳', 1, 1, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070151, '庄荣辉', 1, 1, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070152, '庄思敏', 1, 1, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070201, '陈彦鸿', 1, 2, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070202, '杨嘉龙', 1, 2, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070203, '刘俊杰', 1, 2, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070204, '刘锦森', 1, 2, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070205, '梁乐瑜', 1, 2, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070206, '庄值鑫', 1, 2, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070207, '黄晓栋', 1, 2, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070208, '郭羡鹏', 1, 2, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070209, '陈俞桦', 1, 2, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070210, '石睿', 1, 2, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070212, '郭梓烁', 1, 2, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070213, '杨伟钿', 1, 2, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070214, '文伊扬', 1, 2, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070215, '林阳', 1, 2, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070216, '谢锐', 1, 2, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070217, '郑琼慧', 1, 2, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070218, '张锦裕', 1, 2, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070219, '林伟镇', 1, 2, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070220, '程奕群', 1, 2, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070221, '黄志健', 1, 2, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070222, '潘创杰', 1, 2, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070223, '黄俊鸿', 1, 2, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070224, '张桂漫', 1, 2, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070225, '刘叙杰', 1, 2, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070227, '游世杰', 1, 2, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070228, '欧燕云', 1, 2, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070229, '吴威龙', 1, 2, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070230, '何业伟', 1, 2, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070231, '黄昊', 1, 2, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070232, '谢祥真', 1, 2, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070233, '刘泽凯', 1, 2, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070234, '周俊彦', 1, 2, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070235, '何嘉毅', 1, 2, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070236, '时玉珂', 1, 2, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070237, '陈善荥', 1, 2, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070238, '黄嘉兴', 1, 2, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070239, '罗昌豪', 1, 2, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070240, '卢梓聪', 1, 2, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070241, '谢国辉', 1, 2, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070242, '谭绿升', 1, 2, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070243, '张凯胜', 1, 2, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070244, '蚁弘骏', 1, 2, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070245, '郑伟彬', 1, 2, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070246, '杨佳耿', 1, 2, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070247, '连欣乐', 1, 2, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070248, '周永健', 1, 2, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070249, '吴文俊', 1, 2, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070250, '苑卓', 1, 2, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070251, '黄建雄', 1, 2, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070252, '唐成信', 1, 2, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070301, '李竹林', 1, 3, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070302, '黄勇能', 1, 3, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070303, '钟柳和', 1, 3, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070304, '吴祥宏', 1, 3, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070306, '黄祥鹄', 1, 3, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070307, '李定贤', 1, 3, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070309, '庞海鹏', 1, 3, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070310, '朱文钊', 1, 3, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070311, '黎国栋', 1, 3, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070312, '林文森', 1, 3, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070313, '王楚俊', 1, 3, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070314, '吴梓营', 1, 3, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070315, '何艺', 1, 3, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070317, '李冠潮', 1, 3, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070318, '吴双萍', 1, 3, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070319, '张天慧', 1, 3, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070320, '黄浦添', 1, 3, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070321, '陶埸', 1, 3, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070322, '王明', 1, 3, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070323, '唐国策', 1, 3, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070324, '刘金生', 1, 3, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070325, '黄俊杰', 1, 3, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070326, '刘子霞', 1, 3, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070327, '曾名庭', 1, 3, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070328, '欧冬荣', 1, 3, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070329, '欧有兴', 1, 3, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070330, '陈晖', 1, 3, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070331, '王学东', 1, 3, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070332, '李业', 1, 3, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070333, '吴春峰', 1, 3, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070334, '黄杜奇', 1, 3, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070335, '罗家瑞', 1, 3, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070339, '蔡坤熠', 1, 3, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070340, '洪志铭', 1, 3, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070341, '肖武雄', 1, 3, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070342, '柳乔然', 1, 3, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070343, '钟震廷', 1, 3, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070344, '鲁坷', 1, 3, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070348, '赵军强', 1, 3, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070349, '艾帅君', 1, 3, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070350, '高树行', 1, 3, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070351, '郭锦聪', 1, 3, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070352, '郭可欣', 1, 3, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070353, '陈木涛', 1, 3, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070401, '许思培', 1, 4, 1, 1696839228, 13, 2021);
INSERT INTO `student` VALUES (2106070402, '黄佳玉', 1, 4, 1, 1696838155, 13, 2021);
INSERT INTO `student` VALUES (2106070403, '王伊琳', 1, 4, 1, 1696838460, 13, 2021);
INSERT INTO `student` VALUES (2106070404, '李培龙', 1, 4, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070406, '胡世立', 1, 4, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070407, '陈品曼', 1, 4, 1, 1696839498, 13, 2021);
INSERT INTO `student` VALUES (2106070408, '魏晓晓', 1, 4, 1, 1696839663, 13, 2021);
INSERT INTO `student` VALUES (2106070409, '范欣欣', 1, 4, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070410, '黎莎', 1, 4, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070411, '罗炳华', 1, 4, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070412, '刘天涛', 1, 4, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070413, '沙子龙', 1, 4, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070414, '胡迁丰', 1, 4, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070415, '李雅萍', 1, 4, 1, 1696839569, 13, 2021);
INSERT INTO `student` VALUES (2106070416, '林艺铭', 1, 4, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070417, '郑俊滨', 1, 4, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070419, '胡晓鑫', 1, 4, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070421, '郑萍云', 1, 4, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070422, '郑梓扬', 1, 4, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070425, '杨敏', 1, 4, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070426, '黄伟振', 1, 4, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070428, '华浪', 1, 4, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070429, '谢恒', 1, 4, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070430, '古天明', 1, 4, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070431, '庞桂容', 1, 4, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070432, '毛武飞', 1, 4, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070433, '冯津铭', 1, 4, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070434, '罗艺', 1, 4, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070435, '赖佳东', 1, 4, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070436, '陈怡', 1, 4, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070437, '陈俊权', 1, 4, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070438, '余升宏', 1, 4, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070439, '黄璐瑶', 1, 4, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070440, '陈锦涛', 1, 4, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070442, '高文佳', 1, 4, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070443, '林东阳', 1, 4, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070444, '罗毅', 1, 4, 1, 1696839731, 13, 2021);
INSERT INTO `student` VALUES (2106070445, '陈楚熳', 1, 4, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070446, '杨洁凤', 1, 4, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070447, '李宏信', 1, 4, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070448, '林浩佳', 1, 4, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070449, '朱培泳', 1, 4, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070450, '陈嘉伟', 1, 4, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070451, '许树凯', 1, 4, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070452, '罗晓君', 1, 4, 1, 1696839409, 13, 2021);
INSERT INTO `student` VALUES (2106070453, '赖裕林', 1, 4, 1, 1696839092, 13, 2021);
INSERT INTO `student` VALUES (2106070454, '黄秋瑞', 1, 4, 1, NULL, 13, 2021);
INSERT INTO `student` VALUES (2106070502, '苏俊杰', 1, 5, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106070503, '陈奇华', 1, 5, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106070504, '凌泽枫', 1, 5, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106070505, '刘烨', 1, 5, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106070506, '吴轩', 1, 5, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106070507, '谭菁', 1, 5, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106070508, '陈格林', 1, 5, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106070509, '罗钜涛', 1, 5, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106070510, '李树仁', 1, 5, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106070511, '刘培贤', 1, 5, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106070512, '梁伟健', 1, 5, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106070513, '李广华', 1, 5, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106070514, '廖汇翔', 1, 5, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106070515, '李锐', 1, 5, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106070516, '池梓豪', 1, 5, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106070517, '陈森', 1, 5, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106070518, '梁子杰', 1, 5, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106070519, '龚若龙', 1, 5, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106070520, '骆宝', 1, 5, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106070521, '池铭皞', 1, 5, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106070522, '潘业枫', 1, 5, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106070523, '梁耀佳', 1, 5, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106070524, '屈兆熙', 1, 5, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106070525, '黄家锋', 1, 5, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106070527, '虞文博', 1, 5, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106070528, '胡皓杰', 1, 5, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106070529, '曾韬', 1, 5, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106070530, '张嘉鑫', 1, 5, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106070531, '郭佳凯', 1, 5, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106070532, '黄秉镇', 1, 5, 1, NULL, 12, 2021);
INSERT INTO `student` VALUES (2106200101, '李浩鑫', 1, 11, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200102, '唐嘉', 1, 11, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200103, '黄君豪', 1, 11, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200104, '劳梓健', 1, 11, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200105, '吴锦河', 1, 11, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200106, '董镇宇', 1, 11, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200107, '陈正原', 1, 11, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200108, '谢泽韩', 1, 11, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200109, '郑泓楷', 1, 11, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200110, '陈泽欣', 1, 11, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200111, '魏志桓', 1, 11, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200112, '林炜斌', 1, 11, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200113, '王泽钦', 1, 11, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200114, '洪泽婷', 1, 11, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200115, '黄源俊', 1, 11, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200116, '吴东寅', 1, 11, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200117, '陈锶婷', 1, 11, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200118, '曾育婷', 1, 11, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200119, '吴贤丽', 1, 11, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200120, '张丹微', 1, 11, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200121, '谢树燕', 1, 11, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200122, '庄佳娜', 1, 11, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200123, '郑湘楠', 1, 11, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200124, '郑铃怡', 1, 11, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200125, '郑邦楷', 1, 11, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200126, '陈泽敏', 1, 11, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200127, '林峰', 1, 11, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200128, '姚凯峰', 1, 11, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200129, '陈思遐', 1, 11, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200130, '李熙赞', 1, 11, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200131, '许晓彤', 1, 11, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200132, '吴钊楠', 1, 11, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200133, '王松淦', 1, 11, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200134, '蔡润彬', 1, 11, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200135, '黎骏豪', 1, 11, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200136, '谭铭诺', 1, 11, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200137, '邓生卓', 1, 11, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200138, '祝浩杰', 1, 11, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200140, '林锦国', 1, 11, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200143, '戴汉编', 1, 11, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200144, '韦迎', 1, 11, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200145, '温浩然', 1, 11, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200146, '杨贺旭', 1, 11, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200148, '梁棋乐', 1, 11, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200149, '曾杰谦', 1, 11, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200150, '林靖', 1, 11, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200152, '李博文', 1, 11, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200153, '丘乐基', 1, 11, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200154, '苏哲', 1, 11, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200202, '李佳泉', 1, 12, 1, 1696819767, 11, 2021);
INSERT INTO `student` VALUES (2106200204, '曾勇辉', 1, 12, 1, 1696819883, 11, 2021);
INSERT INTO `student` VALUES (2106200205, '吴玉萍', 1, 12, 1, 1696819923, 11, 2021);
INSERT INTO `student` VALUES (2106200206, '叶俊威', 1, 12, 1, 1696819976, 11, 2021);
INSERT INTO `student` VALUES (2106200207, '陈美静', 1, 12, 1, 1696820026, 11, 2021);
INSERT INTO `student` VALUES (2106200208, '罗依轻', 1, 12, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200209, '林育生', 1, 12, 1, 1696820092, 11, 2021);
INSERT INTO `student` VALUES (2106200210, '唐远韩', 1, 12, 1, 1696820130, 11, 2021);
INSERT INTO `student` VALUES (2106200213, '胡梦芹', 1, 12, 1, 1696820165, 11, 2021);
INSERT INTO `student` VALUES (2106200214, '郑腾跃', 1, 12, 1, 1696820195, 11, 2021);
INSERT INTO `student` VALUES (2106200215, '庄佳胜', 1, 12, 1, 1696820233, 11, 2021);
INSERT INTO `student` VALUES (2106200216, '李灿植', 1, 12, 1, 1696820268, 11, 2021);
INSERT INTO `student` VALUES (2106200217, '卢佳鑫', 1, 12, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200218, '林炼培', 1, 12, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200219, '孙湃钒', 1, 12, 1, 1696820297, 11, 2021);
INSERT INTO `student` VALUES (2106200222, '卢敏如', 1, 12, 1, 1696820324, 11, 2021);
INSERT INTO `student` VALUES (2106200223, '阮宇航', 1, 12, 1, 1696820831, 11, 2021);
INSERT INTO `student` VALUES (2106200224, '黄嘉怡', 1, 12, 1, 1696820901, 11, 2021);
INSERT INTO `student` VALUES (2106200225, '李金海', 1, 12, 1, 1696821005, 11, 2021);
INSERT INTO `student` VALUES (2106200226, '蔡梓沛', 1, 12, 1, 1696821040, 11, 2021);
INSERT INTO `student` VALUES (2106200227, '张楷', 1, 12, 1, 1696821087, 11, 2021);
INSERT INTO `student` VALUES (2106200228, '周泽伟', 1, 12, 1, 1696821179, 11, 2021);
INSERT INTO `student` VALUES (2106200229, '沈浩英', 1, 12, 1, 1696821212, 11, 2021);
INSERT INTO `student` VALUES (2106200230, '林楷帆', 1, 12, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200231, '郭卓佳', 1, 12, 1, 1696821255, 11, 2021);
INSERT INTO `student` VALUES (2106200232, '林曼如', 1, 12, 1, 1696821304, 11, 2021);
INSERT INTO `student` VALUES (2106200233, '张霖', 1, 12, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200235, '林小荣', 1, 12, 1, 1696821446, 11, 2021);
INSERT INTO `student` VALUES (2106200236, '方洪宇', 1, 12, 1, 1696821990, 11, 2021);
INSERT INTO `student` VALUES (2106200237, '郑凯立', 1, 12, 1, 1696822110, 11, 2021);
INSERT INTO `student` VALUES (2106200238, '钟广源', 1, 12, 1, 1696822393, 11, 2021);
INSERT INTO `student` VALUES (2106200239, '邓林彬', 1, 12, 1, 1696823756, 11, 2021);
INSERT INTO `student` VALUES (2106200240, '刘纯娜', 1, 12, 1, 1696823794, 11, 2021);
INSERT INTO `student` VALUES (2106200241, '方润中', 1, 12, 1, 1696823832, 11, 2021);
INSERT INTO `student` VALUES (2106200242, '杜承臻', 1, 12, 1, 1696823882, 11, 2021);
INSERT INTO `student` VALUES (2106200243, '肖雅欣', 1, 12, 1, 1696823928, 11, 2021);
INSERT INTO `student` VALUES (2106200244, '谭子诚', 1, 12, 1, 1696823963, 11, 2021);
INSERT INTO `student` VALUES (2106200245, '李铧斌', 1, 12, 1, 1696824034, 11, 2021);
INSERT INTO `student` VALUES (2106200246, '李健宏', 1, 12, 1, 1696824065, 11, 2021);
INSERT INTO `student` VALUES (2106200247, '陈燊燊', 1, 12, 1, 1696824196, 11, 2021);
INSERT INTO `student` VALUES (2106200248, '李硕', 1, 12, 1, 1696824324, 11, 2021);
INSERT INTO `student` VALUES (2106200249, '罗丽君', 1, 12, 1, 1696824375, 11, 2021);
INSERT INTO `student` VALUES (2106200250, '方恒嘉', 1, 12, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200251, '黄文轩', 1, 12, 1, 1696824424, 11, 2021);
INSERT INTO `student` VALUES (2106200252, '彭俊豪', 1, 12, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200253, '林杰鹏', 1, 12, 1, 1696824466, 11, 2021);
INSERT INTO `student` VALUES (2106200254, '练志浩', 1, 12, 1, 1696824503, 11, 2021);
INSERT INTO `student` VALUES (2106200301, '刘家坤', 1, 13, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200302, '古建华', 1, 13, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200303, '何浩然', 1, 13, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200304, '陈梦怡', 1, 13, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200305, '唐佳乐', 1, 13, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200306, '郎强', 1, 13, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200307, '陈浩通', 1, 13, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200308, '陈浩鑫', 1, 13, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200309, '黄棉昕', 1, 13, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200310, '黄自超', 1, 13, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200312, '陈锦铜', 1, 13, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200314, '谢浩荣', 1, 13, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200315, '唐翠怡', 1, 13, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200316, '李艺敏', 1, 13, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200317, '梁卓轩', 1, 13, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200318, '李柳婷', 1, 13, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200319, '黄润松', 1, 13, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200320, '容励娴', 1, 13, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200321, '林文锋', 1, 13, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200322, '李卓威', 1, 13, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200323, '梁紫晴', 1, 13, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200324, '李子恒', 1, 13, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200325, '庞德甽', 1, 13, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200326, '李松洁', 1, 13, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200327, '李秋民', 1, 13, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200328, '陈彬', 1, 13, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200329, '麦鸿基', 1, 13, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200330, '廖奕枫', 1, 13, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200331, '陈旭', 1, 13, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200332, '陈铉昊', 1, 13, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200334, '陈煜基', 1, 13, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200335, '陈培昊', 1, 13, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200337, '陈茗育', 1, 13, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200338, '陈千伟', 1, 13, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200339, '康晓天', 1, 13, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200341, '李新兴', 1, 13, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200342, '吴国艺', 1, 13, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200343, '林铂荃', 1, 13, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200344, '黄俊鑫', 1, 13, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200345, '邓景升', 1, 13, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200346, '苏长莹', 1, 13, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200347, '陈增毫', 1, 13, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200348, '李贵成', 1, 13, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200349, '陈俊宇', 1, 13, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200350, '温梓翔', 1, 13, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200354, '邓梓镇', 1, 13, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200401, '梁世朝', 1, 14, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200402, '陈科晔', 1, 14, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200403, '黄绍铭', 1, 14, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200404, '朱奕朽', 1, 14, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200405, '余易辉', 1, 14, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200406, '冯志成', 1, 14, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200407, '肖碧英', 1, 14, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200408, '林家明', 1, 14, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200409, '余祖桓', 1, 14, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200410, '刘芳玉', 1, 14, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200411, '孔琳翔', 1, 14, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200413, '张远杰', 1, 14, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200414, '凌征锋', 1, 14, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200415, '刘洪涛', 1, 14, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200416, '卓志恩', 1, 14, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200417, '李家静', 1, 14, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200418, '黄思远', 1, 14, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200419, '谢金浩', 1, 14, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200420, '刘建宇', 1, 14, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200421, '陈鸿胜', 1, 14, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200422, '罗馨蕊', 1, 14, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200423, '袁鸿祥', 1, 14, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200424, '袁思敏', 1, 14, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200425, '黄楠峻', 1, 14, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200426, '梁圆堃', 1, 14, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200427, '陈耀平', 1, 14, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200428, '黄子铭', 1, 14, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200429, '冼宗沛', 1, 14, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200430, '黄俊森', 1, 14, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200432, '朱焯源', 1, 14, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200433, '冯家惠', 1, 14, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200435, '陈钰强', 1, 14, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200436, '谢臻鸿', 1, 14, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200437, '许世豪', 1, 14, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200438, '林钊华', 1, 14, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200439, '陈建晔', 1, 14, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200440, '吕珊', 1, 14, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200442, '彭广银', 1, 14, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200443, '林俊锋', 1, 14, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200444, '方雁怡', 1, 14, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200445, '方培宇', 1, 14, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200446, '李坚浩', 1, 14, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200447, '陈耿彬', 1, 14, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200450, '颜锴雄', 1, 14, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200451, '洪志坤', 1, 14, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200452, '谭霖凯', 1, 14, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200501, '钟校友', 1, 15, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200502, '熊宸辰', 1, 15, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200503, '何玮涛', 1, 15, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200504, '谢敏怡', 1, 15, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200505, '余海龙', 1, 15, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200506, '欧通', 1, 15, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200507, '朱卓军', 1, 15, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200508, '吴嘉杰', 1, 15, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200509, '李嘉伟', 1, 15, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200510, '梁潇锋', 1, 15, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200511, '李浩宇', 1, 15, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200512, '蔡志新', 1, 15, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200513, '肖华健', 1, 15, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200514, '李明亮', 1, 15, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200515, '陈冠良', 1, 15, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200516, '陈培毅', 1, 15, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200517, '何斯力', 1, 15, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200518, '蓝锦铃', 1, 15, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200519, '庞梓浩', 1, 15, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200520, '张国立', 1, 15, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200521, '陈梓然', 1, 15, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200522, '李金林', 1, 15, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200523, '李燚', 1, 15, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200524, '罗琳莉', 1, 15, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200525, '张智龙', 1, 15, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200526, '陈海辉', 1, 15, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200527, '庄矫龙', 1, 15, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200528, '薛嘉城', 1, 15, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200529, '彭裕山', 1, 15, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200530, '朱宇东', 1, 15, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200531, '彭鑫', 1, 15, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200532, '郑楚沛', 1, 15, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200533, '张俊柯', 1, 15, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200534, '钟智宇', 1, 15, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200535, '徐海容', 1, 15, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200536, '冼楚欣', 1, 15, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200537, '许胜逸', 1, 15, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200538, '蔡宇辉', 1, 15, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200541, '陈雷阳', 1, 15, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200542, '章哲', 1, 15, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200543, '吴子民', 1, 15, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200544, '吴国涛', 1, 15, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200545, '曾金菊', 1, 15, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200546, '许林狄', 1, 15, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200547, '陈钰东', 1, 15, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200548, '黄楚程', 1, 15, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200549, '钟梓澎', 1, 15, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106200550, '罗梓聪', 1, 15, 1, NULL, 11, 2021);
INSERT INTO `student` VALUES (2106280101, '雷嘉颖', 1, 16, 1, 1696596572, 14, 2021);
INSERT INTO `student` VALUES (2106280102, '姚绮琳', 1, 16, 1, 1696596624, 14, 2021);
INSERT INTO `student` VALUES (2106280103, '易宣秀', 1, 16, 1, NULL, 14, 2021);
INSERT INTO `student` VALUES (2106280104, '萧欣仪', 1, 16, 1, 1696596661, 14, 2021);
INSERT INTO `student` VALUES (2106280105, '江晓彤', 1, 16, 1, 1696596746, 14, 2021);
INSERT INTO `student` VALUES (2106280106, '刘芷珊', 1, 16, 1, 1696596765, 14, 2021);
INSERT INTO `student` VALUES (2106280107, '萧雅琪', 1, 16, 1, 1696596784, 14, 2021);
INSERT INTO `student` VALUES (2106280108, '陈咏沁', 1, 16, 1, 1696596811, 14, 2021);
INSERT INTO `student` VALUES (2106280109, '刘玉彬', 1, 16, 1, 1696604156, 14, 2021);
INSERT INTO `student` VALUES (2106280110, '徐永燊', 1, 16, 1, NULL, 14, 2021);
INSERT INTO `student` VALUES (2106280111, '刘芷欣', 1, 16, 1, 1696600766, 14, 2021);
INSERT INTO `student` VALUES (2106280112, '汤斯尹', 1, 16, 1, 1696600812, 14, 2021);
INSERT INTO `student` VALUES (2106280113, '段榕灵', 1, 16, 1, 1696600857, 14, 2021);
INSERT INTO `student` VALUES (2106280114, '谭雯欣', 1, 16, 1, 1696604218, 14, 2021);
INSERT INTO `student` VALUES (2106280115, '徐燚', 1, 16, 1, 1696604282, 14, 2021);
INSERT INTO `student` VALUES (2106280116, '林逸钧', 1, 16, 1, 1696600959, 14, 2021);
INSERT INTO `student` VALUES (2106280117, '谢淋琳', 1, 16, 1, 1696600990, 14, 2021);
INSERT INTO `student` VALUES (2106280118, '林家壕', 1, 16, 1, 1696601043, 14, 2021);
INSERT INTO `student` VALUES (2106280119, '李妙涵', 1, 16, 1, 1696601076, 14, 2021);
INSERT INTO `student` VALUES (2106280120, '许诗妍', 1, 16, 1, 1696601106, 14, 2021);
INSERT INTO `student` VALUES (2106280121, '朱梓宜', 1, 16, 1, 1696601132, 14, 2021);
INSERT INTO `student` VALUES (2106280122, '郑建和', 1, 16, 1, 1696840647, 14, 2021);
INSERT INTO `student` VALUES (2106280123, '陈仕桐', 1, 16, 1, 1696604317, 14, 2021);
INSERT INTO `student` VALUES (2106280124, '陈依敏', 1, 16, 1, NULL, 14, 2021);
INSERT INTO `student` VALUES (2106280125, '杨育洁', 1, 16, 1, 1696601162, 14, 2021);
INSERT INTO `student` VALUES (2106280126, '林欣', 1, 16, 1, 1696601189, 14, 2021);
INSERT INTO `student` VALUES (2106280127, '杨婉琪', 1, 16, 1, 1696601212, 14, 2021);
INSERT INTO `student` VALUES (2106280128, '姚煜东', 1, 16, 1, NULL, 14, 2021);
INSERT INTO `student` VALUES (2106280129, '曾嘉欣', 1, 16, 1, 1696601242, 14, 2021);
INSERT INTO `student` VALUES (2106280130, '许燕恋', 1, 16, 1, 1696601270, 14, 2021);
INSERT INTO `student` VALUES (2106280131, '郑梓欣', 1, 16, 1, 1696601365, 14, 2021);
INSERT INTO `student` VALUES (2106280132, '李嘉宜', 1, 16, 1, 1696601446, 14, 2021);
INSERT INTO `student` VALUES (2106280133, '谢乐慈', 1, 16, 1, 1696601470, 14, 2021);
INSERT INTO `student` VALUES (2106280134, '廖婉琳', 1, 16, 1, 1696601491, 14, 2021);
INSERT INTO `student` VALUES (2106280135, '李家鑫', 1, 16, 1, 1696604404, 14, 2021);
INSERT INTO `student` VALUES (2106280136, '郑筱丹', 1, 16, 1, 1696601793, 14, 2021);
INSERT INTO `student` VALUES (2106280137, '肖烨杭', 1, 16, 1, 1696601559, 14, 2021);
INSERT INTO `student` VALUES (2106280138, '邵彤', 1, 16, 1, 1696601583, 14, 2021);
INSERT INTO `student` VALUES (2106280139, '许嘉琳', 1, 16, 1, 1696601750, 14, 2021);
INSERT INTO `student` VALUES (2106280140, '李可镘', 1, 16, 1, 1696601818, 14, 2021);
INSERT INTO `student` VALUES (2106280141, '李梓妍', 1, 16, 1, 1696601841, 14, 2021);
INSERT INTO `student` VALUES (2106280142, '王依楠', 1, 16, 1, 1696601863, 14, 2021);
INSERT INTO `student` VALUES (2106280143, '温佳琳', 1, 16, 1, 1696601887, 14, 2021);
INSERT INTO `student` VALUES (2106280145, '吴娜狄', 1, 16, 1, 1696601907, 14, 2021);
INSERT INTO `student` VALUES (2106280147, '吴钰', 1, 16, 1, 1696601935, 14, 2021);
INSERT INTO `student` VALUES (2106280148, '王颖', 1, 16, 1, 1696601961, 14, 2021);
INSERT INTO `student` VALUES (2106280149, '苏梓柔', 1, 16, 1, 1696840770, 14, 2021);
INSERT INTO `student` VALUES (2106280150, '梁锡鹏', 1, 16, 1, 1696840677, 14, 2021);
INSERT INTO `student` VALUES (2106280151, '梁文忠', 1, 16, 1, 1696840849, 14, 2021);
INSERT INTO `student` VALUES (2106280201, '廖子君', 1, 17, 1, 1696751067, 14, 2021);
INSERT INTO `student` VALUES (2106280202, '张梓婷', 1, 17, 1, 1696751162, 14, 2021);
INSERT INTO `student` VALUES (2106280203, '陈佩玲', 1, 17, 1, 1696751190, 14, 2021);
INSERT INTO `student` VALUES (2106280204, '梁健怡', 1, 17, 1, 1696752699, 14, 2021);
INSERT INTO `student` VALUES (2106280205, '陈旭铧', 1, 17, 1, 1696751272, 14, 2021);
INSERT INTO `student` VALUES (2106280206, '夏嘉敏', 1, 17, 1, 1696751308, 14, 2021);
INSERT INTO `student` VALUES (2106280207, '余君仪', 1, 17, 1, NULL, 14, 2021);
INSERT INTO `student` VALUES (2106280208, '冯洁莹', 1, 17, 1, 1696751405, 14, 2021);
INSERT INTO `student` VALUES (2106280210, '郭紫仪', 1, 17, 1, NULL, 14, 2021);
INSERT INTO `student` VALUES (2106280211, '叶海欣', 1, 17, 1, 1696751427, 14, 2021);
INSERT INTO `student` VALUES (2106280212, '吕婉晴', 1, 17, 1, 1696751452, 14, 2021);
INSERT INTO `student` VALUES (2106280214, '陈思恩', 1, 17, 1, 1696751475, 14, 2021);
INSERT INTO `student` VALUES (2106280215, '陈俊宇', 1, 17, 1, 1696751496, 14, 2021);
INSERT INTO `student` VALUES (2106280217, '陈禧妍', 1, 17, 1, 1696751532, 14, 2021);
INSERT INTO `student` VALUES (2106280218, '郭晓燕', 1, 17, 1, 1696751553, 14, 2021);
INSERT INTO `student` VALUES (2106280219, '詹鹏辉', 1, 17, 1, 1696751575, 14, 2021);
INSERT INTO `student` VALUES (2106280220, '黄晓', 1, 17, 1, 1696751597, 14, 2021);
INSERT INTO `student` VALUES (2106280221, '刘海燕', 1, 17, 1, 1696751618, 14, 2021);
INSERT INTO `student` VALUES (2106280223, '邓惠敏', 1, 17, 1, 1696751638, 14, 2021);
INSERT INTO `student` VALUES (2106280224, '钟佩思', 1, 17, 1, NULL, 14, 2021);
INSERT INTO `student` VALUES (2106280225, '颜映雪', 1, 17, 1, 1696751656, 14, 2021);
INSERT INTO `student` VALUES (2106280226, '庄雨桑', 1, 17, 1, 1696751682, 14, 2021);
INSERT INTO `student` VALUES (2106280227, '张洛彬', 1, 17, 1, 1696751703, 14, 2021);
INSERT INTO `student` VALUES (2106280228, '黄羽靖', 1, 17, 1, 1696751726, 14, 2021);
INSERT INTO `student` VALUES (2106280229, '戴安娜', 1, 17, 1, 1696751760, 14, 2021);
INSERT INTO `student` VALUES (2106280230, '施丽芬', 1, 17, 1, 1696751784, 14, 2021);
INSERT INTO `student` VALUES (2106280231, '刘慧瑶', 1, 17, 1, 1696751806, 14, 2021);
INSERT INTO `student` VALUES (2106280232, '郭绥花', 1, 17, 1, 1696751828, 14, 2021);
INSERT INTO `student` VALUES (2106280233, '王纯美', 1, 17, 1, 1696751864, 14, 2021);
INSERT INTO `student` VALUES (2106280234, '颜思晓', 1, 17, 1, 1696751884, 14, 2021);
INSERT INTO `student` VALUES (2106280235, '刘思芸', 1, 17, 1, 1696751904, 14, 2021);
INSERT INTO `student` VALUES (2106280236, '张芯绮', 1, 17, 1, NULL, 14, 2021);
INSERT INTO `student` VALUES (2106280237, '黄庆钟', 1, 17, 1, 1696751932, 14, 2021);
INSERT INTO `student` VALUES (2106280238, '阮文婷', 1, 17, 1, 1696751962, 14, 2021);
INSERT INTO `student` VALUES (2106280239, '黄思彤', 1, 17, 1, 1696751987, 14, 2021);
INSERT INTO `student` VALUES (2106280240, '阮泳思', 1, 17, 1, 1696752029, 14, 2021);
INSERT INTO `student` VALUES (2106280242, '陈锦聪', 1, 17, 1, 1696752048, 14, 2021);
INSERT INTO `student` VALUES (2106280243, '黄江枫', 1, 17, 1, NULL, 14, 2021);
INSERT INTO `student` VALUES (2106280244, '邱常鋆', 1, 17, 1, 1696752589, 14, 2021);
INSERT INTO `student` VALUES (2106280245, '陈冬儿', 1, 17, 1, 1696752105, 14, 2021);
INSERT INTO `student` VALUES (2106280246, '欧锦迎', 1, 17, 1, 1696752124, 14, 2021);
INSERT INTO `student` VALUES (2106280247, '胡曼丽', 1, 17, 1, 1696752163, 14, 2021);
INSERT INTO `student` VALUES (2106280248, '黄晓峰', 1, 17, 1, 1696752181, 14, 2021);
INSERT INTO `student` VALUES (2106280249, '林佳佳', 1, 17, 1, 1696752201, 14, 2021);
INSERT INTO `student` VALUES (2106280250, '邓锦芳', 1, 17, 1, 1696752217, 14, 2021);
INSERT INTO `student` VALUES (2106280301, '林静敏', 1, 18, 1, 1696831408, 14, 2021);
INSERT INTO `student` VALUES (2106280303, '林蓉琪', 1, 18, 1, 1696831483, 14, 2021);
INSERT INTO `student` VALUES (2106280304, '罗芷薇', 1, 18, 1, 1696831560, 14, 2021);
INSERT INTO `student` VALUES (2106280305, '王金敏', 1, 18, 1, 1696842659, 14, 2021);
INSERT INTO `student` VALUES (2106280306, '蔡晴晴', 1, 18, 1, 1696842719, 14, 2021);
INSERT INTO `student` VALUES (2106280308, '陈海锋', 1, 18, 1, 1696842866, 14, 2021);
INSERT INTO `student` VALUES (2106280309, '尤艳', 1, 18, 1, NULL, 14, 2021);
INSERT INTO `student` VALUES (2106280310, '黄晶晶', 1, 18, 1, 1696842919, 14, 2021);
INSERT INTO `student` VALUES (2106280311, '陈彦孜', 1, 18, 1, NULL, 14, 2021);
INSERT INTO `student` VALUES (2106280312, '卢慧莹', 1, 18, 1, 1696829990, 14, 2021);
INSERT INTO `student` VALUES (2106280313, '罗盛源', 1, 18, 1, 1696842968, 14, 2021);
INSERT INTO `student` VALUES (2106280314, '刘思宇', 1, 18, 1, NULL, 14, 2021);
INSERT INTO `student` VALUES (2106280315, '万陈杰', 1, 18, 1, 1696843008, 14, 2021);
INSERT INTO `student` VALUES (2106280316, '何欣倩', 1, 18, 1, 1696843048, 14, 2021);
INSERT INTO `student` VALUES (2106280317, '林飞绵', 1, 18, 1, 1696843083, 14, 2021);
INSERT INTO `student` VALUES (2106280318, '陈悦', 1, 18, 1, 1696843144, 14, 2021);
INSERT INTO `student` VALUES (2106280319, '章丽婵', 1, 18, 1, 1696843178, 14, 2021);
INSERT INTO `student` VALUES (2106280321, '陈淑玲', 1, 18, 1, 1696843226, 14, 2021);
INSERT INTO `student` VALUES (2106280322, '吴瑞香', 1, 18, 1, 1696843267, 14, 2021);
INSERT INTO `student` VALUES (2106280323, '郑秋鸿', 1, 18, 1, 1696843296, 14, 2021);
INSERT INTO `student` VALUES (2106280324, '彭柳', 1, 18, 1, 1696843327, 14, 2021);
INSERT INTO `student` VALUES (2106280325, '梁美婷', 1, 18, 1, 1696843351, 14, 2021);
INSERT INTO `student` VALUES (2106280326, '谭栋', 1, 18, 1, 1696843383, 14, 2021);
INSERT INTO `student` VALUES (2106280327, '杨育杰', 1, 18, 1, 1696843421, 14, 2021);
INSERT INTO `student` VALUES (2106280328, '李晓婷', 1, 18, 1, 1696843443, 14, 2021);
INSERT INTO `student` VALUES (2106280329, '万嘉欣', 1, 18, 1, 1696843472, 14, 2021);
INSERT INTO `student` VALUES (2106280330, '蔡海润', 1, 18, 1, 1696843524, 14, 2021);
INSERT INTO `student` VALUES (2106280332, '魏美琪', 1, 18, 1, 1696843549, 14, 2021);
INSERT INTO `student` VALUES (2106280333, '黄向如', 1, 18, 1, NULL, 14, 2021);
INSERT INTO `student` VALUES (2106280334, '林建正', 1, 18, 1, NULL, 14, 2021);
INSERT INTO `student` VALUES (2106280335, '易冬兰', 1, 18, 1, 1696843581, 14, 2021);
INSERT INTO `student` VALUES (2106280336, '林树滢', 1, 18, 1, NULL, 14, 2021);
INSERT INTO `student` VALUES (2106280337, '欧宇恩', 1, 18, 1, 1696843614, 14, 2021);
INSERT INTO `student` VALUES (2106280338, '罗嘉杰', 1, 18, 1, 1696843662, 14, 2021);
INSERT INTO `student` VALUES (2106280339, '刘斯婷', 1, 18, 1, 1696843689, 14, 2021);
INSERT INTO `student` VALUES (2106280340, '林奕均', 1, 18, 1, NULL, 14, 2021);
INSERT INTO `student` VALUES (2106280342, '潘宇成', 1, 18, 1, 1696843720, 14, 2021);
INSERT INTO `student` VALUES (2106280343, '陈振文', 1, 18, 1, 1696843743, 14, 2021);
INSERT INTO `student` VALUES (2106280344, '崔燕文', 1, 18, 1, 1696843766, 14, 2021);
INSERT INTO `student` VALUES (2106280345, '刘锦河', 1, 18, 1, 1696843792, 14, 2021);
INSERT INTO `student` VALUES (2106280346, '黄颖苗', 1, 18, 1, 1696843821, 14, 2021);
INSERT INTO `student` VALUES (2106280347, '陈慧敏', 1, 18, 1, 1696843845, 14, 2021);
INSERT INTO `student` VALUES (2106280348, '凌盾威', 1, 18, 1, 1696843867, 14, 2021);
INSERT INTO `student` VALUES (2106280349, '陈柏全', 1, 18, 1, 1696844225, 14, 2021);
INSERT INTO `student` VALUES (2106280350, '叶文彬', 1, 18, 1, 1696843923, 14, 2021);
INSERT INTO `student` VALUES (2106280401, '刘辉鹏', 1, 19, 1, NULL, 14, 2021);
INSERT INTO `student` VALUES (2106280402, '李观萍', 1, 19, 1, 1696841161, 14, 2021);
INSERT INTO `student` VALUES (2106280403, '黄虹桦', 1, 19, 1, 1696841216, 14, 2021);
INSERT INTO `student` VALUES (2106280404, '胡润湘', 1, 19, 1, 1696841260, 14, 2021);
INSERT INTO `student` VALUES (2106280405, '林曦', 1, 19, 1, 1696841309, 14, 2021);
INSERT INTO `student` VALUES (2106280406, '詹裕庭', 1, 19, 1, NULL, 14, 2021);
INSERT INTO `student` VALUES (2106280409, '王文浩', 1, 19, 1, 1696841593, 14, 2021);
INSERT INTO `student` VALUES (2106280410, '潘龙', 1, 19, 1, 1696841658, 14, 2021);
INSERT INTO `student` VALUES (2106280411, '江雅婷', 1, 19, 1, 1696841820, 14, 2021);
INSERT INTO `student` VALUES (2106280412, '黄慧娜', 1, 19, 1, 1696841890, 14, 2021);
INSERT INTO `student` VALUES (2106280413, '罗雅', 1, 19, 1, 1696841930, 14, 2021);
INSERT INTO `student` VALUES (2106280414, '郑启铖', 1, 19, 1, 1696842116, 14, 2021);
INSERT INTO `student` VALUES (2106280415, '冯晓敏', 1, 19, 1, 1696842156, 14, 2021);
INSERT INTO `student` VALUES (2106280416, '郑丽柔', 1, 19, 1, 1696842239, 14, 2021);
INSERT INTO `student` VALUES (2106280417, '刘琳', 1, 19, 1, 1696840991, 14, 2021);
INSERT INTO `student` VALUES (2106280418, '陈韵芝', 1, 19, 1, 1696842288, 14, 2021);
INSERT INTO `student` VALUES (2106280420, '邹世通', 1, 19, 1, 1696842346, 14, 2021);
INSERT INTO `student` VALUES (2106280421, '刘淑文', 1, 19, 1, 1696842398, 14, 2021);
INSERT INTO `student` VALUES (2106280422, '李浩诗', 1, 19, 1, 1696842457, 14, 2021);
INSERT INTO `student` VALUES (2106280424, '许丹洁', 1, 19, 1, 1696842500, 14, 2021);
INSERT INTO `student` VALUES (2106280425, '许佳宜', 1, 19, 1, 1696842550, 14, 2021);
INSERT INTO `student` VALUES (2106280426, '余秋颖', 1, 19, 1, 1696842593, 14, 2021);
INSERT INTO `student` VALUES (2106280427, '曾诗洁', 1, 19, 1, 1696842773, 14, 2021);
INSERT INTO `student` VALUES (2106280428, '刘培钧', 1, 19, 1, NULL, 14, 2021);
INSERT INTO `student` VALUES (2106280429, '张银珊', 1, 19, 1, 1696842811, 14, 2021);
INSERT INTO `student` VALUES (2106280430, '张嘉萍', 1, 19, 1, 1696842953, 14, 2021);
INSERT INTO `student` VALUES (2106280431, '吴晓洁', 1, 19, 1, 1696843012, 14, 2021);
INSERT INTO `student` VALUES (2106280432, '许思彤', 1, 19, 1, 1696843074, 14, 2021);
INSERT INTO `student` VALUES (2106280433, '黄琳晴', 1, 19, 1, 1696843116, 14, 2021);
INSERT INTO `student` VALUES (2106280434, '陈柳吉', 1, 19, 1, 1696843163, 14, 2021);
INSERT INTO `student` VALUES (2106280435, '官欣欣', 1, 19, 1, 1696843208, 14, 2021);
INSERT INTO `student` VALUES (2106280436, '魏丽婷', 1, 19, 1, 1696843242, 14, 2021);
INSERT INTO `student` VALUES (2106280437, '杜妙旋', 1, 19, 1, 1696843309, 14, 2021);
INSERT INTO `student` VALUES (2106280438, '汤廉灿', 1, 19, 1, 1696843360, 14, 2021);
INSERT INTO `student` VALUES (2106280439, '陈贝贝', 1, 19, 1, 1696843398, 14, 2021);
INSERT INTO `student` VALUES (2106280441, '吴建鑫', 1, 19, 1, 1696843464, 14, 2021);
INSERT INTO `student` VALUES (2106280442, '洪依彤', 1, 19, 1, 1696843692, 14, 2021);
INSERT INTO `student` VALUES (2106280444, '邝祖泉', 1, 19, 1, 1696843751, 14, 2021);
INSERT INTO `student` VALUES (2106280445, '温志光', 1, 19, 1, 1696843998, 14, 2021);
INSERT INTO `student` VALUES (2106280447, '钱宇芩', 1, 19, 1, 1696844051, 14, 2021);
INSERT INTO `student` VALUES (2106280448, '朱相怡', 1, 19, 1, 1696844118, 14, 2021);
INSERT INTO `student` VALUES (2106280449, '郑埸浩', 1, 19, 1, 1696844156, 14, 2021);
INSERT INTO `student` VALUES (2106280450, '秦镜宇', 1, 19, 1, NULL, 14, 2021);
INSERT INTO `student` VALUES (2106290101, '梁灏軒', 1, 20, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290102, '徐锡濬', 1, 20, 1, 1696668561, 15, 2021);
INSERT INTO `student` VALUES (2106290103, '李炜斌', 1, 20, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290104, '张立志', 1, 20, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290106, '温志豪', 1, 20, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290107, '姚佩欣', 1, 20, 1, 1696668580, 15, 2021);
INSERT INTO `student` VALUES (2106290108, '陈荣谦', 1, 20, 1, 1696671247, 15, 2021);
INSERT INTO `student` VALUES (2106290109, '谢佳毅', 1, 20, 1, 1696668616, 15, 2021);
INSERT INTO `student` VALUES (2106290110, '欧文燕', 1, 20, 1, 1696673396, 15, 2021);
INSERT INTO `student` VALUES (2106290111, '蔡立楷', 1, 20, 1, 1696668652, 15, 2021);
INSERT INTO `student` VALUES (2106290112, '许泽腾', 1, 20, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290113, '李浩', 1, 20, 1, 1696668679, 15, 2021);
INSERT INTO `student` VALUES (2106290114, '吴诗曼', 1, 20, 1, 1696668915, 15, 2021);
INSERT INTO `student` VALUES (2106290115, '汤泽颖', 1, 20, 1, 1696673469, 15, 2021);
INSERT INTO `student` VALUES (2106290116, '陈琳津', 1, 20, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290117, '朱浩鑫', 1, 20, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290118, '卢浩佳', 1, 20, 1, 1696668936, 15, 2021);
INSERT INTO `student` VALUES (2106290119, '姚宇森', 1, 20, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290120, '郑顺鑫', 1, 20, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290121, '郑浩烁', 1, 20, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290123, '潘学良', 1, 20, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290125, '刘深棋', 1, 20, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290126, '林瑞檀', 1, 20, 1, 1696668958, 15, 2021);
INSERT INTO `student` VALUES (2106290127, '胡耀华', 1, 20, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290129, '韩喜东', 1, 20, 1, 1696668981, 15, 2021);
INSERT INTO `student` VALUES (2106290131, '刘龙鑫', 1, 20, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290132, '陈晓枫', 1, 20, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290133, '黄伟林', 1, 20, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290134, '梁文涛', 1, 20, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290135, '李智豪', 1, 20, 1, 1696671272, 15, 2021);
INSERT INTO `student` VALUES (2106290136, '陈立斌', 1, 20, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290139, '吴宗锦', 1, 20, 1, 1696672757, 15, 2021);
INSERT INTO `student` VALUES (2106290140, '杨伟鑫', 1, 20, 1, 1696669028, 15, 2021);
INSERT INTO `student` VALUES (2106290141, '陈标民', 1, 20, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290142, '徐银清', 1, 20, 1, 1696669052, 15, 2021);
INSERT INTO `student` VALUES (2106290143, '谢锦亮', 1, 20, 1, 1696671295, 15, 2021);
INSERT INTO `student` VALUES (2106290144, '马桂健', 1, 20, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290145, '林伊娜', 1, 20, 1, 1696669070, 15, 2021);
INSERT INTO `student` VALUES (2106290146, '叶劲紫', 1, 20, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290147, '谢先桂', 1, 20, 1, 1696669088, 15, 2021);
INSERT INTO `student` VALUES (2106290148, '谢珊珊', 1, 20, 1, 1696669108, 15, 2021);
INSERT INTO `student` VALUES (2106290149, '蒙瑞标', 1, 20, 1, 1696669291, 15, 2021);
INSERT INTO `student` VALUES (2106290150, '欧阳钊', 1, 20, 1, 1696671324, 15, 2021);
INSERT INTO `student` VALUES (2106290151, '林培生', 1, 20, 1, 1696669158, 15, 2021);
INSERT INTO `student` VALUES (2106290152, '陆春生', 1, 20, 1, 1696669185, 15, 2021);
INSERT INTO `student` VALUES (2106290153, '李波婷', 1, 20, 1, 1696669206, 15, 2021);
INSERT INTO `student` VALUES (2106290155, '郑镇东', 1, 20, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290156, '吴浩斌', 1, 20, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290201, '叶俏琳', 1, 21, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290202, '陈俊达', 1, 21, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290203, '蔡楚庭', 1, 21, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290204, '许可美', 1, 21, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290205, '薛嘉炫', 1, 21, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290206, '林灿慧', 1, 21, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290207, '李锐锋', 1, 21, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290208, '叶志杰', 1, 21, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290209, '丘张卿', 1, 21, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290210, '钟铃锋', 1, 21, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290212, '刘江宏', 1, 21, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290213, '谢汝豪', 1, 21, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290214, '谭梓恒', 1, 21, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290215, '蔡驭', 1, 21, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290216, '梁昶', 1, 21, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290217, '邓学彬', 1, 21, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290218, '陈俊皓', 1, 21, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290219, '罗超成', 1, 21, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290220, '唐敏', 1, 21, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290221, '陈茂林', 1, 21, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290222, '李沛铵', 1, 21, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290223, '蔡春燕', 1, 21, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290224, '陈钰文', 1, 21, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290225, '陈炯恬', 1, 21, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290226, '林浩', 1, 21, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290227, '杨凤婷', 1, 21, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290229, '黄梓越', 1, 21, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290230, '温三金', 1, 21, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290231, '严卓莹', 1, 21, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290232, '陈嘉容', 1, 21, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290233, '何宣东', 1, 21, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290234, '李金龙', 1, 21, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290235, '赖冬倩', 1, 21, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290236, '刘维勇', 1, 21, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290237, '陈杰武', 1, 21, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290238, '陈绍铭', 1, 21, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290239, '卢志坚', 1, 21, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290240, '张函维', 1, 21, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290242, '陈建成', 1, 21, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290243, '黄雪芳', 1, 21, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290244, '刘思美', 1, 21, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290245, '陈梓锋', 1, 21, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290247, '张晋源', 1, 21, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290248, '施少明', 1, 21, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290249, '罗开栅', 1, 21, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290250, '秦李英', 1, 21, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290251, '潘富成', 1, 21, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290253, '石钰莹', 1, 21, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290254, '刘桂松', 1, 21, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290255, '陈耀杰', 1, 20, 1, 1696669227, 15, 2021);
INSERT INTO `student` VALUES (2106290302, '吕紫珊', 1, 22, 1, 1695999698, 15, 2021);
INSERT INTO `student` VALUES (2106290303, '劳梓琪', 1, 22, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290304, '陈星宇', 1, 22, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290305, '郭凯晴', 1, 22, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290306, '梁晓怡', 1, 22, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290307, '梁锦源', 1, 22, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290309, '张浩彬', 1, 22, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290311, '谢灿', 1, 22, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290313, '张琪芳', 1, 22, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290314, '许君裕', 1, 22, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290315, '潘朗聪', 1, 22, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290317, '姚俊基', 1, 22, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290318, '杨建', 1, 22, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290319, '刘懋麟', 1, 22, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290320, '杨小君', 1, 22, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290321, '赵遥遥', 1, 22, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290322, '陈湘坛', 1, 22, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290323, '叶必顺', 1, 22, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290324, '罗洪斌', 1, 22, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290326, '曾鑫炜', 1, 22, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290327, '程思惠', 1, 22, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290328, '吴建霖', 1, 22, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290329, '邝迪章', 1, 22, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290330, '周振鸿', 1, 22, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290331, '黄沛玲', 1, 22, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290332, '赖科泉', 1, 22, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290333, '许华武', 1, 22, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290334, '卢泽婷', 1, 22, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290337, '江泽聪', 1, 22, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290338, '蒙明祥', 1, 22, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290339, '王榆嘉', 1, 22, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290340, '何鑫', 1, 22, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290341, '付政烨', 1, 22, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290343, '陈锐', 1, 22, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290345, '林佳平', 1, 22, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290346, '林益城', 1, 22, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290347, '覃雪坚', 1, 22, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290348, '李梁生', 1, 22, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290349, '苏梓翔', 1, 22, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290350, '李北裕', 1, 22, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290351, '陈昭永', 1, 22, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290353, '魏香游', 1, 22, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2106290354, '杨海生', 1, 22, 1, NULL, 15, 2021);
INSERT INTO `student` VALUES (2206070201, '刘嘉俊', 1, 23, 2, NULL, 13, 2022);
INSERT INTO `student` VALUES (2206070202, '胡嘉俊', 1, 23, 2, NULL, 13, 2022);
INSERT INTO `student` VALUES (2206070203, '郑家鑫', 1, 23, 2, NULL, 13, 2022);
INSERT INTO `student` VALUES (2206070204, '李旺林', 1, 23, 2, NULL, 13, 2022);
INSERT INTO `student` VALUES (2206070205, '陈焕', 1, 23, 2, NULL, 13, 2022);
INSERT INTO `student` VALUES (2206070206, '李文浩', 1, 23, 2, NULL, 13, 2022);
INSERT INTO `student` VALUES (2206070207, '成键恒', 1, 23, 2, NULL, 13, 2022);
INSERT INTO `student` VALUES (2206070208, '曾一航', 1, 23, 2, NULL, 13, 2022);
INSERT INTO `student` VALUES (2206070209, '屈嘉濠', 1, 23, 2, NULL, 13, 2022);
INSERT INTO `student` VALUES (2206070210, '蔡恺锋', 1, 23, 2, NULL, 13, 2022);
INSERT INTO `student` VALUES (2206070211, '叶立', 1, 23, 2, NULL, 13, 2022);
INSERT INTO `student` VALUES (2206070212, '梁铭钊', 1, 23, 2, NULL, 13, 2022);
INSERT INTO `student` VALUES (2206070213, '陈智彬', 1, 23, 2, 1696759175, 13, 2022);
INSERT INTO `student` VALUES (2206070214, '肖浩然', 1, 23, 2, NULL, 13, 2022);
INSERT INTO `student` VALUES (2206070215, '魏子巍', 1, 23, 2, NULL, 13, 2022);
INSERT INTO `student` VALUES (2206070216, '贾文豪', 1, 23, 2, NULL, 13, 2022);
INSERT INTO `student` VALUES (2206070217, '陈俊亮', 1, 23, 2, NULL, 13, 2022);
INSERT INTO `student` VALUES (2206070218, '黎俊豪', 1, 23, 2, NULL, 13, 2022);
INSERT INTO `student` VALUES (2206070219, '张悦', 1, 23, 2, NULL, 13, 2022);
INSERT INTO `student` VALUES (2206070220, '张戈', 1, 23, 2, NULL, 13, 2022);
INSERT INTO `student` VALUES (2206070221, '邓志颖', 1, 23, 2, NULL, 13, 2022);
INSERT INTO `student` VALUES (2206070222, '何颖轩', 1, 23, 2, NULL, 13, 2022);
INSERT INTO `student` VALUES (2206070223, '邹俊彬', 1, 23, 2, NULL, 13, 2022);
INSERT INTO `student` VALUES (2206070224, '王梦真', 1, 23, 2, NULL, 13, 2022);
INSERT INTO `student` VALUES (2206070225, '雷祥愷', 1, 23, 2, NULL, 13, 2022);
INSERT INTO `student` VALUES (2206070226, '易泽宇', 1, 23, 2, NULL, 13, 2022);
INSERT INTO `student` VALUES (2206070227, '王啟泓', 1, 23, 2, NULL, 13, 2022);
INSERT INTO `student` VALUES (2206070228, '杨羽锋', 1, 23, 2, NULL, 13, 2022);
INSERT INTO `student` VALUES (2206070229, '吴泽伟', 1, 23, 2, NULL, 13, 2022);
INSERT INTO `student` VALUES (2206070230, '陈子康', 1, 23, 2, NULL, 13, 2022);
INSERT INTO `student` VALUES (2206070232, '陈耀聪', 1, 23, 2, NULL, 13, 2022);
INSERT INTO `student` VALUES (2206070233, '黄建豪', 1, 23, 2, NULL, 13, 2022);
INSERT INTO `student` VALUES (2206070235, '林斯凯', 1, 23, 2, NULL, 13, 2022);
INSERT INTO `student` VALUES (2206070236, '陈思颖', 1, 23, 2, NULL, 13, 2022);
INSERT INTO `student` VALUES (2206070237, '陈博杰', 1, 23, 2, NULL, 13, 2022);
INSERT INTO `student` VALUES (2206070238, '卢泽波', 1, 23, 2, NULL, 13, 2022);
INSERT INTO `student` VALUES (2206070239, '蔡少欣', 1, 23, 2, NULL, 13, 2022);
INSERT INTO `student` VALUES (2206070240, '林蓄川', 1, 23, 2, 1696759142, 13, 2022);
INSERT INTO `student` VALUES (2206070241, '王梓韩', 1, 23, 2, NULL, 13, 2022);
INSERT INTO `student` VALUES (2206200501, '陈润东', 1, 24, 2, 1696831973, 11, 2022);
INSERT INTO `student` VALUES (2206200502, '叶志伟', 1, 24, 2, 1696844644, 11, 2022);
INSERT INTO `student` VALUES (2206200504, '汤紫琪', 1, 24, 2, 1696772372, 11, 2022);
INSERT INTO `student` VALUES (2206200505, '覃彩儿', 1, 24, 2, 1696772456, 11, 2022);
INSERT INTO `student` VALUES (2206200506, '邝咏婷', 1, 24, 2, 1696772278, 11, 2022);
INSERT INTO `student` VALUES (2206200507, '邝颖嘉', 1, 24, 2, 1696772642, 11, 2022);
INSERT INTO `student` VALUES (2206200508, '胡晓盈', 1, 24, 2, 1696772544, 11, 2022);
INSERT INTO `student` VALUES (2206200509, '钟紫姗', 1, 24, 2, 1696832217, 11, 2022);
INSERT INTO `student` VALUES (2206200510, '夏宏伟', 1, 24, 2, NULL, 11, 2022);
INSERT INTO `student` VALUES (2206200511, '李铭贤', 1, 24, 2, NULL, 11, 2022);
INSERT INTO `student` VALUES (2206200512, '张嘉俊', 1, 24, 2, NULL, 11, 2022);
INSERT INTO `student` VALUES (2206200513, '颜乔枫', 1, 24, 2, NULL, 11, 2022);
INSERT INTO `student` VALUES (2206200514, '张炽鹏', 1, 24, 2, 1696771618, 11, 2022);
INSERT INTO `student` VALUES (2206200515, '冯嘉豪', 1, 24, 2, 1696772186, 11, 2022);
INSERT INTO `student` VALUES (2206200516, '刘冠辉', 1, 24, 2, NULL, 11, 2022);
INSERT INTO `student` VALUES (2206200517, '江乾瑜', 1, 24, 2, NULL, 11, 2022);
INSERT INTO `student` VALUES (2206200518, '梁德俊', 1, 24, 2, NULL, 11, 2022);
INSERT INTO `student` VALUES (2206200519, '刘泽涛', 1, 24, 2, 1696771432, 11, 2022);
INSERT INTO `student` VALUES (2206200520, '黄俊宇', 1, 24, 2, NULL, 11, 2022);
INSERT INTO `student` VALUES (2206200521, '唐康明', 1, 24, 2, 1696844949, 11, 2022);
INSERT INTO `student` VALUES (2206200522, '陈俊宇', 1, 24, 2, NULL, 11, 2022);
INSERT INTO `student` VALUES (2206200523, '冯嘉镇', 1, 24, 2, NULL, 11, 2022);
INSERT INTO `student` VALUES (2206200524, '陈嘉铭', 1, 24, 2, NULL, 11, 2022);
INSERT INTO `student` VALUES (2206200525, '梁梓熙', 1, 24, 2, NULL, 11, 2022);
INSERT INTO `student` VALUES (2206200526, '董俊濠', 1, 24, 2, NULL, 11, 2022);
INSERT INTO `student` VALUES (2206200527, '罗梓瑶', 1, 24, 2, NULL, 11, 2022);
INSERT INTO `student` VALUES (2206200528, '林羽希', 1, 24, 2, 1696771009, 11, 2022);
INSERT INTO `student` VALUES (2206200529, '钟鸿', 1, 24, 2, NULL, 11, 2022);
INSERT INTO `student` VALUES (2206200530, '袁康杰', 1, 24, 2, NULL, 11, 2022);
INSERT INTO `student` VALUES (2206200531, '赵乐', 1, 24, 2, NULL, 11, 2022);
INSERT INTO `student` VALUES (2206200532, '龚焌言', 1, 24, 2, 1696771512, 11, 2022);
INSERT INTO `student` VALUES (2206200533, '岑伟豪', 1, 24, 2, 1696844512, 11, 2022);
INSERT INTO `student` VALUES (2206200534, '陈锦壕', 1, 24, 2, 1696771269, 11, 2022);
INSERT INTO `student` VALUES (2206200535, '王楠', 1, 24, 2, 1696771151, 11, 2022);
INSERT INTO `student` VALUES (2206200536, '丁晓廷', 1, 24, 2, NULL, 11, 2022);
INSERT INTO `student` VALUES (2206200537, '王杰彬', 1, 24, 2, NULL, 11, 2022);
INSERT INTO `student` VALUES (2206200538, '王梓韩', 1, 24, 2, 1696772032, 11, 2022);
INSERT INTO `student` VALUES (2206200539, '刘奕煌', 1, 24, 2, 1696771943, 11, 2022);
INSERT INTO `student` VALUES (2206200540, '张鑫', 1, 24, 2, 1696771837, 11, 2022);
INSERT INTO `student` VALUES (2206200541, '陈俊锋', 1, 24, 2, NULL, 11, 2022);
INSERT INTO `student` VALUES (2206200542, '陈烨挺', 1, 24, 2, NULL, 11, 2022);
INSERT INTO `student` VALUES (2206200543, '陈嘉恩', 1, 24, 2, NULL, 11, 2022);
INSERT INTO `student` VALUES (2206200544, '林泽铭', 1, 24, 2, NULL, 11, 2022);
INSERT INTO `student` VALUES (2206200545, '林捷煜', 1, 24, 2, NULL, 11, 2022);
INSERT INTO `student` VALUES (2206200546, '翁培鑫', 1, 24, 2, 1696771693, 11, 2022);
INSERT INTO `student` VALUES (2206200547, '刘晓权', 1, 24, 2, NULL, 11, 2022);
INSERT INTO `student` VALUES (2206200548, '曾程晓', 1, 24, 2, NULL, 11, 2022);
INSERT INTO `student` VALUES (2206200550, '詹义凯', 1, 24, 2, NULL, 11, 2022);

-- ----------------------------
-- Table structure for studyone
-- ----------------------------
DROP TABLE IF EXISTS `studyone`;
CREATE TABLE `studyone`  (
  `SOID` bigint NOT NULL COMMENT '学委ID',
  `SPassword` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '登录密码',
  `LastLoginTime` datetime NULL DEFAULT NULL COMMENT '上次登录时间',
  `ClassID` int NULL DEFAULT NULL COMMENT '所属班级ID',
  `IsEnable` tinyint(1) NULL DEFAULT 1 COMMENT '是否启用',
  PRIMARY KEY (`SOID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of studyone
-- ----------------------------
INSERT INTO `studyone` VALUES (2106030115, '123123', '2023-10-01 03:55:43', 6, 1);
INSERT INTO `studyone` VALUES (2106030239, '123123', '2023-10-08 06:19:00', 7, 1);
INSERT INTO `studyone` VALUES (2106030310, '123123', '2023-09-12 00:00:00', 8, 1);
INSERT INTO `studyone` VALUES (2106030442, '123123', '2023-10-08 06:19:55', 9, 1);
INSERT INTO `studyone` VALUES (2106030501, '123123', '2023-10-08 06:15:36', 10, 1);
INSERT INTO `studyone` VALUES (2106070152, '123123', '2023-09-12 00:00:00', 1, 0);
INSERT INTO `studyone` VALUES (2106070236, '123123', '2023-10-08 15:11:06', 2, 1);
INSERT INTO `studyone` VALUES (2106070339, '123123', '2023-10-07 03:43:31', 3, 1);
INSERT INTO `studyone` VALUES (2106070401, '123123', '2023-10-09 08:12:29', 4, 1);
INSERT INTO `studyone` VALUES (2106070435, '123123', '2023-09-12 00:00:00', 4, 1);
INSERT INTO `studyone` VALUES (2106070505, '123123', '2023-09-12 00:00:00', 5, 1);
INSERT INTO `studyone` VALUES (2106200121, '123123', '2023-10-08 12:14:45', 11, 1);
INSERT INTO `studyone` VALUES (2106200122, '123123', '2023-09-14 19:58:35', 11, 1);
INSERT INTO `studyone` VALUES (2106200229, '123123', '2023-10-09 04:23:29', 12, 1);
INSERT INTO `studyone` VALUES (2106200238, '123123', '2023-09-29 15:04:02', 12, 1);
INSERT INTO `studyone` VALUES (2106200248, '123123', '2023-09-15 16:12:55', 12, 1);
INSERT INTO `studyone` VALUES (2106200323, '123123', '2023-10-08 06:18:32', 13, 1);
INSERT INTO `studyone` VALUES (2106200440, '123123', '2023-09-12 00:00:00', 14, 1);
INSERT INTO `studyone` VALUES (2106200545, '123123', '2023-10-06 06:42:09', NULL, 1);
INSERT INTO `studyone` VALUES (2106280121, '123123', '2023-10-09 08:33:15', 16, 1);
INSERT INTO `studyone` VALUES (2106280249, '123123', '2023-10-08 08:10:48', 17, 1);
INSERT INTO `studyone` VALUES (2106280312, '123123', '2023-10-09 05:26:00', 18, 1);
INSERT INTO `studyone` VALUES (2106280448, '123123', '2023-10-09 08:35:28', 19, 1);
INSERT INTO `studyone` VALUES (2106290145, '123123', '2023-10-07 08:26:56', 20, 1);
INSERT INTO `studyone` VALUES (2106290225, '123123', '2023-09-12 00:00:00', 21, 1);
INSERT INTO `studyone` VALUES (2106290327, '123123', '2023-09-29 15:04:14', 22, 1);
INSERT INTO `studyone` VALUES (2206070241, '123123', '2023-10-08 09:47:38', 23, 1);
INSERT INTO `studyone` VALUES (2206200526, '123123', '2023-10-09 05:50:30', 24, 1);

SET FOREIGN_KEY_CHECKS = 1;
