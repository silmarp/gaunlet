<template>
    <div>
        <v-footer id ="footer"
        >
            <v-card id= "footer-left-card"
            flat
            >
                <v-card-text id="footer-lef-card-text" >
                    <strong>SSC0961 - Desenvolvimento Web e Mobile</strong>
                </v-card-text>
            </v-card>
            <v-spacer/>
            <a href="https://github.com/silmarp/gaunlet"><v-icon large>mdi-github</v-icon></a>
        </v-footer>
    </div>
</template>

<script>
export default {
};
</script>
<!-- tentando colocar estilo ??? -->
<style>
#footer {
  background-color: #0D4990;
}
#footer-left-card{
    background-color: #0D4990;
    color: white;
}
#footer-lef-card-text{
    color: white;
}
</style>
