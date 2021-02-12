import os
import re

import tqdm

html_label = ['<b>', '</b>', '<i>', '</i>', '<sup>', '</sup>', '<sub>', '</sub>',
'<underline>', '</underline>', '<space>']
def split_fileanme_content(line):
    name, token = line.strip().replace(' ', '<space>').split('\t', )
    # token = re.split('(<.*?>)', token) # 正则算法修复
    token = re.split('(<[^<^>^0-9]+?>)', token) # 正则算法修复
    if token and token[0] == '':
        token.pop(0)
    if token and token[-1] == '':
        token.pop(-1)
    new_token = []
    for t in token:
        new_token += [t] if t in html_label else list(t)
    return name.replace('\\', '/'), ' '.join(new_token)

# res = split_fileanme_content("das.jpg\t<<b><<=>daa sada</b>")
# exit(res)

# 验证集
with open('data/val.txt', 'r') as f:
    lines = f.readlines()


names, tokens = [], []
lines = tqdm.tqdm(lines)
new_lines = []
for l in lines:
    name, token = split_fileanme_content(l)
    new_lines.append(f"data/val/{name} {token}\n")
    
with open("valid.txt", "w") as f:
    f.writelines(new_lines)

# 训练集
with open('data/train.txt', 'r') as f:
    lines = f.readlines()

names, tokens = [], []
lines = tqdm.tqdm(lines)
new_lines = []
for l in lines:
    name, token = split_fileanme_content(l)
    new_lines.append(f"data/train/{name} {token}\n")
with open("train.txt", "w") as f:
    f.writelines(new_lines)