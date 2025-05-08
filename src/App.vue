<template>
  <div class="app-container pebbles-bg">
    <main class="content content-overlay">
      <div class="scroll-container">
        <MainIntro msg="test"/>
      </div>
    </main>
    <footer class="footer">
      <section class="account-links">
        <v-card flat tile width="100%" class="text-center">
          <IconAccountLink type="linkedin" :url-string="linkedinUrl" />
          <IconAccountLink type="github" :url-string="githubPersonalUrl" />
          <IconAccountLink type="github" :url-string="githubRTIUrl" />
          <IconAccountLink type="github" :url-string="githubNCSUUrl" />
        </v-card>
      </section>
    </footer>
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
  height: 100%;
}
.pebbles-bg {
  background: url('~@/assets/pebbles.jpeg') no-repeat center center;
  background-size: cover;
}

.app-container {
  height: 100%;
}

.content-overlay {
  background-color: rgba(255, 255, 255, 0.85);
  padding: 20px;
  width: 100%;
  height: 100%;
}

.footer {
  background-color: #cddcf3;
  padding-top: .1em;
}
html, body {
  height: 100%;
}
main {
  padding-bottom: 2em;
  margin-bottom: -100px;
  background: #ddd;
}
main:after {
  content: "";
  display: block;
  height: 2em;
}
footer {
  height: 2em;
  background: #eee;
  position: fixed;
  left: 0;
  bottom: 0;
  width: 100%;
}
.scroll-container {
  max-height: 100%; /* Set the maximum height */
  overflow-y: auto; /* Enable vertical scrolling */
  padding: 1em; /* Optional: Add padding for better spacing */
  border: 1px solid #ccc; /* Optional: Add a border for visual clarity */
}
</style>
