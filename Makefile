NAME		= jedineeper/sample-app

all			: build

.built	: .
	docker build -t $(NAME):$(shell git rev-parse HEAD) -t $(NAME):latest .
	@docker inspect -f '{{.Id}}' $(NAME) > .built

build  : .built

test   : .
	@echo "Faking some testing!"

release:
	docker push $(NAME)
	
deploy: .
	kubectl --kubeconfig ~/.kube/style-dev update -f deploy

clean  :
	@$(RM) .built
