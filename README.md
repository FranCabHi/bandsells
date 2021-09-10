# README

- Trello: https://trello.com/invite/b/hFaB2BWz/d74119bb37338968717475d52a334bff/proyecto-final
- Dominio: http://bandsells.xyz/ (sin certificado)
- Heroku: https://afternoon-harbor-73328.herokuapp.com/ (con certificado)

### Sobre la aplicación

Esta es una pequeña aplicación de ecommerce con 3 niveles de usuarios:

- administrador
- vendedor
- usuario regular

### Deployment

1. Requisitos: ruby '2.5.3' y 'rails', '~> 5.2.6'
2. Descargar la aplicación
3. Migrar la base de datos y cargar las gemas enlazadas
4. Cargar el seed para incluir usuarios, compras realizadas, productos y pagos
5. Si se accede desde la URL hay 3 credenciales disponibles:

- usuario: admin@example.com
- contraseña: password

- usuario: owner32@example.com
- contraseña: password

- usuario: user12@example.com
- contraseña: password

- También está disponible el acceso con FB, pero hay que ingresar con el sitio con certificado (Heroku). Los usuarios nuevos tienen acceso como usuario regular, pero el usuario admin puede dar más permisos desde la ventana de usuarios (acceso desde Dashboard haciendo clic en la cantidad de usuarios registrados)

### Integración

La aplicación cuenta con la opción de iniciar sesión desde Facebook y los pagos se gestionan desde mercadopago.

### Niveles de usuario

#### Administrador

El administrador tiene acceso especial a un dashboard completo con información de usuarios, productos disponibles y pedidos en curso. Puede gestionar todos estas secciones y otorgar permisos a los usuarios regulares para vender productos.

#### Vendedor

El vendedor puede comprar y vender productos. También tiene acceso a un dashboard reducido sobre el rendimiento de sus productos, así como la posibilidad de editar la información de los productos que ofrece actualmente, incluido el stock disponible.

#### Usuario regular

El usuario regular solo puede comprar productos. Tiene acceso a una vista especial con el detalle de sus pedidos realizados y los productos que compró, a fin de que sea más fácil volver a comprarlos.
Los usuarios recibirán un correo electrónico con la información de su compra (sendgrid) cuando esta sea pagada.
