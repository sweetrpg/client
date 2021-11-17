# -*- coding: utf-8 -*-
__author__ = "Paul Schifferer <dm@sweetrpg.com>"
"""
"""

import responses
from sweetrpg_client.client import Client
from sweetrpg_client.types import VOLUME
import os
import json


def test_client():
    client = Client('http://localhost')


def test_registration():
    client = Client('http://localhost')


@responses.activate
def test_get():
    # load test data file
    path = os.path.dirname(__file__) + '/test-single-volume.json'
    with open(path, 'r') as v:
        volumes_data = json.load(v)
    responses.add(responses.GET, 'http://localhost/volumes/1',
                  json=volumes_data,
                  status=200)

    # client = Client('http://localhost')
    # obj = client.get(VOLUME, '1')


@responses.activate
def test_query():
    # load test data file
    path = os.path.dirname(__file__) + '/test-volumes.json'
    with open(path, 'r') as v:
        volumes_data = json.load(v)
    responses.add(responses.GET, 'http://localhost/volumes/',
                  json=volumes_data,
                  status=200)

    # client = Client('http://localhost')
    # objs = client.query(VOLUME)
    #
    # assert objs is not None
    # assert isinstance(objs, list)
