@echo off

echo mkdir ai-hpa
pause
mkdir ai-hpa

echo cd ai-hpa
pause
cd ai-hpa

echo echo from flask import Flask > app.py
pause
echo from flask import Flask> app.py

echo echo app = Flask(__name__) >> app.py
pause
echo app = Flask(__name__)>> app.py

echo echo @app.route("/") >> app.py
pause
echo @app.route("/")>> app.py

echo echo def home(): >> app.py
pause
echo def home():>> app.py

echo echo     return "AI App Running" >> app.py
pause
echo     return "AI App Running">> app.py

echo echo if __name__ == "__main__": >> app.py
pause
echo if __name__ == "__main__":>> app.py

echo echo     app.run(host="0.0.0.0", port=5000) >> app.py
pause
echo     app.run(host="0.0.0.0", port=5000)>> app.py

echo echo flask > requirements.txt
pause
echo flask> requirements.txt

echo echo FROM python:3.9 > Dockerfile
pause
echo FROM python:3.9> Dockerfile

echo echo WORKDIR /app >> Dockerfile
pause
echo WORKDIR /app>> Dockerfile

echo echo COPY . . >> Dockerfile
pause
echo COPY . .>> Dockerfile

echo echo RUN pip install -r requirements.txt >> Dockerfile
pause
echo RUN pip install -r requirements.txt>> Dockerfile

echo echo CMD ["python", "app.py"] >> Dockerfile
pause
echo CMD ["python", "app.py"]>> Dockerfile

echo minikube start --driver=docker
pause
minikube start --driver=docker

echo docker build -t ai-model .
pause
docker build -t ai-model .

echo kubectl apply -f deployment.yaml
pause
kubectl apply -f deployment.yaml

echo kubectl apply -f service.yaml
pause
kubectl apply -f service.yaml

echo kubectl get pods
pause
kubectl get pods

echo minikube service ai-service
pause
minikube service ai-service

pause
