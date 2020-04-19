from pynvim import attach
import os
import sys

with attach('socket', path=os.environ['NVIM_LISTEN_ADDRESS']) as nvim:
    if len(sys.argv) > 2:
        nvim.command('e +{1} {0}'.format(sys.argv[1].replace(' ', r'\ '), sys.argv[2]))
    else:
        nvim.command('e {0}'.format(sys.argv[1].replace(' ', r'\ ')))
