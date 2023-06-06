<template>
  <div class="about">
      <div>
        <h1>O que é Gaunlet</h1>
        <!-- eslint-disable-next-line max-len -->
        <p>Gaunlet é um projeto de codigo aberto feito para a diciplina SSC0961 desenvolvimento web e mobile.</p>
        <!-- eslint-disable-next-line max-len -->
        <p >O projeto consiste em um app que irá consumir uma API de defesas realizadas no ICMC, e apresenta-las em formato de tabela.</p>
        <!-- eslint-disable-next-line max-len -->
        <p>Além da apresentação das informações obtidas por meio da API é possivel também ordenar por qualquer coluna, exceto a de visualizadores e filtrar por curso, programa e nome</p>
      </div>
  <div class="made by">

    <h1>Projeto feito por:</h1>
    <!-- TODO insert full name and Nusp of each member -->
    <v-list-item>
      <v-list-item-content>
        <v-list-item-title>
        <v-hover v-slot="{ hover }">
          <v-list-item-icon>
            <a href="https://github.com/HeitorPupim"><v-icon large :color="hover ? 'blue': 'gray'">mdi-github</v-icon></a>
          </v-list-item-icon>
        </v-hover>
          Heitor Pupim A. Toledo
        </v-list-item-title>
        <v-list-item-subtitle>11372858</v-list-item-subtitle>
      </v-list-item-content>
    </v-list-item>

    <v-list-item two-line>
      <v-list-item-content>
        <v-list-item-title>
        <v-hover v-slot="{ hover }">
          <v-list-item-icon>
            <a href="https://github.com/RafaelJunDantas"><v-icon large :color="hover ? 'blue': 'gray'">mdi-github</v-icon></a>
          </v-list-item-icon>
        </v-hover>
          Rafael Jun Teramae Dantas
        </v-list-item-title>
        <v-list-item-subtitle>12563686</v-list-item-subtitle>
      </v-list-item-content>
    </v-list-item>

    <v-list-item three-line>
      <v-list-item-content>
        <v-list-item-title>
        <v-hover v-slot="{ hover }">
          <v-list-item-icon>
            <a href="https://github.com/silmarp"><v-icon large :color="hover ? 'blue': 'gray'">mdi-github</v-icon></a>
          </v-list-item-icon>
        </v-hover>
          Silmar Pereira da Silva Junior
        </v-list-item-title>
        <v-list-item-subtitle>12623950</v-list-item-subtitle>
      </v-list-item-content>
    </v-list-item>
  </div>
  </div>

</template>
