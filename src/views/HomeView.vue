<template>
  <div>
    <v-card v-show="load">
      <v-card-title>
        Defesas
        <v-spacer/>

        <v-radio-group v-model="course" :label="'Filtrar por curso'">
            <v-radio
                :label="'ALL'"
                :value="'ALL'"
                :key="'ALL'"
            ></v-radio>
            <v-radio
                :label="'ME'"
                :value="'ME'"
                :key="'ME'"
            ></v-radio>
            <v-radio
                :label="'DO'"
                :value="'DO'"
                :key="'DO'"
            ></v-radio>
            <v-radio
                :label="'DD'"
                :value="'DD'"
                :key="'DD'"
            ></v-radio>
    </v-radio-group>

        <v-spacer/>

        <v-radio-group v-model="program" :label="'Filtrar por programa'">
            <v-radio
                :label="'ALL'"
                :value="'ALL'"
                :key="'ALL'"
            ></v-radio>
            <v-radio
                :label="'MAT'"
                :value="'MAT'"
                :key="'MAT'"
            ></v-radio>
            <v-radio
                :label="'CCMC'"
                :value="'CCMC'"
                :key="'CCMC'"
            ></v-radio>
            <v-radio
                :label="'PIPGEs'"
                :value="'PIPGEs'"
                :key="'PIPGEs'"
            ></v-radio>
            <v-radio
                :label="'PROFMAT'"
                :value="'PROFMAT'"
                :key="'PROFMAT'"
            ></v-radio>
    </v-radio-group>

        <v-spacer/>
        <v-text-field
          label="Busca por nome"
          v-model="search"
          single-line
        />
        <v-spacer/>
      </v-card-title>
      <!-- :search="filter" -->
      <v-data-table
      dense
      :headers="headers"
      :items="alunos"
      :course="course"
      :program="'MAT'"
      :search="search"
      :items-per-page="15"
      multi-sort
      >
        <template v-slot:item="{ item }">
            <tr>
              <td>{{item.Ordem}}</td>
              <td>{{item.Nome}}</td>
              <td>{{item.Curso}}</td>
              <td>{{item.Programa}}</td>
              <td>{{item.Data}}</td>
              <td>
                  <DefenceDialog
                    :aluno="item.Nome"
                    :curso="item.Curso"
                    :programa="item.Programa"
                    :data="item.Data"
                    :orientador="item.Orientador"
                  />
              </td>
            </tr>
        </template>
      </v-data-table>
    </v-card>
  </div>
</template>

<script>
import DefenceDialog from '../components/DefenceDialog.vue';

export default {
  name: 'HomeView',
  data() {
    return {
      alunos: undefined,
      load: false,
      course: 'ALL',
      program: 'ALL',
      search: '',
      headers: [
        {
          text: 'Ordem', value: 'Ordem', filterable: true,
        },
        {
          text: 'Nome', value: 'Nome', filterable: true,
        },
        {
          text: 'Curso',
          value: 'Curso',
          filterable: true,
          filter: (value) => {
            if (this.course === 'ALL') return true;
            return value === this.course;
          },
        },
        {
          text: 'Programa',
          value: 'Programa',
          filterable: true,
          filter: (value) => {
            if (this.program === 'ALL') return true;
            return value === this.program;
          },

        },
        {
          text: 'Data', value: 'Data', filterable: true,
        },
        {
          text: 'Visualização', value: 'Visualização', filterable: false,
        },
      ],
    };
  },
  components: {
    DefenceDialog,
  },
  methods: {
    async loadDefesas() {
      const url = 'http://thanos.icmc.usp.br:4567/api/v1/defesas';
      const response = await fetch(url);
      this.alunos = await response.json();
      this.alunos = this.alunos.items;
      this.load = true;
      this.alunos.forEach((e) => {
        // dd/mm/aaaa -> [dd, mm, aaaa]
        // subtrair 1 do mês, pois js conta o mês Jan como 0, Fev como 1, etc
        // exemplo: 10/02/2022 -> [10, 02, 2022] -> new Date(2022, 02 - 1, 10)
        // se der tempo tentar tirar o tempo do Date
        const data = e.Data.split('/');
        e.Data = new Date(data[2], data[1] - 1, data[0]);
      });
    },
  },
  computed: {
  },
  beforeMount() {
    this.loadDefesas();
  },
};
</script>
