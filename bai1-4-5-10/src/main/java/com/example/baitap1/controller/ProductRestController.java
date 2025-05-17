package com.example.baitap1.controller;

import com.example.baitap1.entity.Product;
import com.example.baitap1.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.logging.Logger;

@RestController
@RequestMapping("/api/products")
public class ProductRestController {

    private static final Logger LOGGER = Logger.getLogger(ProductRestController.class.getName());

    @Autowired
    private ProductRepository productRepository;

    // Lưu ảnh vào thư mục trong thư mục user.home để đảm bảo quyền ghi
    private static final String UPLOAD_DIR = System.getProperty("user.home") + "/uploads/images/";

    @GetMapping
    public List<Product> getAll() {
        return productRepository.findAll();
    }

    @PostMapping(consumes = {"multipart/form-data"})
    public Product create(@RequestParam("name") String name,
                          @RequestParam("price") double price,
                          @RequestParam("description") String description,
                          @RequestParam(value = "image", required = false) MultipartFile image) throws IOException {

        Product product = new Product();
        product.setName(name);
        product.setPrice(price);
        product.setDescription(description);

        if (image != null && !image.isEmpty()) {
            try {
                String originalFileName = StringUtils.cleanPath(image.getOriginalFilename());
                // Thêm timestamp vào tên file để tránh trùng
                String fileName = System.currentTimeMillis() + "_" + originalFileName;

                Path uploadPath = Paths.get(UPLOAD_DIR);

                if (!Files.exists(uploadPath)) {
                    Files.createDirectories(uploadPath);
                    LOGGER.info("Created upload directory: " + uploadPath.toString());
                }

                Path filePath = uploadPath.resolve(fileName);
                image.transferTo(filePath.toFile());

                // Đường dẫn dùng để truy cập ảnh qua URL
                product.setImagePath("/uploads/images/" + fileName);

                LOGGER.info("Image saved at: " + filePath.toString());
            } catch (IOException e) {
                LOGGER.severe("Lỗi khi lưu file ảnh: " + e.getMessage());
                throw new IOException("Lỗi khi lưu file ảnh: " + e.getMessage());
            }
        }

        return productRepository.save(product);
    }
}
