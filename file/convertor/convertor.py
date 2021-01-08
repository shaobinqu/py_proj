# coding=utf-8
import xlwings as xw
import argparse

# 构建命令行输入参数的方法
para = argparse.ArgumentParser()

# 定义命令行输入参数
para.add_argument('dataBase')

para.add_argument('-s', '--sheet')

para.add_argument('-o', '--output')

# 解析参数
args = para.parse_args()

# 并获参数
# dataBase 表格
data_base = args.dataBase
# sheet
sheet = args.sheet
# 输出文件名
outFile = args.output


def openexcel(books, sheet, outFile ):
    data_out = open(outFile, 'w')
    app = xw.App(visible=False,add_book=False)
    rdDataBase = app.books.open(books)
    sht = rdDataBase.sheets(sheet)
    info = sht.used_range
    nrows = info.last_cell.row
    # ncols = info.last_cell.column
    # print(nrows)
    # tmp1 = sht.range('A1').value
    # tmp2 = sht.range('A2').value
    for i in range(1, nrows+1):
        if i != nrows:
            tmp1 = sht.range('A' + str(i)).value
            tmp2 = sht.range('B' + str(i)).value
            tmp = 'XY ' + str(tmp1) + ',' + str(tmp2) + '  '
            data_out.write(tmp)
        else:
            tmp1 = sht.range('A' + str(i)).value
            tmp2 = sht.range('B' + str(i)).value
            tmp = 'XY ' + str(tmp1) + ',' + str(tmp2) + '  '
            tmp_r = 'XY ' + str(tmp1) + ',' + str(tmp2)
            data_out.write(tmp + tmp_r)
    data_out.close()


if __name__ == "__main__":
    if data_base:
        Book_in = data_base
    else:
        Book_in = "dataBase.xlsx"
    if sheet:
        dataSheet = sheet
    else:
        dataSheet = "Sheet1"
    if outFile:
        output = outFile
    else:
        output = "data_output.txt"
    openexcel(data_base, dataSheet, output)
