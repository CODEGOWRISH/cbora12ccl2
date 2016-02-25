#
# Cookbook Name:: cbora12cclt
# Recipe:: install_chefk
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

::Chef::Resource.send(:include, General::InstallChecks)

oraHome=node[:ora_client12c][:oraHome]

#return only_if { ora_client_already_installed?(oraHome) }

#if ora_client_already_installed (oraHome)

#  Chef::Log.warn("Oracle client exists - NOT CONTINUING" + sqlplusFile)
#  return
#else

#  Chef::Log.info("Oracle client not installed - will install - CONTINUING")
#end

#  Using detailed steps (not using helper)
# Return if already is installed
sqlplusFile=node[:ora_client12c][:oraHome]+'/bin/sqlplus'

if File.exists?(sqlplusFile)
  execute 'Oracle client seems to be already installed.  Check before re-run' do
    command "echo Oracle client seems to be already installed.  Check before re-run > /tmp/oracle_client_installed_check.file"
  end

  return

end