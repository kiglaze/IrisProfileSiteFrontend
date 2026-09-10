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
        </v-card>
      </section>
    </footer>
  </div>
</template>

<script>
import MainIntro from './../../components/MainIntro.vue'
import IconAccountLink from './../../components/IconAccountLink.vue'

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
/* Replace style section in `src/pages/home/AppHome.vue` */
:root {
  --footer-h: 2.5rem; /* adjust as needed */
}

html, body {
  height: 100%;
  margin: 0;
}

#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  height: 100%;
}

.app-container {
  min-height: 100vh;
  display: flex;
  flex-direction: column;
  background: url('~@/assets/pebbles.jpeg') no-repeat center center;
  background-size: cover;
}

/* make the content area flexible and avoid negative margins */
.content-overlay {
  background-color: rgba(255, 255, 255, 0.85);
  padding: 20px;
  width: 100%;
  flex: 1;
  display: flex;
  flex-direction: column;
}

/* main becomes the flexible area */
main {
  flex: 1;
  background: #ddd;
  padding-bottom: calc(var(--footer-h) + 1em); /* reserve space for fixed footer */
  margin-bottom: 0; /* remove negative margin */
}

/* scroll container takes remaining height and scrolls internally */
.scroll-container {
  flex: 1;
  overflow-y: auto;
  padding: 1em;
}

/* keep footer fixed but accounted for by padding-bottom on main */
.footer {
  height: var(--footer-h);
  background-color: #cddcf3;
  position: fixed;
  left: 0;
  bottom: 0;
  width: 100%;
  padding-top: .1em;
}

/* remove the old pseudo-element that added extra spacing */
main:after { display: none; }

</style>
