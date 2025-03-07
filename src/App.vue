<template>
  <div class="app-container">
    <div class="content pebbles-bg">
      <MainIntro msg="test"/>
    </div>
    <v-footer class="footer">
      <section class="account-links">
        <v-card flat tile width="100%" class="text-center">
          <IconAccountLink type="linkedin" :url-string="linkedinUrl" />
          <IconAccountLink type="github" :url-string="githubPersonalUrl" />
          <IconAccountLink type="github" :url-string="githubRTIUrl" />
          <IconAccountLink type="github" :url-string="githubNCSUUrl" />
        </v-card>
      </section>
    </v-footer>
  </div>
</template>

<script>
import MainIntro from './components/MainIntro.vue'
import IconAccountLink from './components/IconAccountLink.vue'

export default {
  name: 'App',
  components: {
    MainIntro,
    IconAccountLink
  },
  setup() {
    return {
      linkedinUrl: 'https://www.linkedin.com/in/kiglaze/',
      githubPersonalUrl: 'https://github.com/kiglaze',
      githubRTIUrl: 'https://github.com/IrisGlazeRTI',
      githubNCSUUrl: 'https://github.ncsu.edu/kiglaze'
    }
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
.pebbles-bg {
  background: url('~@/assets/pebbles.jpeg') no-repeat center center;
  background-size: cover;
  height: 100vh; /* Full screen height */
}
.app-container {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
  background: url('~@/assets/pebbles.jpeg') no-repeat center center;
  background-size: cover;
  height: 100vh; /* Full screen height */
}
.content {
  flex: 1;
}
.footer {
  background-color: #cddcf3;
  padding-top: .1em;
}
</style>
