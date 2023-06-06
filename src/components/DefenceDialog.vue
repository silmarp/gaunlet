<template>
  <div class="text-center">
    <v-dialog
      v-model="dialog"
    >
      <template v-slot:activator="{ on, attrs }">
        <v-btn
          color="blue lighten-2"
          dark
          v-bind="attrs"
          v-on="on"
        >
        <v-icon>
        mdi mdi-eye-outline
        </v-icon>
        </v-btn>
      </template>

      <v-card>
        <v-card-title class="text-h5 grey lighten-2">
        {{aluno}}
        </v-card-title>

        <v-divider></v-divider>

        <v-card-subtitle v-if="programa=='MAT'">
          Matemática
          <v-icon>mdi mdi-math-integral</v-icon>
        </v-card-subtitle>

        <v-card-subtitle v-else-if="programa=='CCMC'">
          Ciência de Computação e Matemática Computacional
          <v-icon>mdi mdi-desktop-classic</v-icon>
        </v-card-subtitle>

        <v-card-subtitle v-else-if="programa=='PROFMAT'">
          Mestrado Profissional em Matemática em Rede Nacional
          <v-icon>mdi mdi-matrix</v-icon>
        </v-card-subtitle>

        <v-card-subtitle v-else-if="programa=='PIPGEs'">
          Programa Interinstitucional de Pós-Graduação em Estatística UFSCar-USP
          <v-icon>mdi mdi-percent</v-icon>
        </v-card-subtitle>

        <v-card-title v-else>
          {{programa}}
        </v-card-title>

        <v-card-subtitle v-if="curso=='ME'">
        Mestrado
        </v-card-subtitle>

        <v-card-subtitle v-else-if="curso=='DO'">
        Doutorado
        </v-card-subtitle>

        <v-card-subtitle v-else-if="curso=='DD'">
        Doutorado Direto
        </v-card-subtitle>

        <v-card-subtitle v-else>
        {{curso}}
        </v-card-subtitle>

        <v-card-subtitle v-if="orientador">
        Orientado por:{{orientador}}
        </v-card-subtitle>

        <v-divider></v-divider>

        <v-card-actions>
        {{data}}
          <v-spacer></v-spacer>
          <v-btn
            color="primary"
            text
            @click="dialog = false"
          >
            Close
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </div>
</template>

<script>
export default {
  data() {
    return {
      dialog: false,
    };
  },
  props: [
    'aluno',
    'curso',
    'programa',
    'data',
    'orientador',
  ],
};
</script>
