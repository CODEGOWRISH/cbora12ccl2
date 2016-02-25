#
# Cookbook Name:: cbora12cclt
# Recipe:: default
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

#include_recipe 'cbora12cclt::install_check'
include_recipe 'cbora12cclt::oracle_users_groups_dirs_unix'
include_recipe 'cbora12cclt::oracle_client_install_12c'