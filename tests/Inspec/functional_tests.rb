=begin
Argument Validation Tests
=end

control 'arg-1' do
  title 'All Tasks - Missing env argument'
  desc 'All Tasks - Missing env argument - It should fail'
  impact 'critical'
  tag 'arg','all'
  describe command('ansible-playbook playbooks/network/testoneipargvalidation.yml') do
    its('exit_status') { should_not eq 0 }
    its('stdout') { should match(/env is not defined/) }
  end
end

control 'arg-2' do
  title 'oneipargvalidation - Missing ip_addr argument'
  desc 'oneipargvalidation - Missing ip_addr argument - It should fail.'
  impact 'critical'
  tag 'arg','oneipargvalidation'
  describe command('ansible-playbook playbooks/network/testoneipargvalidation.yml -e env=dev') do
    its('exit_status') { should_not eq 0 }
    its('stdout') { should match(/\'ip_addr\' is undefined/) }
  end
end

control 'arg-3' do
  title 'oneipargvalidation - Correct ip_addr argument value I'
  desc 'oneipargvalidation - Correct ip_addr argument value - It should succeed'
  impact 'critical'
  tag 'arg','oneipargvalidation'
  describe command('ansible-playbook playbooks/network/testoneipargvalidation.yml -e env=dev -e ip_addr=192.168.0.160') do
    its('exit_status') { should eq 0 }
  end
end

control 'arg-4' do
  title 'oneipargvalidation - Incorrect ip_addr argument value I'
  desc 'oneipargvalidation - Incorrect ip_addr argument value - It should fail'
  impact 'critical'
  tag 'arg','oneipargvalidation'
  describe command('ansible-playbook playbooks/network/testoneipargvalidation.yml -e env=dev -e ip_addr=192.168.0.546') do
    its('exit_status') { should_not eq 0 }
    its('stdout') { should match(/DNS name can\'t be resolved/) }
  end
end

control 'arg-5' do
  title 'oneipargvalidation - Incorrect ip_addr argument value II'
  desc 'oneipargvalidation - Incorrect ip_addr argument value - It should fail'
  impact 'critical'
  tag 'arg','oneipargvalidation'
  describe command('ansible-playbook playbooks/network/testoneipargvalidation.yml -e env=dev -e ip_addr=192.168.0.0/24') do
    its('exit_status') { should_not eq 0 }
    its('stdout') { should match(/DNS name can\'t be resolved/) }
  end
end

control 'arg-6' do
  title 'oneipargvalidation - Incorrect ip_addr argument value III'
  desc 'oneipargvalidation - Incorrect ip_addr argument value - It should fail'
  impact 'critical'
  tag 'arg','oneipargvalidation'
  describe command('ansible-playbook playbooks/network/testoneipargvalidation.yml -e env=dev -e ip_addr=thisisnotanip') do
    its('exit_status') { should_not eq 0 }
    its('stdout') { should match(/DNS name can\'t be resolved/) }
  end
end

control 'arg-7' do
  title 'oneipargvalidation - Correct ip_addr argument value II'
  desc 'oneipargvalidation - Correct ip_addr argument value - It should succeed'
  impact 'critical'
  tag 'arg','oneipargvalidation'
  describe command('ansible-playbook playbooks/network/testoneipargvalidation.yml -e env=dev -e ip_addr=192.168.0.160/24') do
    its('exit_status') { should eq 0 }
  end
end

control 'arg-8' do
  title 'oneipargvalidation - Correct ip_addr argument value III'
  desc 'oneipargvalidation - Correct ip_addr argument value - It should succeed'
  impact 'critical'
  tag 'arg','oneipargvalidation'
  describe command('ansible-playbook playbooks/network/testoneipargvalidation.yml -e env=dev -e ip_addr=google.com') do
    its('exit_status') { should eq 0 }
  end
end

control 'arg-9' do
  title 'twoipargvalidation - Missing dst_ip_addr argument'
  desc 'twoipargvalidation - Missing dst_ip_addr argument- It should fail'
  impact 'critical'
  tag 'arg','oneipargvalidation'
  describe command('ansible-playbook playbooks/network/testtwoipargvalidation.yml -e env=dev -e src_ip_addr=192.168.0.160') do
    its('exit_status') { should_not eq 0 }
    its('stdout') { should match(/\'\'dst_ip_addr\'\' is undefined/) }
  end
end

control 'arg-10' do
  title 'twoipargvalidation - Missing src_ip_addr argument'
  desc 'twoipargvalidation - Missing src_ip_addr argument - It should fail'
  impact 'critical'
  tag 'arg','twoipargvalidation'
  describe command('ansible-playbook playbooks/network/testtwoipargvalidation.yml -e env=dev -e dst_ip_addr=192.168.0.160') do
    its('exit_status') { should_not eq 0 }
    its('stdout') { should match(/\'\'src_ip_addr\'\' is undefined/) }
  end
end

control 'arg-11' do
  title 'twoipargvalidation - Both ip_addr arguments are present and their values are correct'
  desc 'twoipargvalidation - Both ip_addr arguments are present and their values are correct - It should succeed'
  impact 'critical'
  tag 'arg','twoipargvalidation'
  describe command('ansible-playbook playbooks/network/testtwoipargvalidation.yml -e env=dev -e src_ip_addr=192.168.0.160 -e dst_ip_addr=192.168.0.161') do
    its('exit_status') { should eq 0 }
  end
end

control 'arg-12' do
  title 'ifbargsvalidation - Delete VLAN arguments - correct values'
  desc 'ifbargsvalidation - Delete VLAN arguments - correct values - It should succeed'
  impact 'critical'
  tag 'arg','ifbargsvalidation'
  describe command('ansible-playbook playbooks/network/testifbargsvalidationdeletevlan.yml -e env=dev -e vlanid=3700 -e region=EMEA -e country=ES -e location=TRC -e site=3') do
    its('exit_status') { should eq 0 }
  end
end

control 'arg-13' do
  title 'ifbargsvalidation - All Features - missing argument'
  desc 'ifbargsvalidation - All Features - missing argument - It should fail'
  impact 'critical'
  tag 'arg','ifbargsvalidation'
  describe command('ansible-playbook playbooks/network/testifbargsvalidationdeletevlan.yml -e env=dev -e vlanid=3700 -e region=EMEA -e country=ES -e location=TRC') do
    its('exit_status') { should_not eq 0 }
    its('stdout') { should match(/No variable found with this name/) }
  end
end

control 'arg-14' do
  title 'ifbargsvalidation - All Features - incorrect Infoblox value for argument'
  desc 'ifbargsvalidation - All Features - incorrect Infoblox value for argument - It should fail'
  impact 'critical'
  tag 'arg','ifbargsvalidation'
  describe command('ansible-playbook playbooks/network/testifbargsvalidationdeletevlan.yml -e env=dev -e vlanid=3700 -e region=MOON -e country=ES -e location=TRC -e site=3') do
    its('exit_status') { should_not eq 0 }
    its('stdout') { should match(/Incorrect value/) }
  end
end

control 'arg-15' do
  title 'ifbargsvalidation - All Features - empty and not allowed Infoblox value for argument'
  desc 'ifbargsvalidation - All Features - empty and not allowed Infoblox value for argument - It should fail'
  impact 'critical'
  tag 'arg','ifbargsvalidation'
  describe command('ansible-playbook playbooks/network/testifbargsvalidationdeletevlan.yml -e env=dev -e vlanid=3700 -e region= -e country=ES -e location=TRC -e site=3') do
    its('exit_status') { should_not eq 0 }
    its('stdout') { should match(/can not be empty/) }
  end
end

control 'arg-16' do
  title 'ifbargsvalidation - Create VLAN - correct values'
  desc 'ifbargsvalidation - Create VLAN - correct values - It should succeed'
  impact 'critical'
  tag 'arg','ifbargsvalidation'
  describe command('ansible-playbook playbooks/network/testifbargsvalidationcreatevlan.yml -e env=dev -e region=EMEA -e country=ES -e location=TRC -e site=2 -e context=MKT -e consumption_model=PRIV_AG_MKTPRE_GOLD -e networkservicerole=BACKEND -e networkservice=SERVERS -e businesstype=GLOBAL_SERVICES -e businessrole=') do
    its('exit_status') { should eq 0 }
  end
end

control 'arg-17' do
  title 'ifbargsvalidation - Next IP - correct values'
  desc 'ifbargsvalidation - Next IP - correct values - It should succeed'
  impact 'critical'
  tag 'arg','ifbargsvalidation'
  describe command('ansible-playbook playbooks/network/testifbargsvalidationnextip.yml -e env=dev -e region=EMEA -e country=ES -e location=TRC -e site=3 -e context=MKT -e consumption_model=PRIV_AG_MKTPRE_GOLD -e networkservicerole=BACKEND -e networkservice=SERVERS -e businesstype=GLOBAL_SERVICES -e businessrole= -e devicesystem=INFOBLOX -e devicesystemrole=INFRASTRUCTURE -e devicetype=SERVER -e hostname=SERVER01 -e requestid=RQ00012345678 -e "note=\'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat. Quis aute iure reprehenderit\'"') do
    its('exit_status') { should eq 0 }
  end
end

control 'arg-18' do
  title 'ifbargsvalidation - Next IP - too long string in argument value'
  desc 'ifbargsvalidation - Next IP - too long string in argument value - It should fail'
  impact 'critical'
  tag 'arg','ifbargsvalidation'
  describe command('ansible-playbook playbooks/network/testifbargsvalidationnextip.yml -e env=dev -e region=EMEA -e country=ES -e location=TRC -e site=3 -e context=MKT -e consumption_model=PRIV_AG_MKTPRE_GOLD -e networkservicerole=BACKEND -e networkservice=SERVERS -e businesstype=GLOBAL_SERVICES -e businessrole= -e devicesystem=INFOBLOX -e devicesystemrole=INFRASTRUCTURE -e devicetype=SERVER -e hostname=SERVER01 -e requestid=RQ00012345678 -e "note=\'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat. Quis aute iure reprehenderit77777777777777777777777\'"') do
    its('exit_status') { should_not eq 0 }
    its('stdout') { should match(/Too long/) }
  end
end

control 'arg-19' do
  title 'vlanidvalidation - Value in range'
  desc 'vlanidvalidation - Value in range - It should succeed'
  impact 'critical'
  tag 'arg','ifbargsvalidation'
  describe command('ansible-playbook playbooks/network/testvlanidvalidation.yml -e env=dev -e vlanid=3700') do
    its('exit_status') { should eq 0 }
    its('stdout') { should match(/vlanid input argument in range/) }
  end
end

control 'arg-20' do
  title 'vlanidvalidation - vlanid value is missing'
  desc 'vlanidvalidation - vlanid value is missing - It should fail'
  impact 'critical'
  tag 'arg','ifbargsvalidation'
  describe command('ansible-playbook playbooks/network/testvlanidvalidation.yml -e env=dev') do
    its('exit_status') { should_not eq 0 }
    its('stdout') { should match(/vlanid input argument not defined or out of range/) }
  end
end

control 'arg-20' do
  title 'vlanidvalidation - vlanid value out of range'
  desc 'vlanidvalidation - vlanid value out of range - It should fail'
  impact 'critical'
  tag 'arg','vlanidvalidation'
  describe command('ansible-playbook playbooks/network/testvlanidvalidation.yml -e env=dev -e vlanid=5000') do
    its('exit_status') { should_not eq 0 }
    its('stdout') { should match(/vlanid input argument not defined or out of range/) }
  end
end

=begin
Get por status given an IP address Tests
=end

=begin
ip_addrs = [
  "172.26.60.30","10.72.139.136","10.72.52.201",
  "172.24.55.205","172.24.17.226","10.72.19.26",
  "172.18.207.102","10.72.16.154","vdi10suptc012",
  "172.26.60.40","10.72.8.130","10.72.136.33",
  "10.72.64.105","172.18.141.10","172.18.248.9",
  "172.18.137.218","10.25.102.14","10.134.6.66",
  "172.18.207.103","10.74.4.178","172.26.82.239",
  "10.72.142.32"
]
ip_addrs.each do |my_ip_addr|
  control 'portstatus-1 '+my_ip_addr do
    title 'getportstatusbyip'+my_ip_addr
    desc 'getportstatusbyip - It should succeed'
    impact 'low'
    tag 'portstatus','getportstatusbyip'
    describe command('ansible-playbook playbooks/network/getportstatusbyip.yml -e env=dev -e ip_addr='+my_ip_addr) do
      its('exit_status') { should eq 0 }
      its('stdout') { should_not match(/Hardware Address not included in device ARP Address Table/) }
      its('stdout') { should_not match(/\[WARNING\] Connection to: \S+ failed/) }
      its('stdout') { should_not match(/\[WARNING\] Traceroute last hop has been reached and destination IP address has not been returned./) }
    end
  end
end

ip_addrs = [
  "10.72.4.18","10.72.4.178","172.18.22.1",
  "172.24.62.1","10.144.73.2","172.26.56.21",
  "10.72.0.168","10.72.6.168","10.72.0.220",
  "172.18.141.2","10.130.75.209"
  ]
ip_addrs.each do |my_ip_addr|
  control 'portstatus-2 '+my_ip_addr do
    title 'getportstatusbyip - No ARP result -'+my_ip_addr
    desc 'getportstatusbyip - No ARP result - It should succeed'
    impact 'low'
    tag 'portstatus','getportstatusbyip'
    describe command('ansible-playbook playbooks/network/getportstatusbyip.yml -e env=dev -e ip_addr='+my_ip_addr) do
      its('exit_status') { should eq 0 }
      its('stdout') { should match(/Hardware Address not included in device ARP Address Table/) }
    end
  end
end

ip_addrs = [
  "10.72.52.3","172.16.82.19","172.16.80.17",
  "10.72.6.222","10.72.6.220","10.134.161.114",
  "10.21.22.11","10.144.166.11"
  ]
ip_addrs.each do |my_ip_addr|
  control 'portstatus-3 '+my_ip_addr do
    title 'getportstatusbyip - No connection result -'+my_ip_addr
    desc 'getportstatusbyip - No connection result - It should succeed'
    impact 'low'
    tag 'portstatus','getportstatusbyip'
    describe command('ansible-playbook playbooks/network/getportstatusbyip.yml -e env=dev -e ip_addr='+my_ip_addr) do
      its('exit_status') { should eq 0 }
      its('stdout') { should match(/\[WARNING\] Connection to: \S+ failed/) }
    end
  end
end

ip_addrs = [ "10.76.3.213","10.76.3.192" ]
ip_addrs.each do |my_ip_addr|
  control 'portstatus-4 '+my_ip_addr do
    title 'getportstatusbyip - Invalid password result -'+my_ip_addr
    desc 'getportstatusbyip - Invalid password result - It should succeed'
    impact 'low'
    tag 'portstatus','getportstatusbyip'
    describe command('ansible-playbook playbooks/network/getportstatusbyip.yml -e env=dev -e ip_addr='+my_ip_addr) do
      its('exit_status') { should eq 0 }
      its('stdout') { should match(/Invalid\/incorrect password/) }
    end
  end
end

ip_addrs = [
  "10.254.94.1","172.18.86.7","10.72.6.252",
  "10.72.8.130","vdi10suptc013"
  ]
ip_addrs.each do |my_ip_addr|
  control 'portstatus-5 '+my_ip_addr do
    title 'getportstatusbyip - No tracert result -'+my_ip_addr
    desc 'getportstatusbyip - No tracert result - It should succeed'
    impact 'low'
    tag 'portstatus','getportstatusbyip'
    describe command('ansible-playbook playbooks/network/getportstatusbyip.yml -e env=dev -e ip_addr='+my_ip_addr) do
      its('exit_status') { should eq 0 }
      its('stdout') { should match(/\[WARNING\] Traceroute last hop has been reached and destination IP address has not been returned./) }
    end
  end
end

=end
=begin
ip_addrs = [
  "10.72.4.18","10.72.139.136","10.72.52.201",
  "10.72.4.178","172.18.22.1","172.24.62.1",
  "172.24.55.205","10.144.166.11","10.72.52.3",
  "10.254.94.1","10.144.73.2","172.16.82.19",
  "172.16.80.17","172.24.17.226","10.72.19.26",
  "172.26.56.21","172.18.207.102","10.72.16.154",
  "172.18.86.7","10.72.0.168","10.72.6.168",
  "10.76.3.213","10.72.6.222","10.72.6.220"
  ]
ip_addrs.each do |my_ip_addr|
  control 'getnettracesbetweentwoips-1 '+my_ip_addr do
    title 'getnettracesbetweentwoips '+my_ip_addr
    desc 'getportstatusbyip - It should succeed'
    impact 'low'
    tag 'nettraces','getnettracesbetweentwoips'
    describe command('ansible-playbook playbooks/network/getnettracesbetweentwoips.yml -e env=dev -e src_ip_addr=172.26.60.30 -e dst_ip_addr='+my_ip_addr) do
      its('exit_status') { should eq 0 }
    end
  end
end
=end
=begin
ip_addrs = [
  "10.72.6.252","10.72.0.220","10.76.3.192",
  "vdi10suptc012","vdi10suptc013","172.26.60.40",
  "10.72.8.130","172.26.82.239","10.72.136.33",
  "10.72.142.32","10.72.64.105","10.72.8.130",
  "172.18.141.2","172.18.141.10","172.18.248.9",
  "172.18.137.218","10.25.102.14","10.130.75.209",
  "10.134.161.114","10.134.6.66","10.21.22.11",
  "172.18.207.103","10.74.4.178"
  ]
ip_addrs.each do |my_ip_addr|
  control 'getnettracesbetweentwoips-2 '+my_ip_addr do
    title 'getnettracesbetweentwoips '+my_ip_addr
    desc 'getportstatusbyip - It should succeed'
    impact 'low'
    tag 'nettraces','getnettracesbetweentwoips'
    describe command('ansible-playbook playbooks/network/getnettracesbetweentwoips.yml -e env=dev -e src_ip_addr=172.26.60.30 -e dst_ip_addr='+my_ip_addr) do
      its('exit_status') { should eq 0 }
    end
  end
end

=end
=begin
F6 - Next IP Tests
=end

control 'F6-nextip-1' do
  title 'F6-nextip - Inexistent Netowrk'
  desc 'F6-nextip - Inexistent Netowrk - It should succeed'
  impact 'critical'
  tag 'nextip'
  describe command('ansible-playbook playbooks/network/getnextfreeip.yml -e env=dev -e region=EMEA -e country=ES -e location=TRC -e site=2 -e context=MKT -e consumption_model=PRIV_AG_MKTPRO_GOLD -e networkservicerole=BACKEND -e networkservice=SERVERS -e businesstype=GLOBAL_SERVICES -e businessrole= -e devicesystem=INFOBLOX -e devicesystemrole=INFRASTRUCTURE -e devicetype=SERVER -e hostname=SERVER01 -e requestid=RQ000000 -e "note=\'Lorem ipsum dolor sit amet, consectetur adipiscing\'"') do
    its('exit_status') { should eq 0 }
    its('stdout') { should match(/\[WARNING\] Input parameters do not match any network in Infoblox system/) }
  end
end

control 'F6-nextip-2' do
  title 'F6-nextip - Empty Netowrk'
  desc 'F6-nextip - Empty Netowrk - It should succeed'
  impact 'critical'
  tag 'nextip'
  describe command('ansible-playbook playbooks/network/getnextfreeip.yml -e env=dev -e region=EMEA -e country=ES -e location=TRC -e site=2 -e context=MKT -e consumption_model=PRIV_AG_MKTPRE_GOLD -e networkservicerole=BACKEND -e networkservice=SERVERS -e businesstype=GLOBAL_SERVICES -e businessrole= -e devicesystem=INFOBLOX -e devicesystemrole=INFRASTRUCTURE -e devicetype=SERVER -e hostname=SERVER01 -e requestid=RQ000000 -e "note=\'Lorem ipsum dolor sit amet, consectetur adipiscing\'"') do
    its('exit_status') { should eq 0 }
    its('stdout') { should match(/\[INFO\] IP Address has been assigned/) }
  end
end

control 'F6-nextip-3' do
  title 'F6-nextip - Full Netowrk'
  desc 'F6-nextip - Full Netowrk - It should succeed'
  impact 'critical'
  tag 'nextip'
  describe command('ansible-playbook playbooks/network/getnextfreeip.yml -e env=dev -e region=EMEA -e country=ES -e location=TRC -e site=2 -e context=MKT -e consumption_model=PUB_AG_MKTPRO_GOLD -e networkservicerole=BACKEND -e networkservice=SERVERS -e businesstype=GLOBAL_SERVICES -e businessrole= -e devicesystem=INFOBLOX -e devicesystemrole=INFRASTRUCTURE -e devicetype=SERVER -e hostname=SERVER01 -e requestid=RQ000000 -e "note=\'Lorem ipsum dolor sit amet, consectetur adipiscing\'"') do
    its('exit_status') { should eq 0 }
    its('stdout') { should match(/\[WARNING\] No more free IP Addresses\. Please, create a new network matching the search criteria and try again/) }
  end
end

control 'F6-nextip-4' do
  title 'F6-nextip - A network with a gap and an empty network - The gap is filled'
  desc 'F6-nextip - A network with a gap and an empty network - The gap is filled - It should succeed'
  impact 'critical'
  tag 'nextip'
  describe command('ansible-playbook playbooks/network/getnextfreeip.yml -e env=dev -e region=EMEA -e country=ES -e location=TRC -e site=2 -e context=MKT -e consumption_model=PUB_AG_MKTPRE_GOLD -e networkservicerole=BACKEND -e networkservice=SERVERS -e businesstype=GLOBAL_SERVICES -e businessrole= -e devicesystem=INFOBLOX -e devicesystemrole=INFRASTRUCTURE -e devicetype=SERVER -e hostname=SERVER01 -e requestid=RQ000000 -e "note=\'Lorem ipsum dolor sit amet, consectetur adipiscing1\'"') do
    its('exit_status') { should eq 0 }
    its('stdout') { should_not match(/Cannot find 1 available IP address\(es\) in this network/) }
    its('stdout') { should match(/\[INFO\] IP Address has been assigned/) }
  end
end

control 'F6-nextip-5' do
  title 'F6-nextip - A network with a gap and an empty network - A network is full, then it tries the next empty network'
  desc 'F6-nextip - A network with a gap and an empty network - A network is full, then it tries the next empty network - It should succeed'
  impact 'critical'
  tag 'nextip'
  describe command('ansible-playbook playbooks/network/getnextfreeip.yml -e env=dev -e region=EMEA -e country=ES -e location=TRC -e site=2 -e context=MKT -e consumption_model=PUB_AG_MKTPRE_GOLD -e networkservicerole=BACKEND -e networkservice=SERVERS -e businesstype=GLOBAL_SERVICES -e businessrole= -e devicesystem=INFOBLOX -e devicesystemrole=INFRASTRUCTURE -e devicetype=SERVER -e hostname=SERVER01 -e requestid=RQ000002 -e "note=\'Lorem ipsum dolor sit amet, consectetur adipiscing2\'"') do
    its('exit_status') { should eq 0 }
    its('stdout') { should match(/Cannot find 1 available IP address\(es\) in this network/) }
    its('stdout') { should match(/\[INFO\] IP Address has been assigned/) }
  end
end

=begin
F1 - Create VLAN Tests
=end

control 'F1-createvlan-1' do
  title 'F1-createvlan - Network container is empty'
  desc 'F1-createvlan - Network container is empty - It should succeed'
  impact 'critical'
  tag 'createvlan'
  describe command('ansible-playbook playbooks/network/createvlan.yml -e env=dev -e region=EMEA -e country=ES -e location=TRC -e site=1 -e context=MKT -e consumption_model=PRIV_AG_MKTPRE_GOLD -e networkservicerole=BACKEND -e networkservice=SERVERS -e businesstype=GLOBAL_SERVICES -e businessrole=') do
    its('exit_status') { should eq 0 }
    its('stdout') { should match(/\[INFO\] VLANID \d+ has been configured both in Infoblox and network devices/) }
  end
end

control 'F1-createvlan-2' do
  title 'F1-createvlan - Network Container is full.'
  desc 'F1-createvlan - Network Container is full - It should fail'
  impact 'critical'
  tag 'createvlan'
  describe command('ansible-playbook playbooks/network/createvlan.yml -e env=dev -e region=EMEA -e country=ES -e location=TRC -e site=1 -e context=JV -e consumption_model=PRIV_AG_JVPRE_GOLD -e networkservicerole=BACKEND -e networkservice=SERVERS -e businesstype=GLOBAL_SERVICES -e businessrole=') do
    its('exit_status') { should_not eq 0 }
    its('stdout') { should match(/\[INFOBLOX\]\[ERROR\] No more free Networks!\. Please, add a new network container for VLAN auto-mangement in datacenter/) }
  end
end

control 'F1-createvlan-3' do
  title 'F1-createvlan - Network Container does not exists.'
  desc 'F1-createvlan - Network Container does not exists - It should fail'
  impact 'critical'
  tag 'createvlan'
  describe command('ansible-playbook playbooks/network/createvlan.yml -e env=dev -e region=EMEA -e country=ES -e location=TRC -e site=1 -e context=GSvDC -e consumption_model=PUB_AG_GSVDCITPRE_GOLD -e networkservicerole=BACKEND -e networkservice=SERVERS -e businesstype=GLOBAL_SERVICES -e businessrole=') do
    its('exit_status') { should_not eq 0 }
    its('stdout') { should match(/\[INFOBLOX\]\[ERROR\] Input parameters do not match any network container in Infoblox system/) }
  end
end

control 'F1-createvlan-4' do
  title 'F1-createvlan - EXTENDED VLAN in single datacenter.'
  desc 'F1-createvlan - EXTENDED VLAN in single datacenter - It should fail'
  impact 'critical'
  tag 'createvlan'
  describe command('ansible-playbook playbooks/network/createvlan.yml -e env=dev -e region=EMEA -e country=ES -e location=TRC -e site=1 -e context=JV -e consumption_model=PRIV_AG_JVPRE_GOLD -e networkservicerole=BE_EXTENDED -e networkservice=SERVERS -e businesstype=GLOBAL_SERVICES -e businessrole=') do
    its('exit_status') { should_not eq 0 }
    its('stdout') { should match(/\[INFOBLOX\]\[ERROR\] NETWORK SERVICE ROLE is \S+_EXTENDED but secondary datacenter cannot be identified for datacenter/) }
  end
end

control 'F1-createvlan-5' do
  title 'F1-createvlan - Creates the VLAN in a GAP.'
  desc 'F1-createvlan - Creates the VLAN in a GAP - It should succeed'
  impact 'critical'
  tag 'createvlan'
  describe command('ansible-playbook playbooks/network/createvlan.yml -e env=dev -e region=EMEA -e country=ES -e location=TRC -e site=1 -e context=DESA -e consumption_model=PUB_AG_DESAPRE_GOLD -e networkservicerole=BACKEND -e networkservice=SERVERS -e businesstype=GLOBAL_SERVICES -e businessrole=') do
    its('exit_status') { should eq 0 }
    its('stdout') { should match(/\[INFO\] VLANID \d+ has been configured both in Infoblox and network devices/) }
  end
end

control 'F1-createvlan-6' do
  title 'F1-createvlan - Creates the VLAN in the second container since the first if full'
  desc 'F1-createvlan - Creates the VLAN in the second container since the first if full - It should succeed'
  impact 'critical'
  tag 'createvlan'
  describe command('ansible-playbook playbooks/network/createvlan.yml -e env=dev -e region=EMEA -e country=ES -e location=TRC -e site=1 -e context=DESA -e consumption_model=PUB_AG_DESAPRE_GOLD -e networkservicerole=FRONTEND -e networkservice=SERVERS -e businesstype=GLOBAL_SERVICES -e businessrole=') do
    its('exit_status') { should eq 0 }
    its('stdout') { should match(/\[INFO\] VLANID \d+ has been configured both in Infoblox and network devices/) }
  end
end

control 'F1-createvlan-7' do
  title 'F1-createvlan - Fails because there is no free vlanids'
  desc 'F1-createvlan - Fails because there is no free vlanids - It should fail'
  impact 'critical'
  tag 'createvlan'
  describe command('ansible-playbook playbooks/network/createvlan.yml -e env=dev -e region=EMEA -e country=ES -e location=TRC -e site=1 -e context=DESA -e consumption_model=PUB_AG_DESAPRE_GOLD -e networkservicerole=HLB -e networkservice=SERVERS -e businesstype=GLOBAL_SERVICES -e businessrole=') do
    its('exit_status') { should_not eq 0 }
    its('stdout') { should match(/\[INFOBLOX\]\[ERROR\] No free vlanid has been gathered/) }
  end
end

=begin
F3 - Next IP with Autocreate VLAN Tests
=end

control 'F3-nextfreeipautocreatevlan-1' do
  title 'F3-nextfreeipautocreatevlan - Network container is empty'
  desc 'F3-nextfreeipautocreatevlan - Network container is empty - It should succeed'
  impact 'critical'
  tag 'nextfreeipautocreatevlan'
  describe command('ansible-playbook playbooks/network/getnextfreeipautocreatevlan.yml -e env=dev -e region=EMEA -e country=ES -e location=TRC -e site=1 -e context=MKT -e consumption_model=PUB_AG_MKTPRO_GOLD -e networkservicerole=BACKEND -e networkservice=SERVERS -e businesstype=GLOBAL_SERVICES -e businessrole= -e devicesystem=INFOBLOX -e devicesystemrole=INFRASTRUCTURE -e devicetype=SERVER -e hostname=SERVER01 -e requestid=RQ00012345678 -e "note=\'Lorem ipsum dolor sit amet, c\'"') do
    its('exit_status') { should eq 0 }
    its('stdout') { should match(/\[WARNING\] Input parameters do not match any network in Infoblox system/) }
    its('stdout') { should match(/\[INFO\] IP Address has been assigned/) }
  end
end

control 'F3-nextfreeipautocreatevlan-2' do
  title 'F3-nextfreeipautocreatevlan - Network container is full'
  desc 'F3-nextfreeipautocreatevlan - Network container is full - It should fail'
  impact 'critical'
  tag 'nextfreeipautocreatevlan'
  describe command('ansible-playbook playbooks/network/getnextfreeipautocreatevlan.yml -e env=dev -e region=EMEA -e country=ES -e location=TRC -e site=1 -e context=JV -e consumption_model=PUB_AG_JVPRO_GOLD -e networkservicerole=BACKEND -e networkservice=SERVERS -e businesstype=GLOBAL_SERVICES -e businessrole= -e devicesystem=INFOBLOX -e devicesystemrole=INFRASTRUCTURE -e devicetype=SERVER -e hostname=SERVER01 -e requestid=RQ00012345678 -e "note=\'Lorem ipsum dolor sit amet, c\'"') do
    its('exit_status') { should_not eq 0 }
    its('stdout') { should match(/\[WARNING\] Input parameters do not match any network in Infoblox system/) }
    its('stdout') { should match(/\[INFOBLOX\]\[ERROR\] No more free Networks!\. Please, add a new network container for VLAN auto-mangement in datacenter/) }
  end
end

=begin
F2 - Delete VLAN Tests
=end

control 'F2-deletevlan-1' do
  title 'F2-deletevlan - Delete existing VLANID'
  desc 'F2-deletevlan - Delete existing VLANID - It should succeed'
  impact 'critical'
  tag 'deletevlan'
  describe command('ansible-playbook playbooks/network/deletevlan.yml -e env=dev -e vlanid=3811 -e region=EMEA -e country=ES -e location=TRC -e site=1') do
    its('exit_status') { should eq 0 }
    its('stdout') { should match(/\[INFO\] VLANID \d+ has been deleted both from Infoblox and network devices/) }
  end
end

control 'F2-deletevlan-2' do
  title 'F2-deletevlan - Delete non-existing VLANID'
  desc 'F2-deletevlan - Delete non-existing VLANID - It should fail'
  impact 'critical'
  tag 'deletevlan'
  describe command('ansible-playbook playbooks/network/deletevlan.yml -e env=dev -e vlanid=3851 -e region=EMEA -e country=ES -e location=TRC -e site=1') do
    its('exit_status') { should_not eq 0 }
    its('stdout') { should match(/\[INFOBLOX\]\[ERROR\] VLAN ID \d+ matches 0 networks/) }
  end
end

control 'F2-deletevlan-3' do
  title 'F2-deletevlan - Delete non-empty VLANID'
  desc 'F2-deletevlan - Delete non-empty VLANID - It should fail'
  impact 'critical'
  tag 'deletevlan'
  describe command('ansible-playbook playbooks/network/deletevlan.yml -e env=dev -e vlanid=3814 -e region=EMEA -e country=ES -e location=TRC -e site=1') do
    its('exit_status') { should_not eq 0 }
    its('stdout') { should match(/\[INFOBLOX\]\[ERROR\] Used IP addresses in network/) }
  end
end
