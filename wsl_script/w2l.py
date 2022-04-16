# 功能：从windows粘贴板中复制文件到目标地址

from PyQt5.QtWidgets import QApplication
import argparse
import subprocess
import sys
import os

def parseDataType(data):
    # 判断粘贴板数据类型
    if data.hasImage():
        return "image"
    elif data.hasHtml():
        return "html"
    elif data.hasUrls() and data.hasText():
        return "url"
    elif data.hasText():
        return "text"
    else:
        return "unknow"

if __name__ == "__main__":
    if (len(sys.argv) > 2):
        print("Usage: {} [dest]".format(sys.argv[0]))
        exit(0)
    elif (len(sys.argv) == 2 and sys.argv[1] == "-h"):
        print("Function:Paste file from windows clipboard to destination path")
        print("Usage: {} [destination]".format(sys.argv[0]))
        exit(0)

    dest_path = os.getcwd() if len(sys.argv) == 1 else sys.argv[1]

    app = QApplication([])
    clipboard = app.clipboard()
    data = clipboard.mimeData()

    # 根据粘贴板数据类型复制数据
    #   windows地址举例:file:///D:/2.txt，有效地址D:/2.txt
    #   wsl地址举例:file://wsl.localhost/Ubuntu-20.04/home/fenghan/temp/test.py，有效地址//wsl.localhost/Ubuntu-20.04/home/fenghan/temp/test.py
    dType = parseDataType(data)
    if dType == "url":
        urls = data.urls()
        text = data.text().strip().split("\n")
        num = len(urls)
        for i in range(num):
            path = text[i]
            start = path.find("//")
            if (path[start + 2] == '/'):        # windows地址
                path = path[start + 3:]
            else:
                path = path[start + 2:]

            source = "\"" + path + "\""
            subprocess.run(
                    ["powershell", "Copy-Item", "-Recurse", source, dest_path]
                    )
            print("powershell Copy-Item {} {}".format(source, dest_path))
    else:
        print("Unsupport data type:{}".format(dType))

