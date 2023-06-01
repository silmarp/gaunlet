<template>
    <v-card class="d-flex flex-column" height="100">
        <span
        class="text-left"
        >
            <router-link to="/">
                <img
                src="../assets/icmc_logo.png"
                alt="ICMC logo"
                width="100"
                height="50"
                />
            </router-link>
        </span>
        <span
        class="text-center align-center justify-center"
        color="black"
        >
            <router-link to="/">
                Home
            </router-link>
        </span>
        <span
        class="text-center align-center justify-center"
        >
            <router-link to="/about">
                About
            </router-link>
        </span>
     </v-card>
</template>

<script>
export default {
  data: () => ({}),
};
</script>

<style>
</style>
