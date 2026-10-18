import pytest
import requests
import page_analyzer
import flask


def test_app_presence():
    assert hasattr(page_analyzer, "app")
    assert isinstance(page_analyzer.app, flask.Flask)


def test_app():
    req = requests.get("http://0.0.0.0.:8000")
    assert req.text == "Hello from page analyzer, stranger!"