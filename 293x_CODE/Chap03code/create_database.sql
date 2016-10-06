CREATE DATABASE Test3
ON PRIMARY
       (NAME = test3_primary_data1,
        FILENAME = 'd:\sqldata\test3_primary_data1.mdf',
        SIZE = 1MB,
        MAXSIZE = 200MB,
        FILEGROWTH = 10%),
       (NAME = test3_primary_data2,
        FILENAME = 'd:\sqldata\test3_primary_data2.ndf',
        SIZE = 1MB,
        MAXSIZE = 200MB,
        FILEGROWTH = 10%),
FILEGROUP FG2
       (NAME = test3_fg2_data1,
        FILENAME = 'd:\sqldata\test3_fg2_data1.ndf',
        SIZE = 1MB,
        MAXSIZE = 200MB,
        FILEGROWTH = 10%)

LOG ON (NAME = test3_log1,
        FILENAME = 'd:\sqldata\test3_log1.ldf',
        SIZE = 51MB,
        MAXSIZE = 200MB,
        FILEGROWTH = 10%)
