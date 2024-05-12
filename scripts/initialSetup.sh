# Aktualizacia systemu
sudo apt update && sudo apt upgrade -y

# Graficke rozhranie pre nastavenie casovej zony
sudo dpkg-reconfigure tzdata - set timezone

# Vytvorenie noveho "pouzivatela" na ktorom nam bude nas webovy server bezat
sudo adduser 'nodejs'

# Povolenie pristupu pre pouzivatela 'nodejs' k sudo
sudo usermod -aG sudo nodejs

# Vymazanie (-d) a zamknutie (-l) hesla pre root
sudo passwd -dl root




