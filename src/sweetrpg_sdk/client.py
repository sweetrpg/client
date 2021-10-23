# -*- coding: utf-8 -*-
__author__ = "Paul Schifferer <dm@sweetrpg.com>"
"""Client.
"""


class Client(object):

    def __init__(self, access_token=None):
        self.access_token = access_token
