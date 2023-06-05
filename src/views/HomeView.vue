<template>
  <div>
    <v-card v-show="load">
      <v-card-title>
        Defesas
        <v-spacer/>
        <v-overflow-btn
        dense
        :items="headers"
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
      </v-data-table>
    </v-card>
  </div>
</template>

<script>
export default {
  name: 'HomeView',
  data() {
    return {
      alunos: undefined,
      load: false,
      filter: '',
      busca: '',
      headers: [
        {
          text: 'Ordem', value: 'Ordem', filterable: true,
        },
        {
          text: 'Nome', value: 'Nome', filterable: true,
        },
        {
          text: 'Curso', value: 'Curso', filterable: true,
        },
        {
          text: 'Programa', value: 'Programa', filterable: true,
        },
        {
          text: 'Data', value: 'Data', filterable: true,
        },
      ],
    };
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
      /* CORRIGIR
      a função funciona corretamente até selecionar a busca por programa,
      é a única opção que a busca não funciona (não sei o motivo)
      quando nenhuma opção é selecionada, a busca por
      programa funciona corretamente
      */
      this.headers.forEach((e) => {
        e.filterable = false;
        if (e.text.match(this.busca)) {
          e.filterable = true;
        }
      });
    },
  },
  computed: {
    buscarPor() {
      this.updateHeadersFilter();
      return `Buscar por ${this.busca}`;
    },
  },
  beforeMount() {
    this.loadDefesas();
  },
};
</script>
