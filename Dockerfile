FROM node:20

# Crea directorio de trabajo
WORKDIR /app

# Copia package.json y package-lock.json
COPY package*.json ./

# Instala dependencias
RUN npm install

# Copia el resto del proyecto
COPY . .

# Ejecuta pruebas y genera cobertura
RUN npm test && npx jest --coverage

# Expone el puerto
EXPOSE 3000

# Comando de inicio
CMD ["npm", "start"]
