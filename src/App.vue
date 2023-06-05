<template>
  <v-app>
    <CustomNavBar/>
    <v-main>
      <router-view/>
    </v-main>
    <CustomFooter/>
  </v-app>
</template>

<script>
import CustomNavBar from './components/CustomNavBar.vue';
import CustomFooter from './components/CustomFooter.vue';

export default {
  name: 'App',

  data: () => ({
    //
  }),
  components: {
    CustomNavBar,
    CustomFooter,
  },
};
</script>

<style>
@import '../public/styles.css';
</style>
