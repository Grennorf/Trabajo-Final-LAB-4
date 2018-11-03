﻿<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Juego.aspx.cs" Inherits="DigitalGames.Juego" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .titulo a{
            text-align:center;
            color: white;
            font-size: 30px;
        }

        .imagenesGrandes{
            width: 600px;
            height: 337px;
        }

        .imagenesChicas{
            width:115px;
            height: 65px;
        }

        .container {
            background-color: rgba(29, 46, 74, 0.70);
            width: 100%;
            height: auto;
            text-align:center;
            padding: 20px 0 20px;
            min-width: 1000px;
        }

        .mySlides {
          width: 600px;
          height: 337px;
          display: none;
        }

        .cursor {
          cursor: pointer;
        }

        .row{
            width: 620px;
            height: auto;
            display: inline-block;
        }

        .column {
            border:2.5px solid rgba(21, 40, 56, 0.70);
            float: left;
        }

        .scroller{ 
            overflow-x: auto;
            overflow-y: auto;
            width: 617px;
            height: 75px;
        } 

        .accordion {
            background-color: #317bb2;
            color: white;
            cursor: pointer;
            padding: 18px;
            width: 100%;
            border: 2px solid #bdbdbd;
            text-align: center;
            outline: none;
            font-size: 25px;
            transition: 0.4s;
        }

        .activacion, .accordion:hover {
            background-color: #235981; 
        }

        .panele {
            display: none;
            background-color: rgba(29, 46, 74, 0.70);
            overflow: hidden;
            width: 100%;
            text-align:center;
            color: white;
        }

        .price {
            width:100%;
            color:#0885e2;
            font-size: 35px;
            text-align:center;
        }

        .card{
            padding:10px;
            width: 324px;
            height: 387px;
            display: inline-block;
            vertical-align: top;
        }

        .card button {
          border: none;
          outline: 0;
          color: white;
          background-color: #48924e;
          text-align: center;
          cursor: pointer;
          width: 100%;
          font-size: 18px;
          padding: 12px;
        }

        .checked {
            color: orange;
        }

        .card button:hover {
          opacity: 0.7;
        }

        .stock{
            width:100%;
        }

        .stock a{
            text-align: left;
            color: #7d7d7d;
            font-size: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="mySlides">
                <img class="imagenesGrandes" src="https://http2.mlstatic.com/key-steam-counter-strike-global-offensive-cs-go-csgo-D_NQ_NP_875309-MLA27574608038_062018-F.jpg">
            </div>

            <div class="mySlides">
                <img class="imagenesGrandes" src="https://www.instant-gaming.com/images/products/62/screenshot/62-2.jpg">
            </div>

            <div class="mySlides">
                <img class="imagenesGrandes" src="https://cdns.kinguin.net/media/category/3/-/3-1024_826.jpg">
            </div>
    
            <div class="mySlides">
                <img class="imagenesGrandes" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJgHgjfAQCjwgF91oZpjgNElpBk7-j5uC_GZrMb24Tkw-OlyaXoQ">
            </div>

            <div class="mySlides">
                <img class="imagenesGrandes" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGNjk5Tf2rA7cKbY8pLIyctHmVhbQVXeIIGQIjpzF6-gxMryWf">
            </div>
        
            <div class="scroller">
                <div class="column">
                    <img class="cursor imagenesChicas" src="https://http2.mlstatic.com/key-steam-counter-strike-global-offensive-cs-go-csgo-D_NQ_NP_875309-MLA27574608038_062018-F.jpg" onclick="currentSlide(1)" alt="">
                </div>
                <div class="column">
                    <img class="cursor imagenesChicas" src="https://www.instant-gaming.com/images/products/62/screenshot/62-2.jpg" onclick="currentSlide(2)" alt="">
                </div>
                <div class="column">
                    <img class="cursor imagenesChicas" src="https://cdns.kinguin.net/media/category/3/-/3-1024_826.jpg" onclick="currentSlide(3)" alt="">
                </div>
                <div class="column">
                    <img class="cursor imagenesChicas" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJgHgjfAQCjwgF91oZpjgNElpBk7-j5uC_GZrMb24Tkw-OlyaXoQ" onclick="currentSlide(4)" alt="">
                </div>
                <div class="column">
                    <img class="cursor imagenesChicas" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGNjk5Tf2rA7cKbY8pLIyctHmVhbQVXeIIGQIjpzF6-gxMryWf" onclick="currentSlide(5)" alt="">
                </div>
            </div>
        </div>

        <div class="card">
            <div class="titulo">
                <a>Counter strike: Global offensive</a>
            </div>

            <div class="price"><s>ARS $1558.00</s></div>
            <div class="price">ARS $1220.00</div>
            
            <span class="fa fa-star checked"></span>
            <span class="fa fa-star checked"></span>
            <span class="fa fa-star checked"></span>
            <span class="fa fa-star checked"></span>
            <span class="fa fa-star"></span>
            
            <div class="stock">
                <div style="float:left; width: 100px">
                    <input id="txb_cantAcomprar" type="text" placeholder="Cantidad"></div>
                <div style="float:left; width: 150px; height:57px; margin-top: 15px"><a>(4 disponibles)</a></div>
            </div>

            <button>Añadir al carrito</button>
            <button style="background-color:#0885e2">Comprar ahora</button>
        </div>
    </div>

    <div style="width:100%">
        <button class="accordion">Acerca de este juego</button>
        <div class="panele">
            <p>Descripcion del juego</p>
        </div>

        <button class="accordion">Requisitos</button>
        <div class="panele">
            <p>Requisito minimo y recomendado</p>
        </div>
    </div>
    

    <script>
    var slideIndex = 1;
    showSlides(slideIndex);

    function currentSlide(n) {
      showSlides(slideIndex = n);
    }

    function showSlides(n) {
      var i;
      var slides = document.getElementsByClassName("mySlides");
      if (n > slides.length) {slideIndex = 1}
      if (n < 1) {slideIndex = slides.length}
      for (i = 0; i < slides.length; i++) {
          slides[i].style.display = "none";
      }
      slides[slideIndex-1].style.display = "block";
    }

    var acc = document.getElementsByClassName("accordion");
    var i;

    for (i = 0; i < acc.length; i++) {
        acc[i].addEventListener("click", function() {
            this.classList.toggle("activacion");
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
