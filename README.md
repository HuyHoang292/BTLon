readme_content = """
# Tự Động Hóa Lấy Dữ Liệu Bất Động Sản từ Alonhadat.com.vn

Dự án này sử dụng **Robot Framework** kết hợp **Python** để tự động mở trình duyệt, tìm kiếm bất động sản theo tiêu chí người dùng nhập và lấy dữ liệu từ trang kết quả, xuất ra file Excel.

## 🔧 Công nghệ sử dụng
- Robot Framework
- SeleniumLibrary
- Python
- BeautifulSoup (bs4)
- pandas
- requests
- Trình duyệt: Google Chrome + ChromeDriver

## 🗂️ Cấu trúc thư mục

BTLon/
├── btl.robot # Test suite chính
├── LayDuLieuWebBatDongSan.py # Script Python lấy dữ liệu từ web
├── requirements.txt # Thư viện cần cài cho Python
├── README.md # Hướng dẫn sử dụng


## ▶️ Cách chạy

### 1. Cài đặt môi trường

```bash
pip install -r requirements.txt
Cài thêm Robot Framework và Selenium:

pip install robotframework
pip install robotframework-seleniumlibrary
Lưu ý: Cài ChromeDriver phù hợp với phiên bản Chrome và đặt nó trong PATH.

robot btl.robot
Sau khi chạy xong:

File Excel ket_qua_bds.xlsx sẽ được tạo nếu tìm thấy dữ liệu.

File log và báo cáo HTML sẽ nằm trong thư mục results.

* Tùy chỉnh tìm kiếm
Trong file btl.robot, bạn có thể thay đổi các biến:

${Dia diem}         Hà Nội
${Loai giao dich}   cho-thue
${Loai BDS}         van-phong

* Kết quả
Kết quả được xuất ra file ket_qua_bds.xlsx gồm các cột:

Tiêu đề

Mô tả

Địa chỉ

Diện tích

Giá

📎 Ghi chú
Script Python đã được xử lý encoding UTF-8 để tránh lỗi Unicode trên Windows.

Sử dụng sys.stdout = io.TextIOWrapper(...) giúp in tiếng Việt không bị lỗi UnicodeEncodeError.

requirements_content = """beautifulsoup4==4.12.3
pandas==2.2.2
requests==2.31.0
openpyxl==3.1.2
"""