<template>
  <v-app>
    <CustomAppBar/>
    <v-main>
    </v-main>
    <CustomFooter/>
  </v-app>
</template>

<script>
import CustomAppBar from './components/CustomAppBar.vue';
import CustomFooter from './components/CustomFooter.vue';

export default {
  name: 'App',

  data: () => ({
    //
  }),
  components: {
    CustomAppBar,
    CustomFooter,
  },
};
</script>
