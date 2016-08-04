#route 
gateway=`echo $IP | cut -d. -f1,2`.0.1 
route add default gw $gateway 
route del -net 0.0.0.0 netmask 0.0.0.0 dev eth0