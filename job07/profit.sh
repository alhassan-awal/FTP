s="sudo"
$s apt install proftpd- * openssl

echo "creation  group ftp"
$s groupadd ftp
echo "Add Merry and Add to group ftp"
$s useradd -m merry && $s adduser merry fpt
$s echo "Meery:kalimac" | $s chpasswd

echo "Add Pippin and to group ftp"
$s useradd -m Pippin && $s adduser Pippin ftp
$s echo  "Pippin:secndbreakfast" | $s chpasswd

echo "Generation of encryption keys"
$s mkdir /etc/proftpd/ssl
$s openssl req -new -x509 -keyout /etc/proftpd/ssl/proftpd.key.pem -days 365 -nodes -out /etc/proftpdssl/proftpd.cert.pem

echo "Backing up the old  file proftpd.conf"
$s cp /etc/proftpd/proftpd.conf /etc/proftpd/proftpd.conf.bak

echo "Replace file proftpd.conf"

$s cp proftpd.conf /etc/proftpd/proftpd.conf
$s chmod 600 /etc/proftpd/ssl/proftpd.*

echo " Replace service proftpd"
$s systemctl restart proftpd.service

echo "installation completed"
