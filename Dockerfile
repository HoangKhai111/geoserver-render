# 1. Dùng GeoServer OSGeo làm base image
# THAY ĐỔI TẠI ĐÂY: Dùng 2.27 thay vì 2.25.1 và bỏ số cuối .1
FROM osgeo/geoserver:2.28.0

# 2. Thiết lập user admin mặc định
ENV GEOSERVER_ADMIN_USER=admin
ENV GEOSERVER_ADMIN_PASSWORD=geoserver

# --- Phần cài đặt JDBC Driver ---

# 3. Chạy dưới quyền root để cài đặt
USER root

# 4. Tạo thư mục chuẩn chứa JDBC driver
RUN mkdir -p /opt/geoserver/webapps/geoserver/WEB-INF/lib

# 5. Copy MySQL JDBC driver vào thư mục chuẩn của GeoServer
COPY lib/mysql-connector-j-9.3.0.jar /opt/geoserver/webapps/geoserver/WEB-INF/lib/

# 6. Trở lại user mặc định của GeoServer/Tomcat
USER 1000

# 7. Expose port GeoServer
EXPOSE 8080