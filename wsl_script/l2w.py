# 将文件放入windows粘贴板

from PyQt5.QtCore import QMimeData, QUrl
from PyQt5.QtWidgets import QApplication
import sys
import os

if __name__ == "__main__":
    if (len(sys.argv) == 1):
        print("Usage: {} [file1, file2, ...]".format(sys.argv[0]))
        exit(0)
    elif (sys.argv[1] == "-h"):
        print("Function:Set windows clipboard to file")
        print("Usage: {} [file1, file2, ...]".format(sys.argv[0]))
        exit(0)

    urls = []
    text = ""
    for name in sys.argv[1:]:
        if (not os.path.exists(name)):
            print("Path:{} not exist!".format(name))
            exit(0)

        path = os.path.join(os.getcwd(), name)
        urls.append(QUrl.fromLocalFile(path))
        text = text + "file:" + path + "\n"

    # 设置粘贴板
    app = QApplication([])

    data = QMimeData()
    data.setUrls(urls)
    data.setText(text)
    app.clipboard().setMimeData(data) 
    
    print("File {} alerady in clipboard".format(sys.argv[1:]))
