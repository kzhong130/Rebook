CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(50) default NULL,
  `password` varchar(50) NOT NULL,
  `truename` varchar(50) default NULL,
  `phone` varchar(200) default NULL,
  `email` varchar(200) default NULL,
  `address` varchar(200) default NULL,
  `role` varchar(50) default NULL, 
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;