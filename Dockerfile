# Sử dụng image chính thức từ OSGeo/GeoServer
FROM docker.osgeo.org/geoserver:2.28.0

# Chạy dưới quyền root để cài đặt thêm
USER root

# Tạo thư mục chứa JDBC driver nếu cần
RUN mkdir -p /opt/geoserver_data/lib

# Copy MySQL JDBC driver vào image
COPY lib/mysql-connector-j-9.3.0.jar /opt/geoserver_data/lib/

# Expose port (GeoServer chạy bên trong container ở port 8080)
EXPOSE 8080

# Thiết lập user và password admin mặc định (nên thay nhanh khi production)
ENV GEOSERVER_ADMIN_USER=admin
ENV GEOSERVER_ADMIN_PASSWORD=geoserver

# Trở về user không root để chạy GeoServer
USER 1000
