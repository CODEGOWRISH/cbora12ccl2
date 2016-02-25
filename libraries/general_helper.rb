#                                                                                         
# Author: Gowrish.Mallipattana                                                            
#                                                                                         
# Helper for general purpose work                                 
#

module General
 module InstallChecks

  def ora_client_already_installed (oraHome)

    sqlplusFile=oraHome +'/bin/sqlplus'

    if file_exists? (sqlplusFile)
    then
      Chef::Log.warn("Oracle client exists " + sqlplusFile)
      return 1
    else
      Chef::Log.info("Oracle client not installed - will install")
      return 0
    end
  end

 end
end