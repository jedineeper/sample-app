NAME		= jedineeper/sample-app

all			: build

.built	: .
	docker build -t $(NAME) .
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
