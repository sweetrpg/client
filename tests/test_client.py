# -*- coding: utf-8 -*-
__author__ = "Paul Schifferer <dm@sweetrpg.com>"
"""
"""

import responses
from sweetrpg_client.client import Client
from sweetrpg_client.types import VOLUME, PERSON
import os
import json
from sweetrpg_library_objects.model.volume import Volume
from sweetrpg_library_objects.model.person import Person
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
    path = os.path.dirname(__file__) + '/test-single-person.json'
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
def test_get_person():
    # load test data file
    path = os.path.dirname(__file__) + '/test-single-person.json'
    with open(path, 'r') as v:
        person_data = json.load(v)
    responses.add(responses.GET, 'http://localhost/persons/1',
                  json=person_data,
                  status=200)

    client = Client('http://localhost')
    obj = client.get(PERSON, '1')

    assert obj is not None
    assert isinstance(obj, Person)
    assert obj.id == '1'


@responses.activate
def test_query_persons():
    # load test data file
    path = os.path.dirname(__file__) + '/test-persons.json'
    with open(path, 'r') as v:
        persons_data = json.load(v)
    responses.add(responses.GET, 'http://localhost/persons/',
                  json=persons_data,
                  status=200)

    # client = Client('http://localhost')
    # objs = client.query(VOLUME)
    #
    # assert objs is not None
    # assert isinstance(objs, list)
