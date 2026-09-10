<template>
  <v-container>
    <v-card>
      <h1 class="font-weight-bold">Thesis Background Info</h1>
      <v-row>
        <v-col>
          <WordPressPost slug="thesis-info" :include-title="true"/>
        </v-col>
      </v-row>
    </v-card>

  </v-container>
</template>

<script>

import WordPressPost from "@/components/WordPressPost.vue";

export default {
  name: 'MainIntro',
  components: {
    WordPressPost

  },
  props: {
    msg: String
  },

}

</script>

<style scoped>
.company-name {
  font-weight: bold;
}

.date-range, .company-history-listing {
  display: block;
}



.wrapper {
  display: flex;
  gap: 1rem;
  align-items: flex-start;
}

.wrapper .text {
  flex: 0 0 60%;
}

.wrapper .profile-photo {
  flex: 0 0 40%;
  width: 40%;
  height: auto;
}

@media (min-width: 960px) {
  .company-history {
    margin: 1em 5em;
  }
}
</style>