# -*- coding: utf-8 -*-

from __future__ import (absolute_import, division, print_function)
__metaclass__ = type

import os


class FilterModule(object):
    """ Filter VPN rules based on the config """
    def filters(self):
        return {
            'vpn_rules_filter': self.vpn_rules_filter,
        }

    def vpn_rules_filter(self, files, rules):
        rfiles = {}
        for item in files["files"]:
            path = item["path"]
            rule = os.path.basename(path)

            if rules.get(rule):
                rfiles[rule] = open(path).read()

        return rfiles
