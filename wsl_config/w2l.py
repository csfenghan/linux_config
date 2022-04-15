#!/bin/python3
import subprocess
import sys
import os
import re

def parserWinPath(mount_path, path):
    # 解析windows地址，返回linux对应挂载点的地址
    path = path.split('\\')

    if (len(path) == 0) or not re.match('[C-Z]+:$', path[0].strip()):
        raise IOError("Error: Address rormat error, cannot recognize address {}!".format(path[0]))

    result = os.path.join(mount_path, str.lower(path[0].strip()[0]))
    for p in path[1:]:
        result = os.path.join(result, p)

    return result
    

mount_path = "/mnt"
if __name__ == "__main__":
    if (len(sys.argv) == 2):
        p1, p2 = sys.argv[1], '.'
    elif (len(sys.argv) == 3):
        p1, p2 = sys.argv[1], sys.argv[2]
    else:
        print("Usage: {} source dest".format(sys.argv[0]))
        exit(0)

    # 解析地址
    try:
        source_path = parserWinPath(mount_path, p1)
        if (not os.path.exists(source_path)):
            raise IOError("Error: File not exist!")

        # 复制
        subprocess.run(
                ["cp", "-r", source_path, p2]
                )
        print("Copy successed!")
    except IOError as err:
        print(err)

