<template>
  <div class="about">
      <div>
        <h1>O que é Gaunlet</h1>
        <!-- eslint-disable-next-line max-len -->
        <p>Gaunlet é um projeto de codigo aberto feito para a diciplina SSC0961 desenvolvimento web e mobile.</p>
        <!-- eslint-disable-next-line max-len -->
        <p >O projeto consiste em um app que irá consumir uma API de defesas realizadas no ICMC, e mostra-las ao usuario.</p>
      </div>
  <div class="made by">

    <h1>Projeto feito por:</h1>
    <!-- TODO insert full name and Nusp of each member -->
    <v-list-item>
      <v-list-item-content>
        <v-list-item-title>
          <v-list-item-icon>
            <a href="https://github.com/HeitorPupim"><v-icon large>mdi-github</v-icon></a>
          </v-list-item-icon>
          Heitor Pupim
        </v-list-item-title>
        <v-list-item-subtitle>{Nusp}</v-list-item-subtitle>
      </v-list-item-content>
    </v-list-item>

    <v-list-item two-line>
      <v-list-item-content>
        <v-list-item-title>
          <v-list-item-icon>
            <a href="https://github.com/RafaelJunDantas"><v-icon large>mdi-github</v-icon></a>
          </v-list-item-icon>
          Rafael Jun
        </v-list-item-title>
        <v-list-item-subtitle>{Nusp}</v-list-item-subtitle>
      </v-list-item-content>
    </v-list-item>

    <v-list-item three-line>
      <v-list-item-content>
        <v-list-item-title>
        <v-hover>
          <v-list-item-icon>
            <a href="https://github.com/silmarp"><v-icon large>mdi-github</v-icon></a>
          </v-list-item-icon>
        </v-hover>
          Silmar Pereira da Silva Junior
        </v-list-item-title>
        <v-list-item-subtitle>{Nusp}</v-list-item-subtitle>
      </v-list-item-content>
    </v-list-item>
  </div>
  </div>

</template>
