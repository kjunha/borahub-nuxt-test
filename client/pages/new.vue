<template>
    <div class="page-wrapper">
        <transition name="fade" mode="out-in">
            <div v-if="stage === 'register'" key="register">
                <div class="title mt-1 ml-3">
                    <span>작품 등록</span>
                </div>
                <hr/>
                <div class="d-flex m-3">
                    <div class="card align-self-baseline text-center mr-5">
                        <cropper class="cropper card-top-img"
                            ref="cropper"
                            :src="src_img"
                            :stencil-props="{
                                aspectRatio: 1
                            }">
                        </cropper>
                        <div class="card-body">
                            <b-button class="reg-btn mr-3" variant="secondary">초기화</b-button>
                            <b-button class="reg-btn mr-3" variant="success" @click="cropImage()">자르기</b-button>
                        </div>
                    </div>
                    <div class="flex-grow-1">
                        <form class="d-flex flex-column mr-5">
                            <div class="form-group">
                                <label for="image">사진</label>
                                <div class="custom-file">
                                    <input type="file" class="custom-file-input" id="image" ref="img" @change="loadImage()">
                                    <label class="custom-file-label" for="inputGroupFile01">{{ path?path:'파일을 선택하세요' }}</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="artist">작품명</label>
                                <input type="text" class="form-control" id="artist" v-model="title">
                            </div>
                            <div class="form-group">
                                <label for="artist">작가명</label>
                                <input type="text" class="form-control" id="artist" v-model="artist">
                            </div>
                            <div class="form-group">
                                <label for="artist">이메일</label>
                                <input type="email" class="form-control" id="artist" v-model="email">
                            </div>
                            <div class="form-group">
                                <small>작품정보와 함께 이메일 정보를 제공하는 것에 동의합니다.</small>
                                <input class="form-check-input ml-1" type="checkbox">
                            </div>
                            <div class="form-group">
                                <label for="description">세부정보</label>
                                <textarea type="text" class="form-control" id="description" v-model="description" v-bind:maxlength="max_length"></textarea>
                                <small><span v-bind:class="description.length<max_length?'text-success':'text-danger'">{{ description.length }}</span> / {{ max_length }} byte</small>
                            </div>
                            <div class="form-group">
                                <label for="artist">태그</label>
                                <input type="text" class="form-control" id="artist" v-model="artist">
                                <small>태그는 띄어쓰기로 구분하며 5개까지 등록이 가능합니다.</small>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="d-flex justify-content-center">
                    <b-button class="reg-btn mr-5" variant="secondary" href="/">취소</b-button>
                    <b-button class="reg-btn mr-5" variant="primary" @click="stage='confirm'">다음</b-button>
                </div>
            </div>
            <div v-else key="confirm">
                <div class="title mt-1 ml-3">
                    <span>등록 확인</span>
                </div>
                <hr/>
                <div class="d-flex justify-content-center m-3">
                    <div class="preview card">
                        <div class="card-header">
                            <small>미리보기</small>
                        </div>
                        <div class="card-top-img text-center bg-dark p-3">
                            <img :src="img" alt="">
                        </div>
                        <div class="card-body">
                            <hr/>
                            contents section
                        </div>
                    </div>
                </div>
                <div class="d-flex justify-content-center">
                    <b-button class="reg-btn mr-5" variant="danger" href="/">취소</b-button>
                    <b-button class="reg-btn mr-5" variant="secondary" @click="stage='register'">뒤로가기</b-button>
                    <b-button class="reg-btn mr-5" variant="primary">등록</b-button>
                </div>
            </div>
        </transition>
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
            stage: 'register',
            src_img: '',
            path: '',
            title: '',
            artist: '',
            email: '',
            description: '',
            max_length:1500,
            img: null,
            coordinates: {
				width: 0,
				height: 0,
				left: 0,
				top: 0,
			},
        }
    },
    methods: {
        cropImage() {
            const { coordinates, canvas } = this.$refs.cropper.getResult();
            this.coordinates = coordinates;
            this.img = canvas.toDataURL();
        },
        loadImage() {
            const file = this.$refs.img.files[0];
            if(file) {
                this.src_img = URL.createObjectURL(file);
                this.path = file.name;
            } else {
                this.url = '';
                this.path = '';
            }
        },
    }
}
</script>
<style>
.fade-enter-active, .fade-leave-active {
    transition: all .5s ease;
}
.fade-enter, .fade-leave-to {
    transform: translateX(100px);
    opacity: 0;
}
.cropper {
    min-width: 600px;
	height: 600px;
	background: #333;
}
.preview {
    min-width: 600px;
}
.reg-btn{
    width: 120px;
    box-shadow: 1px 3px 6px 0 #ccc;
}
#description {
    height: 128px;
}
</style>