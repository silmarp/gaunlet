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
          Defesa
        </v-card-title>

        <v-divider></v-divider>
        <v-card-subtitle>
        Realizada por:{{aluno}}
        </v-card-subtitle>

        <v-card-subtitle>
        Curso:{{curso}}
        </v-card-subtitle>

        <v-card-subtitle>
        Programa:{{programa}}
        </v-card-subtitle>

        <v-card-subtitle v-if="orientador">
        Orientador:{{orientador}}
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
