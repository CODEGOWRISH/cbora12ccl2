#
# Recipe:: users-and-roles-for-oracle-unix
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute

# User and roles creation for Oracle installation

# Create groups - begin
# https://docs.chef.io/resource_group.html

# Common install group for all oracle related users
group 'oradba' do
  action :create
  gid '2580'
end

user 'oracle' do
  comment 'Oracle DB and Client software owner'
  uid     '501'
  group   'oradba'
  home    '/home/oracle'
  shell   '/bin/ksh'

  # Note - no password - only do sudo to oracle
  #password 'oracle'
end

# Create users - end

# Create Directories - begin
%w[ /home /u01 /u01/app ].each do |path|
  directory path do
    owner 'root'
    group 'root'
    mode '0755'
    action :create
  end
end

%w[ /u01/app/oraInventory ].each do |path|
  directory path do
    owner 'oracle'
    group 'oradba'
    mode '0775'
    action :create
  end
end

%w[ /home/oracle /u02/app/oracle ].each do |path|
  directory path do
    owner 'oracle'
    group 'oradba'
    mode '0755'
    action :create
  end
end

%w[ /usr/local/tns ].each do |path|
  directory path do
    owner 'oracle'
    group 'oradba'
    mode '0775'
    action :create
  end
end

# Create directories - end
