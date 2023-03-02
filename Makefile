install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

format:
	black *.py

lint:
	pylint --disable=R,C *.py

clean:
	docker system prune -a
	minikube ssh -- docker system prune -a


all: install lint format