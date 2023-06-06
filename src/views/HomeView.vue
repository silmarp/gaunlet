<template>
  <div>
    <v-card v-show="load">
      <v-card-title>
        Defesas
        <v-spacer/>
        <v-radio-group label="Filtrar por Programa" v-model="programa">
          <span v-for="p in programaHeaders" :key="p.key">
            <v-radio :label=p.label :value=p.key></v-radio>
          </span>
        </v-radio-group>
        <v-spacer/>
        <v-radio-group label="Filtrar por Curso" v-model="curso">
          <span v-for="c in cursoHeaders" :key="c.key">
            <v-radio :label=c.label :value=c.key></v-radio>
          </span>
        </v-radio-group>
        <v-spacer/>
        <v-overflow-btn
        dense
        :items="filterHeaders"
        label="Buscar por"
        v-model="busca"
        />
        <v-spacer/>
        <v-text-field
          v-model="filter"
          :label= buscarPor
          single-line
        />
        <v-spacer/>
      </v-card-title>
      <v-data-table
      dense
      :headers="headers"
      :items="alunos"
      :items-per-page="15"
      :search="filter"
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
      filter: '',
      filterHeaders: ['', 'Ordem', 'Nome', 'Data'],
      programa: '',
      programaHeaders: [
        {
          label: 'Todos', key: '',
        },
        {
          label: 'MAT', key: 'MAT',
        },
        {
          label: 'CCMC', key: 'CCMC',
        },
        {
          label: 'PROFMAT', key: 'PROFMAT',
        },
        {
          label: 'PIPGEs', key: 'PIPGEs',
        },
      ],
      curso: '',
      cursoHeaders: [
        {
          label: 'Todos', key: '',
        },
        {
          label: 'ME', key: 'ME',
        },
        {
          label: 'DO', key: 'DO',
        },
        {
          label: 'DD', key: 'DD',
        },
      ],
      busca: '',
      headers: [
        {
          text: 'Ordem', value: 'Ordem', filterable: false,
        },
        {
          text: 'Nome', value: 'Nome', filterable: false,
        },
        {
          text: 'Curso', value: 'Curso', filterable: false,
        },
        {
          text: 'Programa', value: 'Programa', filterable: false,
        },
        {
          text: 'Data', value: 'Data', filterable: false,
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
    updateHeadersFilter() {
      this.headers.forEach((e) => {
        e.filterable = false;
        if (e.text.match(this.busca)) {
          e.filterable = true;
        }
      });
    },
    updateCursoFiltera() {
      this.alunos.filter((e) => (e.Curso.match(this.curso)));
    },
  },
  computed: {
    buscarPor() {
      this.updateHeadersFilter();
      return `Buscar por ${this.busca}`;
    },
    updateCursoFilter() {
      return this.alunos.filter((e) => (e.Curso.match(this.curso)));
    },
  },
  beforeMount() {
    this.loadDefesas();
  },
};
</script>
