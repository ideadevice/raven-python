bootstrap:
	pip install -e . --use-mirrors
	pip install "file://`pwd`#egg=raven[dev]" --use-mirrors
	pip install "file://`pwd`#egg=raven[tests]" --use-mirrors

test: bootstrap lint
	@echo "Running Python tests"
	py.test -x tests
	@echo ""

lint:
	@echo "Linting Python files"
	flake8 --exclude=migrations --ignore=E501,E225,E121,E123,E124,E125,E127,E128 raven || exit 1
	@echo ""

coverage:
	coverage run runtests.py --include=raven/* && \
	coverage html --omit=*/migrations/* -d cover
