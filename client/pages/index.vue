<template>
  <div class="landing">
    <div class="main" :style="mainStyle">
      <transition name="fade">
        <b-input-group>
          <template #prepend>
            <b-dropdown text="Dropdown" variant="secondary">
              <b-dropdown-item>Action A</b-dropdown-item>
              <b-dropdown-item>Action B</b-dropdown-item>
            </b-dropdown>
          </template>
          <b-form-input></b-form-input>
          <template #append>
            <b-button variant="success">Button</b-button>
          </template>
        </b-input-group>
      </transition>
    </div>
    <div v-if="!galleryToggle" class="text-center pt-5">
      <div class="main-scroll-1">Scroll Down</div>
      <div class="main-scroll-2">˅</div>
      <div class="main-scroll-3">˅</div>
      <div class="main-scroll-4">˅</div>
    </div>
    <div v-else class="gallery">

    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      galleryToggle: false,
      mainStyle: {
        marginTop: '45vh',
        position: 'static'
      }
    }
  },
  methods: {
    detectWindowScroll() {
      if(window.scrollY < 1) {
        this.galleryToggle = false;
        this.mainStyle = {
          marginTop: '45vh',
          position: 'static',
        }
      } else {
        this.galleryToggle = true;
        this.mainStyle = {
          position: 'fixed',
          top: 0,
          paddingTop: '7px',
          paddingBottom: '7px',
          boxShadow: '1px 3px 6px 0 #ccc'
        }
        console.log('is called')
      }
    }
  },
  mounted() {
    window.addEventListener('scroll', this.detectWindowScroll)
  },
  beforeDestroy() {
    window.removeEventListener('scroll', this.detectWindowScroll)
  },
}
</script>

<style>
.main{
  width: 100vw;
  padding-left: 7%;
  padding-right: 7%;
  transition: 0.2s;
}
.main-scroll-1 {
  color: #999;
  font-size: 16pt;
  font-weight: bold;
  animation: Color 1.5s linear infinite alternate;
  -webkit-animation: Color 1.5s ease-in-out infinite alternate;
}
.main-scroll-2 {
  color: #ccc;
  font-size: 12pt;
  line-height: 0.7;
  animation: Color 1.5s 0.3s linear infinite alternate;
  -webkit-animation: Color 1.5s 0.3s ease-in-out infinite alternate;
}
.main-scroll-3 {
  color: #ccc;
  font-size: 12pt;
  line-height: 0.7;
  animation: Color 1.5s 0.6s linear infinite alternate;
  -webkit-animation: Color 1.5s 0.6s ease-in-out infinite alternate;
}
.main-scroll-4 {
  color: #ccc;
  font-size: 12pt;
  line-height: 0.7;
  animation: Color 1.5s 0.9s linear infinite alternate;
  -webkit-animation: Color 1.5s 0.9s ease-in-out infinite alternate;
}
@keyframes Color {
  0%{color: #999;}
  100%{color: #ccc;}
}
@-webkit-keyframes Color {
  0%{color: #999;}
  100%{color: #ccc;}
}

.landing{
  height: 105vh;
}

</style>
