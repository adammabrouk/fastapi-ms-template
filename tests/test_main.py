import pytest
from fastapi.testclient import TestClient
from service_name.main import (
    app,
)  # TODO : remember to rename your service after copying the template

client = TestClient(app)


def test_read_main():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"message": "Hello World"}


def test_read_item():
    response = client.get("/items/42")
    assert response.status_code == 200
    assert response.json() == {"item_id": 42, "name": "The Answer"}
