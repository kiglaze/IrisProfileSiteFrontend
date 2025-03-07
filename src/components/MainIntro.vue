<template>
  <v-container>
    <v-card>
      <div class="content-overlay">
        <h1 class="font-weight-bold">About Iris Glaze</h1>
        <p>
          Hi, I have worked professionally as a full-stack web developer for a total of 8 years.
          Here is a quick summary of the companies I have worked at:
        </p>
        <v-row>
          <v-col>
            <section class="company-history">
              <h2>Company History</h2>
              <v-list>
                <v-list-item class="company-history-listing">
                  <v-list-item-title class="company-name text-h6 font-weight-medium">
                    RTI International (Research Triangle Institute)
                  </v-list-item-title>
                  <v-list-item-subtitle class="date-range text-body-2">
                    August 2020 - present
                  </v-list-item-subtitle>
                  <p>What this company does: They are a non-profit organization, and have
                    federally-funded organizations such as the NIH as their clients. Themes of project work include: health, environmental,
                    and education.
                  </p>
                </v-list-item>
                <v-list-item class="company-history-listing">
                    <v-list-item-title class="company-name text-h6 font-weight-medium">
                      Kadro Solutions
                    </v-list-item-title>
                    <v-list-item-subtitle class="date-range text-body-2">
                      May 2016 - September 2019
                    </v-list-item-subtitle>
                    <p>What this company does: They create e-commerce websites. Those websites allow
                      clients to sell products to their clients.
                    </p>
                </v-list-item>
              </v-list>
            </section>
          </v-col>
        </v-row>
        <v-row>
          <v-col>
            <section class="education-history">
              <h2>Education</h2>
              <v-list>
                <v-list-item class="education-listing">
                  <v-list-item-title class="company-name text-h6 font-weight-medium">
                    North Carolina State University
                  </v-list-item-title>
                  <v-list-item-subtitle class="date-range text-body-2">
                    Master of Science in Computer Science (In Progress)
                  </v-list-item-subtitle>
                  <v-list-item-subtitle class="date-range text-body-2">
                    Predicted Graduation: December 2025
                  </v-list-item-subtitle>
                </v-list-item>
                <v-list-item class="education-listing">
                  <v-list-item-title class="company-name text-h6 font-weight-medium">
                    North Carolina State University
                  </v-list-item-title>
                  <v-list-item-subtitle class="date-range text-body-2">
                    Post-Baccalaureate Certificate in Computer Programming
                  </v-list-item-subtitle>
                  <v-list-item-subtitle class="date-range text-body-2">
                    2020
                  </v-list-item-subtitle>
                </v-list-item>
                <v-list-item class="education-listing">
                  <v-list-item-title class="company-name text-h6 font-weight-medium">
                    North Carolina State University
                  </v-list-item-title>
                  <v-list-item-subtitle class="date-range text-body-2">
                    Bachelor of Science in Applied Mathematics and Statistics (Double Major)
                  </v-list-item-subtitle>
                  <v-list-item-subtitle class="date-range text-body-2">
                    2015
                  </v-list-item-subtitle>
                </v-list-item>
              </v-list>
            </section>
          </v-col>
        </v-row>
      </div>
    </v-card>
  </v-container>
</template>

<script>


export default {
  name: 'MainIntro',
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

.content-overlay {
  background-color: rgba(255, 255, 255, 0.85);
  padding: 20px;
  width: 100%;
  height: 100%;
}
@media (min-width: 960px) {
  .company-history {
    margin: 1em 5em;
  }
}
</style>