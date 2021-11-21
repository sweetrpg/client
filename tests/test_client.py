# -*- coding: utf-8 -*-
__author__ = "Paul Schifferer <dm@sweetrpg.com>"
"""
"""

import responses
from sweetrpg_client.client import Client
from sweetrpg_client.types import VOLUME, AUTHOR
import os
import json
from sweetrpg_library_objects.model.volume import Volume
from sweetrpg_library_objects.model.author import Author
from sweetrpg_client.exceptions import *

def test_client():
    client = Client('http://localhost')

    assert client is not None
    # TODO


def test_registration():
    client = Client('http://localhost')

    assert client is not None
    # TODO


@responses.activate
def test_get_volume():
    # load test data file
    path = os.path.dirname(__file__) + '/test-single-volume.json'
    with open(path, 'r') as v:
        volumes_data = json.load(v)
    responses.add(responses.GET, 'http://localhost/volumes/1',
                  json=volumes_data,
                  status=200)

    client = Client('http://localhost')
    obj = client.get(VOLUME, '1')

    assert obj is not None
    assert isinstance(obj, Volume)
    assert obj.id == '1'


@responses.activate
def test_get_volume_wrong_type():
    # load test data file
    path = os.path.dirname(__file__) + '/test-single-author.json'
    with open(path, 'r') as v:
        volumes_data = json.load(v)
    responses.add(responses.GET, 'http://localhost/volumes/1',
                  json=volumes_data,
                  status=200)

    try:
        client = Client('http://localhost')
        obj = client.get(VOLUME, '1')
    except InvalidResponseData as ird:
        assert ird.name == 'type'
        assert ird.value == VOLUME


@responses.activate
def test_get_volume_wrong_id():
    # load test data file
    path = os.path.dirname(__file__) + '/test-single-volume.json'
    with open(path, 'r') as v:
        volumes_data = json.load(v)
    responses.add(responses.GET, 'http://localhost/volumes/2',
                  json=volumes_data,
                  status=200)

    try:
        client = Client('http://localhost')
        obj = client.get(VOLUME, '2')
    except InvalidResponseData as ird:
        assert ird.name == 'object-id'
        assert ird.value == 'volume:2'



@responses.activate
def test_query_volumes():
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


@responses.activate
def test_get_author():
    # load test data file
    path = os.path.dirname(__file__) + '/test-single-author.json'
    with open(path, 'r') as v:
        author_data = json.load(v)
    responses.add(responses.GET, 'http://localhost/authors/1',
                  json=author_data,
                  status=200)

    client = Client('http://localhost')
    obj = client.get(AUTHOR, '1')

    assert obj is not None
    assert isinstance(obj, Author)
    assert obj.id == '1'


@responses.activate
def test_query_authors():
    # load test data file
    path = os.path.dirname(__file__) + '/test-authors.json'
    with open(path, 'r') as v:
        authors_data = json.load(v)
    responses.add(responses.GET, 'http://localhost/authors/',
                  json=authors_data,
                  status=200)

    # client = Client('http://localhost')
    # objs = client.query(VOLUME)
    #
    # assert objs is not None
    # assert isinstance(objs, list)
