<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Quản lý sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body class="bg-light">
<div class="container py-4">
    <h1 class="mb-4">Danh sách sản phẩm</h1>

    <table class="table table-bordered table-striped bg-white">
        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>Ảnh</th>
            <th>Tên</th>
            <th>Giá</th>
            <th>Mô tả</th>
        </tr>
        </thead>
        <tbody>
        <c:choose>
            <c:when test="${not empty products}">
                <c:forEach var="product" items="${products}">
                    <tr>
                        <td>${product.id}</td>
                        <td>
                            <c:choose>
                                <c:when test="${not empty product.imagePath}">
                                    <img src="${pageContext.request.contextPath}${product.imagePath}" alt="Ảnh sản phẩm" width="80"/>
                                </c:when>
                                <c:otherwise>
                                    <span>Không có ảnh</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>${product.name}</td>
                        <td>${product.price}</td>
                        <td>${product.description}</td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr><td colspan="5">Không có sản phẩm nào.</td></tr>
            </c:otherwise>
        </c:choose>
        </tbody>
    </table>

    <h2 class="mt-5 mb-3">Thêm sản phẩm</h2>
    <form id="addProductForm" class="row g-3" enctype="multipart/form-data">
        <div class="col-md-4">
            <label for="name" class="form-label">Tên:</label>
            <input type="text" class="form-control" id="name" name="name" required>
        </div>
        <div class="col-md-4">
            <label for="price" class="form-label">Giá:</label>
            <input type="number" class="form-control" id="price" name="price" required min="0" step="0.01">
        </div>
        <div class="col-md-4">
            <label for="description" class="form-label">Mô tả:</label>
            <input type="text" class="form-control" id="description" name="description" required>
        </div>
        <div class="col-md-4">
            <label for="image" class="form-label">Hình ảnh:</label>
            <input type="file" class="form-control" id="image" name="image" accept="image/*">
        </div>
        <div class="col-12">
            <button type="submit" class="btn btn-primary">Thêm</button>
        </div>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function () {
        $('#addProductForm').on('submit', function (e) {
            e.preventDefault();

            let formData = new FormData(this);

            // Kiểm tra các trường bắt buộc (trim để loại bỏ khoảng trắng đầu cuối)
            if (!formData.get('name').trim() || !formData.get('price') || !formData.get('description').trim()) {
                alert('Vui lòng điền đầy đủ thông tin!');
                return;
            }

            $.ajax({
                url: '${pageContext.request.contextPath}/api/products',
                type: 'POST',
                data: formData,
                processData: false,  // không chuyển dữ liệu thành query string
                contentType: false,  // để trình duyệt tự đặt content-type đúng (multipart/form-data)
                success: function () {
                    alert('Thêm sản phẩm thành công!');
                    location.reload();  // tải lại trang để cập nhật danh sách
                },
                error: function (xhr, status, error) {
                    alert('Lỗi khi thêm sản phẩm! Vui lòng kiểm tra console.');
                    console.error('Error:', error);
                }
            });
        });
    });
</script>
</body>
</html>
