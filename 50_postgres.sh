# Install Postgres
sudo apt-get install -y postgresql postgresql-contrib

# ----- change Postgres configuration to allow "trusted" local connections
# ipv4 & ipv6
sudo sed -i."$(date +%FT%T)" '/host *all *all */ s/md5/trust/' /etc/postgresql/9.3/main/pg_hba.conf
sudo sed -i."$(date +%FT%T)" '/local *all *all */ s/peer/trust/' /etc/postgresql/9.3/main/pg_hba.conf
sudo sed -i."$(date +%FT%T)" '/local *all *postgres */ s/peer/trust/' /etc/postgresql/9.3/main/pg_hba.conf

# ----- reload postgres config
sudo service postgresql reload
