# 功能：从windows粘贴板中复制文件到目标地址

from PyQt5.QtWidgets import QApplication
import subprocess
import sys
import os

def parseDataType(data):
    # 判断粘贴板数据类型
    # return:
    #     url:文件
    #     html:html数据
    #     text:文本数据
    #     image:图片
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
    dest_path = os.getcwd() if len(sys.argv) == 1 else sys.argv[1]

    app = QApplication([])
    clipboard = app.clipboard()
    data = clipboard.mimeData()

    # 根据粘贴板数据类型复制数据
    dType = parseDataType(data)
    if dType == "url":
        url = data.text()
        if (url[0:8] == "file:///"):        # windows文件
            url = url[8:]
        elif (url[0:7] == "file://"):       # wsl文件
            url = url[5:]
        else:
            print("Unknow url type:{}".format(url))
            exit(0)

        source = "\"" + url + "\""
        subprocess.run(
                ["powershell", "Copy-Item", source, dest_path]
                )
        print("powershell Copy-Item {} {}".format(source, dest_path))

    elif dType == "text" or dType == "html":
        pass
    elif dType == "image":
        pass
    else:
        pass
    exit(0) 

