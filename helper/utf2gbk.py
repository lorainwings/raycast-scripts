import sys

def utf2gbk(utf8_str):
    encoded_str = ''
    for char in utf8_str:
        if char == ' ':
            encoded_str += '+'
        elif ord(char) > 127:  # 判断是否是非ASCII字符
            try:
                gbk_bytes = char.encode('gbk')
                gbk_str = ''.join(['%' + format(byte, '02X') for byte in gbk_bytes])
                encoded_str += gbk_str
            except UnicodeEncodeError:
                # 跳过无法编码的字符
                continue
        else:
            encoded_str += char
    return encoded_str

if __name__ == '__main__':
    if len(sys.argv) > 1:
        utf8_str = sys.argv[1]
        print(utf2gbk(utf8_str))
    else:
        print("Usage: python utf2gbk.py <string>")
