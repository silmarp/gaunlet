<template>
    <div>
        <v-app-bar>
          <router-link to="/">
              <img
               src="../assets/LOGO50A NEG.png"
               alt="ICMC logo"
               width="100"
               height="50"
              />
          </router-link>
          <v-tabs>
          <v-tab to="/">
            Home
          </v-tab>
          <v-tab to="/about">
            About us
          </v-tab>
          </v-tabs>
        </v-app-bar>
    </div>
</template>

<style>
.v-tab {
    text-transform: none !important;
}
</style>

<script>
export default {
  data: () => ({}),
};
</script>

<style>
</style>
