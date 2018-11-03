﻿<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Usuario.aspx.cs" Inherits="DigitalGames.Usuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $( function() {
        $( "#fecha" ).datepicker();
        } );
    </script>

    <style>
        .contenedor{
            width:100%;
            background-color: rgba(29, 46, 74, 0.70);
            max-height: 400px;
            min-width: 400px;
        }

        .datosCuenta{
            background-color: rgba(29, 46, 74, 1);
        }

        .datosCuenta p{
            color: rgba(29, 46, 74, 1);
            background-color: #317bb2;
            padding: 15px;
            margin: 0;
            font-size: 25px;
            border-radius: 5px 6px;
            font-weight: bold;
        }

        .datosCuenta div{
            padding: 10px;
        }

        .datosCuenta h4{
            font-size: 20px;
            color: #317bb2;
            display:initial;
            margin: 0;
        }

        .datosCuenta a{
            font-size: 16px;
            color: white;
        }

        .datosCuenta form{
            border: 2px solid white;
            border-radius: 5px 6px;
            overflow: auto;
            max-height: 400px;
            min-width: 400px;
        }

        .botonModificar{
            color: #317bb2;
            width: auto;
            padding: 4px 7px;
            background-color: transparent;
            margin-left: 10px;
            border: 0.5px solid white;
            cursor: pointer;
            border-radius: 5px 6px;
        }

        .tarjeta{
            margin: 10px;
            background-color: #132f49;
            border: 2px solid white;
            border-radius: 5px 6px;
        }

        .botonEliminar{
            color: white;
            width: auto;
            padding: 4px 7px;
            background-color: red;
            margin-left: 10px;
            border: 0.5px solid white;
            cursor: pointer;
            border-radius: 5px 6px;
        }

        .botonAgregar{
            color: white;
            width: auto;
            padding: 7px 10px;
            background-color: green;
            border: 0.5px solid white;
            cursor: pointer;
            border-radius: 5px 6px;
        }

        .compra{
            margin: 10px;
            background-color: #132f49;
            border: 2px solid white;
            border-radius: 5px 6px;
        }

        @media screen and (max-width: 500px) {
              .contenedor {width: 500px;}
        }

        .accordion {
            background-color: #3c456d;
            color: white;
            cursor: pointer;
            padding: 0;
            width: 100%;
            border: 2px solid #bdbdbd;
            margin-left: 0;
            text-align: center;
            outline: none;
            font-size: 15px;
            transition: 0.4s;
            border-radius: 5px 6px;
        }
        .datosCuenta p:hover {
            background-color: #235981;
        }

        .paneles {
            display: none;
            background-color: transparent;
            overflow: hidden;
            margin:auto auto auto auto;
            text-align:center;
            width: 500px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="Modificar" class="modal">
        <form id="modif" class="modal-content animate">
            <div class="paddingLogin">
                <label for="uname"><b id="campoModificar"></b></label>
                <div id="txbNormal">
                    <input id="txb_modificar" type="text" >
                </div>
                
                <div id="fechaNac">
                    <input type="text" id="fecha">
                </div>

                <div id="repitaContra">
                    <input type="password" >
                    <label for="psw"><b>Repita contraseña</b></label>
                    <input type="password" >
                </div>

                <button class="botonesLogin" id="btn_Modificar" type="button">Modificar</button>
                <button type="button" onclick="cerrarModificar()" class="cancelbtn">Cancel</button>
            </div>
        </form>
    </div>
    
    <div class="contenedor">
        <div class="datosCuenta">
            <button class="accordion">
                <p>Datos de la cuenta</p>
            </button>
            <div class="paneles">
                <div><h4>Usuario: </h4> <a>Fedex</a> <button class="botonModificar" onclick="abrirModificar('Usuario')">Modificar</button></div>
                <div><h4>Email: </h4> <a>fede@hotmail.com</a> <button class="botonModificar" onclick="abrirModificar('Email')">Modificar</button></div>
                <div><h4>Contraseña: </h4> <a>******</a> <button class="botonModificar" onclick="abrirModificar('Contraseña')">Modificar</button></div>
            </div>
        </div>
        <div class="datosCuenta">
            <button class="accordion">
                <p>Datos personales</p>
            </button>
            <div class="paneles">
                <div><h4>Nombre completo: </h4> <a>Federico</a> <button class="botonModificar" onclick="abrirModificar('Nombre completo')">Modificar</button></div>
                <div><h4>Apellido: </h4> <a>Grennon</a> <button class="botonModificar" onclick="abrirModificar('Apellido')">Modificar</button></div>
                <div><h4>Fecha de nacimineto: </h4> <a>11/11/1997</a> <button class="botonModificar" onclick="abrirModificar('Fecha de nacimiento')">Modificar</button></div>
                <div><h4>Pais: </h4> <a>Argentina</a> <button class="botonModificar" onclick="abrirModificar('Pais')">Modificar</button></div>
                <div><h4>Provincia: </h4> <a>Buenos Aires</a> <button class="botonModificar" onclick="abrirModificar('Provincia')">Modificar</button></div>
                <div><h4>Localidad: </h4> <a>Garin</a> <button class="botonModificar" onclick="abrirModificar('Localidad')">Modificar</button></div>
                <div><h4>Telefono: </h4> <a>1145465657</a> <button class="botonModificar" onclick="abrirModificar('Telefono')">Modificar</button></div>
            </div>
        </div>
        <div class="datosCuenta">
            <button class="accordion">
                <p>Tarjetas de credito</p>
            </button>
            
            <div class="paneles">
                <div>
                    <div style="text-align:center; padding:10px">
                        <button class="botonAgregar">Agregar</button>
                    </div>
                    <form>
                        <div class="tarjeta">
                            <div><h4>Ultimos 4 digitos: </h4> <a>4455</a></div>
                            <div><h4>Banco: </h4> <a>Macro</a></div>
                            <div><h4>Vencimiento: </h4> <a>11/2024</a></div>
                            <div style="text-align:right; padding:0">
                                <button class="botonEliminar">Eliminar</button>
                            </div>
                        </div>

                        <div class="tarjeta">
                            <div><h4>Ultimos 4 digitos: </h4> <a>5511</a></div>
                            <div><h4>Banco: </h4> <a>Nacion</a></div>
                            <div><h4>Vencimiento: </h4> <a>08/2022</a></div>
                            <div style="text-align:right; padding:0">
                                <button class="botonEliminar">Eliminar</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="datosCuenta">
            <button class="accordion">
                <p>Compras realizadas</p>
            </button>
            <div class="paneles">
                <form>
                    <div class="compra">
                        <div><h4>Nombre de juego: </h4> <a>Counter Strike</a></div>
                        <div><h4>Precio: </h4> <a>ARS $1500</a></div>
                        <div><h4>Fecha de compra: </h4> <a>11/11/1997</a></div>
                        <div><h4>Ultimos 4 digitos de tarjeta: </h4> <a>4455</a></div>
                        <div><h4>Codigo de activacion: </h4> <a>4455 5558 15SA</a></div>
                    </div>
                </form>
            </div>
        </div>
        <div class="datosCuenta">
            <button class="accordion">
                <p>Privacidad de la cuenta</p>
            </button>
            <div class="paneles">
                <div><a style="color:red; font-weight: bold; -webkit-text-stroke: 0.7px white; font-size: 25px; letter-spacing: 1px">¡ATENCION!</a><a> Al cerrar su cuenta se eliminarán todos sus datos y es irreversible.</a></div>
                <div><button class="botonEliminar" style="padding: 10px 17px; margin: 0">Cerrar cuenta</button></div>
                
            </div>
        </div>
    </div>

    <script>
        function abrirModificar(id) {
            document.getElementById("txbNormal").style.display = "block";
            document.getElementById("repitaContra").style.display = "none";
            document.getElementById("fechaNac").style.display = "none";

            modal2.style.display = 'block';
            document.getElementById("modif").style.display = "block";

            if (id === 'Contraseña') {
                document.getElementById("repitaContra").style.display = "block";
                document.getElementById("txbNormal").style.display = "none";
            }else if (id === 'Fecha de nacimiento') {
                document.getElementById("fechaNac").style.display = "block";
                document.getElementById("txbNormal").style.display = "none";
            }

            document.getElementById("campoModificar").innerText = id;

            cuerpo.style.overflow = "hidden";
        }

        function cerrarModificar() {
            modal2.style.display = "none";

            cuerpo.style.overflow = "auto";
        }

        var acc = document.getElementsByClassName("accordion");
        var i;

        for (i = 0; i < acc.length; i++) {
            acc[i].addEventListener("click", function() {
                var panel = this.nextElementSibling;
                if (panel.style.display === "block") {
                    panel.style.display = "none";
                } else {
                    panel.style.display = "block";
                }
            });
        }
    </script>
</asp:Content>