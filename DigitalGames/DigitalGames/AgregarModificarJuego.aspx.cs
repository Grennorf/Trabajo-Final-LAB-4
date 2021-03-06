﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.IO;

namespace DigitalGames
{
    public partial class AgregarModificarJuego : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void limpiarPagina()
        {
            txb_nombre.Text = "";
            txb_empresa.Text = "";
            txb_descripcion.Text = "";
            txb_requisitos.Text = "";
            txb_tipo.Value = "Acción";
            rbl_listaConsolas.SelectedIndex = 0;

            txb_Precio.Value = "";
            lbl_stockActual.Text = "0";
            txb_codigo.Text = "";

            txb_Porcentaje.Value = "";
            txb_FechaInicio.Value = "";
            txb_FechaFin.Value = "";
        }

        protected void validarTextbox_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = (args.Value != "");
        }

        protected void validarCodJuego_ServerValidate(object source, ServerValidateEventArgs args)
        {
            int aux = 0;

            if(lb_CodJuegos.Items.Count > 0)
            {
                for (int i = 0; i < lb_CodJuegos.Items.Count; i++)
                {
                    if(args.Value == lb_CodJuegos.Items[i].ToString())
                    {
                        aux++;
                    }
                }

                if (aux == 0)
                {
                    args.IsValid = true;
                }
                else
                {
                    args.IsValid = false;
                }
            }
            else
            {
                args.IsValid = true;
            }
            
        }

        protected void btn_guardarCambios_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                funcionesJuegos fJue = new funcionesJuegos();
                ClaseJuego jue = new ClaseJuego();
                Descuento desc = new Descuento();

                string aux = Request.Form["ip_listboxCodigos"].ToString();
                string[] codigos = aux.Split('-');

                lbl_stockActual.Text = (codigos.Length - 1).ToString();

                jue.GenerarCod();
                jue.nombre = txb_nombre.Text;
                jue.empresa = txb_empresa.Text;
                jue.tipo = txb_tipo.Value;
                jue.precio = Convert.ToDecimal(txb_Precio.Value.Replace(".", ","));
                jue.stock = Convert.ToInt32(lbl_stockActual.Text);
                jue.consola = rbl_listaConsolas.SelectedItem.Text;
                jue.descripcion = txb_descripcion.Text;
                jue.requisitos = txb_requisitos.Text;

                desc.GenerarCod();
                desc.codJuego = jue.codJuego;
                desc.porcentaje = Convert.ToInt32(txb_Porcentaje.Value);
                desc.fechaInicio = Convert.ToDateTime(txb_FechaInicio.Value);
                desc.fechaFin = Convert.ToDateTime(txb_FechaFin.Value);
                desc.estado = chx_Disponibilidad.Checked;

                fJue.AgregarJuego(jue);
                fJue.AgregarDescuento(desc);

                foreach (string codigo in codigos)
                {
                    if (codigo != string.Empty)
                    {
                        fJue.AgregarCodActivacion(codigo, jue.codJuego);
                    }
                }

                guardarImagenes();
                
                if(Session["Imagenes"] != null)
                {
                    string[] rutasAux = (string[])Session["Imagenes"];
                    bool primero = true;
                    for(int i=0; i<rutasAux.Length; i++)
                    {
                        if(rutasAux[i] != string.Empty)
                        {
                            fJue.AgregarImagen(GenerarCodImagen(), jue.codJuego, rutasAux[i], primero);
                            primero = false;
                        }
                    }
                } 

                limpiarPagina();
            }
        }

        public void guardarImagenes()
        {
            FileUpload[] files = new FileUpload[5];
            string[] rutas = new string[5];
            rutas[0] = "";
            rutas[1] = "";
            rutas[2] = "";
            rutas[3] = "";
            rutas[4] = "";
            files[0] = fu_cargadorDeArchivo1;
            files[1] = fu_cargadorDeArchivo2;
            files[2] = fu_cargadorDeArchivo3;
            files[3] = fu_cargadorDeArchivo4;
            files[4] = fu_cargadorDeArchivo5;

            for (int i = 0; i < 5; i++)
            {
                if (files[i].HasFile)
                {
                    string path = Server.MapPath("~/Imagenes/");
                    string fileName = Path.GetFileName(files[i].FileName);

                    files[i].SaveAs(path + fileName);
                    rutas[i] = "~/Imagenes/" + fileName;
                }
            }

            Session["Imagenes"] = rutas;
        }

        public string GenerarCodImagen()
        {
            int id = 0;
            AccesoDatos ds = new AccesoDatos();
            if (ds.obtenerCantidad("SELECT count(codImagen) FROM Imagenes", ref id))
            {
                id += 1;
                return "IMG" + id.ToString();

            }
            else
                return "IMG1";
        }
    }
}