# 1. Dùng GeoServer chính thức làm base image
FROM geoserver/geoserver:latest

# 2. Chạy dưới quyền root để cài đặt
USER root

# 3. Tạo thư mục chứa JDBC driver
RUN mkdir -p /opt/geoserver/data_dir/lib

# 4. Copy MySQL JDBC driver vào GeoServer lib
COPY lib/mysql-connector-java-8.1.0.jar /opt/geoserver/data_dir/lib/

# 5. Expose port GeoServer
EXPOSE 8080

# 6. Thiết lập user admin mặc định
ENV GEOSERVER_ADMIN_USER=admin
ENV GEOSERVER_ADMIN_PASSWORD=geoserver

# 7. Chạy GeoServer
USER 1000
