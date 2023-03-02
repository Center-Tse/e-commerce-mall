# e-commerce-mall
整体架构采用了传统的三层架构，即表示层、业务逻辑层和数据访问层，其中：

表示层：使用 JSP、HTML、CSS、JS 等技术实现用户界面，与客户端交互。
业务逻辑层：使用 Servlet、Service、Filter 等技术实现系统的业务逻辑，处理请求并调用数据访问层的接口进行数据操作。
数据访问层：使用 DAO 技术实现数据的持久化和访问，与数据库交互。

用户认证模块
该模块是电子商务网站的重要组成部分，用于验证用户的身份。为方便进行权限管理，本系统将管理员与普通用户的界面分别部署在前台和后台，并提供不同的登录入口。普通用户可以在主页直接找到登录和注册按钮，点击即可访问登录和注册界面。而管理员则需要在系统导航栏中点击后台登录按钮才能进入后台界面。普通用户可使用邮箱注册和登录，而管理员账号需要在后台数据库中添加。管理员可对商品信息和用户信息进行管理。

商品管理模块
该模块负责商品的添加、修改和删除等操作。为了便于管理不同类型的商品，本系统使用分类对商品进行管理，用户可以通过导航栏上的分类按钮查看相应的商品。普通用户可以在未登录的情况下浏览商品信息。为方便用户查找商品，系统还提供了搜索功能，用户可以在导航栏上的搜索框中输入关键词进行搜索。

购物流程模块
该模块涵盖了用户购物的全流程，是电子商务网站中最重要的模块之一。它包括商品加入购物车、订单创建、订单删除、付款、发货通知以及销售报表统计等功能。用户可以将商品加入购物车，并在购物车界面查看当前购买商品的详细信息和价格。在确认购买后，用户可以选择创建订单，支付后管理员会取消未支付订单并根据实际情况用邮件通知用户发货情况。系统会自动统计所有商品的销售额和销量，方便管理员进行销售预测。

2.代码实现
github:https://github.com/Center-Tse/e-commerce-mall
在本系统中，DAO 主要用于实现数据库操作，例如查询、插入、更新和删除数据等。其中，每个 DAO 类对应于一个数据库表或视图，并提供了与该表或视图相关的各种方法。例如，CategoryDAO 类用于实现与商品分类相关的数据库操作，包括查询分类列表、新增分类、删除分类、修改分类等。基于 JDBC 技术的，通过 JDBC 驱动来与 MySQL 数据库进行交互。在 DAO 中，使用了 PreparedStatement 对象来执行 SQL 语句，并使用 ResultSet 对象来获取查询结果。这些操作通常在 DAO 的方法中被封装起来，从而使得代码更加简洁和易于使用。

下面是各个 Servlet 的功能说明：
BaseServlet：是所有 Servlet 的基类，提供了一种通过 URL 映射调用方法的方法，从而简化了 Servlet 的开发。具体实现了处理重定向、JSON 数据写入、转发到 JSP 页面等通用逻辑。

CategoryServlet：用于管理商品分类的增删改查操作。提供了展示商品分类列表、新增商品分类、修改商品分类等功能。


FrontServlet：是前台页面的主要入口，用于处理前台页面的各种请求。具体实现了展示首页、商品列表、商品详情、购物车、登录注册等功能。
OrderServlet：用于管理订单的增删改查操作。提供了创建订单、付款、取消订单等功能。
ProductImageServlet：用于管理商品图片的增删改查操作。提供了展示商品图片、新增商品图片、删除商品图片等功能。
ProductServlet：用于管理商品的增删改查操作。提供了展示商品列表、新增商品、修改商品、删除商品等功能。

PropertyServlet：用于管理商品属性的增删改查操作。提供了展示商品属性、新增商品属性、修改商品属性、删除商品属性等功能。
UserServlet：用于管理用户的增删改查操作。提供了展示用户列表、新增用户、修改用户、删除用户等功能


filter过滤器，该过滤器主要用于处理所有请求并分发到相应的servlet进行处理。其主要功能包括以下几点：
对于后台管理请求，判断是否已登录以及是否具有相应权限，如果已登录但无权限则抛出异常，如果未登录则跳转至登录页面；对于无特殊权限要求的请求，将其转发至相应的servlet进行处理。
对于前台请求，判断是否已登录，如果未登录则跳转至登录页面；如果已登录则将请求转发至相应的servlet进行处理。
对于其他请求，则直接放行。因此，该过滤器实现了对于请求的统一处理和分发



工具类:
DateUtil: 提供了日期时间相关的工具方法，例如将日期转换为指定格式的字符串，获取两个日期之间相差的天数等。
DBUtil: 提供了数据库连接、释放资源、执行SQL语句等常用操作的封装方法，使得其他组件可以方便地与数据库进行交互。
FrontUtil: 提供了前端页面中常用的一些方法，例如根据不同的条件生成动态的URL地址、将HTML字符进行转义等。
Pagination: 分页类，封装了分页相关的信息，包括每页显示多少条记录、当前页码、总记录数、总页数等。
PaginationUtil: 提供了生成分页对象、计算分页数据等方法，使得在其他组件中使用分页功能更加方便。
ParseUploadUtil: 封装了解析上传文件的方法，支持同时上传多个文件，同时可以解析上传文件中的参数。
Passwordutil: 提供了加密密码、验证密码等功能的封装方法，用于增强密码的安全性。
ProductSort: 封装了对商品列表进行排序的方法，支持按照价格、销量等多个字段进行排序，并且可以指定升序或降序。
如upload类的主要功能是解析上传的表单数据，并将其封装为一个Map返回。其中，如果上传的表单项为文件，则返回该文件的输入流；如果为普通表单项，则将其参数名和参数值存入Map中


前端:主要采用JSP技术
CSS：包含网站所使用的CSS文件，用于控制网站的样式和布局。
fonts：包含网站所使用的字体文件，用于设置网站的字体样式。
img：包含网站所使用的图片文件，用于展示商品、广告等信息。
jsp：包含网站所使用的服务器端代码文件，包括JSP文件等。
WEB-INF：包含网站的Web应用程序信息和配置，包括网站所需的Java类、资源文件和配置文件等。


3.功能测试：

系统首页访问：


登陆界面:


注册界面:


购买流程:
填写个人信息:


扫码付款:




最终确认收货:

发送通知邮件：



后台销售统计报表， 销售状态:


后台商品目录管理:


产品属性管理:


后台用户管理:
