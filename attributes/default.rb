#
# Author: Gowrish.Mallipattana
#
# Attributes file default.rb for oracle installation
#
#

#default['hostname'] = 'oralx0001'

default['userShell']                  = '/bin/bash'
#default['userShell']                  = '/bin/ksh'

default['oracle']['userName']         = 'oracle'
default['oracle']['userUid']          = '5011'
default['oracle']['installGroup']     = 'oradba'
default['oracle']['groupGid']         = '5011'
default['oracle']['userHome']         = '/home/oracle'
default['oracle']['oraInventory']     = '/u01/app/oraInventory'
default['oracle']['oraBase']          = '/u01/app/oracle'
default['oracle']['tnsDir']           = '/usr/local/tns'

default['ora_client12c']['installUser']             = 'oracle'
default['ora_client12c']['oraHome']                 = '/u01/app/oracle/product/12cClient'
default['ora_client12c']['installType']             = 'Administrator'
default['ora_client12c']['responseFile']            = '/home/oracle/oracle_client_12c_unix.rsp'

#default['ora_client12c']['softwareFolder']          = '/u01/app/oracle/stage-oracle-client'
#default['ora_client12c']['softwareFolder']          = '/stage/oracle-client'
default['ora_client12c']['softwareFolder']          = '/vagrant'
#default['ora_client12c']['softwareBundle']          = 'linuxamd64_12102_client.zip'
default['ora_client12c']['softwareBundle']          = 'linuxamd64_12c_client.zip'
default['ora_client12c']['unzipDir']                = '/tmp/oracle_12c_client_unzip'

default['ora_client12c']['installScreenOutputLog']  = '/tmp/ora_12c_install.out'