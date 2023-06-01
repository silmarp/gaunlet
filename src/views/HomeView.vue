<template>
  <div>
    <div>
      <v-btn @click="loadDefesas()">
        teste
      </v-btn>
    </div>
    <v-table
    fixed-header
    height="500px">
      <thead>
        <tr>
          <th>
            teste1
          </th>
          <th>
            teste2
          </th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="a in alunos" :key="a.Ordem">
          <td>{{ a.Nome }}</td>
          <td>{{ a.Data }}</td>
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
    };
  },
  methods: {
    loadDefesas() {
      const url = 'http://thanos.icmc.usp.br:4567/api/v1/defesas';
      fetch(url)
        .then((data) => (data.json()))
        .then((response) => {
          this.alunos = response;
        });
    },
  },
};
</script>
