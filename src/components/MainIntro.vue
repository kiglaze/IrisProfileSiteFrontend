<template>
    <v-container>
      <v-card>
        <h1 class="font-weight-bold">About Iris Glaze</h1>
        <v-row>
          <div class="wrapper">
            <WordPressPost class="text" slug="personal-introduction" :include-title="false"/>
            <img class="profile-photo" src="~@/assets/photo.jpeg" alt=""/>
          </div>
        </v-row>
        <v-row>
          <v-col>
            <WordPressPost slug="work-history" :include-title="true"/>
          </v-col>
        </v-row>
        <v-row>
          <v-col>
            <WordPressPost slug="education" :include-title="true"/>
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
  }

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
  flex: 0 0 35%;
  width: 35%;
  height: auto;
}

@media (min-width: 960px) {
  .company-history {
    margin: 1em 5em;
  }
}
</style>