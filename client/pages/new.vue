<template>
    <div class="page-wrapper">
        <transition name="fade" mode="out-in">
            <div v-if="stage === 'register'">
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
                            }"
                            @change="cropImage()">
                        </cropper>
                        <div class="card-body">
                            <b-button class="reg-btn mr-3" variant="secondary">초기화</b-button>
                            <b-button class="reg-btn mr-3" variant="success">자르기</b-button>
                        </div>
                    </div>
                    <div class="flex-grow-1">
                        <form class="d-flex flex-column mr-5" id="image-form" ref="imageForm" novalidate>
                            <div class="form-group">
                                <label for="image">사진</label>
                                <div class="custom-file">
                                    <input type="file" class="custom-file-input" id="image" ref="img" @change="loadImage()">
                                    <label class="custom-file-label" for="inputGroupFile01">{{ path?path:'파일을 선택하세요' }}</label>
                                    <div class="invalid-feedback">
                                        파일을 선택하세요
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="artist">작품명</label>
                                <input type="text" class="form-control" id="artist" v-model="title" required>
                                <div class="invalid-feedback">
                                    작품명 입력은 필수입니다.
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="artist">작가명</label>
                                <input type="text" class="form-control" id="artist" v-model="artist" required>
                                <div class="invalid-feedback">
                                    작가명 입력은 필수입니다.
                                </div>
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
                                <textarea type="text" class="form-control" id="description" v-model="description" :maxlength="max_length"></textarea>
                                <small><span :class="description.length<max_length?'text-success':'text-danger'">{{ description.length }}</span> / {{ max_length }} byte</small>
                            </div>
                            <div class="form-group">
                                <label for="tags">태그</label>
                                <b-form-tags
                                    input-id="tags"
                                    v-model="tags"
                                    tag-variant="success"
                                    separator=" "
                                    :limit="5"
                                    limit-tags-text="태그는 5개까지 추가할 수 있습니다."
                                    remove-on-delete
                                    placeholder="태그를 입력하세요">
                                </b-form-tags>
                                <small>태그는 띄어쓰기로 구분하며 5개까지 등록이 가능합니다.</small>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="d-flex justify-content-center">
                    <b-button class="reg-btn mr-5" variant="secondary" href="/">취소</b-button>
                    <b-button class="reg-btn mr-5" variant="primary" type="submit" form="image-form">다음</b-button>
                </div>
            </div>
            <div v-else>
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
                            <table class="table table-sm">
                                <tbody>
                                    <tr>
                                        <th>작품명</th>
                                        <td>{{ title }}</td>
                                    </tr>
                                    <tr>
                                        <th>작가명</th>
                                        <td>{{ artist }}</td>
                                    </tr>
                                    <tr>
                                        <th>이메일</th>
                                        <td>{{ email || '-' }}</td>
                                    </tr>
                                    <tr>
                                        <th>세부정보</th>
                                        <td>{{ description || '-' }}</td>
                                    </tr>
                                    <tr>
                                        <th>태그</th>
                                        <td>{{ tags || '-' }}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="d-flex justify-content-center">
                    <b-button class="reg-btn mr-5" variant="danger" href="/">취소</b-button>
                    <b-button class="reg-btn mr-5" variant="secondary" @click="moveBack()">뒤로가기</b-button>
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
            tags: [],
            max_length:1500,
            img: null,
            coordinates: {
				width: 0,
				height: 0,
				left: 0,
				top: 0,
            },
            form_state: false
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
        moveBack() {
            this.stage = 'register'
            this.form_state = false
        }
    },
    computed: {
        hasImg: function() {
            return this.img != undefined;
        }
    },
    updated() {
        const form = this.$refs.imageForm
        console.log(JSON.stringify(form))
        if(form && !this.form_state) {
            this.form_state = true
            console.log('listener added')
            form.addEventListener('submit', (event) => {
                console.log('listening')
                if(!this.hasImg) {
                    alert('이미지가 지정되지 않았습니다.')
                    return;
                }
                if(form.checkValidity() == false) {
                    event.preventDefault();
                    event.stopPropagation();
                    form.classList.add("was-validated");
                } else {
                    this.stage = 'confirm'
                }
            })
        }
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
    width: 600px;
	height: 600px;
	background: #333;
}
.preview {
    min-width: 600px;
}
.preview img {
    width: 400px;
	height: 400px;
}
.reg-btn{
    width: 120px;
    box-shadow: 1px 3px 6px 0 #ccc;
}
#description {
    height: 128px;
}
</style>