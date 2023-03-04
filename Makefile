install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

format:
	black *.py

lint:
	pylint --disable=R,C *.py

clean:
	kubectl delete deployment mlapi
	kubectl delete service mlapi
	minikube ssh -- docker system prune -a
	minikube stop
	docker system prune -a


all: install lint format