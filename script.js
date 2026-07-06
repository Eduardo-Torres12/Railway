$(document).ready(function(){

    // Ocultar dialogs al iniciar

    $("#dialogoExito").dialog({
        autoOpen:false,
        modal:true
    });

    $("#dialogoError").dialog({
        autoOpen:false,
        modal:true
    });

    $("#dialogoEliminar").dialog({
        autoOpen:false,
        modal:true
    });

    cargarDatos();

    function cargarDatos(){

        $.ajax({

            url:"obtener.php",
            type:"GET",
            dataType:"json",

            success:function(datos){

                let tabla = "";

                datos.forEach(function(usuario){

                    tabla += `
                    <tr style="display:none;">

                        <td>${usuario.id}</td>
                        <td>${usuario.nombre}</td>
                        <td>${usuario.correo}</td>
                        <td>${usuario.ciudad}</td>

                        <td>
                            <button class="eliminar"
                            data-id="${usuario.id}">
                            Eliminar
                            </button>
                        </td>

                    </tr>
                    `;
                });

                $("#tablaUsuarios tbody").html(tabla);

                // Animación de aparición

                $("#tablaUsuarios tbody tr").each(function(index){

                    $(this)
                    .delay(index * 200)
                    .fadeIn(500);
                });

                // DataTable

                $('#tablaUsuarios').DataTable({
                    destroy:true
                });

                // Animación tabla

                $("#tablaUsuarios").hide().slideDown(1000);
            }
        });
    }

    // AGREGAR

    $("#btnAgregar").click(function(){

        let nombre = $("#nombre").val();
        let correo = $("#correo").val();
        let ciudad = $("#ciudad").val();

        // VALIDACIÓN

        if(nombre == "" || correo == "" || ciudad == ""){

            $("#dialogoError").dialog("open");

            return;
        }

        $.ajax({

            url:"agregar.php",
            type:"POST",

            data:{
                nombre:nombre,
                correo:correo,
                ciudad:ciudad
            },

            success:function(){

                // Dialog éxito

                $("#dialogoExito").dialog("open");

                // Limpiar inputs

                $("#nombre").val("");
                $("#correo").val("");
                $("#ciudad").val("");

                // Recargar tabla

                cargarDatos();
            }
        });
    });

    // ELIMINAR

    $(document).on("click",".eliminar",function(){

        let id = $(this).data("id");

        let fila = $(this).closest("tr");

        $.ajax({

            url:"eliminar.php",
            type:"POST",

            data:{id:id},

            success:function(){

                // Animación eliminar

                fila.fadeOut(1000,function(){

                    $(this).remove();

                    $("#dialogoEliminar").dialog("open");
                });
            }
        });
    });

});