# -*- coding: utf-8 -*-
__author__ = "Paul Schifferer <dm@sweetrpg.com>"
"""Client.
"""

from sweetrpg_model_core.model.base import Model


class Client(object):
    """

    """

    def __init__(self, base_url: str, access_token: str = None):
        """

        :param str base_url:
        :param str access_token:
        """
        self.base_url = base_url
        self.access_token = access_token
        self.data_types = {}

    def register_type(self, name: str):
        """

        :param name:
        :return:
        """
        self.data_types[name] = {}

    def get(self, data_type: str, id: str) -> Model:
        """

        :param str data_type:
        :param str id:
        :return Model:
        """
        return None
