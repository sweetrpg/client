# -*- coding: utf-8 -*-
__author__ = "Paul Schifferer <dm@sweetrpg.com>"
"""Helpers.
"""

import logging


def _flatten_object(obj):
    """

    """
    logging.debug("obj: %s", obj)

    print(dir(obj.fields))
    flattened = dict(obj.attributes._target_object)
    flattened['id'] = obj.id
    logging.debug("flattened: %s", flattened)

    return flattened
