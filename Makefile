PORT ?= 8000

install:
	uv sync

build:
	uv build

package-install:
	uv tool install --force dist/*.whl

dev:
	uv run flask --debug --app page_analyzer:app run

run:
	uv run gunicorn -w 5 -b 0.0.0.0:$(PORT) page_analyzer:app

lint:
	uv run ruff check page_analyzer

black:
	black .
	
test-coverage:
	uv run pytest --cov=gendiff --cov-report term --cov-report xml

tests:
	uv run pytest