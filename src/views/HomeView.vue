<template>
  <div>
    <div>
      <v-btn @click=" loadDefesas()">Carregar defesas</v-btn>
    </div>
    <v-table
    v-show="load"
    >
      <thead>
        <tr>
          <th class="text-center">Ordem</th>
          <th class="text-center">Nome</th>
          <th class="text-center">Curso</th>
          <th class="text-center">Programa</th>
          <th class="text-center">Data</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="a in alunos" :key="a.Ordem">
          <td class="text-center">{{ a.Ordem }}</td>
          <td class="text-center">{{ a.Nome }}</td>
          <td class="text-center">{{ a.Curso }}</td>
          <td class="text-center">{{ a.Programa }}</td>
          <td class="text-center">{{ a.Data }}</td>
        </tr>
      </tbody>
    </v-table>
  </div>
</template>

<script>
export default {
  name: 'HomeView',
  data() {
    return {
      alunos: undefined,
      load: false,
    };
  },
  methods: {
    async loadDefesas() {
      const url = 'http://thanos.icmc.usp.br:4567/api/v1/defesas';
      const response = await fetch(url);
      this.alunos = await response.json();
      this.alunos = this.alunos.items;
      this.load = true;
    },
  },
};
</script>
