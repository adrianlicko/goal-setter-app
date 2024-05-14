sudo apt install nodejs -y

# Presun z priecinku scripts do priecinka Goal Setter app
cd ..
cd 'Goal Setter app'

# Instalacia "zavislosti" pre backend
npm install

# Instalacia "zavislosti" pre frontend
cd frontend
npm install

# Stavba frontendu
npm run build

# Spustenie celej aplikacie
cd .. # Presun do priecinka Goal Setter app z priecinka frontend
npm start