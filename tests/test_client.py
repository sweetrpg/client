# -*- coding: utf-8 -*-
__author__ = "Paul Schifferer <dm@sweetrpg.com>"
"""
"""

import responses
from sweetrpg_client.client import Client
from sweetrpg_client.types import VOLUME


def test_client():
    client = Client('http://localhost')


def test_registration():
    client = Client('http://localhost')


@responses.activate
def test_get():
    responses.add(responses.GET, 'http://localhost/volumes/1',
                  json={'data': {'type': 'volume', 'id': 1, 'attributes': {}}}, status=200)

    client = Client('http://localhost')
    obj = client.get(VOLUME, '1')


@responses.activate
def test_query():
    responses.add(responses.GET, 'http://localhost/volumes/',
                  json={'data': [{'type': 'volume', 'id': 1, 'attributes': {}}]}, status=200)

    client = Client('http://localhost')
    objs = client.query(VOLUME)

    assert objs is not None
    assert isinstance(objs, list)
