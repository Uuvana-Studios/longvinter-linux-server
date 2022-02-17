sudo iptables -I INPUT -p udp --dport 7777 -j ACCEPT
sudo iptables -I INPUT -p tcp --dport 7777 --syn -j ACCEPT

sudo iptables -I INPUT -p udp --dport 27016 -j ACCEPT
sudo iptables -I INPUT -p tcp --dport 27016 --syn -j ACCEPT

sudo iptables -I INPUT -p udp --dport 27015 -j ACCEPT
sudo iptables -I INPUT -p tcp --dport 27015 --syn -j ACCEPT
