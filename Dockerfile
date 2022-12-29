# Usando imagen de node 16
FROM node:16-alpine as builder

# Definiendo el directorio de trabajo  /app en el contenedor
WORKDIR /app

# Copiando archivos
COPY . .

# Npm ci asegura que las versiones exactas estén instaladas en el archivo de bloqueo
RUN npm ci 

# Haciendo build en la app
RUN npm run build

# Paquete de activos estáticos con nginx
FROM nginx:1.21.0-alpine as production

# Seteando env a production
ENV NODE_ENV production

# Copiando los activos construidos de la imagen `builder`
COPY --from=builder /app/build /usr/share/nginx/html

# Agregando el archivo nginx.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Definiendo puerto por defecto
EXPOSE 80

# Iniciando nginx
CMD ["nginx", "-g", "daemon off;"]