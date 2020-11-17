<template>
    <div>
        <div class="mx-5 mb-3 card text-white bg-secondary" v-for="(item, index) in contents" :key="index">
            <div class="card-header">
                <small class="mr-3">banner #{{item.bannerNo}}</small>
            </div>
            <img class="card-img-top" :src="item.imgUrl" alt="banner">
            <div class="bg-white text-dark card-inner rounded p-1">
                raw data: {{ JSON.stringify(item, null, '\t') }}
            </div>
            <div class="card-body text-center">
                <a v-if="item.actionBtn.actionBtn1.title" class="btn btn-primary mr-3 px-3" :href="item.actionBtn.actionBtn1.link">{{ item.actionBtn.actionBtn1.title }}</a>
                <a v-if="item.actionBtn.actionBtn2.title" class="btn btn-dark mr-3 px-3" :href="item.actionBtn.actionBtn2.link">{{ item.actionBtn.actionBtn2.title }}</a>
            </div>
            
        </div>
    </div>
</template>
<script>
export default {
    data() {
        return {
            contents: [],
        }
    },
    created() {
        this.$axios.get('https://atoll-api.dev.borahub.com/api/v0.1/banner')
        .then((res) => {
            if(res.data.status == 200) {
                this.contents = res.data.data
            }
        })
        .catch((err) => {
            console.error(err)
        })
    }    
}
</script>
<style>
    .card-inner{
        margin: 5px;
        font-size: 8pt;
        box-sizing: border-box;
    }
</style>
