#!/usr/bin/env python
# -*- coding: utf-8 -*-
# pylint: disable=missing-docstring

from __future__ import (division, absolute_import, print_function,
                        unicode_literals)
import os
import sys
import re


class WorkPath():  # pylint: disable=too-few-public-methods
    def __init__(self):
        self.path = os.path.dirname(os.path.realpath(__file__))
        self.work_path = os.path.dirname(self.path)
        os.chdir(self.work_path)

    def dirpath(self):
        return self.work_path


def main():

    cr_fail = "\033[91m"
    c_end = "\033[0m"

    # Sets default exit status code
    return_code = 0

    myproject = WorkPath()
    work_path = myproject.dirpath()

    vaultpattern = re.compile(r"\$ANSIBLE_VAULT;\d\.\d;\w+")

    for dirpath, _, filenames in os.walk(work_path):
        for filename in filenames:
            if filename.endswith('.vault'):
                vaultfile = open(os.path.join(dirpath, filename), 'r')
                vaulthead = vaultfile.readline()
                vaultfile.close()
                isvault = re.findall(vaultpattern, vaulthead)
                if not isvault:
                    print(cr_fail +
                          "fail: [Unencrypted Vault] => (item=%s) \n" %
                          os.path.join(dirpath, filename) + c_end)
                    return_code = 1

    sys.exit(return_code)


if __name__ == '__main__':
    main()
