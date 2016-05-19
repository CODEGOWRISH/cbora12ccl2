#
# Oracle client installation recipe
#
#

# Variables set for use by templates and others
oraInventory      =   node[:oracle][:oraInventory]
oraHome           =   node[:ora_client12c][:oraHome]
responseFile      =   node[:ora_client12c][:responseFile] 
softwareFolder    =   node[:ora_client12c][:softwareFolder]
softwareBundle    =   node[:ora_client12c][:softwareBundle]
unzipDir          =   node[:ora_client12c][:unzipDir] 
runInstaller      =   node[:ora_client12c][:unzipDir] + '/client/runInstaller'

# Return if already is installed
if File.exists?(node[:ora_client12c][:oraHome])
  execute 'Oracle client seems to be already installed.  Check before re-run' do
    command "echo Oracle client seems to be already installed.  Check before re-run > /tmp/oracle_client_installed_check.file"
  end
end

return if ::File.exists?(node[:ora_client12c][:oraHome])

# Create the response file from template
template node[:ora_client12c][:responseFile] do
  source 'oracle_client_12c_unix_rsp.erb'
   owner node[:oracle][:userName] 
   group node[:oracle][:installGroup]
    mode '0755'
    variables({
     :installGroup  => node[:oracle][:installGroup],
     :installUser   => node[:ora_client12c][:installUser],
     :oraInventory  => node[:oracle][:oraInventory],
     :oraBase       => node[:oracle][:oraBase],
     :oraHome       => node[:ora_client12c][:oraHome],
     :installType   => node[:ora_client12c][:installType],
     :hostname      => node[:hostname]
  })
end
 
execute 'create unzip directory for oracle software bundle' do
  command "su oracle -c 'mkdir -p #{unzipDir}' "
end

execute 'unzip oracle software bundle' do
  command "su oracle -c 'unzip #{softwareFolder}/#{softwareBundle} -d #{unzipDir}' "
end

execute 'install oracle software bundle' do
  command "su oracle -c '#{runInstaller} -silent -waitforcompletion -noconfig -ignoreSysPrereqs -ignorePrereq -responseFile #{responseFile} > /tmp/out 2>> /tmp/out' "
end

execute 'sleep a while for all filecopy to end' do
  command "sleep 60"
end

execute 'run root shell' do
  user "root"
  command "#{oraHome}/root.sh"
end

execute 'run orainstRoot shell' do
  command "sudo su - root -c '#{oraInventory}/orainstRoot.sh'"
end

