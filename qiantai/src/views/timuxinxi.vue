
<template>
  <div class="order">
    <!-- 头部 -->
    <div class="order-header">
      <div class="order-header-content">
        <p>
          <i
            class="el-icon-s-order"
            style="font-size: 30px; color: #ff6700"
          ></i>
          题目信息
        </p>
      </div>
    </div>
    <!-- 题目列表 -->
    <div class="order-content">
      <div class="content">
        <el-form :inline="true" :model="formInline" class="user-search">
          <el-form-item label=""
            ><el-input
              size="small"
              v-model="formInline.timumingcheng"
              placeholder="输入题目名称"
            ></el-input
          ></el-form-item>
          <el-form-item styxlexulxie2 prop="timubiaoqian"
            ><el-select
              size="small"
              v-model="formInline.timubiaoqian"
              placeholder="请选择题目标签"
              ><el-option selected label="请选择题目标签" value=""></el-option
              ><el-option label="java" value="java"></el-option
              ><el-option label="c" value="c"></el-option
              ><el-option label="go" value="go"></el-option
              ><el-option label="rust" value="rust"></el-option
              ><el-option label="c++" value="c++"></el-option
              ><el-option label="c#" value="c#"></el-option
              ><el-option label="php" value="php"></el-option
              ><el-option label="大数据" value="大数据"></el-option
              ><el-option label="前端" value="前端"></el-option
              ><el-option label="JavaScript" value="JavaScript"></el-option
              ><el-option label="后端" value="后端"></el-option
              ><el-option label="图像处理" value="图像处理"></el-option
              ><el-option label="嵌入式" value="嵌入式"></el-option
              ><el-option
                label="数据结构"
                value="数据结构"
              ></el-option></el-select
          ></el-form-item>
          <el-form-item styxlexulxie3 prop="timuleixing"
            ><el-select
              size="small"
              v-model="formInline.timuleixing"
              placeholder="请选择题目类型"
              ><el-option selected label="请选择题目类型" value=""></el-option
              ><el-option label="简答" value="简答"></el-option
              ><el-option label="单选" value="单选"></el-option
              ><el-option label="不定项" value="不定项"></el-option
              ><el-option label="填空" value="填空"></el-option
              ><el-option label="编程" value="编程"></el-option
              ><el-option label="面经" value="面经"></el-option></el-select
          ></el-form-item>
          <el-form-item styxlexulxie4 prop="timunandu"
            ><el-select
              size="small"
              v-model="formInline.timunandu"
              placeholder="请选择题目难度"
              ><el-option selected label="请选择题目难度" value=""></el-option
              ><el-option label="简单" value="简单"></el-option
              ><el-option label="中等" value="中等"></el-option
              ><el-option label="困难" value="困难"></el-option></el-select
          ></el-form-item>

          <el-form-item>
            <el-button
              size="small"
              type="primary"
              icon="el-icon-search"
              @click="search"
              >搜索</el-button
            >
          </el-form-item>
        </el-form>

        <ul>
          <li class="header">
            <div class="pro-img">题目名称</div>
            <div class="pro-img">题目标签</div>
            <div class="pro-img">题目类型</div>
            <div class="pro-img">题目难度</div>
            <div class="pro-img">收藏次数</div>
            <div class="pro-img">上传时间</div>
          </li>

          <li class="product-list" v-for="item in timuxinxi" :key="item.id">
            <router-link :to="`/timuxinxidetail/` + item.id">
              <div class="pro-img">{{ item.timumingcheng }}</div>
              <div class="pro-img">{{ item.timubiaoqian }}</div>
              <div class="pro-img">{{ item.timuleixing }}</div>
              <div class="pro-img">{{ item.timunandu }}</div>
              <div class="pro-img">{{ item.dianzanshu }}</div>
              <div class="pro-img">{{ item.addtime }}</div>
            </router-link>
          </li>
        </ul>
        <div class="order-bar"></div>
      </div>
      <div style="margin-top: -40px"></div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      timuxinxi: "", // 数据列表
      formInline: {
        page: 1,
        limit: 10,
      },
    };
  },
  created() {
    this.gettimuxinxi();
  },
  activated() {

  },

  methods: {
    search() {
      this.gettimuxinxi(this.formInline);
    },
    // 向后端请求分类列表数据
    gettimuxinxi(parameter) {
      this.$axios
        .post("/api/front/timuxinxi", { ...parameter })
        .then((res) => {
          debugger;
          this.timuxinxi = res.data.data.list;
          // this.currentPage = this.formInline.current;
          // this.pageSize = this.formInline.currentNum;
          // this.total = res.data.data.total;
        })
        .catch((err) => {
          return Promise.reject(err);
        });
    },
  },
};
</script>
<style scoped>
* {
  background: #fff;
  color: #444;
  font-family: "Open Sans", sans-serif;
}
.order {
  background-color: #f5f5f5;
  padding-bottom: 20px;
}
/* 题目头部CSS */
.order .order-header {
  height: 64px;
  border-bottom: 2px solid #ff6700;
  background-color: #fff;
  margin-bottom: 20px;
}
.order .order-header .order-header-content {
  width: 1225px;
  margin: 0 auto;
}
.order .order-header p {
  font-size: 28px;
  line-height: 58px;
  float: left;
  font-weight: normal;
  color: #424242;
}
/* 题目头部CSS END */
.order .content {
  width: 1225px;
  margin: 0 auto;
  background-color: #fff;
  margin-bottom: 50px;
}

.order .content ul {
  background-color: #fff;
  color: #424242;
  line-height: 85px;
}
/* 题目表头CSS */
.order .content ul .order-info {
  height: 60px;
  line-height: 60px;
  padding: 0 26px;
  color: #424242;
  border-bottom: 1px solid #ff6700;
}
.order .content ul .order-info .order-id {
  float: left;
  color: #ff6700;
}
.order .content ul .order-info .order-time {
  float: right;
}

.order .content ul .header {
  height: 85px;
  padding-right: 26px;
  color: #424242;
}
/* 题目表头CSS END */

/* 题目列表CSS */
.order .content ul .product-list {
  height: 85px;
  padding: 15px 26px 15px 0;
  border-top: 1px solid #e0e0e0;
}
.order .content ul .pro-img {
  float: left;
  height: 45px;
  width: 80px;
  padding-left: 40px;
  text-align: center;
}
.order .content ul .pro-img img {
  height: 80px;
  width: 80px;
}
.order .content ul .pro-img:first-child {
  height: 80px;
  width: 400px;
}
.order .content ul .pro-img:last-child {
  height: 80px;
  width: 180px;
}

.order .content ul .pro-name {
  float: left;
  width: 380px;
}
.order .content ul .pro-name a {
  color: #424242;
}
.order .content ul .pro-name a:hover {
  color: #ff6700;
}
.order .content ul .pro-price {
  float: left;
  width: 160px;
  padding-right: 18px;
  text-align: center;
}
.order .content ul .pro-num {
  float: left;
  width: 190px;
  text-align: center;
}
.order .content ul .pro-total {
  float: left;
  width: 160px;
  padding-right: 81px;
  text-align: right;
}
.order .content ul .pro-total-in {
  color: #ff6700;
}

.order .order-bar {
  width: 1185px;
  padding: 0 20px;
  border-top: 1px solid #ff6700;
  height: 50px;
  line-height: 50px;
  background-color: #fff;
}
.order .order-bar .order-bar-left {
  float: left;
}
.order .order-bar .order-bar-left .order-total {
  color: #757575;
}
.order .order-bar .order-bar-left .order-total-num {
  color: #ff6700;
}
.order .order-bar .order-bar-right {
  float: right;
}
.order .order-bar .order-bar-right .total-price-title {
  color: #ff6700;
  font-size: 14px;
}
.order .order-bar .order-bar-right .total-price {
  color: #ff6700;
  font-size: 30px;
}
/* 题目列表CSS END */

/* 题目为空的时候显示的内容CSS */
.order .order-empty {
  width: 1225px;
  margin: 0 auto;
}
.order .order-empty .empty {
  height: 300px;
  padding: 0 0 130px 558px;
  margin: 65px 0 0;
  background: url(../assets/imgs/cart-empty.png) no-repeat 124px 0;
  color: #b0b0b0;
  overflow: hidden;
}
.order .order-empty .empty h2 {
  margin: 70px 0 15px;
  font-size: 36px;
}
.order .order-empty .empty p {
  margin: 0 0 20px;
  font-size: 20px;
}
/* 题目为空的时候显示的内容CSS END */
</style>
