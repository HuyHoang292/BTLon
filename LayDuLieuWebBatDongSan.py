from bs4 import BeautifulSoup
import pandas as pd
import requests
import sys
import io

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8')

url = sys.argv[1]
print(f"Đang lấy dữ liệu từ: {url}")

response = requests.get(url)
if response.status_code == 200:
    soup = BeautifulSoup(response.content, "html.parser")
    items = soup.select("div.ct_title")
    descriptions = soup.select("div.ct_brief")
    addresses = soup.select("div.ct_dis")
    areas = soup.select("div.ct_dt")
    prices = soup.select("div.ct_price")

    data = []

    for i in range(len(items)):
        title = items[i].get_text(strip=True)
        desc = descriptions[i].get_text(strip=True) if i < len(descriptions) else ''
        address = addresses[i].get_text(strip=True) if i < len(addresses) else ''
        area = areas[i].get_text(strip=True) if i < len(areas) else ''
        price = prices[i].get_text(strip=True) if i < len(prices) else 'N/A'
        
        data.append([title, desc, address, area, price])

    if data:
        df = pd.DataFrame(data, columns=["Tiêu đề", "Mô tả", "Địa chỉ", "Diện tích", "Giá"])
        df.to_excel("ket_qua_bds.xlsx", index=False)
        print("Đã xuất dữ liệu ra file ket_qua_bds.xlsx")
    else:
        print("Không tìm thấy dữ liệu phù hợp.")
else:
    print(f"Lỗi khi truy cập URL: {response.status_code}")