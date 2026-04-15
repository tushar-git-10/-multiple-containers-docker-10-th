@echo off

echo Creating folders...
mkdir backend
mkdir frontend

echo Creating backend files...

echo from flask import Flask> backend\app.py
echo app = Flask(__name__)>> backend\app.py
echo @app.route("/")>> backend\app.py
echo def home():>> backend\app.py
echo     return "AI Model Running!">> backend\app.py
echo if __name__ == "__main__":>> backend\app.py
echo     app.run(host="0.0.0.0", port=5000)>> backend\app.py

echo flask> backend\requirements.txt

echo FROM python:3.10> backend\Dockerfile
echo WORKDIR /app>> backend\Dockerfile
echo COPY . .>> backend\Dockerfile
echo RUN pip install -r requirements.txt>> backend\Dockerfile
echo EXPOSE 5000>> backend\Dockerfile
echo CMD ["python", "app.py"]>> backend\Dockerfile

echo Creating frontend files...

echo ^<h1^>Frontend Connected to AI Backend^</h1^> > frontend\index.html

echo FROM nginx:latest> frontend\Dockerfile
echo COPY index.html /usr/share/nginx/html/index.html>> frontend\Dockerfile
echo EXPOSE 80>> frontend\Dockerfile

echo Creating docker-compose.yml...

echo version: '3'> docker-compose.yml
echo services:>> docker-compose.yml
echo   backend:>> docker-compose.yml
echo     build: ./backend>> docker-compose.yml
echo     ports:>> docker-compose.yml
echo       - "5001:5000">> docker-compose.yml
echo   frontend:>> docker-compose.yml
echo     build: ./frontend>> docker-compose.yml
echo     ports:>> docker-compose.yml
echo       - "8081:80">> docker-compose.yml
echo   database:>> docker-compose.yml
echo     image: mysql:5.7>> docker-compose.yml
echo     environment:>> docker-compose.yml
echo       MYSQL_ROOT_PASSWORD: root>> docker-compose.yml

echo Running Docker Compose...
pause
