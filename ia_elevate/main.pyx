#! /usr/bin/env python
# cython: language_level=3
# distutils: language=c++

""" get sudo if necessary """

import shutil
from typing             import Optional

from structlog          import get_logger

from ia_check_root.main import check_root

from .err               import ElevationException

logger = get_logger()

def get_sudo()->Optional[str]:
	if check_root():
		logger.info('already root')
		return None
	sudo:Optional[str] = shutil.which('sudo')
	if(sudo is not None):
		logger.info('found sudo: %s', sudo)
		return sudo
	raise ElevationException('could not find sudo')

if __name__ == '__main__':
	sudo:Optional[str] = get_sudo()
	print('sudo: %s', sudo)

__author__:str = 'you.com' # NOQA
