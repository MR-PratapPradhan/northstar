# apps/retail-api/tests/test_main.py
from apps.retail_api import main

def test_add():
    assert main.add(2, 3) == 5

