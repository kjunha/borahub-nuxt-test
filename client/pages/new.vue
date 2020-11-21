<template>
    <div class="page-wrapper">
        <div class="title mt-3 ml-3">
            <span>작품 등록</span>
        </div>
        <hr>
        <div class="d-flex m-3">
            <cropper class="cropper mr-3" 
                :src="img"
                :stencil-props="{
                    aspectRatio: 1
                }">
            </cropper>
            <div class="flex-grow-1">
                <form class="d-flex flex-column">
                    <div class="form-group mb-3">
                        <label for="image">사진</label>
                        <div class="custom-file">
                            <input type="file" class="custom-file-input" id="image" ref="img" v-on:change="onFileChange()">
                            <label class="custom-file-label" for="inputGroupFile01">{{ path?path:'파일을 선택하세요' }}</label>
                        </div>
                    </div>
                    <div class="form-group mb-3">
                        <label for="artist">작가명</label>
                        <input type="text" class="form-control" id="artist" v-model="artist">
                    </div>
                    <div class="form-group">
                        <label for="artist">이메일</label>
                        <input type="email" class="form-control" id="artist" v-model="email">
                    </div>
                    <div class="form-group mb-3">
                        <small>작품정보와 함께 이메일 정보를 제공하는 것에 동의합니다.</small>
                        <input class="form-check-input ml-1" type="checkbox">
                    </div>
                    <div class="form-group mb-3">
                        <label for="description">설명</label>
                        <textarea type="text" class="form-control" id="description" v-model="description" v-bind:maxlength="max_length"></textarea>
                        <small><span v-bind:class="description.length<max_length?'text-success':'text-danger'">{{ description.length }}</span> / {{ max_length }} byte</small>
                    </div>
                    <div class="form-group mb-3">
                        <label for="artist">테그</label>
                        <input type="text" class="form-control" id="artist" v-model="artist">
                        <small>테그는 띄어쓰기로 구분하며 5개까지 등록이 가능합니다.</small>
                    </div>
                </form>
            </div>
        </div>
        <div class="d-flex justify-content-center">
            <b-button class="reg-btn mr-5" variant="secondary">취소</b-button>
            <b-button class="reg-btn mr-5" variant="primary">등록</b-button>
        </div>
    </div>
</template>
<script>
import { Cropper } from 'vue-advanced-cropper'
export default {
    layout: 'form',
    components: {
        Cropper
    },
    data() {
		return {
            url: '',
            path: '',
            artist: '',
            email: '',
            description: '',
            max_length:1500,
            img: 'https://images.unsplash.com/photo-1600984575359-310ae7b6bdf2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80'
        }
	},
    
}
</script>
<style>
.cropper {
	height: 600px;
	background: #333;
}
.reg-btn{
    width: 120px;
    box-shadow: 1px 3px 6px 0 #ccc;
}
#description {
    height: 135px;
}
</style>