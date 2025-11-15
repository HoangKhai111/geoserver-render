# 1. Dùng GeoServer OSGeo làm base image
FROM osgeo/geoserver:2.25.1

# 2. Thiết lập user admin mặc định (Thực hiện trước khi chạy, không cần quyền root)
ENV GEOSERVER_ADMIN_USER=admin
ENV GEOSERVER_ADMIN_PASSWORD=geoserver

# --- Phần cài đặt JDBC Driver ---

# 3. Chạy dưới quyền root để cài đặt (Cần thiết cho các thao tác hệ thống)
USER root

# 4. Tạo thư mục chuẩn chứa JDBC driver trong thư mục cài đặt GeoServer
# GeoServer (và Tomcat) thường đọc driver từ WEB-INF/lib của ứng dụng
RUN mkdir -p /opt/geoserver/webapps/geoserver/WEB-INF/lib

# 5. Copy MySQL JDBC driver vào thư mục chuẩn của GeoServer
# Đảm bảo file 'mysql-connector-j-9.3.0.jar' nằm trong thư mục 'lib' cùng cấp với Dockerfile
COPY lib/mysql-connector-j-9.3.0.jar /opt/geoserver/webapps/geoserver/WEB-INF/lib/

# 6. Trở lại user mặc định của GeoServer/Tomcat để tăng bảo mật
# User mặc định của image osgeo/geoserver là 'geoserver' hoặc UID 1000
USER 1000

# 7. Expose port GeoServer (Thường là 8080)
EXPOSE 8080

# 8. Chạy GeoServer (Lệnh mặc định của image base sẽ tự động chạy)
# Không cần thêm CMD hoặc ENTRYPOINT nếu image base đã có sẵn lệnh chạy GeoServer/Tomcat