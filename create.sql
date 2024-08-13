-- 创建 User 表
CREATE TABLE User (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    state ENUM('online', 'offline') DEFAULT 'offline'
);

-- 创建 Friend 表
CREATE TABLE Friend (
    userid INT NOT NULL,
    friendid INT NOT NULL,
    PRIMARY KEY (userid, friendid),
    FOREIGN KEY (userid) REFERENCES User(id),
    FOREIGN KEY (friendid) REFERENCES User(id)
);

-- 创建 AllGroup 表
CREATE TABLE AllGroup (
    id INT PRIMARY KEY AUTO_INCREMENT,
    groupname VARCHAR(50) NOT NULL,
    groupdesc VARCHAR(200) DEFAULT ''
);


-- 创建 GroupUser 表
CREATE TABLE GroupUser (
    groupid INT PRIMARY KEY,
    userid INT NOT NULL,
    grouprole ENUM('creator', 'normal') DEFAULT 'normal',
    FOREIGN KEY (userid) REFERENCES User(id)  -- 假设 User 表已存在
);

-- 创建 OfflineMessage 表
CREATE TABLE OfflineMessage (
    userid INT PRIMARY KEY,
    message VARCHAR(500) NOT NULL,
    FOREIGN KEY (userid) REFERENCES User(id)  -- 假设 User 表已存在
);
