# Tổng quát

- Ruby là một ngôn ngữ lập trình hướng đối tượng, được biên dịch trong quá trình chạy.
- Ruby được lấy cảm hứng từ các ngôn ngữ lập trình khác như Perl, Smalltalk, Effiel và Lisp.

- Rails framework được tạo ra để quá trình phát triển phần mềm diễn ra nhanh hơn
- Rails sử dụng các qui ước triệt để và đảm nhận xử lý rất nhiều task khiến người lập trình viên không phải bận tâm về nó nữa như : mail management, object-database mappers, file structures, code generation .v.v.
- Rails sử dụng mẫu kiến trúc Model - View - Controller (MVC) để tăng cường khả năng bảo trì và phát triển của úng dụng.

# Mô hình MVC trong Rails Framework

- ActiveRecord đóng vai trò là M trong MVC:
  - Đóng vai trò xử lý các nghiệp vụ và logic, kết nối Database.
  - Tất cả các Model được tạo ra từ lệnh `rails g model <model name>` đều được kết thừa từ lớp ActiveRecord.
  - Đảm bảo Rails có thể hoạt động một cách độc lập với các hệ quản trị CSDL.

- ActionView đóng vai trò là V trong MVC:
  - View trong Rails được viết bằng cách nhúng các đoạn mã Ruby trong các thẻ lẫn với thẻ HTML.
  - Rails hỗ trợ các `ActionView::Helper` để lập trình viên có thể dễ dàng hiển thị dữ liệu từ Model đến người dùng.

Một số Helper hỗ trợ trong việc tạo form dữ liệu : [FormTagHelper](https://apidock.com/rails/ActionView/Helpers/FormTagHelper)

```
form_tag('/posts')
# => <form action="/posts" method="post">

text_field_tag 'name'
# => <input id="name" name="name" type="text" />
```

- ActionController đóng vai trò là C trong MVC:
  - Trong Rails chỉ có application_controller.rb mới kế thừa từ lớp ActionController, tất cả các Controller khác đều kế thừa lại từ application_controller.rb. - Controller có nghiệm vụ xác định các request và trả về view cho người dùng.

![rails_mvc](/imgs/rails_mvc.webp)


