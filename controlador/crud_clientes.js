// Importar la función de conexión desde el archivo "../modelo/db_conectar.js"
import { conectar } from "../modelo/db_conectar.js";

// Objeto para las operaciones CRUD de clientes
var crud_cliente = {};

// Función para leer los registros de clientes desde la base de datos y renderizarlos en una vista
crud_cliente.leer = (req, res) => {
    conectar.query('SELECT clientes.id_cliente,clientes.nit,clientes.nombres,clientes.apellido,clientes.direccion,clientes.telefono, DATE_FORMAT(clientes.fecha_nacimiento,"%d-%m-%Y") as fecha_nacimiento FROM clientes;', (error, results) => {
        if (error) {
            throw error;
        } else {
            // Renderizar la vista 'clientes/index' con los resultados de la consulta
            res.render('clientes/index', { resultado: results });
        }
    });
};

// Función para crear, actualizar o borrar registros de clientes en la base de datos
crud_cliente.cud = (req, res) => {
    // Obtener datos del cuerpo de la solicitud
    const btn_crear = req.body.btn_crear;
    const btn_actualizar = req.body.btn_actualizar;
    const btn_borrar = req.body.btn_borrar;
    const id = req.body.txt_id;
    const nit = req.body.txt_nit;
    const nombres = req.body.txt_nombres;
    const apellido = req.body.txt_apellido;
    const direccion = req.body.txt_direccion;
    const telefono = req.body.txt_telefono;
    const fecha_nacimiento = req.body.txt_fn;
  
    // Realizar operaciones según el botón presionado
    if (btn_crear) {
        // Insertar un nuevo registro de cliente en la base de datos
        conectar.query('INSERT INTO clientes SET ?', { nit: nit, nombres: nombres, apellido: apellido, direccion: direccion, telefono: telefono, fecha_nacimiento: fecha_nacimiento }, (error, results) => {
            if (error) {
                console.log(error);
            } else {
                // Redirigir de vuelta a la página principal después de la inserción
                res.redirect('/');
            }
        });
    }
    
    if (btn_actualizar) {
        // Actualizar un registro de cliente en la base de datos según su ID
        conectar.query('UPDATE clientes SET ? WHERE id_cliente = ?', [{ nit: nit, nombres: nombres, apellido: apellido, direccion: direccion, telefono: telefono, fecha_nacimiento: fecha_nacimiento }, id], (error, results) => {
            if (error) {
                console.log(error);
            } else {
                // Redirigir de vuelta a la página principal después de la actualización
                res.redirect('/');
            }
        });
    }
    
    if (btn_borrar) {
        // Borrar un registro de cliente en la base de datos según su ID
        conectar.query('DELETE FROM clientes WHERE id_cliente = ?', [id], (error, results) => {
            if (error) {
                console.log(error);
            } else {
                // Redirigir de vuelta a la página principal después del borrado
                res.redirect('/');
            }
        });
    }
};

// Exportar el objeto "crud_cliente" para que esté disponible en otros archivos
export { crud_cliente };
